@GovGrantsSanityPreRequisiteCheck @regression
Feature: Validate Pre-requisiste check for Sanity/Regression

  @checkUserLoginsGrantor
  Scenario: Check GovGrants user logins - Grantor
    When I login to "Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grants Portal" app as "SME" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
#    #RegressionUser
#    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    When I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I re-login to "Grants Portal" app as "SPI4" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    And I logout

  @mkk @checkUserLoginsGrantee
  Scenario: Check GovGrants user logins - Grantee
    When I login to "Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Home" tab
    When I re-login to "Grantee" app as "GRANTEE PM" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantee" app as "GRANTEE FO" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantee" app as "GRANTEE FD" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantee" app as "GRANTEE PO" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
#    #RegressionUser
#    When I re-login to "Grantee" app as "GRANTEE ADMIN1" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I re-login to "Grantee" app as "GRANTEE ADMIN2" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    When I re-login to "Grantee" app as "GRANTEE EXE1" user on "SUBPORTAL" portal
#    And I navigate to "Home" tab
#    And I logout

  @StandardAwardActivationAPI @InlineItems @FDMAward
  Scenario: Standard Award Activation from approved FDM API
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime Announcement}" on announcement "{SavedValue:Automation Runtime Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Announcement}"
    And I created award from approved FDM with announcement "{SavedValue:Automation Runtime Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Announcement}"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Announcement}" having object api name as "PaymentRequest__c"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Announcement}" having object api name as "ProgressReports__c"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Announcement}" having object api name as "Closeout"

  @WorkPlanActivationAPI @PaymentOrProgresOrCloseoutRequestBatchJob @APISanity
  Scenario: Workplan Award Activation API and PaymentRequest / ProgressReport / Closeout batch jobs
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "Closeout"
