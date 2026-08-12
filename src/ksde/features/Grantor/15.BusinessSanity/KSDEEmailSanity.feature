@KSDEEmailSanity @Regression @SecondaryProgram
Feature: email regression

  @UserEmail
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
    #HALT FOR CAPTCHA
    When I click on "Submit" in the page details
    #HERE CONFIRMTION MESSAGE SHOW
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

  @ProgramEmails @INT_PROG_1 @INT_PROG_2 @INT_PROG_3 @INT_PROG_11 @activateTaskEmail @ApproverTask
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
    And I save the field labeled "EGMS ID" as "ProgramID"
    And I save the field labeled "Program Name" as "ProgramName"
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
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description            | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "ProgramID"
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "7" seconds
    #INT_PROG_1 Notify Peer Reviewer
    And I checkout to yopmail with mailid "{SavedValue:FO_EmailID}"
    And I pause execution for "240" seconds
    And I click on mail with subject "Sandbox: Review Program {SavedValue:ProgramID}"
    And I see the mail subject is as follows :
      """
      Sandbox: Review Program {SavedValue:ProgramID}
      """
    And I pause execution for "20" seconds
    And I click on mail with subject "Sandbox: Notification: Program {SavedValue:ProgramID} awaiting Peer Review"
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Program {SavedValue:ProgramID} awaiting Peer Review
      """
    Then I see the mail text is as follows :
      """
      Hello {SavedValue:FO Username},
      This email is to notify you that Program {SavedValue:ProgramID} has been assigned to you for a peer review.

      Program Details:
        Program ID: {SavedValue:ProgramID}
        Program Name: {SavedValue:programName}

      Log in to EGMS and click here to start reviewing the details.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education
      """
    And I am on "INTERNAL" portal
    And I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "3" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I wait for "3" seconds
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    #INT_PROG_2 Notify Peer Review Completion
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "20" seconds
    And I click on mail with subject "Sandbox: Notification: Program {SavedValue:ProgramID} has been Peer Reviewed"
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Program {SavedValue:ProgramID} has been Peer Reviewed
      """
    Then I see the mail text is as follows :
      """

      Hello Sarah,

      This email is to notify you that Program {SavedValue:ProgramID} has been peer reviewed.

      Program Details:
         Program ID: {SavedValue:ProgramID}
         Program Name: {SavedValue:ProgramName}

      Log in to EGMS and click here to start reviewing the details.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education

      """
    And I am on "INTERNAL" portal
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
     #INT_PROG_3 Notify Approver
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "100" seconds
    And I click on mail with subject "Sandbox: Notification: Request to Approve {SavedValue:ProgramID}"
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Request to Approve {SavedValue:ProgramID}
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that Program #{SavedValue:ProgramID} has been created and is waiting for your approval.

      Program Details:
      Program ID: {SavedValue:ProgramID}
      Program Name: {SavedValue:ProgramName}

      Log in to EGMS and click here to start reviewing the Program.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education

      """
    And I am on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:FO_EmailID}"
    And I pause execution for "20" seconds
    And I click on mail with subject "Sandbox: Notification: Request to Approve {SavedValue:ProgramID}"
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Request to Approve {SavedValue:ProgramID}
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that Program #{SavedValue:ProgramID} has been created and is waiting for your approval.

      Program Details:
      Program ID: {SavedValue:ProgramID}
      Program Name: {SavedValue:ProgramName}

      Log in to EGMS and click here to start reviewing the Program.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education

      """
    #ApproverTask
    And I checkout to yopmail with mailid "{SavedValue:FO_EmailID}"
    And I pause execution for "240" seconds
    And I click on mail with subject "Sandbox: Approve Program {SavedValue:ProgramID}"
    And I see the mail subject is as follows :
      """
        Sandbox: Approve Program {SavedValue:ProgramID}
      """
    And I am on "INTERNAL" portal
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    #INT_PROG_11 Approver Approved
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "180" seconds
    And I click on mail with subject "Sandbox: Notification: Program #{SavedValue:ProgramID} has been Approved"
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Program #{SavedValue:ProgramID} has been Approved
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that Program #{SavedValue:ProgramID} has been reviewed and approved.

      Log in to EGMS and click here to activate the program.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education
      """
    #activateTaskEmail
    And I pause execution for "180" seconds
    And I click on mail with subject "Sandbox: Activate Internal Program {SavedValue:ProgramID}"
    And I see the mail subject is as follows :
      """
        Sandbox: Activate Internal Program {SavedValue:ProgramID}
      """
    And I am on "INTERNAL" portal
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---"
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"

  @programRejectionEmail
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
    And I save the field labeled "EGMS ID" as "ProgramID"
    And I save the field labeled "Program Name" as "ProgramName"
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
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "180" seconds
    And I click on mail with subject "Sandbox: Notification: Program #{SavedValue:ProgramID} has been Rejected"
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Program #{SavedValue:ProgramID} has been Rejected
      """
    Then I see the mail text is as follows :
      """
        Hello,

        This email is to notify you that Program #{SavedValue:ProgramID} has been rejected.

        Log in to EGMS and click here to see details.

        Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

        Thanks,
        Kansas State Department of Education
      """

  @programSendbackEmail
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
    And I save the field labeled "EGMS ID" as "ProgramID"
    And I save the field labeled "Program Name" as "ProgramName"
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
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    And I "Send back" in the approval decision
    And I softly see the following messages in the page details contains:
      | Successfully sent to Owner. It may take few minutes to process record. |
    #INT_PROG_4 Approver Sent Back
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "180" seconds
    And I click on mail with subject "Sandbox: Notification: Program #{SavedValue:ProgramID} has been sent back"
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Program #{SavedValue:ProgramID} has been sent back
      """
    Then I see the mail text is as follows :
      """
        Hello,
        This email is to notify you that Program # {SavedValue:ProgramID} has been sent back for revision.
        Program Details:
          Program ID: {SavedValue:ProgramID}
          Program Name: {SavedValue:ProgramName}
        Log in to EGMS and click here to resubmit the Program after making the required changes.
        Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

        Thanks,
        Kansas State Department of Education
      """

  @programUndoEmail @draft
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
    And I save the field labeled "EGMS ID" as "ProgramID"
    And I save the field labeled "Program Name" as "ProgramName"
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
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I click on "Undo" in the page details
    #INT_PROG_13 Program Undo Notify
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "180" seconds
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onProgram #{SavedValue:ProgramID}."
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Approver has initiated Undo Action onProgram #{SavedValue:ProgramID}.
      """
    Then I see the mail text is as follows :
      """
        Hello,
        This email is to notify you that program approver #Emaily PO has initiated undo action for program approval.
        Program Details:
        Program ID: {SavedValue:ProgramID}
        Program Name: {SavedValue:ProgramName}
        Log in to EGMS and click here to start reviewing the details.
        Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

        Thanks,
        Kansas State Department of Education
      """
    And I checkout to yopmail with mailid "{SavedValue:PO_EmailID}"
    And I click on mail with subject "Sandbox: Notification: Approver has initiated Undo Action onProgram #{SavedValue:ProgramID}."
    And I see the mail subject is as follows :
      """
        Sandbox: Notification: Approver has initiated Undo Action onProgram #{SavedValue:ProgramID}.
      """
    Then I see the mail text is as follows :
      """
        Hello,
        This email is to notify you that program approver #Emaily PO has initiated undo action for program approval.
        Program Details:
        Program ID: {SavedValue:ProgramID}
        Program Name: {SavedValue:ProgramName}
        Log in to EGMS and click here to start reviewing the details.
        Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

        Thanks,
        Kansas State Department of Education
      """


  @AN_1 @AN_2 @AN_3 @AN_8 @AN_9 @draft
  Scenario: Announcement Emails
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Eligible Applicant Types" as "School District"
    Then I softly see that "EligibleApplicantTypes__c" rendered in view mode only
    When I navigate to "Financials" sub tab
    Then I softly see value "Only First Budget Period" for the edit mode field "BudgetingPeriod__c"
    And I enter "Edition_KSDE" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "AnnName"
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I select value inside table "---announcement:-:announcementBudgetCategory---" is "All"
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
    #AN_1 Announcement Notify Peer Reviewers
    And I checkout to yopmail with mailid "{SavedValue:FO_EmailID}"
    And I pause execution for "100" seconds
    And I click on mail with subject "Sandbox: Notification: Announcement {SavedValue:AnnEGMSID} Awaiting PeerReview"
    And I see the mail subject is as follows :
    """
     Sandbox: Notification: Announcement {SavedValue:AnnEGMSID} Awaiting PeerReview
    """
    Then I see the mail text is as follows :
    """
      Hello Automation FM,

      This email is to notify you that Announcement {SavedValue:AnnEGMSID} has been assigned to you for peer review.

      Announcement Details:
      Announcement Title: {SavedValue:AnnName}
      Announcement Type:  Directed
      Associated Program Name:Basic Rapid Response

      Log in to EGMS and click here to start reviewing the details.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education
    """
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
    #AN_2 Announcement Notify Peer Review Completion
    And I checkout to yopmail with mailid "{SavedValue:FO_EmailID}"
    And I pause execution for "50" seconds
    And I click on mail with subject "Sandbox: Notification: Announcement {SavedValue:AnnEGMSID} has been PeerReviewed"
    And I see the mail subject is as follows :
    """
     Sandbox: Notification: Announcement {SavedValue:AnnEGMSID} has been PeerReviewed
    """
    Then I see the mail text is as follows :
    """
      Hello Automation,

      This email is to notify you that Announcement {SavedValue:AnnEGMSID} has been peer reviewed.

      Announcement Details:
         Announcement Title: {SavedValue:AnnName}
         Announcement Type: Directed
         Associated Program Name: Basic Rapid Response

      Log in to EGMS and click here to start reviewing the details.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education
    """
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    #AN_3 Announcement Approval Notify
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "50" seconds
    And I click on mail with subject "Sandbox: Notification: Announcement # {SavedValue:AnnEGMSID} had been Createdand is Waiting for Your Approval"
    And I see the mail subject is as follows :
    """
     Sandbox: Notification: Announcement # {SavedValue:AnnEGMSID} had been Createdand is Waiting for Your Approval
    """
    Then I see the mail text is as follows :
    """
      Hello,

      This email is to notify you that you are requested to review Announcement # {SavedValue:AnnEGMSID}, which has been created for Program Basic Rapid Response.

      Announcement Details:

      Announcement Title: {SavedValue:AnnName}
      Associated Program Name: Basic Rapid Response

      Log in to EGMS and click here to start reviewing the Announcement details.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education
    """
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:FO_EmailID}"
    And I pause execution for "50" seconds
    And I click on mail with subject "Sandbox: Notification: Announcement # {SavedValue:AnnEGMSID} had been Createdand is Waiting for Your Approval"
    And I see the mail subject is as follows :
    """
     Sandbox: Notification: Announcement # {SavedValue:AnnEGMSID} had been Createdand is Waiting for Your Approval
    """
    Then I see the mail text is as follows :
    """
      Hello,

      This email is to notify you that you are requested to review Announcement # {SavedValue:AnnEGMSID}, which has been created for Program Basic Rapid Response.

      Announcement Details:

      Announcement Title: {SavedValue:AnnName}
      Associated Program Name: Basic Rapid Response

      Log in to EGMS and click here to start reviewing the Announcement details.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education
    """
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:PO_EmailID}"
    And I pause execution for "50" seconds
    And I click on mail with subject "Sandbox: Notification: Announcement # {SavedValue:AnnEGMSID} had been Createdand is Waiting for Your Approval"
    And I see the mail subject is as follows :
    """
     Sandbox: Notification: Announcement # {SavedValue:AnnEGMSID} had been Createdand is Waiting for Your Approval
    """
    Then I see the mail text is as follows :
    """
      Hello,

      This email is to notify you that you are requested to review Announcement # {SavedValue:AnnEGMSID}, which has been created for Program Basic Rapid Response.

      Announcement Details:

      Announcement Title: {SavedValue:AnnName}
      Associated Program Name: Basic Rapid Response

      Log in to EGMS and click here to start reviewing the Announcement details.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Thanks,
      Kansas State Department of Education
    """
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---"
    And I "Approve" in the approval decision
 #AN_8 Announcement Approved Email Template
    And I checkout to yopmail with mailid "{SavedValue:PM_EmailID}"
    And I pause execution for "50" seconds
    And I click on mail with subject "Sandbox: Notification: Announcement {SavedValue:AnnEGMSID} has been Approved"
    And I see the mail subject is as follows :
    """
     Sandbox: Notification: Announcement {SavedValue:AnnEGMSID} has been Approved
    """
    Then I see the mail text is as follows :
    """
      Hello,

      This email is to notify you that, the Announcement # {SavedValue:AnnEGMSID} has been approved.

      Log in to EGMS and click here to publish the announcement.

      Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

      Sincerely,
      Kansas State Department of Education
    """
    And I am on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    Then I softly see field "Status" as "Published"
    #AN_9 Announcement Published
    And I checkout to yopmail with mailid "{SavedValue:SPI EmailID}"
    And I pause execution for "50" seconds
    And I click on mail with subject "Sandbox: Notification: New Opportunity #{SavedValue:AnnEGMSID} has beenPublished"
    And I see the mail subject is as follows :
    """
     Sandbox: Notification: New Opportunity #{SavedValue:AnnEGMSID} has beenPublished

    """
    Then I see the mail text is as follows :
    """
      Hello,

      This email is to notify you that Opportunity # {SavedValue:AnnEGMSID} has been published.

      Opportunity Details:

         Opportunity Title: {SavedValue:AnnName}

         Opportunity Type: Directed

         Associated Program Name:

        Log in to EGMS and click here to review the details and submit an application.

        Please do not reply to this email. You may contact the Helpdesk at perkins@ksde.gov for assistance.

        Thanks,
        Kansas State Department of Education
    """

    #Application Review
  @AllBudgetCategories @HammerIcon @AddDueDates @SubmitToGrantor
  Scenario:AllBudgetCategories
  |Submit to grantor button|
  |add budegt in all categories|
  |Initiate review Process and Application -> reviewa -> Not yet Started-> Hammer Icon|
  |Add due dates|
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
      | Description                | Name of Entity Contracting With (Must follow local procurement policies) | Brief Summary of the Project to be Completed | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Total Cost | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                                               | {default:StringOf255Chars}                   | 10.00    | $100.00   | Evaluation of Student Performance | 100        | 100            | 100            | 100        | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name of Entity Contracting With (Must follow local procurement policies) | Brief Summary of the Project to be Completed | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                                               | {default:StringOf255Chars}                   | 10.00    | $100.00   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Contracted Services | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE-436 #Salaries-8 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Salaries" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Salary Position            | Provide link or email position description to KSDE | New position? | Quantity | Cost/Unit | CLNA                              | Please indicate how many years the salary position has been paid by Perkins | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                         | Yes           | 10.00    | $100.00   | Evaluation of Student Performance | 2                                                                           | 100        | 100            | 100            | 1000.23                      |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Salary Position            | Provide link or email position description to KSDE | New position? | Quantity | Cost/Unit | CLNA                              | Please indicate how many years the salary position has been paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}                         | Yes           | 10.00    | $100.00   | Evaluation of Student Performance | 2                                                                           | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.23                    | $1,300.23          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Salaries      | $1,000.23        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.23          |
    #Categories: 9 to 17
    #KSDE- #Honorarium or Stipend-9 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Honorarium or Stipend" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Stipend staff names or classification | Brief Summary of the Project to be Completed | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars}            | {default:StringOf255Chars}                   | 10.00    | $100.00   | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Stipend staff names or classification | Brief Summary of the Project to be Completed | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars}            | {default:StringOf255Chars}                   | 10.00    | $100.00   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name         | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Honorarium or Stipend | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Travel Expenses-10 #KSDE-1158
    When I click on "Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Title/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Title/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}           | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name   | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Travel Expenses | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Advisory Committee-11 #KSDE-1158
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Advisory Committee" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name      | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Advisory Committee | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #CTSO Advisor Expenses-12 #KSDE-1158
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "CTSO Advisor Expenses" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
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
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Name/Classification of Participants | Brief Summary of the Activity (including CTSO Name when applicable) | Quantity | Cost/Unit | CLNA                              | Cash Match | Non-Cash Match | Total Match | Other Leverage | Amount to be paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars}          | {default:StringOf255Chars}                                          | 10.00    | $100.00   | Evaluation of Student Performance | $100.00    | $100.00        | $200.00     | $100.00        | $100.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Externships   | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Institutional Memberships-15 #KSDE-1157
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Institutional Memberships" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | Quantity | Cost/Unit | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | {default:StringOf255Chars} | 10       | 10        | {default:StringOf255Chars} | 10.00    | $100.00   | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | 100                          |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description                | Quantity | Cost/Unit | Online Link to Item        | Quantity | Cost/Unit | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | {default:StringOf255Chars} | 10.00    | $10.00    | {default:StringOf255Chars} | 10.00    | $100.00   | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $100.00    | $100.00                      | $0.00                      | $400.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name             | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Institutional Memberships | $100.00          | $100.00    | $100.00        | $200.00     | $100.00        | $400.00            |
    #KSDE- #Administrative Costs-17 #KSDE-1158
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Administrative Costs" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title                      | Description                | Quantity | Cost/Unit | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Other Leverage |
      | {default:StringOf255Chars} | {default:StringOf255Chars} | 10.00    | $100.00   | 200                          | 100        | 100            | 100            |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Title                      | Description                | Quantity | Cost/Unit | Amount to be paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | {default:StringOf255Chars} | {default:StringOf255Chars} | 10.00    | $100.00   | $200.00                      | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
    When I close "Application Budget Categories" modal by clicking the top right x button
    And I select value inside table "---applicationReview:-:childBudgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name        | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Administrative Costs | $200.00          | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
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
      | Administrative Costs       | $200.00          | $100.00    | $100.00        | $200.00     | $100.00        | $500.00            |
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:announcementListTableId---" panel
    And I wait for "5" seconds
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    Then I see status in Progress-bar is "Published" and is "dark blue"


  @PreScreenReviewform @ReviewCompletion @ManangemnetReview @SubmitSMEReview
  Scenario Outline: Validate the complete review process for an application
  |Peer Review /manangemnet review|
  |Pre Screen review form|
  |Review Completion|
  |Submit form for review to Internal user and SME user|
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
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    Then I see that "Status" is in "Review Completed" status
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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

  @prescreen @ListFilter @ALLTabs
  Scenario Outline:Verify that User will get validation if User sending Application for Pre Screen Review to reviewer without setting due in days.
  |List View Filter  Of Application Review|
  |View of all tabs of Applications|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    When I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Application Reviews - Under Review"
    Then I softly see "Application Reviews - Under Review" page block displayed
    Then I see the following ordered headers in table with id "---applicationReview:-:announcementListTableId---" :
      | Actions | EGMS ID | Announcement Title | Application Due Date | # Applications Received | # Applications Review Completed | # Applications Rejected | # Applications Pending Review | Review Status |
    And I click toggle button to select "Application Reviews - Not Started"
    Then I softly see "Application Reviews - Not Started" page block displayed
    Then I see the following ordered headers in table with id "---applicationReview:-:announcementListTableId---" :
      | Actions | EGMS ID | Announcement Title | Application Due Date | # Applications Received | # Applications Review Completed | # Applications Rejected | # Applications Pending Review | Review Status |
    And I click toggle button to select "Application Reviews - Completed"
    Then I softly see "Application Reviews - Completed" page block displayed
    Then I see the following ordered headers in table with id "---applicationReview:-:announcementListTableId---" :
      | Actions | EGMS ID | Announcement Title | Application Due Date | # Applications Received | # Applications Review Completed | # Applications Rejected | # Applications Pending Review | Review Status |
    And I click toggle button to select "Application Reviews - All"
    Then I softly see "Application Reviews - All" page block displayed
    Then I see the following ordered headers in table with id "---applicationReview:-:announcementListTableId---" :
      | Actions | EGMS ID | Announcement Title | Application Due Date | # Applications Received | # Applications Review Completed | # Applications Rejected | # Applications Pending Review | Review Status |
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I wait for "5" seconds
    Then I softly can see "Overview" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I see below fields in "Information" page block
      | Applicant Organization | Address | EIN | UEI | SAM Expiration Date |
    Then I softly see "Primary Place of Performance" page block displayed
    Then I see below fields in "Primary Place of Performance" page block
      | Address line 1 | Address line 2 | City | County | State | Congressional district | Zip Code | Country | 4-Digit Zip Code Extension |
    Then I softly see "Announcement Overview" page block displayed
    Then I see below fields in "Announcement Overview" page block
      | Announcement ID | Announcement Title | Announcement Type | Budget Category Package | Application Due Date | Project Period Start Date | Project Period End Date | Subrecipient Match Required? | Program Income Allowed? | Required Match % |
    Then I softly see "Application Overview" page block displayed
    Then I see below fields in "Application Overview" page block
      | Application Title | Budgeted Amount | Estimated Program Income For Project Period |
    Then I softly see "Acknowledgement" page block displayed
    Then I see below fields in "Acknowledgement" page block
      | Acknowledgement | Submitted By | Submitted On |
    Then I softly see "System Information" page block displayed
    Then I see below fields in "System Information" page block
      | Created By | Created Date | Last Modified By | Last Modified Date |
    Then I softly can see "Budget" sub tab at view detail page
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I see below fields in "Budget Summary" page block
      | Subaward Floor | Subaward Ceiling | Budgeted Amount |
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see "Budget Periods" page block displayed
    Then I softly see "Budget Narrative" page block displayed
    And I navigate to "Forms and Files" sub tab
    Then I softly see "All Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Budget Files" page block displayed
    Then I softly see "Notes" page block displayed
    And I navigate to "Proposal" sub tab
    Then I softly see "Technical Proposal" page block displayed
    Then I softly see "Goals and Objectives" page block displayed
    Then I softly see "Key Performance Indicators" page block displayed
    And I save the field labeled "EGMS ID" as "AppID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I switch to tab number "1"
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
    #462320`
    Then I softly see the following messages in the page details contains:
      | You must enter a value for the due in days field for all applicable panels before initiating corresponding reviews. |
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
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
    When I click on "Save" in the page details
    When I click on "Decline" in the page details without processing
    Then I softly see confirmation box with body "This review form will no longer be editable and will get marked as Review Declined. Are you sure you want to Decline?" is displayed
    When I click alert button "OK"
    And I wait for "5" seconds
   #462352
    Then I softly see that "Status" is in "Review Declined" status

    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |