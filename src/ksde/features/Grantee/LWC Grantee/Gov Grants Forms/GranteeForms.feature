@GranteeForms
Feature: Grantee Forms Scenario

  @485407 @485428 @ValidateProjectNarrativeAttachmentFOuserasaReviewershouldabletoedittheformifeditaccessisYes @GRegression3 @P3_Grantee @PM_Grantee
  Scenario: Validate Project Narrative Attachment FO user as a Reviewer should able to edit the form if edit access is Yes
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside table
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    #485428
    And I close the tab
    And I perform quick search inside global search "Project Narrative Attachment Form"
    Then I softly do not see value "Project Narrative Attachment Form" for title "Announcement Name" inside table "Announcements"
    Then I softly do not see value "Project Narrative Attachment Form" for title "ID" inside table "FOA Leads"
    Then I softly do not see value "Project Narrative Attachment Form" for title "Program Name" inside table "Programs"

  @485410 @ValidateProjectNarrativeAttachmentFOuserasaReviewershouldnotabletoedittheformifeditaccessisNo @P2_Grantee @FO_Grantee @GRegression2
  Scenario: Validate Project Narrative Attachment FO user as a Reviewer should not able to edit the form if edit access is No
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "TWO_STEP_APPROVER"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"

  @485414 @485415 @485416 @485417 @485418 @ValidateProjectNarrativeAttachmentEXEusershouldabletoviewaccessinallstateofApplicationforform @P2_Grantee @EXE_Grantee @FO_Grantee @FD_Grantee @ADMIN_Grantee @AUDITOR_Grantee @Gregression2
  Scenario: Validate Project Narrative Attachment EXE user should able to view access in all state of Application for form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter value "Automation1234" into field "Funding_Opportunity_Number__c"
    And I enter value "11.123" into field "CFDA_Number__c"
    And I enter value "Automation Application" into field "Applicant_Name__c"
    And I enter value "Automation Test" into field "DescriptiveTitleOfProject__c"
    And I enter value "Automation Test Execution" into field "ProjectSummary__c"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @485425 @ValidateProjectNarrativeAttachmentAdminuserusershouldabletoseethelastmodifycolumnisupdateifonlyformiseditedbyanyuser @P2_Grantee @Gregression2 @ADMIN_Grantee
  Scenario: Validate Project Narrative Attachment Admin user user should able  to see the last modify column is update if only form is edited by any user
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    Then I softly see value "Sarah PM" for title "Last Modified By Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside table
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "Sarah PM" for title "Last Modified By Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"

  @485427 @478403 @ValidateProjectNarrativeAttachmentPMuserisrejecttheapplicationthensubmittograntsgovbuttonisnotdisplaytheeditaccess
  Scenario: Validate Project Narrative Attachment PM user is reject the application then submit to grants.gov button is not display & verify the edit access
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter value "Automation1234" into field "Funding_Opportunity_Number__c"
    And I enter value "11.123" into field "CFDA_Number__c"
    And I enter value "Automation Application" into field "Applicant_Name__c"
    And I enter value "Automation Test" into field "DescriptiveTitleOfProject__c"
    And I enter value "Automation Test Execution" into field "ProjectSummary__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name       | Application |
      | Grantee PO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Rejected"
    Then I softly cannot see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    #478403
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @481435 @ValidateusershouldnotabletoSubmittheApptograntsgovifusernotaddedthemandatoryfileinattachment @PO_Grantee @P2_Grantee @GRegression1
  Scenario: Validate user should not able to Submit the App to grants gov if user not added the mandatory file in attachment
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269349" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269349" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269349" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Created"
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |

  @478400 @478403 @ValidateProjectNarrativeAttachmentformusershouldabletoaddtheattachmentincreatedsendforreviewsubmittedforreviewreviewedstate @P1_Grantee @PO_Grantee @GRegression1
  Scenario: Validate Project Narrative Attachment form user should able to add the attachment in created, send for review submitted for review, reviewed state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    And I wait for "1" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment1.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment1.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Delete" icon for "Attachment1.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "1" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @478403_1 @ValidateProjectNarrativeAttachmentformusershouldabletoaddtheattachmentincreatedsendforreviewsubmittedforreviewreviewedstate
  Scenario: Validate Project Narrative Attachment form user should able to add the attachment in created, send for review submitted for review, reviewed state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    And I wait for "1" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @477581 @477583 @477584 @477585 @477586 @477587 @ValidateAttachmentsformEXEuseruserNonOwnercanonlyviewfilesaddedonattachments @GRegression3 @GranteeTBE
  Scenario: Validate Attachments form EXE, PO, FO, FD, ADMIN, AUDITOR user user Non Owner can only view files added on attachments
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberAttachmentsForm}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001204576" with properties "default"
    Given I login to "As a Grantee" app as "Grantee PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001204576" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001204576" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @477582 @ValidateAttachmentsformPMuserNonOwnercanonlyviewfilesaddedonattachments  @P3_Grantee @PM_Grantee @GRegression3
  Scenario: Validate Attachments form PM user Non Owner can only view files added on attachments
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @479091 @ValidatePOProfiletheRevisebutton
  Scenario: Validate PO Profile the Revise button
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0000660610" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "Grantee_Opp_PreAppNo_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact | Project Role                                   |
      | Sarah PM | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Add Line Item Details" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values - backup.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I click on "Edit" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I enter the following values into flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" by clicking "Add" :
      | Name     | Is Key Contact | Project Role    |
      | Sarah PM | Checked        | Program Manager |
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name       | Application |
      | Grantee PO | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Validate" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"

  @479461 @479462 @ValidatePOProfileabletoseevalidateandsavebuttononformsandsplitviewscreenonceformsstatuscreatedSubmitedforreviewReviewed @P2_Grantee @P3_Grantee @PO_Grantee @GRegression1
  Scenario: Validate PO Profile able to see validate and save button on forms and split view screen once forms status created Submited for review Reviewed
    Given I delete the grantee record "{grantee_testData:GrantsGovKeyContactMandatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269340" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269340" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269340" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "1" seconds
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:HomePendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:HomePendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
    When I enter the following values into flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" by clicking "Add" :
      | Name     | Is Key Contact | Project Role    |
      | Sarah PM | Checked        | Program Manager |
    And I click on "Validate" in the split screen page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see top right button "Edit" in the split screen page details
    Then I cannot see top right button "Validate" in the split screen page details

  @473992 @VerifytheallvalidationsofSF424formGrantsgovApplication @P1_Grantee @GRegression1 @GranteeTBE
  Scenario:Verify the all fields of SF-424[V4.0] form Grants.gov Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, 1. Type of Submission is required in the Application for Federal Assistance SF-424 section.                                                                                                  |
      | To Save, 2. Type Of Application is required in the Application for Federal Assistance SF-424 section.                                                                                                 |
      | To Save, a. Legal Name is required in the Applicant Information section.                                                                                                                              |
      | To Save, c. UEI is required in the Applicant Information section.                                                                                                                                     |
      | To Save, Street1 is required in the Applicant Information section.                                                                                                                                    |
      | To Save, City is required in the Applicant Information section.                                                                                                                                       |
      | To Save, State is required in the Applicant Information section.                                                                                                                                      |
      | To Save, Zip / Postal Code is required in the Applicant Information section.                                                                                                                          |
      | To Save, First Name is required in the Authorized Representative section.                                                                                                                             |
      | To Save, Last Name is required in the Authorized Representative section.                                                                                                                              |
      | To Save, Telephone Number is required in the Authorized Representative section.                                                                                                                       |
      | To Save, Email is required in the Authorized Representative section.                                                                                                                                  |
      | To Save, Type of Applicant 1: Select Applicant Type is required in the Type of Applicant section.                                                                                                     |
      | To Save, 10. Name of Federal Agency is required in the Name Of Federal Agency section.                                                                                                                |
      | To Save, 11. Assistance Listing Number (Catalog of Federal Domestic Assistance Number) is required in the Assistance Listing # section.                                                               |
      | To Save, Assistance Listing Number (CFDA) Title is required in the Assistance Listing # section.                                                                                                      |
      | To Save, Title is required in the Authorized Representative section.                                                                                                                                  |
      | To Save, 15. Descriptive Title of Applicant's Project is required in the Descriptive Title section.                                                                                                   |
      | To Save, a. Applicant is required in the Congressional District section.                                                                                                                              |
      | To Save, b. Program/Project is required in the Congressional District section.                                                                                                                        |
      | To Save, a. Start Date is required in the Proposed Project section.                                                                                                                                   |
      | To Save, b. End Date is required in the Proposed Project section.                                                                                                                                     |
      | To Save, a. Federal is required in the Estimated Funding ($) section.                                                                                                                                 |
      | To Save, b. Applicant is required in the Estimated Funding ($) section.                                                                                                                               |
      | To Save, c. State is required in the Estimated Funding ($) section.                                                                                                                                   |
      | To Save, d. Local is required in the Estimated Funding ($) section.                                                                                                                                   |
      | To Save, e. Other is required in the Estimated Funding ($) section.                                                                                                                                   |
      | To Save, f. Program Income is required in the Estimated Funding ($) section.                                                                                                                          |
      | To Save, 19. Is Application Subject to Review By State Under Executive Order 12372 Process? is required in the Application Review section.                                                            |
      | To Save, 20. Is the Applicant Delinquent On Any Federal Debt? (If "Yes," provide explanation in attachments. Add attachment from the Files section) is required in the Federal Debt (if any) section. |
      | To Save, I AGREE is required in the Agreement Details section.                                                                                                                                        |
      | First Name is required to save.                                                                                                                                                                       |
      | Last Name is required to save.                                                                                                                                                                        |
      | Title is required to save.                                                                                                                                                                            |
      | Telephone Number is required to save.                                                                                                                                                                 |
      | Email is required to save.                                                                                                                                                                            |
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Application for Federal Assistance (SF-424)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"

  @473994 @Verifyusershouldabletoseethecolumnsonformssection @P2_Grantee @GRegression2 @GranteeTBE
  Scenario:Verify user should able to see the columns on forms section
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see link "grants.gov" inside Page block
    Then I softly see "Form Name" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Mandatory" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Percentage" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Last Modified By Name" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "Validated" in flex table header "---grantee_tableId:-:applicationBusinessFormTableId---"

  @482022 @GrantsgovlobbingformVerifyPOuserNonOwnercannotaddeditdeletedatainGrantsgovlobbingformandcanonlyviewdataenteredbyownerintheform @P3_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Grants.gov lobbing form -  Verify PO user (Non Owner) cannot add/edit/delete data in Grants.gov lobbing form and can only view data entered by owner in the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "3" seconds
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName        | OwnerType   | NonOwner        |
      | Sarah PM user   | GRANTEE PM  | GRANTEE PO      |

  @482023 @GrantsgovlobbingformVerifyEXEuserNonOwnercannotaddeditdeletedatainGrantsgovlobbingformandcanonlyviewdataenteredbyownerintheform @P3_Grantee @EXE_Grantee @GRegression2
  Scenario Outline: Grants.gov lobbing form -  Verify EXE user (Non Owner) cannot add/edit/delete data in Grants.gov lobbing form and can only view data entered by owner in the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "3" seconds
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName        | OwnerType   | NonOwner        |
      | Sarah PM user   | GRANTEE PM  | GRANTEE EXE     |

  @482024 @GrantsgovlobbingformVerifyFOuserNonOwnercannotaddeditdeletedatainGrantsgovlobbingformandcanonlyviewdataenteredbyownerintheform @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Grants.gov lobbing form -  Verify FO user (Non Owner) cannot add/edit/delete data in Grants.gov lobbing form and can only view data entered by owner in the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "3" seconds
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName        | OwnerType   | NonOwner        |
      | Victor EXE user | GRANTEE EXE | GRANTEE FO      |

  @482025 @GrantsgovlobbingformVerifyFDuserNonOwnercannotaddeditdeletedatainGrantsgovlobbingformandcanonlyviewdataenteredbyownerintheform @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Grants.gov lobbing form -  Verify FD user (Non Owner) cannot add/edit/delete data in Grants.gov lobbing form and can only view data entered by owner in the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "3" seconds
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName        | OwnerType   | NonOwner        |
      | Victor EXE user | GRANTEE EXE | GRANTEE FD      |

  @482026 @GrantsgovlobbingformVerifyADMINuserNonOwnercannotaddeditdeletedatainGrantsgovlobbingformandcanonlyviewdataenteredbyownerintheform @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Grants.gov lobbing form -  Verify ADMIN user (Non Owner) cannot add/edit/delete data in Grants.gov lobbing form and can only view data entered by owner in the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "3" seconds
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName        | OwnerType   | NonOwner        |
      | Grantee PO user | GRANTEE PO  | GRANTEE ADMIN1  |

  @482027 @GrantsgovlobbingformVerifyAUDITORuserNonOwnercannotaddeditdeletedatainGrantsgovlobbingformandcanonlyviewdataenteredbyownerintheform @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Grants.gov lobbing form -  Verify AUDITOR user (Non Owner) cannot add/edit/delete data in Grants.gov lobbing form and can only view data entered by owner in the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "3" seconds
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "3" seconds
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName        | OwnerType   | NonOwner        |
      | Sarah PM user   | GRANTEE PM  | GRANTEE AUDITOR |

  @482030 @GrantsgovlobbingformVerifyassignedreviewerEXEwitheditaccessasNocannotseeeditbuttonforGrantsgovlobbingformandcannoteditanydataontheform @P3_Grantee @GRgression3 @GranteeTBE
  Scenario Outline: Grants.gov lobbing form - Verify assigned reviewer(EXE)  with edit access as No cannot see edit button for Grants.gov lobbing form and cannot edit any data on the form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Delete" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | UserType   |
      | Sarah PM user | GRANTEE PM |

  @485355 @SF424VerifyFOuserasaReviewershouldabletoedittheformifeditaccessisYes @P2_Grantee @GRegression2 @GranteeTBE
  Scenario Outline: SF-424 -Verify FO user as a Reviewer should able to edit the form if edit access is Yes
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Examples:
      | UserName      | UserType   |
      | Sarah PM user | GRANTEE PM |

  @485359 @SF424VerifyFOuserasaReviewershouldabletoedittheformifeditaccessisNo @P2_Grantee @GRegression2 @GranteeTBE
  Scenario Outline: SF-424 -Verify FO user as a Reviewer should able to edit the form if edit access is No
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001241410" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | UserType   |
      | Sarah PM user | GRANTEE PM |

  @482029 @GrantsgovlobbingformVerifyassignedreviewerFOwitheditaccessasYescanseeeditbuttonforGrantsgovlobbingformandcaneditallthedataontheformandvalidateitwhenapplicationisinSubmittedforreviewstate @GRegression2 @GranteeTBE
  Scenario Outline: Grants.gov lobbing form - Verify assigned reviewer(FO)  with edit access as Yes can see edit button for Grants.gov lobbing form and can edit all the data on the form and validate it when application is in Submitted for review state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumber}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001241410" with properties "default"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001241410" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    Examples:
      | UserType   |
      | GRANTEE PM |

  @485370 @Sf424VerifyAdminusershouldabletoviewaccessforforminallstateofApplication @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Sf-424-Verify Admin user should able to view access for form in all  state of Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | OwnerType  | UserType        |
      | Sarah PM user | GRANTEE PM | GRANTEE ADMIN1  |

  @485371 @Sf424VerifyAUDITORusershouldabletoviewaccessforforminallstateofApplication @P4_Grantee @AUDITOR_Grantee @GRegression4
  Scenario Outline: Sf-424-Verify AUDITOR user should able to view access for form in all  state of Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | OwnerType  | UserType        |
      | Sarah PM user | GRANTEE PM | GRANTEE AUDITOR |

  @485364 @Sf424VerifyFOusershouldabletoviewaccessforforminallstateofApplication @P2_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Sf-424-Verify FO user should able to view access for form in all  state of Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | OwnerType  | UserType        |
      | Sarah PM user | GRANTEE PM | GRANTEE FO      |

  @485365 @Sf424VerifyFDusershouldabletoviewaccessforforminallstateofApplication @P2_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Sf-424-Verify FD user should able to view access for form in all  state of Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | OwnerType  | UserType        |
      | Sarah PM user | GRANTEE PM | GRANTEE FD      |

  @485361 @Sf424VerifyEXEusershouldabletoviewaccessforforminallstateofApplication @P3_Grantee @EXE_Grantee @GRegression3
  Scenario Outline: Sf-424-Verify EXE user should able to view access for form in all  state of Application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I wait for "2" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | OwnerType  | UserType        |
      | Sarah PM user | GRANTEE PM | GRANTEE EXE     |

  @485395 @Sf424PMuserisrejecttheapplicationthensubmittograntsgovbuttonisnotdisplay&verifytheeditaccess @P4_Grantee @GranteeTBE
  Scenario Outline: Sf-424- PM user is reject the application then submit to grants.gov button is not display & verify the edit access
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "DAVID_FO_APPROVER-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    Then I softly cannot see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserName      | OwnerType  |
      | Sarah PM user | GRANTEE PM |

  @485360 @SF424VerifyPMusershouldabletosubmittheapplicationtograntsgovifuserupdatethedatarevisioninprogressstate @P2_Grantee @GranteeTBE
  Scenario: SF-424-Verify PM user should able to submit the application to grants.gov if user update the data revision in progress state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Sarah PM"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Sarah PM"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "DAVID_FO_APPROVER"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @485374 @Sf424VerifyAdminuserusershouldabletoseethelastmodifycolumnisupdateifonlyformiseditedbyanyuser @P2_grantee @GranteeTBE
  Scenario Outline: Sf-424- Verify Admin user user should able  to see the last modify column is update if only form is edited by any user
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see value "Delinquent Federal Debt" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly do not see value "Areas Affected" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Areas Affected" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see value "Delinquent Federal Debt" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see value "Areas Affected" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see value "Delinquent Federal Debt" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see value "Areas Affected" for title "Classification" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | UserName      | OwnerType  | UserType       |
      | Sarah PM user | GRANTEE PM | GRANTEE ADMIN1 |

  @485340 @SF424VerifyPMusershouldnotableedittheformsinsubmitforapprovalapprovedsubmittograntorstate @P2_Grantee @GranteeTBE
  Scenario: SF-424-Verify PM user should not able o edit the forms in submit for approval, approved, submit to grantor state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    And I close the tab
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail

  @485339 @SF424VerifyPMusershouldabletoedittheformsinCreatedSubmittedforreviewreviewedRevisioninprogressstate&Verifynonuserpermission @P2_Grantee @GranteeTBE
  Scenario: SF-424-Verify PM user should able to edit the forms in Created , Submitted for review, reviewed, Revision in progress state & Verify non user permission
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I close the tab
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    And I close the tab
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail

  @477451 @VerifyEXEuserNonOwneranonlyviewfilesaddedonBudgetNarrativeattachmentform @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Verify EXE user (Non Owner) can only view files added on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "1" seconds
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | OwnerType  | NonOwner        |
      | GRANTEE PM | GRANTEE EXE     |

  @477452 @VerifyFOuserNonOwneranonlyviewfilesaddedonBudgetNarrativeattachmentform @P3_Grantee @FO_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Verify FO user (Non Owner) can only view files added on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "1" seconds
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | OwnerType  | NonOwner        |
      | GRANTEE PM | GRANTEE FO      |

  @477453 @VerifyFDuserNonOwneranonlyviewfilesaddedonBudgetNarrativeattachmentform @P3_Grantee @FD_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Verify FD user (Non Owner) can only view files added on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "1" seconds
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | OwnerType  | NonOwner        |
      | GRANTEE PM | GRANTEE FD      |

  @477454 @VerifyADMINuserNonOwneranonlyviewfilesaddedonBudgetNarrativeattachmentform @P3_Grantee @ADMIN_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Verify ADMIN user (Non Owner) can only view files added on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "1" seconds
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | OwnerType  | NonOwner        |
      | GRANTEE PM | GRANTEE ADMIN1  |

  @477455 @VerifyEXEuserNonOwneranonlyviewfilesaddedonBudgetNarrativeattachmentform @P4_Grantee @AUDITOR_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Verify EXE user (Non Owner) can only view files added on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "1" seconds
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Examples:
      | OwnerType  | NonOwner        |
      | GRANTEE PM | GRANTEE AUDITOR |

  @477449 @BudgetNarrativeattachmentformVerifyvalidationdisplayedtoPMuseronBudgetNarrativeattachmentform @P2_Grantee @P2_Grantee @PM_Grantee @GRegression2
  Scenario Outline:Budget Narrative attachment form - Verify validation displayed to PM user on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    When I click on "SplitView" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Validate" in the split screen page details
    And I click on "Validate" in the split screen page details
    Then I softly see the following messages in the page details contains:
      | Please upload exactly one 'Mandatory Budget Narrative'. |
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Please upload exactly one 'Mandatory Budget Narrative'. |
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | 2 duplicate file title(s) found: AttachmentTesting.pdf. Please ensure all file titles are unique. |
      | 2 duplicate file title(s) found: Attachment.pdf. Please ensure all file titles are unique. |
      | Please upload exactly one 'Mandatory Budget Narrative'. |
      | Please upload no more than one 'Optional Budget Narrative'. |
    Examples:
      | UserName        | OwnerType  |
      | Sarah PM user   | GRANTEE PM |

  @477450 @BudgetNarrativeattachmentformVerifyvalidationdisplayedtoPMuseronBudgetNarrativeattachmentform @P2_Grantee @PO_Grantee @P2_Grantee @GRegression2
  Scenario Outline:Budget Narrative attachment form - Verify validation displayed to PM user on Budget Narrative attachment form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    When I click on "SplitView" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Validate" in the split screen page details
    And I click on "Validate" in the split screen page details
    Then I softly see the following messages in the page details contains:
      | Please upload exactly one 'Mandatory Budget Narrative'. |
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Please upload exactly one 'Mandatory Budget Narrative'. |
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Budget Narrative" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Optional Budget Narrative" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | 2 duplicate file title(s) found: AttachmentTesting.pdf. Please ensure all file titles are unique. |
      | 2 duplicate file title(s) found: Attachment.pdf. Please ensure all file titles are unique. |
      | Please upload exactly one 'Mandatory Budget Narrative'. |
      | Please upload no more than one 'Optional Budget Narrative'. |
    Examples:
      | UserName        | OwnerType  |
      | Grantee PO user | GRANTEE PO |

  @477446 @BudgetNarrativeattachmentformVerifyFDusercannotaddeditViewdeletefilesinBudgetnarrativeattachmentforminSplitviewmodewhenApplicationisinsubmittedforreviewstate @GRegression2 @GranteeTBE
  Scenario: Budget Narrative attachment form - Verify FD user cannot add/edit/View/delete files in Budget narrative attachment form in Split view mode when Application is in submitted for review state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212745" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Mandatory Budget Narrative" from computer
    When I click modal button "Close"
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    When I click on "SplitView" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see top right button "Edit" in the split screen page details
    Then I softly cannot see top right button "Validate" in the split screen page details
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "Download" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Edit" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly cannot see row level action button "Delete" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly can see row level action button "View" against "Mandatory Budget Narrative" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"

  @481564 @VerifyEXEusershouldabletoviewaccessinallstateofApplicationforform @EXE_Grantee @P2_Grantee @GRegression4 @GranteeTBE
  Scenario Outline: Verify EXE user should able to view access in all state of Application for form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType  | UserType        |
      | GRANTEE PM | GRANTEE EXE     |

  @481565 @VerifyFOusershouldabletoviewaccessinallstateofApplicationforform @P3_Grantee @FO_Grantee @GRegression4 @GranteeTBE
  Scenario Outline: Verify FO user should able to view access in all state of Application for form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType  | UserType        |
      | GRANTEE PM | GRANTEE FO      |

  @481566 @VerifyFDusershouldabletoviewaccessinallstateofApplicationforform @P3_Grantee @FD_Grantee @GRegression4 @GranteeTBE
  Scenario Outline: Verify FD user should able to view access in all state of Application for form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType  | UserType        |
      | GRANTEE PM | GRANTEE FD      |

  @481567 @VerifyFOusershouldabletoviewaccessinallstateofApplicationforform @P4_Grantee @AUDITOR_Grantee @GRegression4 @GranteeTBE
  Scenario Outline: Verify AUDITOR user should able to view access in all state of Application for form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType  | UserType        |
      | GRANTEE PM | GRANTEE AUDITOR |

  @481568 @VerifyFOusershouldabletoviewaccessinallstateofApplicationforform @ADMIN_Grantee @P2_Grantee @GRegression4 @GranteeTBE
  Scenario Outline: Verify FO user should able to view access in all state of Application for form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "3" seconds
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision In Progress"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | OwnerType  | UserType        |
      | GRANTEE PM | GRANTEE ADMIN1  |


  @481536 @VerifyFOuserasaReviewershouldabletoedittheformifeditaccessisYes @GRegression2 @GranteeTBE
  Scenario Outline: Verify FO user as a Reviewer should able to edit the form if edit access is Yes
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "Funding Opportunity Number" as "FundingOpportunityNumber"
    And I save the field labeled "Applicant Name" as "ApplicantName"
    And I save the field labeled "Descriptive Title of Applicant's Project" as "DescriptiveTitle"
    And I save the field labeled "Project Abstract" as "ProjectAbstract"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I see field "Funding Opportunity Number" as "{SavedValue:FundingOpportunityNumber}"
    Then I see field "Applicant Name" as "{SavedValue:ApplicantName}"
    Then I see field "Descriptive Title of Applicant's Project" as "{SavedValue:DescriptiveTitle}"
    Then I see field "Project Abstract" as "{SavedValue:ProjectAbstract}"
    Examples:
      | UserType   |
      | GRANTEE PM |

  @481537 @VerifyFDuserasaReviewershouldablenotedittheformifeditaccessisNo @GRegression4 @GranteeTBE
  Scenario Outline: Verify FD user as a Reviewer should able not edit the form if edit access is No
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name      | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I pause execution for "2" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "SplitView" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Examples:
      | UserType   |
      | GRANTEE PM |

  @481563 @VerifyPOUsershouldabletotoedittheforminRevisioninProgressstate @GRegression4 @GranteeTBE
  Scenario: Verify PO User should able to to edit the form in Revision in Progress state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision In Progress"
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Areas Affected" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @481571 @VerifyPMUsershouldabletosubmittheapplicationtograntsgovwithaddingrequiredfields&optionalfields @GRegression2 @GranteeTBE
  Scenario: Verify PM User should able to submit the application to grants.gov with adding  required fields & optional fields
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "Project_Abstract_Summary" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

  @482652 @ValidatePOProfileablevalidatetheSFLLLformwithValiddata @P2_Grantee @PO_Grantee @GRegression1
  Scenario: Validate PO Profile able validate the SF LLL form with Valid data
    Given I delete the grantee record "{grantee_testData:GrantsGovMandatorySFLLL}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269344" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269344" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269344" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    And I wait for "2" seconds
    Then I softly see value "Disclosure of Lobbying Activities (SF-LLL)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Disclosure of Lobbying Activities (SF-LLL)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Disclosure of Lobbying Activities (SF-LLL)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Disclosure of Lobbying Activities (SF-LLL)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Disclosure of Lobbying Activities (SF-LLL)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see "Federal Action Information" page block displayed
    Then I softly see "Name and Address of Reporting Entity" page block displayed
    Then I softly see "5. If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" page block displayed
    Then I softly see "Federal Department/Agency Information" page block displayed
    Then I softly see "Name and Address of Lobbying Registrant" page block displayed
    Then I softly see "Individual Performing Services (including address if different from No. 10a)" page block displayed
    Then I softly see "Disclosure of Lobbying Activities" page block displayed
    Then I softly see field "1. Type of Federal Action" inside page block
    Then I softly see field "2. Status of Federal Action" inside page block
    Then I softly see field "3. Report Type" inside page block
    Then I softly see the text containing "For Material Change Only"
    Then I softly see field "Year" inside page block
    Then I softly see field "Quarter" inside page block
    Then I softly see field "Date of Last Report" inside page block
    Then I softly see field "4. Name and Address of Reporting Entity" inside page block
    Then I softly see field "Tier if known" inside page block
    Then I softly see field "Name" inside "Name and Address of Reporting Entity" section
    Then I softly see field "Street 1" inside "Name and Address of Reporting Entity" section
    Then I softly see field "Street 2" inside "Name and Address of Reporting Entity" section
    Then I softly see field "City" inside "Name and Address of Reporting Entity" section
    Then I softly see field "State" inside "Name and Address of Reporting Entity" section
    Then I softly see field "Zip" inside "Name and Address of Reporting Entity" section
    Then I softly see field "Congressional District, if known" inside "Name and Address of Reporting Entity" section
    Then I softly see field "Name" inside "If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" section
    Then I softly see field "Street 1" inside "If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" section
    Then I softly see field "Street 2" inside "If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" section
    Then I softly see field "City" inside "If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" section
    Then I softly see field "State" inside "If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" section
    Then I softly see field "Zip" inside "If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" section
    Then I softly see field "Congressional District, if known" inside "If Reporting Entity in No.4 is Subawardee, Enter Name and Address of Prime" section
    Then I softly see field "6. Federal Department/Agency" inside "Federal Department/Agency Information" section
    Then I softly see field "7. Federal Program Name/Description" inside "Federal Department/Agency Information" section
    Then I softly see field "Assistance Listing Number (CFDA Number), if applicable" inside "Federal Department/Agency Information" section
    Then I softly see field "8. Federal Action Number, if known" inside "Federal Department/Agency Information" section
    Then I softly see field "9. Award Amount, if known" inside "Federal Department/Agency Information" section
    Then I softly see field "Prefix" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "First Name" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "Middle Name" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "Last Name" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "Suffix" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "Street 1" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "Street 2" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "City" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "State" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "Zip" inside "Name and Address of Lobbying Registrant" section
    Then I softly see field "Prefix" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "First Name" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "Middle Name" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "Last Name" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "Suffix" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "Street 1" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "Street 2" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "City" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "State" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "Zip" inside "Individual Performing Services (including address if different from No. 10a)" section
    Then I softly see field "Signature" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "Prefix" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "First Name" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "Middle Name" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "Last Name" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "Suffix" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "Title" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "Telephone No" inside "Disclosure of Lobbying Activities" section
    Then I softly see field "Date" inside "Disclosure of Lobbying Activities" section
    And I enter "Grantee_SF-LLL_Form_Valid" values from "Application_Field_Values - backup.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @477553 @477511 @477555 @477870 @ValidatewithPOprofileonClickViewactionKeycontactformgetopeninviewTab @GRegression3
  Scenario: Validate with PO profile on Click View action Key contact form get open in view Tab
    Given I delete the grantee record "{grantee_testData:GrantsGovKeyContactMandatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269340" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269340" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269340" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Key Contacts" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly see the text containing "Key Contacts"
    Then I softly see the text containing :
      | Agency Owner: Grants.gov |
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "2.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Key Contacts" page block displayed
    Then I softly can see top right button "Add" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    #477511
    And I close the tab
    And I click on "Edit" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see new tab is opened
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    Then I softly see the text containing "Key Contacts"
    Then I softly see the text containing :
      | Agency Owner: Grants.gov |
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "2.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Key Contacts" page block displayed
    Then I softly can see top right button "Add" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see the text containing "Required to Save"
    Then I softly see the text containing "Required to Submit"
    When I click on parallel lines menu bar with data target value "Key Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Key Contacts"
    Then I see table is refreshing
    And I perform quick search for "Attachment" in "---grantee_tableId:-:applicationKeyContactFormTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:applicationKeyContactFormTableId---"
    When I "Collapse" page block contaninig value "Key Contacts"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    When I "Expanded" page block contaninig value "Key Contacts"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly can see top right button "Edit" in page detail
    #477870
    Then I softly can see top right button "Validate" in page detail
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Please select atleast one contact as a Key Contact. |
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:applicationKeyContactFormTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I enter the following values into flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" by clicking "Add" :
      | Name     | Is Key Contact | Project Role    |
      | Sarah PM | Checked        | Program Manager |
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    #477870
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I click on "Delete" icon for "Sarah PM" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    #477555
    And I close the tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
    And I click on "Edit" in the split screen page details
    Then I can see top right button "Save" in the split screen page details
    #477870
    Then I can see top right button "Cancel" in the split screen page details
    And I click on "Cancel" in the split screen page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    Then I softly see button "OK" on confirmation pop-up
    Then I softly see button "Cancel" on confirmation pop-up
    When I click modal button "OK"
    Then I softly see "Key Contacts" page block displayed
    Then I softly see the text containing :
      | Agency Owner: Grants.gov |
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "2.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    And I click on "Validate" in the split screen page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please select atleast one contact as a Key Contact. |
    When I enter the following values into flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" by clicking "Add" :
      | Name     | Is Key Contact | Project Role    |
      | Sarah PM | Checked        | Program Manager |
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    And I click on "Validate" in the split screen page details
    And I wait for "2" seconds
    #477870
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I click on "Edit" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see value "Program Manager" for title "Project Role" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    And I close the tab
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see value "Program Manager" for title "Project Role" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    And I click on "Delete" icon for "Sarah PM" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" without waiting for record
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"

  @479928 @ValidateUsershouldabletovalidatethedataonsplitviewmode @P1_Grantee @PO_Grantee @GRegression1
  Scenario: Validate User should able to validate the data on splitview mode
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see top right button "Edit" in the split screen page details
    Then I can see top right button "Validate" in the split screen page details
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationProjectNarrativeAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Mandatory Project Narrative File" from computer
    When I click modal button "Close"
    And I click on "Validate" in the split screen page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:applicationProjectNarrativeAttachmentTableId---"
    And I wait for "3" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationProjectNarrativeAttachmentTableId---"

  @477672 @ValidateWithPOProfileAddbuttonabletoseeandcontinue @GRegression1
  Scenario: Validate With PO Profile Add button able to see and continue
    Given I delete the grantee record "{grantee_testData:GrantsGovKeyContactMandatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269340" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269340" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269340" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Key Contacts" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Key Contacts" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Key Contacts" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I wait for "2" seconds
    Then I softly can see top right button "Add" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    And I click on top right button "Add" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see top right button "Add" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see top right button "Save" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see "Applicant Organization Name" in flex table header "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see "Telephone Number" in flex table header "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:applicationKeyContactFormTableId---"
    When I click on parallel lines menu bar with data target value "Key Contacts"
    And I select "Refresh" from parallel lines dropdown of "Key Contacts"
    Then I see table is refreshing
    When I enter the following values into flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" by clicking "Add" :
      | Name     | Is Key Contact | Project Role    |
      | Sarah PM | Checked        | Program Manager |
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see value "Program Manager" for title "Project Role" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see value "Department of Product" for title "Applicant Organization Name" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see value "(940) 351-4157" for title "Telephone Number" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see value "sarah.pm.t8@yopmail.com.invalid" for title "Email" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly see value "True" for title "Is Key Contact" inside table "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see row level action button "Delete" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"
    And I click on "Delete" icon for "Sarah PM" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationKeyContactFormTableId---"

  @485304 @ValidatePOuserAROwnercanabletoRejecttheFundingChangeAmendmentRequestfromApprovalProcess @P3_Grantee @PO_Grantee @GRegression2
  Scenario: Validate PO user AR Owner can able to Reject the Funding Change Amendment Request from Approval Process
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I "Created" of type "Funding Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "GRANTEE_FO_APPROVER-Grantee PO user"
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @485287 @ValidatePOusercannotabletocreateFundingChangeARonClosedstatesofAward @P3_Grantee @PO_Grantee @GRegression2
  Scenario: Validate PO user can not able to create Funding Change AR on Closed states of Award
    And I "Created" standalone subaward "Automation Runtime award" with properties "INDIRECT_COST_NO-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I create adhoc closeout "{SavedValue:Automation Runtime award}" for status "Completed" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    Then I softly see field "Status" as "Closed/Completed"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Closed" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"
    And I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentsTableId---"

  @485303 @ValidateFDuserAROwnercanabletotakeNotAcceptedDecisionfromGrantorRecordDecisionmodal @P3_Grantee @FD_Grantee @Gregression2
  Scenario: Validate FD user AR Owner can able to take Not Accepted Decision from Grantor Record Decision modal
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I "Approved" of type "Funding Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default-Danielle FD Garcia user"
    When I login to "As a Grantee" app as "GRANTEE FD" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value        | Field       |
      | Not Accepted | Decision__c |
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Additional Details is required. |
    When I enter values into fields
      | Value | Field       |
      | Test  | Comments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Status" as "Not Accepted"
    Then I softly see status in Progress-bar is "Not Accepted" and is "Red"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Not Accepted" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"

  @485289 @ValidatePOuserAROwnercanabletoAcceptFundingChangeAmendmentRequest
  Scenario: Validate PO user AR Owner can able to Accept Funding Change Amendment Request
    When I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I wait for "2" seconds
    And I enter "Grantee_GrantCreation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Grantee_Award_Edition" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Project Role    | Is Key Contact |
      | Victor EXE | Project Officer | Checked        |
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Projections" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                           | Start Date                         | End Date                         |
      | Automation Permanent Focus Area | {SavedValue:BudgetPeriodStartDate} | {SavedValue:BudgetPeriodEndDate} |
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:awardLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 5000         | 500        | 200            |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Justification |
      | Automation Permanent Focus Area | 1000                         | Automation Test              |
    When I enter the following values into flex table with id "---grantee_tableId:-:awardIndirectRateTableId---" by clicking "New" :
      | Title | Effective from | Effective until | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15             | 30              | 10                             | Final                   |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "New" :
      | Name       | Award  |
      | Grantee PO | Step 1 |
    And I navigate to "Monitoring" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Amendments" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter values into fields
      | Value | Field                      |
      | 2000  | RequestedChangeInBudget__c |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Add Line Items" icon for "Equipment" inside flex table with id "---grantee_tableId:-:AmendmentBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentLineItemsTableId---" by clicking "New" :
      | Title     | Narrative     | Awarded Budget | Cash Match | Other Leverage |
      | Equipment | The narrative | 2000           | 200        | 200            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 1            |
    When I get the "EGMS ID"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    Then I softly see fields "Decision__c" is in edit mode
    Then I softly see fields "Comments__c" is in edit mode
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Additional Details is required to save. |
      | Decision is required to save.           |
    Then I see only the following ordered options in dropdown field "Decision__c" :
      | --None-- | Accepted | Not Accepted |
    When I enter values into fields
      | Value    | Field       |
      | Accepted | Decision__c |
    Then I softly see fields "AmendmentNumber__c" is in edit mode
    Then I softly see fields "AwardIssueDate__c" is in edit mode
    Then I softly see fields "Comments__c" is in edit mode
    When I hovering mouse on help text icon inside modal "Amendment Number"
    Then I softly see "Field should allow only number upto 4 digits" shown as help text
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Additional Details is required to save. |
    When I enter values into fields
      | Value | Field       |
      | Test  | Comments__c |
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | You need to provide Award Issue Date if the decision is accepted. |
    When I enter values into fields
      | Value                       | Field             |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    Then I see status in Progress-bar is "Accepted" and is "dark blue"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Accepted" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    And I click on "Amend Award" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"

  @481531 @ValidatePMuserOwnershouldabletoseetheeditactiononApplication&verifytheeditaccesstononrecordowner @Grantee_Smoke
  Scenario: Validate PM user Owner should able to see the edit action on Application & verify the edit access to non record owner
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberProjectnarrativeForm}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212704" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212704" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001212704" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I can see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    Then I can see row level action button "View" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    Then I can see row level action button "Delete" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I close the tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I close the tab
    Then I softly see value "Budget Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I close the tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I close the tab
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - My Records"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "Form Name" inside table "---grantee_tableId:-:ApplicationTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    And I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    Then I can see row level action button "View" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Edit" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    And I close the tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Application for Federal Assistance (SF-424)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    And I close the tab
    Then I softly see value "Budget Narrative Attachment Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Budget Narrative Attachment Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Budget Narrative Attachment Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    And I close the tab
    Then I softly see value "Project Abstract Summary" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I cannot see row level action button "Edit" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Project Abstract Summary" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "View" icon for "Project Abstract Summary" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    And I close the tab
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - My Records"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:ApplicationTableId---"

  @477569 @477575 @ValidateAttachmentsformPMusercanaddfilesinAttachmentsforminsplitviewmodeandsuccessfullysubmitapplicationtograntsgov @P2_Grantee @GRegression1 @PM_Grantee
  Scenario: Validate Attachments form PM user can add files in Attachments form in split view mode and successfully submit application to grants.gov
    Given I delete the grantee record "{grantee_testData:GrantsGovMandatoryAttachments}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001271853" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001271853" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001271853" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "0.00%" for title "Percentage" against the value "Attachments" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I see the header is "Attachments" in the page details
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "Version :" as "1.2" on forms
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download as PDF" in the split screen page details
    When I "Collapse" page block contaninig value "Instructions"
    And I wait for "1" seconds
    When I "Expanded" page block contaninig value "Instructions"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Edit" in the split screen page details
    Then I softly can see top right button "Save" in the split screen page details
    Then I softly can see top right button "Cancel" in the split screen page details
    And I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly can see top right button "Edit" in the split screen page details
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Grant Application Document |
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AmendmentRequest_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AmendmentRequest_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Announcement_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Announcement_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Application_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Application_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Award_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Award_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Closeout_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Closeout_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "DeskReview_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "DeskReview_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Financial_Report_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Financial_Report_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Financial_Report_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Financial_Report_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Financial_Report_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Financial_Report_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "FocusArea_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "FocusArea_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "FocusArea_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "FocusArea_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Validate" in the split screen page details
    Then I softly see the following messages in the page details :
      | You cannot add more than 15 Attachments to the form. Please remove extra files.                                |
      | 3 duplicate file title(s) found: Financial_Report_Field_Values.xlsx. Please ensure all file titles are unique. |
      | 2 duplicate file title(s) found: Attachment.pdf. Please ensure all file titles are unique.                     |
      | 2 duplicate file title(s) found: FocusArea_Field_Values.xlsx. Please ensure all file titles are unique.        |
    When I click on "Delete" icon for "Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "FocusArea_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "FocusArea_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Financial_Report_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Financial_Report_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Financial_Report_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "DeskReview_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Closeout_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Award_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Application_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Announcement_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "AmendmentRequest_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File1.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File1.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File2.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File2.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File3.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File3.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File4.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File4.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Validate" in the split screen page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Validate" in the split screen page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Attachments" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see top right button "Edit" in the split screen page details
    Then I softly cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "S2SReceived" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Check Status" in the page details
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Validated" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"

  @477576 @ValidateAttachmentsformOptionalPOusercanaddfilesinattachmentsforminsplitviewmodeandcansuccessfullysubmitapplicationtograntsgovafterupdatingthefilesinviewmode @PO_Grantee @P2_Grantee @GRegression1
  Scenario: Validate Attachments form (Optional)- Verify PO user can add files in attachments form in split view mode and can successfully submit application to grants.gov after updating the files in view mode
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "As a Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I click on "Edit" in the page details
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    Then I softly see value "Attachments" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "cross" symbol against the value "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Edit" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Preview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "View" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I can see row level action button "Splitview" against "Attachments" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "0.00%" for title "Percentage" against the value "Attachments" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I see the header is "Attachments" in the page details
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "Version :" as "1.2" on forms
    Then I softly can see top right button "Edit" in the split screen page details
    Then I softly can see top right button "Download as PDF" in the split screen page details
    When I "Collapse" page block contaninig value "Instructions"
    And I wait for "1" seconds
    When I "Expanded" page block contaninig value "Instructions"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Edit" in the split screen page details
    Then I softly can see top right button "Save" in the split screen page details
    Then I softly can see top right button "Cancel" in the split screen page details
    And I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly can see top right button "Edit" in the split screen page details
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Grant Application Document |
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AmendmentRequest_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "AmendmentRequest_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Announcement_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Announcement_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Application_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Application_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Award_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Award_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Closeout_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Closeout_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "DeskReview_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "DeskReview_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Financial_Report_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Financial_Report_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Financial_Report_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Financial_Report_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Financial_Report_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Financial_Report_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "FocusArea_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "FocusArea_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "FocusArea_Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "FocusArea_Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "Field_Values.xlsx" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Field_Values.xlsx" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Validate" in the split screen page details
    Then I softly see the following messages in the page details :
      | You cannot add more than 15 Attachments to the form. Please remove extra files.                                |
      | 3 duplicate file title(s) found: Financial_Report_Field_Values.xlsx. Please ensure all file titles are unique. |
      | 2 duplicate file title(s) found: Attachment.pdf. Please ensure all file titles are unique.                     |
      | 2 duplicate file title(s) found: FocusArea_Field_Values.xlsx. Please ensure all file titles are unique.        |
    When I click on "Delete" icon for "Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "FocusArea_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "FocusArea_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Financial_Report_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Financial_Report_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Financial_Report_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "DeskReview_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Closeout_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Award_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Application_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Announcement_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "AmendmentRequest_Field_Values.xlsx" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "AttachmentTesting.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File1.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File1.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File2.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File2.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File3.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File3.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "2mb_File4.pdf" of type "Grant Application Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "2mb_File4.pdf" for title "Title" inside table "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I click on "Validate" in the split screen page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    When I click on "View" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I softly see value "100.00%" for title "Percentage" against the value "Attachments" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I click on "Splitview" icon for "Attachments" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see top right button "Edit" in the split screen page details
    Then I softly cannot see top right button "Validate" in the split screen page details
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "View" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Delete" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I cannot see row level action button "Edit" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    Then I can see row level action button "Download" against "2mb_File3.pdf" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    When I re-login to "As a Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "S2SReceived" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Check Status" in the page details
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Validated" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"

  @482049 @ValidateGrantsgovlobbingformfieldsandvalidationsdisplayedtoPMuserforGrantsgovlobbingform @P2_Grantee @PM_Grantee @GRegression1
  Scenario: Validate Grants gov lobbing form fields and validations displayed to PM user for Grants gov lobbing form
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPM1User}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001271854" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001271854" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001271854" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    Then I softly see value "Grants.gov Lobbying Form" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "0.00%" for title "Percentage" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    Then I softly can see row level action button "View" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Splitview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Edit" against "Grants.gov Lobbying Form" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see the header is "Grants.gov Lobbying Form" in the page details
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0013" on forms
    Then I softly see the field "Version :" as "1.1" on forms
    Then I softly see the field "OMB Expiration Date :" as "02/28/2025" on forms
    Then I softly see the text containing "When filling out the data within this form, please adhere to the character limits for each field as specified within the information icon for the field."
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Certification Regarding Lobbying" page block displayed
    Then I softly see field with quotes "APPLICANT'S ORGANIZATION" inside page block
    Then I softly see "Organization" page block displayed with quotes
    Then I softly see "Printed Name And Title Of Authorized Representative" page block displayed
    Then I softly see "Signature And Date" page block displayed
    Then I softly see the text containing " Required to Save | "
    Then I softly see the text containing " Required to Submit"
    When I "Collapse" page block contaninig value "Certification Regarding Lobbying"
    And I wait for "1" seconds
    When I "Expanded" page block contaninig value "Certification Regarding Lobbying"
    Then I softly see the text containing "Certification for Contracts, Grants, Loans, and Cooperative Agreements"
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "The undersigned certifies, to the best of his or her knowledge and belief, that:" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "(1) No Federal appropriated funds have been paid or will be paid, by or on behalf of the undersigned, to any person for influencing or attempting to influence an officer or employee of an agency, a Member of Congress, an officer or employee of Congress, or an employee of a Member of Congress in connection with the awarding of any Federal contract, the making of any Federal grant, the making of any Federal loan, the entering into of any cooperative agreement, and the extension, continuation, renewal, amendment, or modification of any Federal contract, grant, loan, or cooperative agreement." on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "(2) If any funds other than Federal appropriated funds have been paid or will be paid to any person for influencing or attempting to influence an officer or employee of any agency" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "(3) The undersigned shall require that the language of this certification be included in the award documents for all subawards at all tiers (including subcontracts, subgrants, and contracts under grants, loans, and cooperative agreements)" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "Statement for Loan Guarantees and Loan Insurance" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "The undersigned states, to the best of his or her knowledge and belief, that:" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "If any funds have been paid or will be paid to any person for influencing or attempting to influence an officer or employee of any agency" on forms
    Then I softly see the field "Certification for Contracts, Grants, Loans, and Cooperative Agreements" as "Statement for Loan Guarantees and Loan Insurance" on forms
    Then I softly see field with quotes "APPLICANT'S ORGANIZATION" inside page block
    Then I softly see asterisk mark on "ApplicantsOrganization__c"
    When I hovering mouse on help text icon inside page block detail "ORGANIZATION"
    Then I softly see "This is the legal name of the organization that will undertake the assistance activity. This should normally be the name under which the organization has registered with the Business Partner Network. Max character limit for this field is 60." shown as help text
    Then I softly see field "Prefix" inside page block
    Then I softly do not see asterisk mark on "Prefix"
    When I hovering mouse on help text icon inside page block detail "Prefix"
    Then I softly see "This is the prefix (e.g., Mr., Mrs., Rev.) for the name of the Authorized Representative." shown as help text
    And I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "AOR_Prefix__c" :
      | --None-- | Mr. | Mrs. | Miss | Ms. | Dr. | Rev. | Prof. |
    Then I softly see field "First Name" inside page block
    Then I softly see asterisk mark on "First Name"
    When I hovering mouse on help text icon inside page block detail "First Name"
    Then I softly see "This is the first (given) name of the Authorized Representative who is signing this form. Max character limit for this field is 35." shown as help text
    Then I softly see field "Middle Name" inside page block
    Then I softly do not see asterisk mark on "Middle Name"
    When I hovering mouse on help text icon inside page block detail "Middle Name"
    Then I softly see "This is the middle name of the Authorized Representative. Max character limit for this field is 25." shown as help text
    Then I softly see field "Last Name" inside page block
    Then I softly see asterisk mark on "Last Name"
    Then I softly see field "Suffix" inside page block
    Then I softly do not see asterisk mark on "Suffix"
    When I hovering mouse on help text icon inside page block detail "Suffix"
    Then I softly see "This is the suffix (e.g., Jr, Sr, PhD) for the name of the Authorized Representative." shown as help text
    Then I see only the following ordered options in dropdown field "AOR_Suffix__c" :
      | --None-- | Jr. | Sr. | M.D. | Ph.D |
    Then I softly see field "Title" inside page block
    Then I softly see asterisk mark on "Title"
    When I hovering mouse on help text icon inside page block detail "Title"
    Then I softly see "This is the title of the Authorized Representative who is signing this form. Max character limit for this field is 45." shown as help text
    Then I softly see field "SIGNATURE:" inside page block
    Then I softly do not see asterisk mark on "SIGNATURE:"
    When I hovering mouse on help text icon inside page block detail "SIGNATURE:"
    Then I softly see "It is the organization's responsibility to assure that only properly authorized individuals sign in this capacity and/or submit the application to Grants.gov. If this application is submitted through Grants.gov leave blank. If a hard copy is submitted, the AOR must sign this block." shown as help text
    Then I softly see field "DATE:" inside page block
    Then I softly do not see asterisk mark on "DATE:"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, APPLICANT'S ORGANIZATION is required in the Applicant's Organization section.              |
      | To Save, First Name is required in the Printed Name And Title Of Authorized Representative section. |
      | To Save, Last Name is required in the Printed Name And Title Of Authorized Representative section.  |
      | To Save, Title is required in the Printed Name And Title Of Authorized Representative section.      |
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "ApplicantsOrganization__c"
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "AOR_First_Name__c"
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "AOR_Middle_Name__c"
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "AOR_Last_Name__c"
    And I enter value "{AUTOEnvData:StringOf100Chars}" into field "AOR_Title__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    And I wait for "1" seconds
    Then I softly see the following messages in the page details contains:
      | The value of the field "APPLICANT'S ORGANIZATION" exceeds the maximum allowed limit of 60 characters. |
      | The value of the field "First Name" exceeds the maximum allowed limit of 35 characters.               |
      | The value of the field "Middle Name" exceeds the maximum allowed limit of 25 characters.              |
      | The value of the field "Last Name" exceeds the maximum allowed limit of 60 characters.                |
      | The value of the field "Title" exceeds the maximum allowed limit of 45 characters.                    |
    When I click on "Edit" in the page details
    And I enter "Lobbying_Form" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "1" seconds
    And I close the tab
    When I click on "Edit" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "No" for title "Validated" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please validate the Forms by clicking validate button. |
    When I click on "View" icon for "Grants.gov Lobbying Form" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Yes" for title "Validated" against the value "Grants.gov Lobbying Form" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |