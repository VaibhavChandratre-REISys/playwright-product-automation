@ksdeBusinessFlowSanity @grantor-sanity @sanity
Feature: Validate sanity testing of Complete Business Flow

  #userRegistrationSanity
  @userRegistrationSanity @Bug-KSDE-1079 @Bug-KSDE-1080 @ProdSan4 @preawardSanity @Rerun1
  Scenario: Scenario for user registration
    Given I begin "Organization" registration as "Register As Organization"
    Then I see the header is "Registration" in the registration page details
    Then I see the sub-header is "Legal Disclaimer 1 of 2" in the registration page details
    When I click on "Agree" in the page details
    Then I see the header is "Registration" in the registration page details
    Then I see the sub-header is "Legal Disclaimer 2 of 2" in the registration page details
    When I click on "Agree" in the page details
    And I wait for "3" seconds
    #Bug-KSDE-1080 #TODO: Uncomment below steps once the bug KSDE-1080 gets resolved
    #Then I see the header is "Registration" in the registration page details
    #Then I see the sub-header is "Step 1 of 3" in the registration page details
    Then I softly see field "Employer Identification Number (EIN)" inside page block
    Then I softly see field "Unique Entity Identifier (UEI)" inside page block
    Then I softly see field "School District Number" inside page block
    And I generate the random SDN and save as "SDN"
    When I enter value as "{SavedValue:SDN}" into "School District Number" on old form
    When I click on "Save" in the page details
    #KSDE-1058
    Then I see the header is "Registration" in the registration page details
    Then I see the sub-header is "Step 2 of 3" in the registration page details
    And I navigate to "Organization Profile" sub tab
    Then I softly see that "OrganizationTypeSInglePicklist__c" rendered in view mode only
    Then I softly see value "School District" for the readonly mode field "OrganizationTypeSInglePicklist__c"
    And I enter "CreationWithAllDetails_KSDE" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    Then I see the header is "Registration" in the registration page details
    Then I see the sub-header is "Step 3 of 3" in the registration page details
    And I wait for "5" seconds
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    And I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    Then I see the following rows under the following headers in table with id "---grantor_tableId:-:SubrecipientOrganization---" :
      | Name                                         | Type            |
      | {SavedValue:Automation Runtime Organization} | School District |
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I navigate to "Overview" sub tab
    Then I softly see field "Organization Type" as "School District"
    Then I softly see that "OrganizationTypeSInglePicklist__c" rendered in view mode only
    #KSDE-820:Submitted for Approval
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see field "School District Number" as "{SavedValue:SDN}"
    And I "Approve" in the approval decision
    #KSDE-820:Approved
    Then I softly see field "Status" as "Approved"
    And I navigate to "Overview" sub tab
    Then I softly see field "School District Number" as "{SavedValue:SDN}"
    Then I softly see field "Organization Type" as "School District"
    Then I softly see that "OrganizationTypeSInglePicklist__c" rendered in view mode only
    And I refresh the page
    And I logout
    And I wait for "5" seconds
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I wait for "190" seconds
    And I refresh the page
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Organization}" in the page details
    Then I softly see field "Organization Type" as "School District"
    Then I softly see that "ApplicantType__c" rendered in view mode only
    #KSDE-820:Active
    Then I softly see field "Status" as "Active"
    Then I softly see field "School District Number" as "{SavedValue:SDN}"
    #Create Secondary User
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter in modal "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "Email"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} User" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "2" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I logout
    And I wait for "190" seconds
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Notification: Invitation to be a user of EGMS"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID1}"
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Organization}" in the page details
    #KSDE-820:Active-SPA
    Then I softly see field "Status" as "Active"
    Then I softly see field "School District Number" as "{SavedValue:SDN}"
    #KSDE-1058-SPA
    Then I softly see field "Organization Type" as "School District"
    Then I softly see that "ApplicantType__c" rendered in view mode only

  #HomeSanity
  @SMEreviewerFlowSanity @ProdSan4 @HomeSanity @preawardSanity @Rerun1
  Scenario: Scenario for SME reviewer
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I wait for "5" seconds
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---home:-:reviewersTableId---"
    And I click "Send" button in modal
    And I wait for "2" seconds
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I wait for "190" seconds
    And I refresh the page
    And I navigate to maildrop portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Notification: You have been Invited to Register in the"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I enter "Edition" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    And I select "Profile" from user dropdown
    Then I see the header is "{SavedValue:Automation Runtime} Contact" in the page details

  @SubrecipientContactCreation @ProdSan2 @HomeSanity @preawardSanity
  Scenario: Subrecipient Contact Creation
    Given I login to "As a Grantor" app as "ADMIN" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I close "Create Subrecipient Contact" modal by clicking the top right x button
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---home:-:subrecipientContactTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---home:-:subrecipientContactTableId---"
    Then I softly see field "Organization" as "{SavedValue:SubrecipientOrg}"
    When I click modal button "Edit"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I click modal button "Save"
    And I close "View Subrecipient Contact" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly see value "New" for title "Status" inside table "---home:-:subrecipientContactTableId---"

  #PlanningSanity #sanitycompleted
  @72335 @activationOfFocusArea @ProdSan1 @PlanningSanity @preawardSanity
  Scenario: Validate the activation of Focus Area by User
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "Description__c"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---focusarea:-:FocusAreaFilesTableId---"
    When I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Status" as "Active"

  @72340 @activateKPI @ProdSan2 @PlanningSanity @preawardSanity
  Scenario: Validate the activation of KPI and the status changes to Active
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Status" as "Active"

  @72337 @activationOFFundingSource @ProdSan1 @PlanningSanity @preawardSanity
  Scenario: Validate the activation of Funding Source HappyPath and the status is Active
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition_KSDE" values from "FundingSource_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see field "Status" as "Active"

  @StrategicPlanCreation @ProdSan2 @PlanningSanity @preawardSanity
  Scenario: Creation of Strategic plan
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---strategicplan:-:ObjectivesKPITableId---"
    When I click "Add" after selection of "Automation Permanent KPI" in the table "---strategicplan:-:ListOfActiveKPITableId---"
    Then I see that "Automation Permanent KPI" has been added in flextable with Id "---strategicplan:-:ObjectivesKPITableId---"
    Then I softly see field "Status" as "Draft"
    And I click on "Back To Strategic Goal" in the page details
    Then I softly see field "Status" as "Draft"
    When I click on "Back To Strategic Plan" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Status" as "Draft"

  @programRejection @ProdSan3 @PlanningSanity @preawardSanity
  Scenario: Validate the Rejection of Internal Program and redirecting to same page
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle_2}" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "{SavedValue:KPITitle}" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 1  |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required | Applies To  | Status |
      | Automation test description | Optional | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I select radio button "Reject" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    When I submit the approval in the approval decision without processing
    And I wait for "2" seconds
    Then I softly see confirmation box with body "This action cannot be undone. Do you really want to Reject?" is displayed
    And I click "Cancel" on modal confirmation box
    And I wait for "3" seconds
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Forward | Send back |
    When I select radio button "Reject" in the approval decision
    When I submit the approval in the approval decision without processing
    And I click "Continue" on modal confirmation box
    Then I softly see field "Status" as "Rejected"

  @72341 @programActivation @ProdSan1 @PlanningSanity @preawardSanity
  Scenario: Validate the activation of Internal Program and the status changes to Active
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "{SavedValue:FocusAreaTitle_2}" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "{SavedValue:KPITitle}" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 2  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"

  @ExternalProgramActivation @ProdSan2 @PlanningSanity @preawardSanity
  Scenario: Validate External Program Activation
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "All NGO Programs"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  #AnnouncementsSanity
  @65077 @KSDE-198 @publishingCompetitiveAnnouncementCA_Construction @ProdSan2 @AnnouncementsSanity
  Scenario Outline: Validate the activation of Competitive Announcement-> Construction
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #KSDE-1058:3.1
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    #KSDE-1058:3.2
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    #KSDE-198
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Name                       |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 2000            |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 2       |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FO Username} | Step 3       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---"
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "2" seconds
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    Given I click on "Complete Review" in the page details
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Then I softly see field "Status" as "Published"

    Examples:
      | User |
      | PM   |
      | PO   |

  @65077_1 @KSDE-199 @publishingCompetitiveAnnouncementCA_NonConstruction @ProdSan2
  Scenario Outline: Validate the activation of Competitive Announcement-> Non-Construction
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "Non-Construction" into field "Budget_Category_Package__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I get the "EGMS ID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #KSDE-1058:3.1
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    #KSDE-1058:3.2
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    #KSDE-199
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Name                       |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
#      | Optional List              |
      | Administrative Costs       |
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 2000            |
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
#    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---announcement:-:goalsTableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
#      | Name                         | Announcement |
#      | {SavedValue:PM Username} | Step 1       |
    When I navigate to "Overview" sub tab
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Then I softly see field "Status" as "Published"

    Examples:
      | User |
      | PM   |
      | PO   |

  @72342 @publishingDirectedAnnouncement @ProdSan2 @AnnouncementsSanity @preawardSanity
  Scenario Outline: Validate the activation of Directed Announcement-> Construction
  |In Directed Type Eligible applicant added Organizations can apply only|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #KSDE-1058:3.1
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    #KSDE-1058:3.2
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    #KSDE-198
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Name                       |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I refresh the page
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I wait for "5" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:Organization_School_District}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
#    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---announcement:-:goalsTableId---"
#    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:reviewersTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:reviewersTableId---"
    And I wait for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click on submit review
    And I wait for "2" seconds
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Directed Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:annoucementTableId---"
    Given I click on "Complete Review" in the page details
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annoucementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:annoucementTableId---"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"

    Examples:
      | User |
      | PM   |
      | PO   |

  @72342_1 @KSDE-199 @publishingDirectedAnnouncement @ProdSan2 @AnnouncementsSanity @preawardSanity
  Scenario Outline: Validate the activation of Directed Announcement-> Non-Construction
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Directed Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I wait for "5" seconds
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "Non-Construction" into field "Budget_Category_Package__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #KSDE-1058:3.1
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    #KSDE-1058:3.2
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    #KSDE-199
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Name                       |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on "Edit" in the page details
    And I wait for "5" seconds
    When I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I enter value "Justified" into field "Justification__c"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "5" seconds
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---announcement:-:annoucementContactTableId---"
    And I wait for "5" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:Organization_School_District}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
#    When I click "Associate" after selection of "{SavedValue:StrategicObjective}" in the table "---announcement:-:goalsTableId---"
#    And I wait for "3" seconds
#    When I navigate to "Responsibilities" sub tab
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Directed Announcements"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:annoucementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:annoucementTableId---"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"

    Examples:
      | User |
      | PM   |
      | PO   |

  @72343 @KSDE-199 @publishingFormulaAnnouncementByApplicant @ProdSan2 @AnnouncementsSanity @preawardSanity
  Scenario Outline: Validate the activation of Formula By Applicant Announcement-> Non-Construction
#    When I login to "As a Grantor" app as "ADMIN" user
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I wait for "10" seconds
    And I enter "FormulaAnn_AdminUser" values from "Announcement_Field_Values.xlsx"
    And I enter value "Non-Construction" into field "Budget_Category_Package__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    #KSDE-1058:3.1
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    #KSDE-1058:3.2
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Formula_Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    #KSDE-199
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Name                       |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I click modal button "Close"
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I perform quick search for "{SavedValue:Organization_School_District}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:Organization_School_District}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I pause execution for "4" seconds
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                | Allocated Amount |
      | {SavedValue:Organization_School_District} | 1000             |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"

    Examples:
      | User |
      | PM   |
      | PO   |

  @72343_1 @publishingFormulaAnnouncementByApplicantFocusArea @ProdSan2 @AnnouncementsSanity @preawardSanity
  Scenario Outline: Validate the activation of Formula By Applicant & Focus Area Announcement-> Construction
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I wait for "10" seconds
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #KSDE-1058:3.1
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    #KSDE-1058:3.2
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Formula_Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Formula Announcement"
    #KSDE-198
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Name                       |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                     | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---"
    And I wait for "2" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click on submit review
    And I wait for "2" seconds
    When I click modal button "Close"
    And I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Formula Announcements"
    When I perform quick search for "Record id" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside table
    Given I click on "Complete Review" in the page details
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "4" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organization" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "{SavedValue:Organization_School_District}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:Organization_School_District}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:Organization_School_District}"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1000              |
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Formula Announcements"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I click on "Publish" in the page details
    Then I softly see field "Status" as "Published"

    Examples:
      | User |
      | PM   |
      | PO   |

  #ApplicationsSanity
  @72344 @preApplicationSubmittedToGrantor @ProdSan2 @ApplicationsSanity @ApplicationsSanity @preawardSanity @Rerun1
  Scenario: Validate once the Grantor accepts the submitted pre-application then the changes status to Accepted
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PreAppEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    #KSDE
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:preApplicationAttachmentId---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
#    And I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I wait for "2" seconds
    #TCForRequestedBudget
    And I expand nested table containing column value "BP01"
    And I wait for "2" seconds
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---preApplication:-:preApplicationAttachmentId---"
    When I edit the following rows inline in flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "Edit" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Agricultural Technology & Mechanical Systems | $1,000.00  | $1,000.00                    | $0.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:preApplicationAttachmentId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---preApplication:-:preApplicationAttachmentId---"
    When I edit the following rows inline in flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 50       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 5000       | 50             | 100            | $5,000.00                    |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 50.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $5,000.00  | $50.00         | $5,050.00   | $100.00        | $5,000.00  | $5,000.00                    | $0.00                      | $10,150.00         |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:preApplicationAttachmentId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $5,000.00        | $5,000.00  | $50.00         | $5,050.00   | $100.00        | $10,150.00         |
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreAppEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PreAppEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    #KSDE
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:preApplicationAttachmentId---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    When I click on "Accept" in the page details
    Then I see status in Progress-bar is "Accepted" and is "dark blue"
    Then I softly see field "Status" as "Accepted"

  #Applications -> "Reserve Grant Application" Form
  @72345 @KSDE-675 @KSDE-127 @submitApplication @ProdSan1 @ApplicationsSanity @preawardSanity @Rerun
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted
  | Validate Application Budget Categories |
  | Validate the "Reserve Grant Application" Form on Application |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "appEGMSID"
    #KSDE
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name       | Requested Budget | Cash Match | Non-Cash Match |
#      | Special Populations | 1000             | 100        | 100            |
#      | Supplies            | 1000             | 100        | 100            |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    #KSDE-675
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Reserve Grant Application" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see "Announcement Information" page block displayed
    Then I softly see "Description of Activity (What will you do?)" page block displayed
    Then I softly see "Expected Result / Evaluation of the Activity (What is the expected outcome?)" page block displayed
    Then I softly see "Budget Narrative" page block displayed
    Then I softly see "Contractual Provisions and Local Assurances" page block displayed
    Then I softly see "Contractual Provisions and Local Assurances" page block displayed
    Then I softly see "Certification" page block displayed
    And I select below checkbox options for field "KSDE_PathwayPicklist__c"
      | Agricultural Technology & Mechanical Systems          |
      | Animal Science, Health & Related Industries           |
      | Diversified Agricultural Science                      |
      | Food Products & Processing Systems                    |
      | Plant Science & Industry Operations                   |
      | Natural Resources & Environmental Sustainability      |
      | Energy                                                |
      | Business Management & Entrepreneurship                |
      | Business Finance                                      |
      | Marketing                                             |
      | Restaurant & Event Management                         |
      | Travel & Tourism                                      |
      | Teaching/Training                                     |
      | Early Childhood Development & Services                |
      | Government & Public Administration                    |
      | Corrections, Security, Law & Law Enforcement Services |
      | Emergency & Fire Management Services                  |
      | Information Support & Services                        |
      | Media Design & Communications                         |
      | Networking & Telecommunications                       |
      | Programming & Software Development                    |
      | Construction & Design                                 |
      | Manufacturing                                         |
      | Automation Engineering                                |
      | Aviation Production                                   |
      | Engineering & Applied Mathematics                     |
      | Aviation Maintenance & Operations                     |
      | Vehicle Maintenance & Repair                          |
      | Family, Community & Consumer Services                 |
      | Biotechnology                                         |
      | Health Science                                        |
    When I enter "KSDE_ApplicationForm-1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Upload Files" in the page details
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Back" in the page details
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:appEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |

  @72347 @negotiationComplete @ProdSan1 @ApplicationsSanity @preawardSanity @Rerun
  Scenario: Validate the Negotiation Request Completion Happy Path
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I pause execution for "10" seconds
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I navigate to "Negotiations" sub tab
    When I click on "Edit" in the page details
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Application Reviews" subheader on left panel
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime FDM Announcement}" in flex table with id "---negotiation:-:negotiationCompletedTaskTableId---"

  #NewScenario->Application->"Perkins Secondary Improvement Grant" Form
  @TCID_Form2 @72345_1 @KSDE-675 @KSDE-127 @submitApplication @ProdSan1 @bug-KSDE-50 @ApplicationsSanity @preawardSanity @Rerun1
  Scenario: Validate the "Perkins Secondary Improvement Grant" Form on Application and Application "Status" as "Submitted to Grantor"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "appEGMSID"
    #KSDE
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name       | Requested Budget | Cash Match | Non-Cash Match |
#      | Special Populations | 1000             | 100        | 100            |
#      | Supplies            | 1000             | 100        | 100            |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    #KSDE-127
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Form Name" as "Perkins Secondary Improvement Grant"
    Then I softly see "School District Information" page block displayed
    Then I softly see "Local Plan" page block displayed
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    Then I softly see "Student Performance Data (Actuals)" page block displayed
    Then I softly see "Student Performance Action Plan" page block displayed
    Then I softly see "Application Files" page block displayed
    Then I softly see "Time and Effort Certification" page block displayed
    Then I softly see "Certification" page block displayed
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | LEA Overall Score | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                      | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Individuals with Disabilities | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                   | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Economically Disadvantaged | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category       | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Single Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category         | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | English Learners | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                  | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Non-Traditional Enrollees | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Migrant Worker Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                    | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Homeless (includes Migrant) | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Active Military Parent | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Foster Care Youth | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    Then I see the following rows under the following headers in table with id "StudentPerformanceData" :
      | Category                      | 1S1 Graduation | 1S1 Graduation Gap Or Exceed | 2S1 Reading Language Arts | 2S1 Reading Language Arts Gap Or Exceed | 2S2 Math | 2S2 Math Gap Or Exceed | 2S3 Science | 2S3 Science Gap Or Exceed | 3S1 Placement | 3S1 Placement Gap Or Exceed | 4S1 Nontraditional | 4S1 Nontraditional Gap Or Exceed | 5S2 Postsecondary Credits | 5S2 Postsecondary Credits Gap Or Exceed |
      | LEA Overall Score             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Individuals with Disabilities | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Economically Disadvantaged    | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Single Parents                | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | English Learners              | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Non-Traditional Enrollees     | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Migrant Worker Parents        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Homeless (includes Migrant)   | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Active Military Parent        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Foster Care Youth             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan     |
      | 2S2 Math  | -60%           | English Learners | Policies/Processes | Scheduling barriers | Automation Test |
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Back" in the page details
    And I switch to parent tab
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

  #NewScenario->Pre-Application->Built-Up Items
  @KSDE-212 @KSDE-244 @KSDE-323 @KSDE-342 @KSDE-367 @KSDE-382 @KSDE-400 @KSDE-436 @11
    @KSDE-1156 @KSDE-1157 @KSDE-1158 @ApplicationsSanity @ProdSan2 @preawardSanity @rerunSanity @PreApplicationBuiltUp @Rerun1
  Scenario Outline: Validate Detailed/Built-Up Budget Categories of Pre-Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "PRE_APP_YES_DETAILED_BUDGET_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PreAppEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    #KSDE-212 #Special Populations #KSDE-1156
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "Edit" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Other Leverage |
      | Special Populations | Special Populations                        | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 1000                         | $100       | $100           | $100           |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Agricultural Technology & Mechanical Systems | $1,000.00  | $1,000.00                    | $0.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
#      | Expenditure                | How does this support Special Populations? | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Expenditure Cost |
#      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 1000             |
#    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
#      | Expenditure                | How does this support Special Populations? | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Expenditure Cost | Total Project Cost |
#      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00        | $1,300.00          |
    #KSDE-244 #Supplies-2 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $500.00                      |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-323 #Software and Subscriptions-3 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Software and Subscriptions" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 500                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Software and Subscriptions | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-342 #Computing Devices-4 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Computing Devices" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 500                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name     | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Computing Devices | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-367 #Equipment-5 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Equipment" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | Quote 1  | Quote 2 | Quote 3  | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | 21212.21 | 1000    | 23000.23 | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 500                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | Quote 1   | Quote 2  | Quote 3   | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | 21,212.21 | 1,000.00 | 23,000.23 | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Equipment     | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-382 #Professional Development-6 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Professional Development" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Title/Classification of Participants | Quantity | Cost/Unit | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Total Cost | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | 10       | 100       | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100        | 100.23                       |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Title/Classification of Participants | Quantity | Cost/Unit | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | 10.00    | $100.00   | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.23                      | ($0.23)                    | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name            | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Professional Development | $100.23          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE-400 #Contracted Services-7 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Contracted Services" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Name of Entity Contracting With (Must follow local procurement policies) | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Total Cost | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                                               | {default:StringOf255Chars}                   | Evaluation of Student Performance | 100        | 100            | 100            | 100        | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Name of Entity Contracting With (Must follow local procurement policies) | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                                               | {default:StringOf255Chars}                   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Contracted Services | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE-436 #Salaries-8 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Salaries" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Salary Position            | Provide link or email position description to KSDE | New position? | CLNA                              | Please indicate how many years the salary position has been paid by Perkins | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                         | Yes           | Evaluation of Student Performance | 2                                                                           | 100        | 100            | 100            | 1000.23                      |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Salary Position            | Provide link or email position description to KSDE | New position? | CLNA                              | Please indicate how many years the salary position has been paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                         | Yes           | Evaluation of Student Performance | 2                                                                           | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.23                    | $1,300.23          |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Salaries      | $1,000.23        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.23          |
    #Categories: 9 to 17
    #KSDE- #Honorarium or Stipend-9 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Honorarium or Stipend" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Stipend staff names or classification | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars}            | {default:StringOf255Chars}                   | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Stipend staff names or classification | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars}            | {default:StringOf255Chars}                   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name         | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Honorarium or Stipend | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Travel Expenses-10 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Title/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Title/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name   | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Travel Expenses | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Advisory Committee-11 #KSDE-1158
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Advisory Committee" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name      | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Advisory Committee | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #CTSO Advisor Expenses-12 #KSDE-1158
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "CTSO Advisor Expenses" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name         | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | CTSO Advisor Expenses | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Substitutes-13 #KSDE-1157
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Substitutes" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 10        | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Quantity | Cost/Unit | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $10.00    | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Substitutes   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Externships-14 #KSDE-1158
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Externships" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Externships   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Institutional Memberships-15 #KSDE-1157
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Institutional Memberships" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 10        | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $10.00    | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name             | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Institutional Memberships | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
#    #KSDE- #Optional List-16 #KSDE-1157
#    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
#    When I click on "Add Line Item Details" icon for "Optional List" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
#    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
#      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
#      | {default:StringOf255Chars} | 10       | 10        | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 99.99                        |
#    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
#      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
#      | {default:StringOf255Chars} | 10.00    | $10.00    | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $99.99                       | $0.01                      | $400.00            |
#    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
#    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
#    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
#      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
#      | Optional List | $99.99           | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Administrative Costs-17 #KSDE-1158
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Administrative Costs" inside flex table with id "---preApplication:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---preApplication:-:PreAppDetailsLineItemTableId---" by clicking "New" :
      | Title                      | Description                | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Other Leverage |
      | {default:StringOf255Chars} | {default:StringOf255Chars} | 200                          | 100        | 100            | 100            |
    Then I see the following rows under the following headers in table with id "---preApplication:-:PreAppDetailsLineItemTableId---" :
      | Title                      | Description                | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars} | $200.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
    When I close "Pre-Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name        | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Administrative Costs | $200.00          | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
    And I select value inside table "---preApplication:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations        | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Supplies                   | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Software and Subscriptions | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Computing Devices          | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Equipment                  | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Professional Development   | $100.23          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Contracted Services        | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Salaries                   | $1,000.23        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.23          |
      | Honorarium or Stipend      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Travel Expenses            | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Advisory Committee         | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | CTSO Advisor Expenses      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Substitutes                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Externships                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Institutional Memberships  | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
#      | Optional List              | $99.99           | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Administrative Costs       | $200.00          | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
    #Grantor side validation
#    And I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I save the field labeled "EGMS ID" as "PreAppEGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "<PreAppEGMSID>" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "<PreAppEGMSID>" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations        | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Supplies                   | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Software and Subscriptions | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Computing Devices          | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Equipment                  | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Professional Development   | $100.23          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Contracted Services        | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Salaries                   | $1,000.23        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.23          |
      | Honorarium or Stipend      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Travel Expenses            | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Advisory Committee         | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | CTSO Advisor Expenses      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Substitutes                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Externships                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Institutional Memberships  | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
#      | Optional List              | $99.99           | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Administrative Costs       | $200.00          | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |

    Examples:
      | PreAppEGMSID              |
      | {SavedValue:PreAppEGMSID} |

  #NewScenario->Application->Built-Up Items
  @KSDE-212 @KSDE-244 @KSDE-323 @KSDE-342 @KSDE-367 @KSDE-382 @KSDE-400 @KSDE-436
  @KSDE-1156 @KSDE-1157 @KSDE-1158 @ProdSan2 @ApplicationsSanity @preawardSanity @Rerun1 @1111
  Scenario: Validate Detailed/Built-Up Budget Categories of Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "DETAILE_BUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    #KSDE-212 #Special Populations #KSDE-1156
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure                | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | 10.00    | 100       | Health Science | 900                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure                | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | {default:StringOf255Chars} | {default:StringOf255Chars}                 | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $900.00                      | $100.00                    | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $900.00          | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    #KSDE-244 #Supplies-2 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $500.00                      |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-323 #Software and Subscriptions-3 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Software and Subscriptions" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 500                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Software and Subscriptions | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-342 #Computing Devices-4 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Computing Devices" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 500                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name     | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Computing Devices | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-367 #Equipment-5 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | Quote 1  | Quote 2 | Quote 3  | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 100       | {default:StringOf255Chars} | 21212.21 | 1000    | 23000.23 | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 500                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | Quote 1   | Quote 2  | Quote 3   | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $100.00   | {default:StringOf255Chars} | 21,212.21 | 1,000.00 | 23,000.23 | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $500.00                      | $500.00                    | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Equipment     | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    #KSDE-382 #Professional Development-6 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Professional Development" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Title/Classification of Participants | Quantity | Cost/Unit | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Total Cost | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | 10       | 100       | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100        | 100.23                       |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Title/Classification of Participants | Quantity | Cost/Unit | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | 10.00    | $100.00   | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.23                      | ($0.23)                    | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name            | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Professional Development | $100.23          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE-400 #Contracted Services-7 #KSDE-1157
    When I click on "Add Line Item Details" icon for "Contracted Services" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Name of Entity Contracting With (Must follow local procurement policies) | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Total Cost | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                                               | {default:StringOf255Chars}                   | Evaluation of Student Performance | 100        | 100            | 100            | 100        | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name of Entity Contracting With (Must follow local procurement policies) | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                                               | {default:StringOf255Chars}                   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Contracted Services | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE-436 #Salaries-8 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Salaries" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Salary Position            | Provide link or email position description to KSDE | New position? | CLNA                              | Please indicate how many years the salary position has been paid by Perkins | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                         | Yes           | Evaluation of Student Performance | 2                                                                           | 100        | 100            | 100            | 1000.23                      |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Salary Position            | Provide link or email position description to KSDE | New position? | CLNA                              | Please indicate how many years the salary position has been paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                         | Yes           | Evaluation of Student Performance | 2                                                                           | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.23                    | $1,300.23          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Salaries      | $1,000.23        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.23          |
    #Categories: 9 to 17
    #KSDE- #Honorarium or Stipend-9 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Honorarium or Stipend" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Stipend staff names or classification | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars}            | {default:StringOf255Chars}                   | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Stipend staff names or classification | Brief Summary of the Project to be Completed | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars}            | {default:StringOf255Chars}                   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name         | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Honorarium or Stipend | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Travel Expenses-10 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Title/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Title/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name   | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Travel Expenses | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Advisory Committee-11 #KSDE-1158
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Advisory Committee" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name      | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Advisory Committee | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #CTSO Advisor Expenses-12 #KSDE-1158
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "CTSO Advisor Expenses" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name         | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | CTSO Advisor Expenses | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Substitutes-13 #KSDE-1157
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Substitutes" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 10        | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Quantity | Cost/Unit | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $10.00    | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Substitutes   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Externships-14 #KSDE-1158
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Externships" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Externships   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Institutional Memberships-15 #KSDE-1157
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Institutional Memberships" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 10        | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $10.00    | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name             | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Institutional Memberships | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
#    #KSDE- #Optional List-16 #KSDE-1157
#    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
#    When I click on "Add Line Item Details" icon for "Optional List" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
#    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
#      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
#      | {default:StringOf255Chars} | 10       | 10        | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 99.99                        |
#    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
#      | Description                | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
#      | {default:StringOf255Chars} | 10.00    | $10.00    | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $99.99                       | $0.01                      | $400.00            |
#    When I close "Application Budget Categories" modal by clicking the top right x button
#    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
#    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
#      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
#      | Optional List | $99.99           | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Administrative Costs-17 #KSDE-1158
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Administrative Costs" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title                      | Description                | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Other Leverage |
      | {default:StringOf255Chars} | {default:StringOf255Chars} | 200                          | 100        | 100            | 100            |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Title                      | Description                | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars} | $200.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name        | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Administrative Costs | $200.00          | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations        | $900.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00          |
      | Supplies                   | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Software and Subscriptions | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Computing Devices          | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Equipment                  | $500.00          | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
      | Professional Development   | $100.23          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Contracted Services        | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Salaries                   | $1,000.23        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.23          |
      | Honorarium or Stipend      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Travel Expenses            | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Advisory Committee         | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | CTSO Advisor Expenses      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Substitutes                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Externships                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Institutional Memberships  | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
#      | Optional List              | $99.99           | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
      | Administrative Costs       | $200.00          | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |

  #NewScenario->Pre-Application->InLine Items
  @PreApplicationInlineItems @ApplicationsSanity @preawardSanity @11
  Scenario:  Validate Inline Budget Categories of Pre-Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PreAppEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    #KSDE
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    And I edit the following rows inline in flex table with id "---preApplication:-:childBudgetPeriodTableId---" by clicking "Edit" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Special Populations        | 100              | 100        | 100            | 100            |
      | Supplies                   | 100              | 100        | 100            | 100            |
      | Software and Subscriptions | 100              | 100        | 100            | 100            |
      | Computing Devices          | 100              | 100        | 100            | 100            |
      | Equipment                  | 100              | 100        | 100            | 100            |
      | Professional Development   | 100              | 100        | 100            | 100            |
      | Contracted Services        | 100              | 100        | 100            | 100            |
      | Salaries                   | 100              | 100        | 100            | 100            |
      | Honorarium or Stipend      | 100              | 100        | 100            | 100            |
      | Travel Expenses            | 100              | 100        | 100            | 100            |
      | Advisory Committee         | 100              | 100        | 100            | 100            |
      | CTSO Advisor Expenses      | 100              | 100        | 100            | 100            |
      | Substitutes                | 100              | 100        | 100            | 100            |
      | Externships                | 100              | 100        | 100            | 100            |
      | Institutional Memberships  | 100              | 100        | 100            | 100            |
      | Administrative Costs       | 100              | 100        | 100            | 100            |
    And I wait for "5" seconds
    And I select value inside table "---preApplication:-:budgetPeriodTableId---" is "All"
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---preApplication:-:childBudgetPeriodTableId---" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations        | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Supplies                   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Software and Subscriptions | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Computing Devices          | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Equipment                  | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Professional Development   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Contracted Services        | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Salaries                   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Honorarium or Stipend      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Travel Expenses            | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Advisory Committee         | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | CTSO Advisor Expenses      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Substitutes                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Externships                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Institutional Memberships  | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Administrative Costs       | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |

  #NewScenario->Application->InLine Items
  @preApplicationSubmittedToGrantor @ProdSan2 @ApplicationsSanity @preawardSanity @ApplicationInline @11
  Scenario: Validate Inline Budget Categories of Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "DETAILE_BUDGET_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    #KSDE
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    And I edit the following rows inline in flex table with id "---applicationReview:-:childBudgetPeriodTableId---" by clicking "Edit" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Special Populations        | 100              | 100        | 100            | 100            |
      | Supplies                   | 100              | 100        | 100            | 100            |
      | Software and Subscriptions | 100              | 100        | 100            | 100            |
      | Computing Devices          | 100              | 100        | 100            | 100            |
      | Equipment                  | 100              | 100        | 100            | 100            |
      | Professional Development   | 100              | 100        | 100            | 100            |
      | Contracted Services        | 100              | 100        | 100            | 100            |
      | Salaries                   | 100              | 100        | 100            | 100            |
      | Honorarium or Stipend      | 100              | 100        | 100            | 100            |
      | Travel Expenses            | 100              | 100        | 100            | 100            |
      | Advisory Committee         | 100              | 100        | 100            | 100            |
      | CTSO Advisor Expenses      | 100              | 100        | 100            | 100            |
      | Substitutes                | 100              | 100        | 100            | 100            |
      | Externships                | 100              | 100        | 100            | 100            |
      | Institutional Memberships  | 100              | 100        | 100            | 100            |
      | Administrative Costs       | 100              | 100        | 100            | 100            |
    And I wait for "5" seconds
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations        | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Supplies                   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Software and Subscriptions | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Computing Devices          | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Equipment                  | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Professional Development   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Contracted Services        | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Salaries                   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Honorarium or Stipend      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Travel Expenses            | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Advisory Committee         | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | CTSO Advisor Expenses      | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Substitutes                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Externships                | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Institutional Memberships  | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |
      | Administrative Costs       | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $300.00            |

##################################### PostAwardSanity #####################################

  #SubawardSanity #AwardActivationFromFDM
  @38224 @awardHappyPathFromFDM @ProdSan2 @SubawardSanity @postAwardSanity @Rerun
  Scenario Outline: Validate  the activation of subaward from FDM happy path and the status changes to Activated
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NO_RISK_ASSESSMENT"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:AwardFundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I navigate to "Terms" sub tab
    When I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardFromFDM:-:paymentRequestSchedulesTableId---"
    And I enter in modal "Payment Request Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    #When I close "Edit Payment Request Schedule" modal by clicking the top right x button
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardFromFDM:-:progressReportSchedulesTableId---"
    When I enter in modal "Progress Report Schedule_FDM" values from "Award_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    And I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:subrecipientPendingTaskTableId---"
    And I wait for "3" seconds
    And I click on "Accept" in the page details
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see field "Status" as "Accepted"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardFromFDM:-:pendingTaskTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardFromFDM:-:peerReviewersTableId---"
    And I wait for "2" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "1" seconds
    When I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I wait for "3" seconds
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardFromFDM:-:subrecipientPendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    And I refresh the page
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardFromFDM:-:grantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside flex table with id "---subAwardFromFDM:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardFromFDM:-:subawardsTableId---"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"

    Examples:
      | Award Name                                       | Grant Name                                       |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  #DirectAwardActivation
  @72348 @awardHappyPathStandAlone @ProdSan1 @SubawardSanity @postAwardSanity
  Scenario: Validate the activation of direct subaward Happy path stand alone and status changes to Activated | Validate subaward Happy path stand alone
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter value "Grant Desc" into field "GrantDescription__c"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I navigate to "Budget" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category     | Award Amount | Cash Match | Non-Cash Match |
      | Special Populations | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Personnel |
#      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on "Send to Subrecipient" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---"
    And I wait for "5" seconds
    When I click on "Accept" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---"
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    Then I see that "Subaward" is in "Activated" status

  #Subaward_NoFocusArea
  @AwardWithFocusNo @ProdSan4 @SubawardSanity @postAwardSanity
  Scenario: Award with Focus Area=No
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_ByApp_Focus_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I enter value "Grant Desc" into field "GrantDescription__c"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I get the "EGMS ID"
    And I navigate to "Budget" sub tab
    Then I see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I navigate to "Budget" sub tab
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category     | Award Amount | Cash Match | Non-Cash Match |
      | Special Populations | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Personnel |
