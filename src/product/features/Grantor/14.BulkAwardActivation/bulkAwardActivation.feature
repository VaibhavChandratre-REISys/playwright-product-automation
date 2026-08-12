@bulkAwardActivation @grantor-regression @grantAndAward @wip
Feature: Validate Bulk Award creation, NOGA generation, and activation from an approved FDM

  # -----------------------------------------------------------------------------
  # Scope: cut down from the full manual test (30+ apps + post-award + closeout)
  # to a runnable bulk-award activation scenario using 3 applications.
  #
  # Prereqs handled via API (existing steps, no UI):
  #   * Publish competitive announcement
  #   * Initiate 3 application reviews (one per app) on the same announcement
  #   * Approve FDM on each application (each becomes an eligible recommended app)
  #
  # All steps reuse existing framework steps:
  #   * Bulk row selection via `I check "all" boxes in flex table with id "..."`
  #     (existing header select-all step in navigation-steps.ts)
  #   * Bulk action buttons via `I click on top right button "X" in flex table
  #     with id "Y"` (works if those button labels exist on the LWC page)
  #   * Status column checked via `I softly see value "..." for title "..."
  #     inside table "..."`
  #
  # Assumptions (please override if wrong):
  #   * "AO user" = Award Owner = PM in this scenario (PM created the awards
  #     from the FDM, so PM is the record owner and sees Sign & Activate).
  #   * Grantee acceptance is performed by SPI3.
  # -----------------------------------------------------------------------------

  @PROD-65149 @VerifyPMuserShouldBeAbleToActivateTheBulkAward
  Scenario: Verify PM user should be able to activate the bulk award
    # ── Prerequisites: seed 3 approved-FDM applications via API ────────────────
    Given I published "Competitive" type announcement having name "Automation Runtime Bulk Award Announcement" and properties "default"
    And I initiated an application review for application "Automation Runtime Bulk Award App1" on announcement "{SavedValue:Automation Runtime Bulk Award Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Bulk Award App1}"
    And I initiated an application review for application "Automation Runtime Bulk Award App2" on announcement "{SavedValue:Automation Runtime Bulk Award Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Bulk Award App2}"
    And I initiated an application review for application "Automation Runtime Bulk Award App3" on announcement "{SavedValue:Automation Runtime Bulk Award Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Bulk Award App3}"

    # ── PM opens the FDM and navigates to recommended applications ─────────────
    When I login to "Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I navigate to "Overview" sub tab

    # ── Step 1: Select all recommended applications and click "Create Award" ───
    And I check "all" boxes in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Create Award" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    # Initial award processing status while batch is running
    Then I softly see value "Creating Award" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    # Wait for the batch to complete; refresh the page and re-check
    And I wait for "30" seconds
    And I refresh the page
    And I navigate to "Overview" sub tab
    Then I softly see value "Created" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"

    # ── Step 2: Select all "Created" awards and click "Generate NOGA" ──────────
    And I check "all" boxes in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Generate NOGA" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I softly see value "Generating NOGA" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "30" seconds
    And I refresh the page
    And I navigate to "Overview" sub tab
    Then I softly see value "NOGA Generated" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"

    # ── Step 3: Send for grantee acceptance ────────────────────────────────────
    And I check "all" boxes in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Send for Grantee Acceptance" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    Then I softly see value "Sending for Grantee Acceptance" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "30" seconds
    And I refresh the page
    And I navigate to "Overview" sub tab
    Then I softly see value "Sent for Grantee Acceptance" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"

    # ── Step 4: Grantee (SPI3) accepts each award via pending tasks ────────────
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    # Accept award #1
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award App1}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Bulk Award App1}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    # Accept award #2
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award App2}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Bulk Award App2}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    # Accept award #3
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award App3}" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime Bulk Award App3}" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I click on "Accept" in the page details
    And I wait for "2" seconds

    # ── Step 5: Award Owner (PM) signs & activates the accepted awards ─────────
    # "AO user" in the manual test = Award Owner = the PM who created the awards
    # from the FDM. Since PM is the current session's owner, we just re-login as
    # PM to guarantee a clean context after the grantee (SPI3) session above.
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I navigate to "Overview" sub tab
    Then I softly see value "Accepted by Grantee" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I check "all" boxes in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Sign and Activate" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "30" seconds
    And I refresh the page
    And I navigate to "Overview" sub tab
    Then I softly see value "Activated" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"

    # ── Step 6: Regenerate NOGA after activation ───────────────────────────────
    And I check "all" boxes in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Generate NOGA" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "30" seconds
    And I refresh the page
    And I navigate to "Overview" sub tab
    Then I softly see value "NOGA Generated" for title "Award Processing Status" inside table "---subAwardFromFDM:-:recommendedAppTableId---"

    # ── Step 7: Verify NOGA PDF is present on the award AND grant file sections
    #    on both the Grantor and Subrecipient sides after Sign & Activate.
    # NOTE: Exact NOGA file title (e.g. "Notice of Grant Award.pdf" vs the org's
    #       naming convention) may need adjustment for your environment.
    # Open the first activated award to confirm the NOGA PDF is in Files section (grantor side)
    When I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award App1}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I save the field labeled "EGMS ID" as "bulkActivatedGrantEGMS"
    And I navigate to "Files" sub tab
    Then I softly see value "Notice of Grant Award.pdf" for title "Title" inside table "---subAwardStandAlone:-:awardAddFilesTableId---"
    # Verify the same NOGA PDF is visible from the Subrecipient portal
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:bulkActivatedGrantEGMS}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:bulkActivatedGrantEGMS}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see value "Notice of Grant Award.pdf" for title "Title" inside table "---subAwardStandAlone:-:grantAddFilesTableId---"

    # ── Step 8: Perform ad-hoc closeout on the first activated grant ───────────
    # Re-login to Grantor PM to return to the grantor context after S/R session
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:bulkActivatedGrantEGMS}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:bulkActivatedGrantEGMS}" inside flex table with id "---closeout:-:grantsTableId---"

    # Create ad-hoc closeout request with all required information
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"

    # Add approver on Responsibilities sub tab, then send to Subrecipient
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                     | Closeout |
      | {SavedValue:PM Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details

    # Subrecipient (SPI3) enters required closeout info and acknowledges
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details

    # Grantor (PM) overrides and submits for approval, then approves as final step
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    And I wait for "2" seconds

    # PM (approver) approves the closeout, moving the grant to Closed/Completed
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "4" seconds

    # Verify: grant status is Closed/Completed after closeout completion
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Bulk Award Closeout Grant}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Bulk Award Closeout Grant}" inside flex table with id "---closeout:-:grantsTableId---"
    Then I softly see field "Status" as "Closed/Completed"
