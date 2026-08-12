# Windsurf Task: Add Salesforce JWT Auth (MFA-Proof Login) — ADDITIVE ONLY

## 0. Read this before writing any code

You are modifying a **working production test framework**. The existing
implementation must keep working. This is an **additive migration** with exactly
**one** surgical integration point.

**Do not begin coding. Start with Phase 0 (Discovery) and report back.**

---

## 1. The problem

Salesforce enforced MFA in June/July 2026. The org-wide setting
"Require MFA for all direct UI logins" is now **locked on and cannot be disabled**,
and the "Waive MFA for Exempt Users" permission **no longer exempts anyone**.

Our test suite logs in via username/password through the Salesforce login page.
That path now hits an MFA challenge that automation cannot answer. The suite
passed 15/16 on July 10 and broke immediately after — that is the enforcement
window landing on our sandbox.

**Root cause is NOT a bug in our framework.** Do not try to fix waits, selectors,
or the login page. The login page itself is no longer usable by automation.

## 2. The fix

OAuth flows are **not** interactive UI logins, so MFA enforcement does not apply
to them. We:

1. Mint a session server-side via the **OAuth 2.0 JWT Bearer flow** (no password,
   no MFA prompt, no email code).
2. Hand that session to the browser via **`/secur/frontdoor.jsp?sid=<token>`**.
3. The browser lands **already authenticated** as the target persona.

The `sub` claim in the JWT is the impersonation switch — same cert, same Connected
App, different `sub` gives us PM, ADMIN, FD, FO, PO, or EXE.

**Feature files do not change. Not one line.** Every scenario using
`Given I login to "As a Grantor" app as "PM" user` keeps working as written.

---

## 3. HARD RULES — do not violate

### 3.1 Files you must NOT modify
- **Any `.feature` file.** Zero changes. If you think a feature file needs
  editing, you have misunderstood the task — stop and ask.
- `src/framework/utils/click-helper.ts`
- `src/framework/utils/wait-helper.ts`
- `src/framework/utils/logger.ts`
- `src/framework/utils/excel-re*.ts`
- `src/framework/utils/saved*.ts` (saved-value store)
- `src/framework/utils/date-token-*.ts`
- `src/framework/utils/failure-diagn*.ts`
- `src/framework/utils/user-res*.ts` — **READ IT, DO NOT EDIT IT.** We reuse it.
- `src/framework/api/**`, `src/framework/support/**`
- `DynamicTestDataGenerator.ts`
- Any existing page object, any existing non-login step definition.

### 3.2 The ONE file you may modify (CORRECTED — see 3.2b)

**Repo inspection (screenshot of `src/project/pages/login-page.ts`) shows
this is a Playwright Page Object Model, not a plain step-def-does-everything
framework.** There is a `LoginPage extends BasePage` class whose own header
comment says it is "Aligned with POC MainPageHelper.login() and Java
MainPage.login()" — implying a single `login()` method that step definitions
call. **The real, narrower integration point is that method, not the step
definition file.** Read 3.2b below before writing any code — it supersedes
the guess made in this subsection.

The step definition registering
```
Given I login to {string} app as {string} user
```
almost certainly just calls `loginPage.login(...)` and does nothing else.
If Phase 0 confirms this, **the step definition file does not need to
change at all** — only `login-page.ts`'s method body does. This is a
stricter, smaller blast radius than originally scoped, and is now the
required approach. See 3.2b.

### 3.2b The confirmed integration point — `LoginPage.login()`

**Do not modify the locators already defined in `login-page.ts`** (username
input, password input, login sandbox button, logout iframe, etc.) — they
stay, because the password fallback path still needs them.

**Only the body of the `login()` method changes.** Same method name, same
parameters, same return behavior, so every one of the 5000+ existing
scenarios that indirectly call it keeps working with zero changes to any
`.feature` file or step definition:

```typescript
// Inside LoginPage.login(...) -- EXACT signature TBD by Phase 0, do not guess it
async login(username: string, password: string, role?: string) {
  if (process.env.SF_AUTH_MODE === 'password') {
    // The EXISTING body, moved here VERBATIM. Do not rewrite, rename
    // variables, or change waits. Byte-equivalent fallback behavior.
    await this.usernameInput.fill(username);
    await this.passwordInput.fill(password);
    // ...existing submit/wait logic, unchanged...
    return;
  }

  // New JWT + frontdoor path. Requires `role` to resolve a sandbox username
  // via the EXISTING user-resolver (see Phase 0, item 2) -- do not build a
  // second username map.
  const jwtUsername = resolveUsername(role ?? username); // reuse existing resolver
  const session = await jwtLogin(jwtUsername, sfJwtConfig);
  await this.page.goto(frontdoorUrl(session), { waitUntil: 'domcontentloaded' });
  await this.page
    .locator('.slds-global-header, one-appnav, .oneHeader')
    .first()
    .waitFor({ state: 'visible', timeout: 45000 });
}
```

**Critical constraint — Grantor vs Grantee.** The class's own header comment
states it "Handles Salesforce login for both Grantor (internal) and Grantee
(portal) portals." If a single `login()` method serves both:

- The `SF_AUTH_MODE=jwt` branch must apply **only** to Grantor/internal
  logins (ADMIN, PM, EXE, FO, PO, FD, PM1, EXE1, FO1, FD1 — see the
  confirmed persona list in Section 6).
- Grantee/portal logins (`GRANTEE_SC`, `GRANTEE_LEA`, `GRANTEE_CE`,
  `GRANTEE_VO`) must **always** take the password path, regardless of
  `SF_AUTH_MODE`, because they are external Experience Cloud users who were
  never MFA-affected and were never given the JWT permission set.
- **If it is not obvious from the method's parameters how to distinguish a
  Grantor call from a Grantee call, STOP and ask.** Do not guess based on
  username shape (e.g. presence of `.nysedauto`) inside the method itself —
  that's fragile. Find the actual signal the caller already provides (a
  role/app parameter, a separate method, a subclass, etc.) in Phase 0 and
  branch on that instead.

**Phase 0 must confirm before any code is written:**
1. The exact method name and full signature in `login-page.ts`.
2. Every caller of that method (step definitions, hooks, other page
   objects) and whether a `role` or persona string is available at the
   call site — JWT needs it to resolve a username.
3. How Grantor vs Grantee is currently distinguished by callers of this
   method (see constraint above).
4. Whether `login-page.ts` already imports or has access to a config/env
   reader — reuse it for `SF_AUTH_MODE`, don't add a second one.

### 3.3 Reversibility is mandatory
`SF_AUTH_MODE=password` must restore the **exact old behavior**. If anyone sets
that env var, the suite runs precisely as it does today. No exceptions.

### 3.4 Do not touch the World or hooks unless Phase 0 proves you must
If `src/framework/world/**` already exposes a browser/context/page, **reuse it**.
Only propose a change there if the JWT login genuinely cannot get a browser
handle — and if so, **ask first** with the specific reason.

---

## 4. Phase 0 — DISCOVERY (do this first, report back, write no code)

Read and report the following. I need the answers before you implement.

1. **The login step definition.** Find the file registering
   `I login to {string} app as {string} user`. Report its full path and paste its
   current body.
2. **The user resolver.** Open `src/framework/utils/user-res*.ts`. How does it map
   the role string (`"PM"`, `"FD"`, `"EXE"`…) to a user? Does it hold usernames,
   passwords, or both? Where do those values come from (env, JSON, Excel)?
   **We will reuse this mapping — we need usernames, and we will stop using passwords.**
3. **The World.** Open `src/framework/world/**`. What is on the World object —
   `this.page`? `this.browser`? `this.context`? Report the exact property names
   and how the browser is launched.
4. **Config.** How do `src/framework/config/**` and `src/project/config/**` load
   settings — dotenv, JSON, a config class? What is the existing convention for
   secrets? **Follow the existing convention. Do not introduce a new one.**
5. **The app switcher.** After login, how does the suite switch to the
   `"As a Grantor"` Lightning app? Is there an existing helper? We must reuse it.
6. **Reports.** Grep the feature files for scenarios that view, run, or export
   **reports or dashboards**. Salesforce now triggers a *step-up auth challenge*
   on report actions. List any scenarios that hit reports — they are a separate
   problem and I need to know the blast radius.

**Report these six answers and stop. Do not proceed to Phase 1 without confirmation.**

---

## 5. Phase 1 — New files (purely additive)

Create a new folder `src/framework/auth/`. Nothing outside it is created.

```
src/framework/auth/
├── salesforce-jwt.ts            # JWT mint + token exchange + frontdoor URL
├── jwt-login.strategy.ts        # new login path
├── password-login.strategy.ts   # OLD BODY, MOVED VERBATIM (fallback)
├── login-dispatcher.ts          # picks strategy from SF_AUTH_MODE
└── preflight.ts                 # standalone verification script
```

### 5.1 `salesforce-jwt.ts`
Implement JWT Bearer against Salesforce. Non-negotiable details:

- Sign **RS256** with the private key whose `.crt` is uploaded to the Connected App.
- Claims:
  - `iss` = Connected App **Consumer Key**
  - `sub` = the **sandbox username** of the persona
  - `aud` = **`https://test.salesforce.com`** — this literal string for sandboxes.
    It is the audience claim only; the HTTP request still goes to our My Domain host.
    **Do not set `aud` to the My Domain URL.** This is the most common mistake.
  - `exp` = now + 180s. Salesforce rejects `exp` more than 3 minutes out.
- POST form-encoded to `{SF_LOGIN_URL}/services/oauth2/token`:
  - `grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer`
  - `assertion=<signed jwt>`
- Response gives `access_token` and `instance_url`.
- Frontdoor URL:
  `{instance_url}/secur/frontdoor.jsp?sid={urlencode(access_token)}&retURL={urlencode(retUrl)}`
- Navigate to a frontdoor URL **once** per session. Re-navigating to a stale one
  can bounce to the login page.

**Error mapping — implement this, it will save hours:**

| Salesforce error | Real cause | Message to print |
|---|---|---|
| `invalid_grant` | wrong sandbox username | "Sandbox usernames are `<prod-username>.nysedauto`. Verify in Setup → Users. This is the #1 cause." |
| `invalid_grant` | key/cert mismatch, or wrong `aud` | "Check the .crt matches the .key, and that aud is `https://test.salesforce.com`" |
| `user hasn't approved this consumer` | profile not pre-authorized | "Connected App → Manage → Profiles → add this persona's profile" |
| `invalid_client_id` | app still propagating | "Wait ~10 min after creating the Connected App" |

### 5.2 `password-login.strategy.ts`
The old body, **moved verbatim**. See rule 3.2. This is a copy operation, not a
rewrite.

### 5.3 `jwt-login.strategy.ts`
- Resolve `role` → username using the **existing user resolver** from Phase 0.
  Do not build a second mapping.
- **Cache sessions per persona** in a module-level `Map`. A 200-scenario run must
  make ~6 token calls, not 200.
- Create a **fresh browser context per login** so personas don't share cookies.
  This is *stricter* isolation than the current password flow.
- Navigate to the frontdoor URL.
- Wait for an authenticated Lightning shell
  (`.slds-global-header, one-appnav, .oneHeader`). **This assertion doubles as our
  MFA canary** — if it ever times out, enforcement behavior changed.
- Call the **existing app-switcher helper** from Phase 0. Do not write a new one.
- Use the existing `logger.ts` for output. Do not add a new logging approach.

### 5.4 `login-dispatcher.ts`
```
SF_AUTH_MODE=jwt       -> jwt-login.strategy      (new default)
SF_AUTH_MODE=password  -> password-login.strategy (exact old behavior)
```
Default to `jwt` if unset. Log which mode is active at suite start.

### 5.5 `preflight.ts`
A standalone script (`npm run preflight`) that:
- Loops all six personas.
- For each: mint a token (pure HTTP, no browser), then open a **headed** browser
  and hit the frontdoor URL.
- Classifies the outcome as one of:
  - `AUTHENTICATED` — Lightning shell present. 
  - `MFA_CHALLENGE` — page contains any of: "verify your identity", "security key",
    "authenticator app", "verification code", "passkey", "two-factor". 
  - `LOGIN_PAGE` — bounced back to login (usually a missing `web` OAuth scope).
  - `TOKEN_FAILED` — never got a token; config problem, not MFA.
- Prints a clear verdict and exits non-zero unless **all six** are `AUTHENTICATED`.

---

## 6. Phase 2 — Config (follow existing conventions from Phase 0)

Add to whatever config mechanism already exists. Do **not** invent a new one.

```
SF_AUTH_MODE=jwt
SF_CONSUMER_KEY=3MVG9...
SF_LOGIN_URL=https://test8-internal--nysedauto.sandbox.my.salesforce.com
SF_PRIVATE_KEY_PATH=./certs/server.key
```

Persona usernames: **reuse the existing user resolver's usernames** if it already
holds them. Only add new env vars if it does not.

Add to `.gitignore`: `certs/` and any new secret file. The private key is a
credential — it must never be committed.

---

## 7. Phase 3 — Verification gate (ALREADY CLEARED — do not re-litigate)

**This gate has already been proven against the real NYSEDAUTO sandbox, using
a standalone Python POC (`sf_preflight.py`), independent of this framework.
Do not treat JWT + frontdoor as a hypothesis to re-validate. It is confirmed
working. Build directly to the TypeScript implementation below.**

### Confirmed results (do not repeat this testing — reuse it as ground truth)

**Token exchange — 10/10 personas succeeded** against the real Connected
App / permission set / cert configuration already live in NYSEDAUTO:
ADMIN, PM, EXE, FO, PO, FD, PM1, EXE1, FO1, FD1.

**Live browser session — `AUTHENTICATED`** for **two** personas tested directly
via live browser session (not just token exchange):

- **ADMIN** (`govgrantsadmin@yopmail.com.nysedauto`) — the highest-risk case,
  since System Administrator profiles are the ones subject to the
  phishing-resistant MFA tier. Landed cleanly at:
  `https://test8-internal--nysedauto.sandbox.lightning.force.com/lightning/page/home`
- **PM** (`donald_pm@ggp.test7.atm.nysedauto`) — the persona actually used in
  the pilot scenario (Section 7.1 below). Also landed cleanly at the same
  Lightning home URL.

Both sessions showed no identity challenge, no security-key prompt, no bounce
to login. Two different persona/profile types (privileged admin, standard
internal user), same clean result.

**Conclusion: JWT Bearer + `frontdoor.jsp` bypasses MFA enforcement in this
sandbox, for both privileged and non-privileged internal personas.**

### Salesforce-side configuration already in place (do not recreate)

This exists in NYSEDAUTO right now, confirmed working via the Python POC.
Reuse it exactly — do not create a second External Client App or permission set.

| Item | Value |
|---|---|
| External Client App name | `Playwright Automation` |
| Distribution State | Local |
| OAuth Scopes | `api`, `refresh_token`/`offline_access`, `web` |
| JWT Bearer Flow | Enabled, cert uploaded (`server.crt`) |
| Permitted Users | Admin approved users are pre-authorized |
| Authorizing permission set (App Policies → App Policies section) | `Playwright Automation Access` |
| Permission set contents | System Permission `API Enabled` ticked; License = `--None--` |
| Permission set assignees | All 10 internal personas below (NOT the 4 grantee users) |
| IP Relaxation | Relax IP restrictions (set to avoid false MFA-looking failures on IP rotation) |

### Confirmed working personas (10 internal users — token + config proven)

```
ADMIN_USERNAME=govgrantsadmin@yopmail.com.nysedauto
PM_USERNAME=donald_pm@ggp.test7.atm.nysedauto
EXE_USERNAME=test@gmaildemo.com.nysedauto
FO_USERNAME=auto.fm@auto.com.nysedauto
PO_USERNAME=automationpo@yopmail.com.nysedauto
FD_USERNAME=automationfd@yopmail.com.nysedauto
PM1_USERNAME=pm1.automation@yopmail.com.nysedauto
EXE1_USERNAME=exe1.automation@yopmail.com.nysedauto
FO1_USERNAME=fo1automation@yopmail.com.nysedauto
FD1_USERNAME=fd1automation@yopmail.com.nysedauto
```

All 10 returned `TOKEN_OK`. ADMIN and PM additionally verified via live
browser session (see above). The remaining 8 are very likely to behave the
same (same app, same permission set, same cert) — Phase 3's `preflight.ts`
port should still check all 10 as a matter of course, but do not treat this
as an open question requiring investigation.

### Excluded — external community users, stay on password auth

```
GRANTEE_SC_USERNAME=automation.grantee_submitcertify1@yopmail.com
GRANTEE_LEA_USERNAME=automation.grantee_leaadmin1@yopmail.com
GRANTEE_CE_USERNAME=automation.grantee_createedit1@yopmail.com
GRANTEE_VO_USERNAME=automation.grantee_viewonly1@yopmail.com
```

These are Experience Cloud / community-license users (note: no `.nysedauto`
suffix on their usernames, unlike the internal users above — that's the
tell). They log in through the public grantee portal, which is not subject
to the employee MFA enforcement this migration addresses. They are **not**
in the permission set assignment and were **not** included in the Python
POC. `password-login.strategy.ts` must keep handling them exactly as today.

### Reference implementation — a working, tested Python POC exists

A standalone Python script (`sf_preflight.py`) implements the exact
JWT-sign → token-exchange → frontdoor-navigate flow, and is the artifact
that produced the confirmed results above. Its core logic is the ground
truth for `salesforce-jwt.ts` (Section 5.1) — port the same claims, same
endpoint, same error mapping, same 180-second `exp` ceiling.

```python
import jwt          # pip install pyjwt cryptography
import requests
import time, urllib.parse
from pathlib import Path

def jwt_login(username, cfg):
    private_key = Path(cfg["PRIVATE_KEY_PATH"]).read_text()
    now = int(time.time())
    assertion = jwt.encode(
        {
            "iss": cfg["CONSUMER_KEY"],      # Connected/External Client App Consumer Key
            "sub": username,                  # impersonation switch -- the persona
            "aud": cfg["AUDIENCE"],           # "https://test.salesforce.com" for sandboxes
            "exp": now + 180,                 # SF rejects exp > 3 min out
        },
        private_key,
        algorithm="RS256",
    )
    token_endpoint = cfg["LOGIN_URL"].rstrip("/") + "/services/oauth2/token"
    resp = requests.post(
        token_endpoint,
        data={
            "grant_type": "urn:ietf:params:oauth:grant-type:jwt-bearer",
            "assertion": assertion,
        },
        headers={"Content-Type": "application/x-www-form-urlencoded"},
        timeout=30,
    )
    data = resp.json()
    return data["access_token"], data["instance_url"]

def frontdoor_url(instance_url, access_token, ret_url="/lightning/page/home"):
    return (
        f"{instance_url}/secur/frontdoor.jsp"
        f"?sid={urllib.parse.quote(access_token)}"
        f"&retURL={urllib.parse.quote(ret_url)}"
    )
```

The browser-verification half (Playwright, sync API) that produced the
`AUTHENTICATED` verdicts for ADMIN and PM:

```python
def check_browser_session(url):
    from playwright.sync_api import sync_playwright
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        page = browser.new_context().new_page()
        page.goto(url, wait_until="domcontentloaded", timeout=30000)

        # frontdoor.jsp chains through several redirects -- wait for network
        # idle rather than a fixed sleep, then retry content()/url reads a
        # few times since a late redirect can still be in flight momentarily.
        try:
            page.wait_for_load_state("networkidle", timeout=15000)
        except Exception:
            pass

        body, current_url = None, None
        for _ in range(5):
            try:
                page.wait_for_timeout(1000)
                current_url = page.url
                body = page.content().lower()
                break
            except Exception:
                continue

        mfa_signals = ["verify your identity", "security key", "authenticator app",
                       "verification code", "passkey", "two-factor", "multi-factor"]
        if any(s in body for s in mfa_signals):
            return "MFA_CHALLENGE"
        if "/login" in current_url:
            return "LOGIN_PAGE"
        if page.locator(".slds-global-header, one-appnav, .oneHeader").count() > 0 \
           or "/lightning/" in current_url:
            return "AUTHENTICATED"
        return "UNKNOWN"
```

**Port this logic faithfully to `salesforce-jwt.ts` / `jwt-login.strategy.ts`.**
The redirect-settling retry loop in particular is load-bearing — an earlier
version of the Python script used a flat `sleep(6)` before reading page
content and intermittently crashed mid-redirect. Don't reintroduce that bug
in the TS port; use Playwright's `waitForLoadState('networkidle')` followed
by a bounded retry on the URL/content read, exactly as above.

### What this means for implementation

- Do **not** add a "prove this works first" step before building. It's proven.
- Still keep `preflight.ts` in the deliverable (Section 5.5) — it's useful
  as an ongoing regression check (e.g., if Salesforce changes enforcement
  again later), but it is **not a gate blocking this migration**.
- If, during implementation, any persona's TypeScript-side login produces
  an MFA challenge that the Python POC did **not** produce, that indicates a
  bug in the TypeScript auth code (wrong scope, wrong claim, stale token),
  not a re-emergence of MFA enforcement. Debug the code, don't assume
  Salesforce changed again.
- The Connected App config, permission set (`Playwright Automation Access`),
  and cert already exist and are confirmed working — reuse them as-is.
  Do not create a second app or permission set.

### Grantee users — explicitly out of scope for JWT

`GRANTEE_SC`, `GRANTEE_LEA`, `GRANTEE_CE`, `GRANTEE_VO` are external
Experience Cloud / community-license users, not internal employee-license
users. They are **not** subject to the MFA enforcement this migration
addresses, and were deliberately excluded from the Python POC and from the
permission set assignment. **Keep them on password auth.** Do not attempt to
JWT-migrate them unless told otherwise.

### First scenario to validate
`smeRegistration.feature` → `@VerifyPageDetailsOnRegistrationStep1of1-SMEReviewerRegistration`

This is the ideal pilot because it splits cleanly:
- **Line 1 only** (`Given I login ... as "PM" user`) is the broken, MFA-affected part.
- **Everything from `I navigate to maildrop portal` onward** is an external
  Experience Cloud registration flow (Legal Disclaimer 1 of 2 → Step 1 of 1 →
  `ExternalReviewerPrefix__c` assertions). That flow is **unauthenticated and
  completely unaffected by employee MFA**. It must pass unchanged.

If this scenario goes green end-to-end, the login fix is proven.

---

## 8. Acceptance criteria

- [ ] Zero `.feature` files changed. Verified by `git diff --stat -- '*.feature'` → empty.
- [ ] Zero step definition files changed (per 3.2/3.2b — confirm in Phase 0
      whether this holds; if the step def does more than call
      `loginPage.login(...)`, report it before proceeding).
- [ ] Exactly one pre-existing file modified: `login-page.ts` (or wherever
      Phase 0 confirms `login()` actually lives). Its diff is only the
      method body → password/JWT branch. Method name, signature, and every
      other method/locator in the file are untouched.
- [ ] Old password logic preserved **verbatim** inside the `password` branch.
- [ ] `SF_AUTH_MODE=password` reproduces today's exact behavior, for both
      Grantor and Grantee logins.
- [ ] Grantee/portal logins take the password path unconditionally,
      regardless of `SF_AUTH_MODE` — verified by running at least one
      grantee scenario with `SF_AUTH_MODE=jwt` set and confirming it still
      uses password auth, not JWT.
- [ ] `npm run preflight` (Node/TS port of the already-verified Python POC)
      reports all ten personas `AUTHENTICATED`. This is a confirmation of a
      correct TS port, not a re-test of whether the approach works — that
      was already proven (see Section 7).
- [ ] The SME registration smoke scenario passes end-to-end with `SF_AUTH_MODE=jwt`.
- [ ] No password is used anywhere in the JWT path.
- [ ] Private key is gitignored and not committed.
- [ ] Session caching confirmed: a multi-scenario run makes ~6 token calls, not one per scenario.

---

## 9. Explicitly out of scope

Do not do these. Raise them, don't fix them.

- The `And I pause execution for "180" seconds` hard wait. It is wasteful and
  flaky, but it is **not** an auth problem. **Flag it, do not change it.**
- Any selector, wait, or page-object refactor.
- Step-up authentication on reports/dashboards. If Phase 0 finds scenarios that
  touch reports, **report them and stop.** Separate task.
- The ADMIN persona's privilege tier. Admins now require *phishing-resistant* MFA
  (security keys/passkeys) that no script can satisfy. JWT+frontdoor should
  sidestep this because it is not an interactive login — but **if ADMIN fails
  preflight specifically while others pass, report it immediately.** The likely
  answer is giving automation users the narrowest profile that still passes the
  tests, which is a scope decision, not yours to make.

---

## 10. Questions to ask me if anything is ambiguous

Ask. Do not guess. Specifically ask if:
- The World does not expose a reusable browser handle.
- The user resolver stores passwords in a way that makes usernames hard to extract.
- The existing config mechanism can't cleanly hold a file path to the private key.
- Preflight returns anything other than six `AUTHENTICATED`.

**Begin with Phase 0. Report the six discovery answers. Write no code yet.**