#      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send to Subrecipient" in the page details
    And I wait for "5" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I wait for "5" seconds
    When I click on "Accept" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see that "Subaward" is in "Approved" status
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    And I click on "Accept after Approval" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I click on "Activate" in the page details
    Then I softly see that "Status" is in "Activated" status

  #Subaward-DetailedBudgetYes
  @ValidatedDetailBudgetYesScenarioInAward @ProdSan2 @SubawardSanity @postAwardSanity
  Scenario: Validate Detail Budget Yes Scenario In Award
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_By_Applicant" values from "Award_Field_Values.xlsx"
    And I enter value "Yes" into field "IsBuildUpFunctionality__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"
    And I wait for "2" seconds
    Then I can see top right button "New" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I enter the following values into flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---" by clicking "New" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Other Leverage |
      | Supplies    | 5        | 10        | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100                          | 100        | 100            | 100            |
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Other Leverage | Total Project Cost |
      | Supplies    | 5.00     | $10.00    | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $50.00     | $100.00                      | ($50.00)                   | $100.00    | $100.00        | $100.00        | $350.00            |
    Then I softly can see row level action button "Edit" against "Supplies" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Supplies" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    When I click on "Edit" icon for "Supplies" inside flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    And I clear in modal the value from table field "CashMatch__c"
    And I clear in modal the value from table field "NonCashMatch__c"
    And I click on top right button "Save" in flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---" :
      | Description | Cash Match | Non-Cash Match |
      | Supplies    |            |                |
    When I click on "Delete" icon for "Supplies" inside flex table with id "---subAwardStandAlone:-:addLinesBudgetCategoryTableId---"
    And I wait for "5" seconds
    Then I softly see "No Records Found" inside flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---"

  #RiskAssessmentSanity->AwardLevelRiskAssessment
  @72360 @activeRiskAssessment @ProdSan2 @RiskAssessmentSanity @postAwardSanity
  Scenario: Validate the Activation of Award Risk Assessment and the status changes to Active
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Assessment" sub tab
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "RAEGMSID"
    And I wait for "5" seconds
    When I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Active"


  #SiteVisitSanity->AwardLevelSiteVisit (No Forms)
  @72353 @KSDE-1148 @siteVisitAcceptAndClose @ProdSan1 @SiteVisitSanity @postAwardSanity @Rerun
  Scenario: Validate once the Award level Site Visit is clicked on Accept and Close butted then sttaus changes to closed
  | Verify Civil Rights Voluntary Compliance Plan Required form in Files Tab if internal user is not checked the checkbox while creating the SV |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I refresh the page
    #NewChange
    And I click on "Notify" in the page details
    Then I softly see field "Status" as "Notified"
    And I pause execution for "3" seconds
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    #KSDE-1147
    When I navigate to "Forms & Files" sub tab
    Then I softly see "All Forms" page block displayed
    Then I softly see "No Records Found" inside flex table with id "---sitevisits:-:reportsTableId---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Approved"
    Given I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to grantor after Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Accept and Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly see field "Status" as "Closed"

  #SiteVisitSanity->AwardLevelSitiVisit_ManagementTab
  @KSDE-1058.4_SiteVisit @SitevisitOpenThroughManagementTabFromAward @ProdSan4 @SiteVisitSanity @postAwardSanity
  Scenario: Validate Site visit Open Through Management Tab From Award
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Then I softly see field "Status" as "Notified"
    Then I softly see status in Progress-bar is "Notified" and is "dark blue"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    Then I softly see status in Progress-bar is "Notified" and is "dark blue"
    Then I softly see field "EGMS ID" as "{SavedValue:SitevVisitId}"

  #NewScenario->SiteVisitSanity->AwardLevelSitiVisitCreation_PMPOFO
  @KSDE-1064 @SitevisitOpenThroughManagementTabFromAward @ProdSan4 @SiteVisitSanity @postAwardSanity
  Scenario: AwardLevelSitiVisit_CreatedState_PMPOFO
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Notify" in page detail
    And I save the field labeled "EGMS ID" as "SiteVisitId1"
    #PO
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Notify" in page detail
    And I save the field labeled "EGMS ID" as "SiteVisitId2"
    #FO
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Notify" in page detail
    And I save the field labeled "EGMS ID" as "SiteVisitId3"

  #NewScenario->SiteVisitSanity->AwardLevelSiteVisit ("Civil Rights Voluntary Compliance Plan" Form)
  @KSDE-1147 @siteVisitAcceptAndClose @ProdSan1 @SiteVisitSanity @postAwardSanity #Form-> "Civil Rights Voluntary Compliance Plan"
  Scenario: Verify Civil Rights Voluntary Compliance Plan Required form in Files Tab if internal user is checked the checkbox while creating the SV
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    #KSDE-1148
    When I enter value "Checked" into field "CivilRightsVolCompPlanRequired__c"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    Then I softly see field "Status" as "Notified"
    And I pause execution for "3" seconds
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Forms & Files" sub tab
    Then I softly see "All Forms" page block displayed
    Then I softly see value "Civil Rights Voluntary Compliance Plan" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    When I click on "View" icon for "Civil Rights Voluntary Compliance Plan" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    When I navigate to "Appendix A" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:AccessibilityStandardsTableID---" by clicking "Add Line Item" :
      | Name of Building | Date Built or Last Date of Renovations/Alterations | Accessibility Standard (To be Completed by KSDE Staff) | Programs/Pathways Located in the Building |
      | Automation Test  | 0                                                  | Automation Test                                        | Automation Test                           |
    When I navigate to "Appendix B" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforAdministratorsTableID---"
    Then I softly see "Interview Questions for Administrators" opens in overLay window
    And I enter "AppendixB" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    When I navigate to "Appendix C" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforParentStudentTableID---"
    Then I softly see "Interview Questions for Parents and Students" opens in overLay window
    And I enter "AppendixC" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    When I navigate to "Appendix D" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforCounselorsCTEStaffTableID---"
    Then I softly see "Interview Questions for Counselors and CTE/Academic Instructional Staff" opens in overLay window
    And I enter "AppendixD" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    When I navigate to "Appendix E" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforADACoordinatorsTableID---"
    Then I softly see "Interview Questions for Title IX, Section 504, and ADA Coordinators" opens in overLay window
    And I enter "AppendixE" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    Then I softly see field "Is Form Validated?" as "Yes"
    And I close the tab
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    When I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I wait for "2" seconds
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I wait for "2" seconds
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    And I wait for "2" seconds
    Then I softly can see top right button "Submit to Grantor" in page detail
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Accept and Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    Then I softly see field "Status" as "Closed"

  #DeskReviewSanity->AwardLevelDeskReview (1 Forms-> District/Consortium Self-Evaluation)
  @72354 @KSDE-1150 @KSDE-TCID-FormDCSE @deskReviewAcceptAndClose @ProdSan2 @DeskReviewSanity @postAwardSanity @Rerun
  Scenario: Validate once the Award level Desk Review is clicked on Accept and Close butted then status changes to closed
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Then I softly see field "Status" as "Notified"
    And I pause execution for "3" seconds
    Given I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    #KSDE-1150
    When I navigate to "Forms & Files" sub tab
    Then I softly see "All Forms" page block displayed
    Then I softly do not see value "Civil Rights Voluntary Compliance Plan" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    Then I softly see value "District/Consortium Self-Evaluation" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    #TODO: Palak to provide TC
    When I click on "Edit" icon for "District/Consortium Self-Evaluation" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields_KSDE" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                      | Strategies for the next annual Perkins Grant application |
      | 1S1: Four-Year Graduation Rate | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                          | Strategies for the next annual Perkins Grant application |
      | 2S1: Academic Proficiency in Reading/Language Arts | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                | Strategies for the next annual Perkins Grant application |
      | 2S2: Academic Proficiency in Mathematics | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                            | Strategies for the next annual Perkins Grant application |
      | 2S3: Academic Proficiency in Science | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                   | Strategies for the next annual Perkins Grant application |
      | 3S1: Post-Program Placement | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                  | Strategies for the next annual Perkins Grant application |
      | 4S1: Non-traditional Program Concentration | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                             | Strategies for the next annual Perkins Grant application |
      | 5S2: Program Quality – Attained Postsecondary Credits | Automation Test description                              |
    And I wait for "5" seconds
    When I click on "Add Line Item" icon for "1S1: Four-Year Graduation Rate" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "2S1: Academic Proficiency in Reading/Language Arts" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "2S2: Academic Proficiency in Mathematics" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "2S3: Academic Proficiency in Science" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "3S1: Post-Program Placement" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "4S1: Non-traditional Program Concentration" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "5S2: Program Quality – Attained Postsecondary Credits" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see field "Is Form Validated?" as "Yes"
    And I close the tab
    And I wait for "1" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to grantor after Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Accept And Close" in the page details
    Then I softly see field "Status" as "Closed"

  #AwardLevelDeskReview_ManagementTab
  @DeskReviewOpenThroughManagementTabFromAward @ProdSan4 @DeskReviewSanity @postAwardSanity
  Scenario: Validate Desk Review Open Through Management Tab From Award
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Then I softly see field "Status" as "Notified"
    Then I softly see status in Progress-bar is "Notified" and is "dark blue"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on "View" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:managementInitiateDRtableid---"
    Then I softly see field "Status" as "Notified"
    Then I softly see status in Progress-bar is "Notified" and is "dark blue"

  #NewScenario->AwardLevelDeskReview->#NewForm(2 Forms -> "Civil Rights Voluntary Compliance Plan" and "District/Consortium Self-Evaluation")
  @KSDE-1149 @ProdSan4 @DeskReviewSanity @postAwardSanity @Rerun
  Scenario: Verify Civil Rights Voluntary Compliance Plan Required form in Files Tab if internal user is checked the checkbox while creating the DR
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    #KSDE-
    When I enter value "Checked" into field "CivilRightsVolCompPlanRequired__c"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:PO Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    Then I softly see field "Status" as "Notified"
    And I pause execution for "3" seconds
    Given I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent To Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    #KSDE-1150
    When I navigate to "Forms & Files" sub tab
    Then I softly see "All Forms" page block displayed
    Then I softly see value "Civil Rights Voluntary Compliance Plan" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    Then I softly see value "District/Consortium Self-Evaluation" for title "Form Name" inside table "---sitevisits:-:reportsTableId---"
    #TODO: Palak to provide TC
    When I click on "Edit" icon for "District/Consortium Self-Evaluation" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields_KSDE" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                      | Strategies for the next annual Perkins Grant application |
      | 1S1: Four-Year Graduation Rate | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                          | Strategies for the next annual Perkins Grant application |
      | 2S1: Academic Proficiency in Reading/Language Arts | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                | Strategies for the next annual Perkins Grant application |
      | 2S2: Academic Proficiency in Mathematics | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                            | Strategies for the next annual Perkins Grant application |
      | 2S3: Academic Proficiency in Science | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                   | Strategies for the next annual Perkins Grant application |
      | 3S1: Post-Program Placement | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                  | Strategies for the next annual Perkins Grant application |
      | 4S1: Non-traditional Program Concentration | Automation Test description                              |
    And I edit the following rows inline in flex table with id "OtherTargetedAreas" by clicking "Edit" :
      | Indicator                                             | Strategies for the next annual Perkins Grant application |
      | 5S2: Program Quality – Attained Postsecondary Credits | Automation Test description                              |
    And I wait for "5" seconds
    When I click on "Add Line Item" icon for "1S1: Four-Year Graduation Rate" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "2S1: Academic Proficiency in Reading/Language Arts" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "2S2: Academic Proficiency in Mathematics" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "2S3: Academic Proficiency in Science" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "3S1: Post-Program Placement" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "4S1: Non-traditional Program Concentration" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I pause execution for "5" seconds
    When I click on "Add Line Item" icon for "5S2: Program Quality – Attained Postsecondary Credits" inside flex table with id "OtherTargetedAreas" with wait for record
    When I enter the following values into flex table with id "OtherTargetedAreasAddChild" by clicking "New" :
      | FY   | Category          | Required/State Goal | Actual |
      | 2022 | LEA Overall Score | 100                 | 100    |
    Then I see the following rows under the following headers in table with id "OtherTargetedAreasAddChild" :
      | FY   | Category          | Required/State Goal | Actual  | Result |
      | 2022 | LEA Overall Score | 100.00%             | 100.00% | 0 %    |
    When I close "Add Line Item" modal by clicking the top right x button
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see field "Is Form Validated?" as "Yes"
    And I close the tab
    And I wait for "1" seconds
    #TODO: Palak to provide TC
    When I click on "View" icon for "Civil Rights Voluntary Compliance Plan" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    When I navigate to "Appendix A" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:AccessibilityStandardsTableID---" by clicking "Add Line Item" :
      | Name of Building | Date Built or Last Date of Renovations/Alterations | Accessibility Standard (To be Completed by KSDE Staff) | Programs/Pathways Located in the Building |
      | Automation Test  | 0                                                  | Automation Test                                        | Automation Test                           |
    When I navigate to "Appendix B" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforAdministratorsTableID---"
    Then I softly see "Interview Questions for Administrators" opens in overLay window
    And I enter "AppendixB" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    When I navigate to "Appendix C" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforParentStudentTableID---"
    Then I softly see "Interview Questions for Parents and Students" opens in overLay window
    And I enter "AppendixC" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    When I navigate to "Appendix D" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforCounselorsCTEStaffTableID---"
    Then I softly see "Interview Questions for Counselors and CTE/Academic Instructional Staff" opens in overLay window
    And I enter "AppendixD" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    When I navigate to "Appendix E" sub tab
    And I click on top right button "Add" in flex table with id "---sitevisits:-:InterviewQuestionsforADACoordinatorsTableID---"
    Then I softly see "Interview Questions for Title IX, Section 504, and ADA Coordinators" opens in overLay window
    And I enter "AppendixE" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    Then I softly see field "Is Form Validated?" as "Yes"
    And I close the tab
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient after Approval"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to grantor after Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Accept And Close" in the page details
    Then I softly see field "Status" as "Closed"

  #NewScenario->AwardLevelDeskReviewCreation_PMPOFO
  @KSDE-1178 @ProdSan4 @DeskReviewSanity @postAwardSanity
  Scenario: Verify Internal Users(PM/PO/FO) can create Desk Review on Activated Awards
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default" of type "Formula_By_Applicant"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Notify" in page detail
    #PO
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Notify" in page detail
    #FO
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---subAwardStandAlone:-:SubAwardTableId---" panel
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:SubAwardTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Notify" in page detail

  #PaymentRequestSanity
  #PaymentRequest->Advance
  @72350 @adhocAdvanceHappyPath @ProdSan1 @bug-KSDE-51 @PaymentRequestSanity @postAwardSanity @Rerun1
  Scenario: Validate the Advance Payment Request happy path and the status changes to 'Paid'
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category     | Advance Requested This Action |
      | Special Populations | 10                            |
    When I navigate to "Forms and Files" sub tab
#    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---"
#    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
#    And I wait for "2" seconds
#    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---"
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I click modal button "Close"
    And I refresh the page
    Then I softly see field "Status" as "Paid"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Special Populations" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Amount to be paid by Perkins | Advance Applied | Cash Match | Non-Cash Match |
      | Special Populations | Special Populations                        | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 500                          | 10              | 100        | 100            |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentLineItemsTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Other Charges ($) | Spent This Action | Advance Applied | Reimbursed Amount | Program Income Disbursed | Cash Match | Non-Cash Match | Total Match |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Agricultural Technology & Mechanical Systems | $1,000.00  | $500.00                      | $500.00                    | $0.00             | $500.00           | $10.00          | $490.00           | $0.00                    | $100.00    | $100.00        | $200.00     |
    When I close "Add Line Items" modal by clicking the top right x button
