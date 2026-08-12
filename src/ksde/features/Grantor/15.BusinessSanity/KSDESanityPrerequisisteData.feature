@ksdeSanityPreRequisite @grantor-sanity @sanity
Feature: Validate sanity testing of Complete Business Flow

  @CheckKSDEUserLogins
  Scenario: Check User Logins
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab

  @StandardAwardActivationAPI @detailedBudgetNo
  Scenario: Standard Award Activation from approved FDM API->Detailed Budget=No
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"

  @StandardAwardActivationAPI @detailedBudgetYes
  Scenario: Standard Award Activation from approved FDM API->Detailed Budget=Yes
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "DETAILE_BUDGET_YES"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "BUDGET_CAT_DETAILS_BUD_YES"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"

  @202531 @StandardAwardFromFDMAPI @APISanity @arpa
  Scenario: FDM Creation API
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    Given I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I created FDM on application "{SavedValue:Automation Runtime FDM Announcement}"

  @DirectAwardActivationAPI @PaymentOrProgresOrCloseoutRequestBatchJob @APISanity
  Scenario: Direct Award Activation API and PaymentRequest / ProgressReport / Closeout batch jobs->Detailed Budget=Yes
    Given I activated standalone subaward "Automation Runtime award" with properties "IS_BUILDUP_FUNCTIONALITY_YES" of type "Competitive"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "Closeout"

  @wip @DirectAwardActivationAPI @PaymentOrProgresOrCloseoutRequestBatchJob @APISanity
  Scenario: Direct Award Activation API and PaymentRequest / ProgressReport / Closeout batch jobs->Detailed Budget=No
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "Closeout"