#    When I click on "Show line items" icon for "Special Populations" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
#    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
#      | Expenditure            | How does this support Special Populations? | Pathway Name                                 | Expenditure Cost | Other Charges ($) | Advance Applied | Program Income Disbursed | Cash Match | Non-Cash Match |
#      | Automation Expenditure | Automation Test                            | Agricultural Technology & Mechanical Systems | 500              | 100               | 10              | 0                        | 100        | 100            |
#    And I wait for "5" seconds
#    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action | Advance Applied This Action |
      | {SavedValue:fundingAccount} | 500                   | 10                          |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    Then I softly see field "Status" as "Approved"
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I pause execution for "2" seconds
    When I click modal button "Close"
    Then I softly see field "Status" as "Paid"

  #PaymentRequestSanity->Reimbursement
  @KSDE-1174 @72349 @adhocReimbursementHappyPath @ProdSan1 @bug-KSDE-51 @PaymentRequestSanity @postAwardSanity @Rerun
  Scenario: Validate the Reimbursement Payment Request happy path and the status changes to 'Paid'
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Special Populations" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Expenditure                | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 400                          |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentLineItemsTableId---" :
      | Actions     | Expenditure                | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Other Charges ($) | Spent This Action | Cash Match | Non-Cash Match | Total Match |
      | Action menu | {default:StringOf255Chars} | {default:StringOf255Chars}                 | 10.00    | $100.00   |                     | Agricultural Technology & Mechanical Systems | $1,000.00  | $400.00                      | $600.00                    | $0.00             | $400.00           | $0.00      | $0.00          | $0.00       |
    When I close "Add Line Items" modal by clicking the top right x button
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 400                   |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I pause execution for "2" seconds
    When I click modal button "Close"
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    Then I softly see field "Status" as "Paid"

  #PaymentRequest->Scheduled
  @72351 @scheduledReimbursementPaymentRequestHappyPath @ProdSan1 @PaymentRequestSanity @postAwardSanity @Rerun
  Scenario Outline: Validate the Scheduled Payment Request happy path and the status changes to 'Paid' and is green
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Formula_By_Applicant"
    Given I delete the record "<Award Name>" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "<Award Name>" having object api name as "PaymentRequest__c"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---paymentRequest:-:subrecipientPendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I click on "Edit" in the page details
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Special Populations" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---"
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Expenditure                | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 400                          |
    Then I see the following rows under the following headers in table with id "---paymentRequest:-:paymentLineItemsTableId---" :
      | Actions     | Expenditure                | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Other Charges ($) | Spent This Action | Cash Match | Non-Cash Match | Total Match |
      | Action menu | {default:StringOf255Chars} | {default:StringOf255Chars}                 | 10.00    | $100.00   |                     | Agricultural Technology & Mechanical Systems | $1,000.00  | $400.00                      | $600.00                    | $0.00             | $400.00           | $0.00      | $0.00          | $0.00       |
    When I close "Add Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 400                   |
    When I navigate to "Responsibilities" sub tab
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I pause execution for "2" seconds
    When I click modal button "Close"
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    Then I softly see field "Status" as "Paid"

    Examples:
      | Award Name                            |
      | {SavedValue:Automation Runtime award} |

  #ProgressReportSanity
  @72352 @progressReportHappyPath @ProdSan1 @bug-KSDE-56 @ProgressReportSanity @postAwardSanity @Rerun
  Scenario: Validate once the Progress Report approval process is completed then the status changes to approved
    Given I activated standalone subaward "Automation Runtime award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:subrecipientPendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:subrecipientPendingTaskTableId---"
    When I navigate to "Forms and Files" sub tab
#    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---"
#    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
#    And I click modal button "Close"
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    Then I softly see field "Form Name" as "Community Initiative Progress Report"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Approve" in the approval decision
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - Approved"
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:internalProgressReportFlexTableId---" panel
    Then I see value "Approved" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  #ProgressReport->SF429-B
  @SF429-B_FillFullForm @ProdSan3 @ProgressReportSanity @postAwardSanity
  Scenario: Validate SF429-B_Fill Full Form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
#    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---"
#    And I upload attachment without random number "Attachment1.pdf" of type "Others" from computer
#    When I click modal button "Close"
    And I wait for "2" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "5" seconds
    Then I softly see value "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without Split
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0016"
    Then I see the page contains text "Expiration Date: 02/28/2025"
    And I click on "Edit" in the page details
    And I enter "SF429B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment1.pdf" of type "14i. NHPA Description" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment1.pdf" of type "14h. Environmental Compliance Requirements" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  #ProgressReport->SF428_B
  @SF428_B_Form_Fill @ProdSan3 @ProgressReportSanity @postAwardSanity
  Scenario: Validate SPI user can able to save & validate form after entering correct & valid data on all fields present on SF-428-B form
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "View" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---"
    And I switch to tab number "1"
    Then I softly see the text containing "OMB Number: 4040-0018"
    Then I see the page contains text "Expiration Date: 11/30/2024"
    When I click on "Edit" in the page details
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    And I refresh the page
    And I wait for "4" seconds
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Back" in page detail
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |

  @SF428_B_ErrorValidation @ProdSan3 @ProgressReportSanity @postAwardSanity
  Scenario: SF428_B_ErrorValidation
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---"
    And I switch to tab number "1"
    And I enter "SF428B_Form" values from "ProgressReport_Field_Values.xlsx"
    When I enter value "UnChecked" into field "FederallyownedProperty__c"
    When I enter value "UnChecked" into field "AcquiredEquipment__c"
    When I enter value "UnChecked" into field "ResidualUnusedSupplies__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "1. Supplemental Sheet SF-428S or recipient equivalent" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Add Files" in flex table with id "---progressReport:-:sf428cFormAttachmentTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "2. Additional File for Comments" from computer
    When I click modal button "Close"
    And I wait for "9" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Selecting at least one that apply in 'Report' is required. |
    When I click on "Edit" in the page details
    When I enter value "Checked" into field "FederallyownedProperty__c"
    When I enter value "Checked" into field "AcquiredEquipment__c"
    When I enter value "Checked" into field "ResidualUnusedSupplies__c"
    When I enter value "Checked" into field "NoneoftheAbove__c"
    And I clear the value from field "FederalAwardIdentifier__c"
    When I enter value "UnChecked" into field "RequestTransfertoAward__c"
    When I enter value "UnChecked" into field "RequestFederalAgency__c"
    When I enter value "UnChecked" into field "Other__c"
    When I enter value "UnChecked" into field "AcknowledgeEquipment__c"
    When I enter value "UnChecked" into field "RequestFederalAgencyDispositionInstr__c"
    And I clear the value from field "TotalAmount__c"
    And I clear the value from field "PercentageofFederalParticipation__c"
    And I clear the value from field "FederalShare__c"
    And I clear the value from field "SellingandHandlingAllowance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If "1d" is checked, uncheck "1a", "1b" and "1c" in 'Report' section.                                                                            |
      | One selection is required in "2a. Federally-owned Property", if "1a" is checked in 'Report' section.                                            |
      | One selection is required in "2b. Acquired Equipment with current fair market value of $5,000 or more", if "1b" is checked in 'Report' section. |
      | "Total Amount" is required in "2c. Reportable Residual Unused Supplies", if "1c" is checked in 'Report' section.                                |
      | "Percentage of Federal participation" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.         |
      | "Federal share" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.                               |
      | "Selling and handling allowance" in "2c. Reportable Residual Unused Supplies" is required, if "1c" is checked in 'Report' section.              |

  @SF428_B_Dependent_fields @ProdSan3 @ProgressReportSanity @postAwardSanity
  Scenario: SF428_B_Dependent_fields
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---"
    And I switch to tab number "1"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "FederallyownedProperty__c"
    Then I softly see fields "RequestTransfertoAward__c" is in edit mode
    Then I softly see fields "RequestFederalAgency__c" is in edit mode
    Then I softly see fields "Other__c" is in edit mode
    Then I softly see that "AcknowledgeEquipment__c" rendered in view mode only
    Then I softly see that "RequestFederalAgency__c" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see fields "PercentageofFederalParticipation__c" is in edit mode
    Then I softly see fields "FederalShare__c" is in edit mode
    Then I softly see fields "SellingandHandlingAllowance__c" is in edit mode
    Then I softly see fields "FederalAwardIdentifier__c" is in edit mode
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see field "(i) Request transfer to Award" inside page block
    Then I softly see field "Federal Award Identifier" inside page block
    Then I softly see field "(ii) Request Federal Agency disposition instructions" inside page block
    Then I softly see field "(iii) Other (Provide detail in Block 3 or attach request)" inside page block
    Then I softly see that "Federal Award Identifier" rendered in view mode only

  @SF428_B_dependentField_2 @ProdSan3 @ProgressReportSanity @postAwardSanity
  Scenario: SF428_B_dependentField_2
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I wait for "2" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "2" seconds
    Then I softly see value "Tangible Personal Property Report - Final Report - SF-428-B" for title "Form Name" inside table "---progressReport:-:formTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "View" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    Then I can see row level action button "Edit" against "Tangible Personal Property Report - Final Report - SF-428-B" in flex table with id "---progressReport:-:formTableId---"
    And I click on "Edit" icon for "Tangible Personal Property Report - Final Report - SF-428-B" inside flex table with id "---progressReport:-:formTableId---"
    And I switch to tab number "1"
    Then I softly see "a. Federally-owned Property (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2a below)" inside page block detail
    Then I softly see "b. Acquired Equipment with acquisition cost of $5,000 or more for which the awarding agency has reserved the right to transfer title (List on Supplemental Sheet SF-428S or recipient equivalent and complete Section 2b below)" inside page block detail
    Then I softly see "c. Residual Unused Supplies with total aggregate fair market value exceeding $5,000 not needed for any other Federally sponsored programs or projects (Complete Section 2c below)" inside page block detail
    Then I softly see "d. None of the above" inside page block detail
    When I enter value "1234" into field "FederalGrantIdentifyingNumbe__c"
    When I enter value "Checked" into field "AcquiredEquipment__c"
    Then I softly see that "RequestTransfertoAward__c" rendered in view mode only
    Then I softly see fields "FederalAwardIdentifier__c" is in edit mode
    Then I softly see that "RequestTransfertoAward__c" rendered in view mode only
    Then I softly see that "Other__c" rendered in view mode only
    Then I softly see that "Total Amount" rendered in view mode only
    Then I softly see that "(ii) Percentage of Federal participation" rendered in view mode only
    Then I softly see that "(iii) Federal Share" rendered in view mode only
    Then I softly see that "(iv) Selling and handling allowance" rendered in view mode only
    Then I softly see fields "PercentageofFederalParticipation__c" is in edit mode
    Then I softly see fields "FederalShare__c" is in edit mode
    Then I softly see fields "SellingandHandlingAllowance__c" is in edit mode
    Then I softly see "(i) Acknowledge equipment acquired under this federal award will be retained for use as originally approved" inside page block detail
    Then I softly see "(ii) Request Federal Agency disposition instructions" inside page block detail
    Then I softly see fields "AcknowledgeEquipment__c" is in edit mode
    Then I softly see fields "RequestFederalAgencyDispositionInstr__c" is in edit mode

  #ProgressReport_SF425_SF428A_SF429B
  @SF428_B_NegativeValidation @ProdSan4 @ProgressReportSanity @postAwardSanity @Rerun1
  Scenario: SF425 Forms Negative Validation Check and SF 428 A Blank value Validation Check also SF429B form negative values entered validation check
    Given I activated standalone subaward "Automation Runtime Direct Award" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Direct Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Direct Award}" having object api name as "ProgressReports__c"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---"
    And I wait for "12" seconds
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "12" seconds
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "12" seconds
    And I click on "View" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressReport:-:formTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF425_Form" values from "ProgressReport_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---progressReport:-:sf425TransactionTableID---" by clicking "Edit" :
      | Classification                                                          | Cumulative |
      | a. Cash Receipts                                                        | -30        |
      | b. Cash Disbursements                                                   | -10        |
      | d. Total Federal funds authorized                                       | -30        |
      | e. Federal share of expenditures                                        | -20        |
      | f. Federal share of unliquated obligations                              | -5         |
      | i. Total recipient share required                                       | -30        |
      | j. Recipient share of expenditures                                      | -20        |
      | l. Total Federal share of program income earned                         | -30        |
      | m. Program income expended in accordance with the deduction alternative | -20        |
      | n. Program income expended in accordance with the addition alternative  | -5         |
    Then I softly see the following messages in the page details contains:
      | The amount cannot be less than zero. |
    And I close the tab
    #SF-428-A Blank value validation check
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I click on "Edit" icon for "Tangible Personal Property Report - Annual Report - SF-428-A" inside flex table with id "---progressReport:-:formTableId---"
    And I switch to tab number "1"
    And I enter value "1234" into field "FederalGrantSF428A__c"
    And I enter value "(a) Individual (Reporting Federally-owned property for one award)" into field "ReportTypePiclikist__c"
    And I enter value "30 SEP" into field "ReportAsOf__c"
    And I enter value "Test" into field "CommentsSF428__c"
    When I click on "Save" in the page details
    And I wait for "12" seconds
    And I refresh the page
    And I click on top right button "New" in flex table with id "---progressReport:-:sf428AFederallyOwnedTableId---"
    When I enter in modal "SF428A_Federal_Property" values from "ProgressReport_Field_Values.xlsx"
    And I click modal button "Save"
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | If year is selected, report type As of Year is required. |
    And I close the tab
    #SF429B form negative values entered validation check
    When I navigate to "Forms and Files" sub tab
    And I wait for "5" seconds
    And I select value inside table "---progressReport:-:formTableId---" is "All"
    And I wait for "25" seconds
    And I click on "View" icon for "Real Property Status Report ATTACHMENT B (Request to Acquire, Improve or Furnish)- SF-429-B" inside flex table with id "---progressReport:-:formTableId---" without Split
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF429B_Form_incorrect_data" values from "ProgressReport_Field_Values.xlsx"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | If "Other" option is selected in "14k", Justification in specify is required.                                                                |
      | If "Other" option is selected in "14l", Justification in specify is required.                                                                |
      | If "Other" is selected in "Real Property Ownership Type", Description is required.                                                           |
      | Unit type is required, if amount entered in "14d. Land Acreage or Square Units".                                                             |
      | Unit type is required, if amount entered in "14e. Gross and Usable Square Footage/Meters".                                                   |
      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14k"                                                     |
      | Values can only be entered against the Electric (KWh) or Electric (Btu) in section "14l"                                                     |
      | Please enter Zip code in the Zip + 4 codes format (e.g. 12345-1234) in the 'Zip / Postal code' field.                                        |
      | Federal Percentage cannot be less than zero.                                                                                                 |
      | Non Federal Percentage cannot be less than zero.                                                                                             |
      | The Land Acreage Amount cannot be less than zero.                                                                                            |
      | The Gross Amount cannot be less than zero.                                                                                                   |
      | The Usable Amount cannot be less than zero.                                                                                                  |
      | Federal Share cannot be less than zero.                                                                                                      |
      | Non Federal Share cannot be less than zero.                                                                                                  |
      | Value in "Electric" in "14k" cannot be less than zero.                                                                                       |
      | Value in "Btu" in "14k" cannot be less than zero.                                                                                            |
      | Value in "Petroleum" in "14k" cannot be less than zero.                                                                                      |
      | Value in "Natural Gas" in "14k" cannot be less than zero.                                                                                    |
      | Value in "Other" in "14k" cannot be less than zero.                                                                                          |
      | Value in "Electric" in "14l" cannot be less than zero.                                                                                       |
      | Value in "Btu" in "14l" cannot be less than zero.                                                                                            |
      | Value in "Petroleum" in "14l" cannot be less than zero.                                                                                      |
      | Value in "Natural Gas" in "14l" cannot be less than zero.                                                                                    |
      | Value in "Other" in "14l" cannot be less than zero.                                                                                          |
      | Adding file is required in "Files section" with classification "Environmental Compliance Requirements", if "Yes" option in "14h" is checked. |
      | Adding file is required in "Files section" with classification "NHPA", if "Yes" option in "14i" is checked.                                  |

  #AmendmentRequestSanity->AmendmentRequest->BudgetPeriod
  @72358 @activationOfBudgetPeriodAmendmentRequest @ProdSan2 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario: Validate the Budget period amendment activation
    And I activated standalone subaward "Automation Runtime Award" with properties "AMENDMENT_REQUEST" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    And I wait for "5" seconds
    When I enter "BudgetPeriodChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "3800" into field "NewBudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "4" seconds
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    When I navigate to "Responsibilities" sub tab
    And I navigate to "Responsibilities" sub tab
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AmendReqEGMSID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendReqEGMSID}" in "---amendment:-:subrecipientPendingTask---" panel
    And I click on "Start" icon for "{SavedValue:AmendReqEGMSID}" inside flex table with id "---amendment:-:subrecipientPendingTask---"
    And I click on "Acknowledge" in the page details
    And I refresh the page
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendReqEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AmendReqEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendReqEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Approve Amendment Request" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Amended" in "---subAwardStandAlone:-:GrantsSubAwardsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:GrantsSubAwardsTableId---"
    Then I softly see field "Status" as "Amended"
    Then I see status in Progress-bar is "Amended" and is "dark blue"
    Then I softly see field "Status" as "Amended"

  #AmendmentRequest->FundingChange
  @FundingChangeAmendmentRequest @ProdSan1 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario: validate the end to end flow for Funding change amendment request
#    Given I activated standalone subaward "Automation Runtime Award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-{SavedValue:PO Username} user" of type "Formula_By_Applicant"
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    Then I softly see "Create Amendment Request" opens in overLay window
    When I enter "FundingChange_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundingID"
    When I navigate to "Responsibilities" sub tab
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Special Populations" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Expenditure         | Amount to be paid by Perkins |
      | Special Populations | 3000                         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 3000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundingID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:FundingID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I get current URL
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundingID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I get current URL
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I softly see field "Status" as "Pending Activation"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

  #AmendmentRequest->PeriodicRenewal
  @PeriodicRenewalAmendmentRequests @ProdSan2 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario: validate the end to end flow for Periodic Renewal Amendment Request
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 1000                |
    When I navigate to "Responsibilities" sub tab
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    Then I see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SOWAMENDMENTREQUEST}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:SOWAMENDMENTREQUEST}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I softly see field "Status" as "Pending Activation"
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

  #AmendmentRequest->ScopeOfWorkChange
  @ScopeOfWorkChangeAmendmentRequest @ProdSan2 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario Outline: Validate end to end flow for scope of work change amendment request
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Send to Subrecipient" in the page details
    Then I see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "10" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I softly see field "Status" as "Pending Activation"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  #AmendmentRequest->Subrecipient_KeyPersonnelChange
  @SubrecipientKeyPersonnelChangeAmendmentRequest @ProdSan2 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario: Validate end to end flow for key personnel change amendment request
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_KPC" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AmendmentId"
    And I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---amendment:-:RecipientKeyPersonalTableId---"
    When I click "Associate" after selection of "{SavedValue:SPA Username}" in the table "---amendment:-:RecipientKeyPersonalAssociateTableId---"
    When I close "Associate Contacts" modal by clicking the top right x button
    When I click on "Submit to Grantor" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I wait for "3" seconds
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:AmendmentId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:AmendmentId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PM Username} | Step 1            |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Amend Subaward" in the page details
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    Then I softly see field "Status" as "Pending Activation"
    And I pause execution for "3" seconds
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see that "Status" is in "Activated" status

  #AmendmentRequest->BudgetRedirection_Subrecipient
  @SubrecipientBudgetRedirection @ProdSan1 @bug-KSDE-57 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario: Validate Subrecipient side Budget Redirection Amendment End to End flow
    And I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Formula_By_Applicant"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardFromFDM:-:RecipientGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardFromFDM:-:RecipientSubAwardTableId---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I save the field labeled "Grant ID" as "GrantEGMSID"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Subrecipient_BRedirection" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "BUDGETREDIRECTIONID"
    When I click on "Add Line Items" icon for "Special Populations" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Expenditure         | Amount to be paid by Perkins |
      | Special Populations | 900                          |
    And I wait for "2" seconds
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100                          |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:BUDGETREDIRECTIONID}" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:BUDGETREDIRECTIONID}" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I click on "Amend Subaward" in the page details
    And I wait for "4" seconds
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see that "Status" is in "Activated" status

  #AmendmentRequest->TermsAndConditions
  @TermsandConditionAmendmentRequest @ProdSan2 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario: Validate Terms and Conditions Amendment Request End to End flow
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "TermsAndConditions_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Justification" into field "TncComments__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:approversTableId---" by clicking "New" :
      | Name                     | Amendment Request |
      | {SavedValue:PO Username} | Step 2            |
#    When I navigate to "Files" sub tab
#    And I click on top right button "Add Files" in flex table with id "---progressreport:-:AmendmentAttachmentTableId---"
#    And I upload attachment without random number "Attachment.pdf" of type "Terms and Conditions" from computer
#    When I click modal button "Close"
#    And I wait for "2" seconds
#    Then I softly see value "Attachment.pdf" for title "Title" inside table "---progressreport:-:AmendmentAttachmentTableId---"
    And I click on "Send to Subrecipient" in the page details
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Acknowledge" in the page details
    And I refresh the page
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - Approved"
    And I perform quick search for "Record Id" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see that "Status" is in "Activated" status

  #AmendmentRequest->FundingChange+TermsAndConditions
  @FundingChangeandTermsandConditions @ProdSan4 @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario: Validate Funding Change and Terms & Conditions End to End flow
#    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES-{SavedValue:PO Username} user" of type "Competitive"
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Formula_By_Applicant"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    When I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Funding_Terms_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter values into fields
      | Value                       | Field                         |
      | Automation Test Description | FundingChangeJustification__c |
      | 2000                        | RequestedChangeInBudget__c    |
    When I enter values into fields
      | Value                    | Field          |
      | Automation Justification | TncComments__c |
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FundTermsID"
    When I navigate to "Responsibilities" sub tab
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Add Line Items" icon for "Special Populations" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Expenditure         | Amount to be paid by Perkins |
      | Special Populations | 1500                         |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    When I click on "Add Line Items" icon for "Special Populations" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Expenditure                | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 1500                         |
    And I wait for "2" seconds
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    And I click on "Acknowledge" in the page details
    And I wait for "2" seconds
    And I refresh the page
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value | Field                |
      | 4000  | RevisedCommitment__c |
    And I click on "Save" in the page details
    When I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 3000                |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:FundTermsID}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:FundTermsID}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---"
    And I click on "Amend Subaward" in the page details
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see that "Status" is in "Activated" status

  #AmendmentRequest->SubrecipientBR+KPC+SOW
  @mk @CombinationOfSubrecipientBRandKPCandSOW @ProdSan2 @AmendmentRequestSanity @postAwardSanity @Rerun1
  Scenario: Validate Combinations of Subrecipient BR and KPC and SOW
    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES" of type "Formula_By_Applicant"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "Sub_BR_KPC_SOW_creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation Justification" into field "Justification__c"
    And I enter value "Automation Justification" into field "ContactChangeDescription__c"
    And I enter "Subrecipient_SOW_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budRedKPCSOWId"
    Then I softly see field "Status" as "Created"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientKeyPersonalTableId---" by clicking "Edit" :
      | Name                       | Project Role |
      | {SavedValue:SPI3 Username} | Other        |
    And I wait for "2" seconds
    And I refresh the page
    When I click on "Add Line Items" icon for "Special Populations" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Expenditure         | Amount to be paid by Perkins |
      | Special Populations | 450                          |
#    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
#      | Expenditure                | How does this support Special Populations? | Pathway Name                                 | Expenditure Cost |
#      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | Agricultural Technology & Mechanical Systems | -50              |
    And I wait for "2" seconds
    When I close "Add Line Items" modal by clicking the top right x button
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Amount to be paid by Perkins |
      | Supplies    | 5        | 10        | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 50                           |
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    When I click on "Add Line Items" icon for "Special Populations" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "Edit" :
      | Expenditure         | Amount to be paid by Perkins |
      | Special Populations | 450                          |
#    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
#      | Expenditure                | How does this support Special Populations? | Pathway Name                                 | Expenditure Cost |
#      | {default:StringOf255Chars} | {default:StringOf255Chars}                 | Agricultural Technology & Mechanical Systems | -50              |
#    And I wait for "2" seconds
    When I close "Add Line Items" modal by clicking the top right x button
    And I wait for "3" seconds
    When I click on "Add Line Items" icon for "Supplies" inside flex table with id "---amendment:-:budgetChangeTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---amendment:-:amendmentLineItemsTableId---" by clicking "New" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Amount to be paid by Perkins |
      | Supplies    | 5        | 10        | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 50                           |
    And I wait for "5" seconds
    When I close "Add Line Items" modal by clicking the top right x button
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:budRedKPCSOWId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:budRedKPCSOWId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Amend Subaward" in the page details
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see that "Status" is in "Activated" status

  #AmendmentRequest->PeriodicRenewal-Forward
  @CarryForwardAmendmentRequest @ProdSan2 @AmendmentRequestSanity @postAwardSanity @Rerun1
  Scenario: Validate Carry Forward Amendment Request End to End flow
    And I activated standalone subaward "Automation Runtime award" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY_BUILDUP_NO" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside table
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see that "Status" is in "Activated" status
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    And I wait for "5" seconds
    When I enter "Periodic Renewal" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Periodic Renewal Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I enter values into fields
      | Value | Field                      |
      | 4000  | RevisedCommitment__c       |
      | 2000  | RequestedChangeInBudget__c |
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "SOWAMENDMENTREQUEST"
    And I save the field labeled "Proposed Budget Period Start Date" as "PBPSD"
    And I save the field labeled "Proposed Budget Period End Date" as "PBPED"
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date         | End Date           |
      | Automation Permanent Focus Area | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:FundingChangeFocusAreaTableId---" by clicking "Edit" :
      | Title                            | Start Date         | End Date           |
      | Automation Permanent Focus Area2 | {SavedValue:PBPSD} | {SavedValue:PBPED} |
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2000                |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I save the field labeled "EGMS ID" as "AmendmentEGMSID"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendmentEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AmendmentEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category     | Revised Award Amount | Cash Match | Non Cash Match |
      | Special Populations | 1000                 | 100        | 0              |
    And I click on page navigation arrow "---amendment:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:budgetChangeTableId---" by clicking "Edit" :
      | Category Name       | Revised Award Amount | Cash Match | Non Cash Match |
      | Special Populations | 1000                 | 100        | 0              |
    And I wait for "2" seconds
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AmendmentEGMSID}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:AmendmentEGMSID}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on "Amend Subaward" in the page details
    And I pause execution for "5" seconds
    When I click on "Activate" in the page details
    And I save the field labeled "EGMS ID" as "ActivatedSubAwardId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:ActivatedSubAwardId}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:ActivatedSubAwardId}" inside flex table with id "---amendment:-:recipientsSubawardTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientCF_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Created"
    And I enter value "Automation Justification" into field "PurposeRTA__c"
    And I enter value "700" into field "RequestedChangeInBudget__c"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "CFAmendmentId"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category     | Carry Forward |
      | Special Populations | 200           |
    And I wait for "2" seconds
    And I click on page navigation arrow "---amendment:-:RecipientCarryForwardBudgetTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---amendment:-:RecipientCarryForwardBudgetTableId---" by clicking "Edit" :
      | Budget Category     | Carry Forward |
      | Special Populations | 500           |
    When I click on button "resetIcon" in flex table with id "---progressReport:-:budgetChangeTableId---"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category     | Revised Award Amount | Cash Match | Non Cash Match |
      | Special Populations | 1200                 | 120        | 0              |
    And I wait for "2" seconds
    And I click on page navigation arrow "---progressReport:-:budgetChangeTableId---" for table id "Next"
    And I edit the following rows inline in flex table with id "---progressReport:-:budgetChangeTableId---" by clicking "Edit" :
      | Budget Category     | Revised Award Amount | Cash Match | Non Cash Match |
      | Special Populations | 1500                 | 150        | 0              |
    And I wait for "5" seconds
    And I refresh the page
    And I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:CFAmendmentId}" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:CFAmendmentId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---amendment:-:amendmentFundingAccountsTableId---" by clicking "Edit" :
      | Title                       | Revised Encumbrance |
      | {SavedValue:fundingAccount} | 2700                |
    When I navigate to "Responsibilities" sub tab
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see that "Status" is in "Submitted for Approval" status
    And I "Approve" in the approval decision
    And I click on "Amend Subaward" in the page details
    And I wait for "3" seconds
    When I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see that "Status" is in "Activated" status

  #NewScenario-AmendmentRequestCreation_PMPOFO
  @KSDE-1179 @ProdSan4 @AmendmentRequestSanity @postAwardSanity
  Scenario Outline: Verify Internal Users(PM/PO/FO) can create SOW Amendment Requests on Activated Awards
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I login to "As a Grantor" app as "<User>" user
    #TODO: Palak to provide TC
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    When I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | User |
      | PO   |
      | FO   |

  #NewScenario->AmendmentRequestSanity->AwardActivation_PM->AmendmentRequestCreation_PO->AmendAndActivateSubaward_FO
  @KSDE-TCID @ProdSan4 @SOWAmendmentRequest_PMPOFO @AmendmentRequestSanity @postAwardSanity @Rerun
  Scenario Outline: Award Activate by PM, initiate "scope of work change" amendment request by PO and Amend Award & Active Award by FO
    Given I activated standalone subaward "Automation Runtime Amendment Award" with properties "default" of type "Competitive"
    And I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---"
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "ScopeOfWork_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "scopeWorkId"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I edit the following rows inline in flex table with id "---amendment:-:approversTableId---" by clicking "Edit" :
      | Amendment Request | Name                     |
      | Step 1            | {SavedValue:PO Username} |
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:scopeWorkId}" for title "EGMS ID" inside table "---amendment:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    When I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I pause execution for "3" seconds
    Then I can see top right button "Amend Subaward" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:scopeWorkId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:scopeWorkId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    Then I can see top right button "Amend Subaward" in page detail
    And I click on "Amend Subaward" in the page details
    Then I softly see field "Status" as "Pending Activation"
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"

    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Amendment Award} | {SavedValue:Automation Runtime Amendment Award} |

  #CloseoutRequestSanity->EarlyCompletionCR_PM->"Reserve Grant" Form
  @72359 @KSDE-1066_PM @completeCloseout @ProdSan1 @CloseoutRequestSanity @postAwardSanity @Rerun
  Scenario: Validate the Closeout is submitted for approval and the status changes to Submitted for Approval
    And I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    And I wait for "3" seconds
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Automation Test justification" into field "Justification__c"
    And I enter value "Automation test description" into field "Reason__c"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Checked" into field "Aggreement__c"
    And I navigate to "Checklist" sub tab
    Then I softly see "Reserve Grant" page block displayed
    And I enter "Edition_ReserveGrant_KSDE" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Acknowledge" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Completed"

  #CloseoutRequestSanity->ScheduledCR_PM->"Reserve Grant" Form
  @CompletedSchedulesCloseout @ProdSan2 @CloseoutRequestSanity @postAwardSanity @Rerun
  Scenario: Validate Complete Scheduled Closeout End to End flow-PM->"Reserve Grant" Form
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Closeout"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "Closeout"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "Reason__c"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Checked" into field "Aggreement__c"
    And I navigate to "Checklist" sub tab
    And I wait for "2" seconds
    #TCID
    Then I softly see "Reserve Grant" page block displayed
    And I enter "Edition_ReserveGrant_KSDE" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Acknowledge" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Completed"

  #NewScenario #CloseoutRequestSanity->ScheduledCR_PO->"Secondary Improvement Grant" Form
  @CompletedSchedulesCloseout_PO @ProdSan2 @CloseoutRequestSanity @postAwardSanity
  Scenario: Validate Complete Scheduled Closeout End to End flow-PO->"Secondary Improvement Grant" Form
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "updateUserProgram-{SavedValue:PO Username},{SavedValue:InternalProgram_2}" of type "Competitive"
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Closeout"
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "Closeout"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    When I click on "View" icon for "Scheduled" inside flex table with id "---closeout:-:RequestTabCloseoutRequestTableId---"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Automation Test Reason" into field "Reason__c"
    And I enter value "Automation Test justification" into field "Justification__c"
    When I navigate to "Checklist" sub tab
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Checked" into field "Aggreement__c"
    And I navigate to "Checklist" sub tab
    And I wait for "2" seconds
    Then I softly see "Secondary Improvement Grant" page block displayed
    And I enter "Edition_KSDE" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Acknowledge" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Completed"

  #NewScenario #CloseoutRequestSanity->EarlyCompletionCR_PM #"Secondary Improvement Grant" Form
  @72359_1 @TCID_PM @completeCloseout @ProdSan1 @CloseoutRequestSanity @postAwardSanity
  Scenario: Validate the Closeout is submitted for approval and the status changes to Submitted for Approval
    And I activated standalone subaward "Automation Runtime Award for closeout" with properties "program-{SavedValue:InternalProgram_2}" of type "Competitive"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Automation Test justification" into field "Justification__c"
    And I enter value "Automation test description" into field "Reason__c"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    Then I softly can see top right button "Send To Subrecipient" in page detail
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Checked" into field "Aggreement__c"
    And I navigate to "Checklist" sub tab
    Then I softly see "Secondary Improvement Grant" page block displayed
    And I enter "Edition_KSDE" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Acknowledge" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Submitted for Approval"
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"

  #NewScenario #CloseoutRequestSanity->EarlyCompletionCR_PO #"Reserve Grant" Form
  @72359_2 @KSDE-1066_PO @completeCloseout @ProdSan1 @CloseoutRequestSanity @postAwardSanity @Rerun
  Scenario: Validate the Closeout is submitted for approval and the status changes to Submitted for Approval
    And I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Automation Test justification" into field "Justification__c"
    And I enter value "Automation test description" into field "Reason__c"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    Then I softly can see top right button "Send To Subrecipient" in page detail
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on "Send To Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Checked" into field "Aggreement__c"
    And I navigate to "Checklist" sub tab
    Then I softly see "Reserve Grant" page block displayed
    And I enter "Edition_ReserveGrant_KSDE" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Acknowledge" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I navigate to "Closeout" tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"

  #NewScenario #CloseoutRequestSanity->EarlyCompletionCR_FO #"Reserve Grant" Form
  @72359_3 @KSDE-1066_FO @completeCloseout @ProdSan1 @CloseoutRequestSanity @postAwardSanity @Rerun
  Scenario: Validate the Closeout is submitted for approval and the status changes to Submitted for Approval
    And I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I navigate to "Overview" sub tab
    And I enter value "Automation Test justification" into field "Justification__c"
    And I enter value "Automation test description" into field "Reason__c"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    Then I softly can see top right button "Send To Subrecipient" in page detail
    And I click on "Send To Subrecipient" in the page details
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:subrecpientPendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:subrecpientPendingTaskTableId---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    And I enter value "Checked" into field "Aggreement__c"
    And I navigate to "Checklist" sub tab
    Then I softly see "Reserve Grant" page block displayed
    And I enter "Edition_ReserveGrant_KSDE" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I click on "Acknowledge" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Acknowledged by Subrecipient"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    Then I softly see status in Progress-bar is "Overridden" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    Then I see field "Status" as "Submitted for Approval"
    When I navigate to "Closeout" tab
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Completed"

  #TODO: Getting an error while submitting the review form, it's resolved in product. Need to get solution from Product.
  @72346 @applicationReviewHappyPath @ProdSan2 @ApplicationsSanity @preawardSanity
  Scenario Outline: Validate the complete review process for an application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    And I switch to tab number "1"
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    And I switch to tab number "2"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PO Username} |
      | {SavedValue:FO Username} |
      | {SavedValue:PM Username} |
    When I expand nested table containing column value "<Announcement Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    When I click on "Submit" in the page details
    When I click alert button "OK"
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "1" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I click on "Funding Decision Memo" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Status" as "Created"
    And I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field            |
      | AuGr                        | GrantCode__c     |
      | Automation Test Description | Justification__c |
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I edit the following rows inline in flex table with id "FundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title   | Recommended Budget | Recommend for Funding | Comments    | Total Commitment Amount |
      | <Announcement Name> | 500                | Yes                   | Recommended | 500                     |
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "GrantorReviewStepRolesandResponsibilities" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I get the "EGMS ID"
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |

  @KSDE-1390 @KSDE-1404
  Scenario Outline: Verify Application Saving with optional fields on Proposal tab can be left blank
  |Verify Application Submitting with optional fields on the Proposal tab can be left blank|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Agricultural Technology & Mechanical Systems | $1,000.00  | $1,000.00                    | $0.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Other Leverage |
#      | Special Populations | 1000             | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Reserve Grant Application" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I select below checkbox options for field "KSDE_PathwayPicklist__c"
      | Agricultural Technology & Mechanical Systems          |
      | Animal Science, Health & Related Industries           |
      | Diversified Agricultural Science                      |
      | Food Products & Processing Systems                    |
      | Plant Science & Industry Operations                   |
      | Natural Resources & Environmental Sustainability      |
      | Energy                                                |
      | Business Management & Entrepreneurship                |
      | Business Finance                                      |
      | Marketing                                             |
      | Restaurant & Event Management                         |
      | Travel & Tourism                                      |
      | Teaching/Training                                     |
      | Early Childhood Development & Services                |
      | Government & Public Administration                    |
      | Corrections, Security, Law & Law Enforcement Services |
      | Emergency & Fire Management Services                  |
      | Information Support & Services                        |
      | Media Design & Communications                         |
      | Networking & Telecommunications                       |
      | Programming & Software Development                    |
      | Construction & Design                                 |
      | Manufacturing                                         |
      | Automation Engineering                                |
      | Aviation Production                                   |
      | Engineering & Applied Mathematics                     |
      | Aviation Maintenance & Operations                     |
      | Vehicle Maintenance & Repair                          |
      | Family, Community & Consumer Services                 |
      | Biotechnology                                         |
      | Health Science                                        |
    When I enter "KSDE_ApplicationForm-1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Upload Files" in the page details
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Back" in the page details
    And I refresh the page
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Edit" in the page details
    When I navigate to "Proposal" sub tab
    When I clear the value from field "ApproachMethodology__c"
    When I clear the value from field "Capacity__c"
    When I clear the value from field "Qualifications__c"
    When I click on "Save" in the page details
    #KSDE-1390
    Then I softly cannot see the following messages in the page details contains:
      | To save, Approach/Methodology is required in the Technical Proposal section. |
      | To save, Capacity is required in the Technical Proposal section.             |
      | To save, Qualifications is required in the Technical Proposal section.       |
    When I click on "Submit Application" in the page details
    #KSDE-1404
    Then I softly cannot see the following messages in the page details contains:
      | Proposal Tab - Enter a Approach/Methodology before submitting this Application. |
      | Proposal Tab - Enter a Capacity before submitting this Application.             |
      | Proposal Tab - Enter a Qualifications before submitting this Application.       |
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @KSDE-1391 @KSDE-1392 @KSDE-1396 @KSDE-1395 @Rerun1
  Scenario Outline: Verify Project Abstract Required to Submit fields on Overview tab can be left blank while clicking the save button
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name                                 | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Agricultural Technology & Mechanical Systems | $1,000.00  | $1,000.00                    | $0.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Other Leverage |
#      | Special Populations | 1000             | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Reserve Grant Application" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I select below checkbox options for field "KSDE_PathwayPicklist__c"
      | Agricultural Technology & Mechanical Systems          |
      | Animal Science, Health & Related Industries           |
      | Diversified Agricultural Science                      |
      | Food Products & Processing Systems                    |
      | Plant Science & Industry Operations                   |
      | Natural Resources & Environmental Sustainability      |
      | Energy                                                |
      | Business Management & Entrepreneurship                |
      | Business Finance                                      |
      | Marketing                                             |
      | Restaurant & Event Management                         |
      | Travel & Tourism                                      |
      | Teaching/Training                                     |
      | Early Childhood Development & Services                |
      | Government & Public Administration                    |
      | Corrections, Security, Law & Law Enforcement Services |
      | Emergency & Fire Management Services                  |
      | Information Support & Services                        |
      | Media Design & Communications                         |
      | Networking & Telecommunications                       |
      | Programming & Software Development                    |
      | Construction & Design                                 |
      | Manufacturing                                         |
      | Automation Engineering                                |
      | Aviation Production                                   |
      | Engineering & Applied Mathematics                     |
      | Aviation Maintenance & Operations                     |
      | Vehicle Maintenance & Repair                          |
      | Family, Community & Consumer Services                 |
      | Biotechnology                                         |
      | Health Science                                        |
    When I enter "KSDE_ApplicationForm-1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on "Upload Files" in the page details
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Back" in the page details
    And I refresh the page
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
#      | Name                       | Project Role             | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I clear the value from field "ProjectAbstract__c"
    When I click on "Save" in the page details
    #KSDE-1391
    Then I softly cannot see the following messages in the page details contains:
      | To save, Project Abstract is required in the Project Information section. |
    When I click on "Submit Application" in the page details
    #KSDE-1395
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application. |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "Project Abstract" into field "ProjectAbstract__c"
    #KSDE-1392
    When I navigate to "Budget" sub tab
    When I clear the value from field "Justification__c"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | To save, Justification for Project Cost is required in the Budget Narrative section. |
    When I click on "Submit Application" in the page details
    #KSDE-1396
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Enter a Justification for project cost before submitting this Application. |
    When I click on "Edit" in the page details
    When I navigate to "Budget" sub tab
    And I enter value "Justification for Project Cost" into field "Justification__c"
    When I click on "Save" in the page details
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @KSDE-1393 @KSDE-1394
  Scenario Outline: Verify Project Abstract Required to Submit fields on Overview tab can be left blank while clicking the save button
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    #KSDE-1393
    Then I see the sub-header is "{SavedValue:Automation Runtime Announcement Application}" in the page details
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Proposal" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I see below fields in "Information" page block
      | Applicant Organization | Address | EIN | UEI | SAM Expiration Date |
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "Application Overview" page block displayed
    Then I softly see "Project Information" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Acknowledgement" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Periods" page block displayed
    Then I softly see "Budget Narrative" page block displayed
    When I navigate to "Proposal" sub tab
    Then I softly see "Technical Proposal" page block displayed
    Then I softly see "Goals and Objectives" page block displayed
    Then I softly see "Key Performance Indicators" page block displayed
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "All Forms" page block displayed
    #Remove in new inhancement and replace with Budget Files
#    Then I softly see "Application Files" page block displayed
    Then I softly see "Budget Files" page block displayed
    Then I softly see "Notes" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    #KSDE-1394
    When I navigate to "Proposal" sub tab
    Then I softly see "Technical Proposal" page block displayed
    Then I softly see value "Automation Test Description" for the field "Approach/Methodology"
    Then I softly see value "Automation Test Description" for the field "Capacity"
    Then I softly see value "Automation Test Description" for the field "Qualifications"
    When I navigate to "Overview" sub tab
    Then I softly see "Project Information" page block displayed
    Then I softly see value "Automation Test Description" for the field "Project Abstract"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Narrative" page block displayed
    Then I softly see value "Justified" for the field "Justification for Project Cost"

    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @KSDE-1398 @KSDE-1399 @KSDE-1400 @KSDE-1401 @Rerun1
  Scenario Outline: Hide Application Sections for Secondary Improvement Grant Program (KSDE)
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    #KSDE-1401
    Then I softly cannot see "Proposal" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    #KSDE-1399
    Then I softly do not see "Project Information" page block displayed
    When I navigate to "Budget" sub tab
    #KSDE-1400
    Then I softly do not see "Budget Narrative" page block displayed
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly can see page block "Budget Summary"
    Then I softly see field "Subaward Floor" inside page block
    Then I softly see field "Subaward Ceiling" inside page block
    Then I softly see field "Budgeted Amount" inside page block
    Then I softly see field "Subaward Ceiling" as "$10,000.00"
    Then I softly see field "Subaward Floor" as "$1,000.00"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "appEGMSID"
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
#    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
#      | Category Name       | Requested Budget | Cash Match | Non-Cash Match |
#      | Special Populations | 1000             | 100        | 100            |
#      | Supplies            | 1000             | 100        | 100            |
#    When I navigate to "Overview" sub tab
#    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
#      | Name                       | Is Key Contact |
#      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Form Name" as "Perkins Secondary Improvement Grant"
    Then I softly see "School District Information" page block displayed
    Then I softly see "Local Plan" page block displayed
    Then I softly see "Student Performance Data (State Goals)" page block displayed
    Then I softly see "Student Performance Data (Actuals)" page block displayed
    Then I softly see "Student Performance Action Plan" page block displayed
    Then I softly see "Application Files" page block displayed
    Then I softly see "Time and Effort Certification" page block displayed
    Then I softly see "Certification" page block displayed
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | LEA Overall Score | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                      | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Individuals with Disabilities | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                   | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Economically Disadvantaged | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category       | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Single Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category         | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | English Learners | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                  | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Non-Traditional Enrollees | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Migrant Worker Parents | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category                    | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Homeless (includes Migrant) | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category               | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Active Military Parent | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | Foster Care Youth | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    Then I see the following rows under the following headers in table with id "StudentPerformanceData" :
      | Category                      | 1S1 Graduation | 1S1 Graduation Gap Or Exceed | 2S1 Reading Language Arts | 2S1 Reading Language Arts Gap Or Exceed | 2S2 Math | 2S2 Math Gap Or Exceed | 2S3 Science | 2S3 Science Gap Or Exceed | 3S1 Placement | 3S1 Placement Gap Or Exceed | 4S1 Nontraditional | 4S1 Nontraditional Gap Or Exceed | 5S2 Postsecondary Credits | 5S2 Postsecondary Credits Gap Or Exceed |
      | LEA Overall Score             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Individuals with Disabilities | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Economically Disadvantaged    | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Single Parents                | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | English Learners              | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Non-Traditional Enrollees     | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Migrant Worker Parents        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Homeless (includes Migrant)   | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Active Military Parent        | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
      | Foster Care Youth             | 80.00%         | -20%                         | 20.00%                    | -80%                                    | 40.00%   | -60%                   | 73.00%      | -27%                      | 56.00%        | -44%                        | 99.00%             | -1%                              | 110.00%                   | Exceed                                  |
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan     |
      | 2S2 Math  | -60%           | English Learners | Policies/Processes | Scheduling barriers | Automation Test |
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Back" in the page details
    And I switch to parent tab
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    #KSDE-1398
    Then I softly cannot see the following messages in the page details :
      | Overview Tab - Provide the Project Abstract before submitting this Application.         |
      | Budget Tab - Enter a Justification for project cost before submitting this Application. |
      | Proposal Tab - Provide Target Values for all Key Performance Indicators.                |
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Intake} |

  @KSDE-1409 @KSDE-1410 @Rerun1
  Scenario Outline: Verify existing functionality on other tabs remains unaffected
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "Address line 1" as "Vintage Plaza"
    When I click on "Edit" in the page details
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Address line 1" as "Sterling"
    Then I softly see "Information" page block displayed
    Then I see below fields in "Information" page block
      | Applicant Organization | Address | EIN | UEI | SAM Expiration Date |
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "Application Overview" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Acknowledgement" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Periods" page block displayed
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "All Forms" page block displayed
    #this step remove in new enhancemnet
#    Then I softly see "Application Files" page block displayed
    Then I softly see "Notes" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I navigate to "Overview" sub tab
    Then I softly see field "Acknowledgement" as "checked"
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see field "Address Line 1" as "Sterling"
    Then I softly see asterisk mark on "Address line 1"
    Then I softly see field "City" as "Sterling"
    Then I softly see asterisk mark on "City"
    Then I softly see field "County" as "Prince George"
    Then I softly see field "State" as "AL"
    Then I softly see asterisk mark on "State"
    Then I softly see field "Zip Code" as "20171"
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field "Country" as "USA"
    Then I softly see asterisk mark on "Country"
    Then I softly see "Application Overview" page block displayed
    Then I softly see field "Application Title" as "<Application Name>"
    Then I softly see asterisk mark on "Application Title"
    When I click on "Edit" in the page details
    And I clear the value from field "Title__c"
    And I clear the value from field "Addressline1__c"
    And I clear the value from field "City__c"
    And I clear the value from field "County__c"
    And I enter value "--None--" into field "State__c"
    And I clear the value from field "CongressionalDistrict1__c"
    And I clear the value from field "Zip4__c"
    And I clear the value from field "Country__c"
    And I clear the value from field "ZipCode4Extension__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Address line 1 is required in the Overview tab under the Primary Place of Performance section. |
      | To save, City is required in the Overview tab under the Primary Place of Performance section.           |
      | To save, State is required in the Overview tab under the Primary Place of Performance section.          |
      | To save, Zip Code is required in the Overview tab under the Primary Place of Performance section.       |
      | To save, Country is required in the Overview tab under the Primary Place of Performance section.        |
      | To save, Application Title is required in the Overview tab under the Application Overview section.      |

    Examples:
      | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Intake} |

  @KSDE-1468 @KSDE-1469 @KSDE-1470 @KSDE-1471 @KSDE-1475 @KSDE-1476 @KSDE-1477 @KSDE-1474 @Rerun1
  Scenario Outline:Enable Add/Edit/Delete for Student Performance Action Plan during Negotiation Initiated Status
    # data we enter manually API NOT found
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "program-{SavedValue:InternalProgram_2}"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Application Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    Then I softly can see row level action button "View" against "<Application Name>" in flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "View" icon for "<Application Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Application Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Negotiation Initiated"
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "Grants Portal" app as "<userType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Applications" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:applicationsflexTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---negotiation:-:applicationsflexTableId---"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    #KSDE-1471
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan     |
      | 2S2 Math  | N/A            | English Learners | Policies/Processes | Scheduling barriers | Automation Test |
    When I click on "Delete" icon for "2S2 Math" inside flex table with id "StudentPerformanceActionPlan"
    #KSDE-1476
#    Then I softly see confirmation box with body "Do you want to delete? Once it is deleted it cannot be restored." is displayed
#    And I click "OK" on modal confirmation box
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    #KSDE-1468
    Then I softly do not see value "2S2 Math" for title "Indicator" inside table "StudentPerformanceActionPlan"
    #KSDE-1469
    Then I softly see top right button "Add" inside flex table "StudentPerformanceActionPlan"
    #KSDE-1477
    Then I softly do not see top right button "Edit" inside flex table "StudentPerformanceActionPlan"
    #KSDE-1470
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Implement targeted intervention strategies for underperforming students" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan                                                             |
      | 2S2 Math  | N/A            | English Learners | Policies/Processes | Scheduling barriers | Implement targeted intervention strategies for underperforming students |
    #KSDE-1474
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "StudentPerformanceActionPlan" by clicking "Edit" :
      | Indicator | Indicator                 | Category          | Action Plan                                                               |
      | 2S2 Math  | 2S1 Reading Language Arts | LEA Overall Score | Implement targeted intervention strategies for underperforming students 1 |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    #KSDE-1475
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "StudentPerformanceActionPlan" by clicking "Edit" :
      | Indicator                 | Indicator |
      | 2S1 Reading Language Arts | --None--  |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |

    Examples:
      | userType | Application Name                                 |
      | SPI3     | {SavedValue:Automation Runtime FDM Announcement} |

  @KSDE-1472 @Rerun1
  Scenario Outline:Verify that the KSDE Grantor user can not see all the buttons, such as Add, Edit, and Delete, when the Student Performance Action Plan is in the Negotiation Initiated state
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "program-{SavedValue:InternalProgram_2}"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "<Application Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    Then I softly can see row level action button "View" against "<Application Name>" in flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I click on "View" icon for "<Application Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "<Application Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    Then I see field "Status" as "Negotiation Initiated"
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "Grants Portal" app as "<userType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Negotiations" content inside "Applications" subheader on left panel
    And I perform quick search for "Record Id" in "---negotiation:-:applicationsflexTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---negotiation:-:applicationsflexTableId---"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    When I click on "Back" in the page details
    And I close the tab
    And I switch to parent tab
    Given I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:negotiationAppReviewListTableId---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:negotiationAppReviewListTableId---"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly do not see top right button "Add" inside flex table "StudentPerformanceActionPlan"
    Then I softly cannot see row level action button "Delete" against "2S2 Math" in flex table with id "StudentPerformanceActionPlan"
    Then I softly cannot see row level action button "Edit" against "2S2 Math" in flex table with id "StudentPerformanceActionPlan"
    Then I softly can see row level action button "No Actions Available" against "2S2 Math" in flex table with id "StudentPerformanceActionPlan"

    Examples:
      | userType | Application Name                                 |
      | SPI3     | {SavedValue:Automation Runtime FDM Announcement} |
