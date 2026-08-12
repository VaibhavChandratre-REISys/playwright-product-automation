@programExecutionNysed @planningNysed @planning @planningRemainingExe
Feature: Validate all scenarios for program

  @490449 @490452  @Sprint-00 @US-487291 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see only Edit button at the Program page layout and other record flow action buttons at page level action dropdown.: Program Created status
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #@490449
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approval> | Step 1  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #@490452
    Then I can see top right button "Undo" in page detail
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Download as PDF" in page detail
    Then I can see top right button "Take Snapshot" in page detail

    Examples:
      | UserType | Approval      |
      | PM       | Automation PM |


  @496476 @496479 @496487 @Sprint-03 @US-494834 @M04 @M04Planning
    @NYSED-5996 @NYSED-Sprint-30 @US-NYSED-5970 @M04
    @NYSED-6001 @NYSED-Sprint-30 @US-NYSED-5970 @M04
  Scenario Outline: Validate ownership is transferred for a Program in Submitted for Review state Validate all the visibility of all the buttons of the program is available to the new owner
  |Verify that the Program Owner can sees the 'Edit' inline action is visible to owner when the program status is 'Being Amended' on Internal Program list filter.|
  |Verify that the Program Owner can see the validation message for the field ‘Office Phone’ is updated on the Internal Program layout → Overview tab → Contacts section → Create Contact modal.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #@496476
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "Fund_Code__c" is in edit mode
    And I enter value "1234" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1234"
    When I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---program:-:contactTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Runtime" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Program Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "MobilePhone"
    And I enter value "704777786" into field "Phone"
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Please enter valid Office Phone Number. |
    And I enter value "(704) 777-7866" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "(704) 777-7866" for title "Business Phone" against the value "{SavedValue:uniqueEmailID}" inside table "---program:-:contactTableId---"
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    #@496479
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    #@496476
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I pause execution for "2" seconds
    Then I softly see fields "Fund_Code__c" is in edit mode
    And I enter value "1234" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1234"
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    #@496479
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Reviewed"
    #@496476
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I pause execution for "2" seconds
    Then I softly see fields "Fund_Code__c" is in edit mode
    And I enter value "1234" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1234"
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    #@496479
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #496487
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    #496487
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    #496487
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    #@496476
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "Fund_Code__c" is in edit mode
    And I enter value "1234" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see field "Fund Code" as "1234"
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    #NYSED-5996
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "Edit" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I enter value "OCE" into field "NYSEDDeputy_Area__c"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "OCE"
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    #@496479
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable

    Examples:
      | UserType | Approver                 | Non-Owner |
      | PM       | {SavedValue:PM Username} | ADMIN     |
#      | PO       | {SavedValue:PO Username}  | EXE       |

  @496480 @Sprint-03 @US-494834 @M04 @M04Planning @bug_ID_526532 @sanitysuite
  Scenario Outline:Verify that fund code field on Internal program is a required text field which allows only 4 digits without decimal.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I clear the value from field "Fund_Code__c"
    Then I softly see fields "Fund_Code__c" is in edit mode
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Fund Code is required in the Overview tab under the Information section. |
    And I enter value "asd" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "11.00" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "-120" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "123" into field "Fund_Code__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "1234" into field "Fund_Code__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | FO      | {SavedValue:FO Username}   |
#      | FD    | {SavedValue:FD Username} |
#      | PO       | {SavedValue:PO Username}  |

  @496484 @Sprint-03 @US-494834 @M04 @M04Planning
  Scenario Outline: Verify that Fund Code field on Internal program is editable to Peer reviewer if program is in 'Submitted for Review' and edit is set to 'Yes'.
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | <Reviever>    | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "<Reviever>" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I navigate to "Overview" sub tab
    Then I can see top right button "Edit" in page detail
    Then I softly see fields "Fund_Code__c" is in edit mode

    Examples:
      | UserType | Reviever                  |
      | PM       | {SavedValue:EXE Username} |
#      | PO      | {SavedValue:EXE Username} |
#      | FO       | {SavedValue:EXE Username}  |
#      | FD       | {SavedValue:EXE Username} |

  @496485 @Sprint-03 @US-494834 @M04 @M04Planning
  Scenario Outline: Verify that Fund Code field on Internal program is not editable to Peer reviewer if program is in 'Submitted for Review' and edit is set to 'No'.
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | <Reviewer>    | Fiscal Reviewer | Automation Test Description | 10       | No                   |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "<Reviewer>" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable

    Examples:
      | UserType | Reviewer                  |
      | PM       | {SavedValue:EXE Username} |
#      | PO      | {SavedValue:EXE Username} |
#      | FO       | {SavedValue:EXE Username}  |
#      | FD       | {SavedValue:EXE Username} |

  @496486 @Sprint-03 @US-494834 @M04 @M04Planning @sanitysuite
  Scenario Outline:Verify that Fund code is not unique and can be duplicate.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "9999" into field "Fund_Code__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "Fund Code" as "FundCode"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "{SavedValue:FundCode}" into field "Fund_Code__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Fund Code" as "{SavedValue:FundCode}"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | EXE      | {SavedValue:EXE Username}   |
#      | ADMIN    | {SavedValue:ADMIN Username} |

  @496487-RJ @Sprint-03 @US-494834 @M04 @M04Planning
    @NYSED-6538 @Sprint-30 @US-NYSED-6262 @M04
  Scenario Outline: Verify that Fund code field on Internal program is not editable for program owner when status is Submitted for Approval, Approved, Rejected and Active
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter unique value in field with apiName "Fund_Code__c"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    Then I navigate to "Overview" sub tab
    When I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #NYSED-6538
    When I "Reject" in the approval decision without confirmation
    And I wait for "2" seconds
    Then I softly see confirmation box with body "Are you sure you want to reject this request? Once rejected, it cannot be reactivated or edited." is displayed
    And I click "Continue" on modal confirmation box
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    Then I softly see that "Status" is in "Rejected" status
    #496487
    Then I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Fund Code" is not editable

    Examples:
      | UserType | Approver                 |
      | PM       | {SavedValue:PM Username} |
#      | EXE      | {SavedValue:EXE Username}   |
#      | ADMIN    | {SavedValue:ADMIN Username} |

  @501249 @NYSED-2015 @NYSED-2013 @Sprint-05 @US-500364 @NYSEDSprint-23 @US-NYSED-1797 @M04 @M04Planning
    @NYSED-6569 @Sprint-30 @US-NYSED-6262 @M04
  Scenario Outline: Verify that Fund Code field is added at Internal Program list view, next to EGMS ID Column.
  |Verify that the Type column is hidden/removed from the Internal Programs list view for the Internal User.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    And I wait for "2" seconds
    #NYSED-6569
    Then I see only the following headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Fund Code | Program Name | Created By | Status |
    #NYSED-2013
    Then I softly cannot see toggle option "Internal Programs - My Records" inside flex table id "---program:-:programsTableId---"
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Active"
    #501249 #NYSED-2015 #NYSED-6569
    Then I see only the following headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Fund Code | Program Name | Created By | Status |
    And I perform quick search for "Active" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Active" for title "Status" inside table "---program:-:programsTableId---"
    And I click toggle button to select "Internal Programs - Rejected"
    #501249 #NYSED-2015
    Then I see only the following headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Fund Code | Program Name | Created By | Status |
    And I perform quick search for "Rejected" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Rejected" for title "Status" inside table "---program:-:programsTableId---"
    And I click toggle button to select "Internal Programs - Created"
    #501249 #NYSED-2015
    Then I see only the following headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Fund Code | Program Name | Created By | Status |
    And I perform quick search for "Created" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Created" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Submitted for Review" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Submitted for Review" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Reviewed" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Reviewed" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Submitted for Approval" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Approved" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Approved" for title "Status" inside table "---program:-:programsTableId---"
    And I click toggle button to select "Internal Programs - All"
    #501249 #NYSED-2015
    Then I see only the following headers in table with id "---program:-:programsTableId---" :
      | Actions | EGMS ID | Fund Code | Program Name | Created By | Status |
    And I perform quick search for "Created" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Created" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Submitted for Review" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Submitted for Review" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Reviewed" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Reviewed" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Submitted for Approval" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---program:-:programsTableId---"
    And I perform quick search for "Approved" in "---program:-:programsTableId---" panel
    #NYSED-2015
    Then I softly see value "Approved" for title "Status" inside table "---program:-:programsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |

  @501359 @Sprint-05 @US-499232 @M04 @M04Planning
  Scenario Outline: Verify that the specified fields are removed/hidden from the Internal Program Create Modal and the Internal Program Layout -> Overview tab -> Information section.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see field "Type" inside page block
    Then I softly cannot see field "Internal Organization" inside page block
    Then I softly cannot see field "Primary Funding Organization" inside page block
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I navigate to "Overview" sub tab
    Then I softly cannot see field "Type" inside page block
    Then I softly cannot see field "Internal Organization" inside page block
    Then I softly cannot see field "Primary Funder Type " inside page block
    Then I softly cannot see field "Primary Funding Organization" inside page block
    Then I softly cannot see field "Organization Level" inside page block

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @501363 @501411 @501380 @501428 @501498 @501508 @501532 @501546 @501594 @501757 @Sprint-5 @US-499232 @M04 @M04Planning
  Scenario Outline: Verify that the 'Law Statutory Authority' field is added to the Internal Program Layout -> Overview tab -> Information section, is a short text field, displays the Help Text 'Statutory Authority', and is not required to save.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    #501594
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see fields "ProjectRole__c" is in edit mode
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role    |
      | {SavedValue:EXE Username} | Program Contact |
    Then I softly see value "Program Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    #501363
    Then I softly see field "Law Statutory Authority" inside page block
    When I hovering mouse on help text icon inside page block detail "Law Statutory Authority"
    Then I softly see "Statutory Authority." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Law_Statutory_Authority__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    #501380
    Then I softly see field "Regulation" inside page block
    When I hovering mouse on help text icon inside page block detail "Regulation"
    Then I softly see "Regulatory Citation." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Regulation__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
    #501498
    Then I softly see field "Comm Reg(NYS)" inside page block
    When I hovering mouse on help text icon inside page block detail "Comm Reg(NYS)"
    Then I softly see "NYS Commissioner's Regulations." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Comm_Reg__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    #501532
    Then I softly see field "Approp Cit" inside page block
    When I hovering mouse on help text icon inside page block detail "Approp Cit"
    Then I softly see "Cites law chapter and page in state budget. Used for state programs only." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Approp_Cit__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    #501411
    Then I softly see field "Law Statutory Authority" inside page block
    Then I see field "Law Statutory Authority" is not editable
    #501428
    Then I softly see field "Regulation" inside page block
    Then I see field "Regulation" is not editable
    #501508
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I see field "Comm Reg(NYS)" is not editable
    #501546
    Then I softly see field "Approp Cit" inside page block
    Then I see field "Approp Cit" is not editable
    #501757
    Then I softly see value "Program Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    #501363
    Then I navigate to "Overview" sub tab
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly see field "Law Statutory Authority" inside page block
    When I hovering mouse on help text icon inside page block detail "Law Statutory Authority"
    Then I softly see "Statutory Authority." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Law_Statutory_Authority__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    #501380
    Then I softly see field "Regulation" inside page block
    When I hovering mouse on help text icon inside page block detail "Regulation"
    Then I softly see "Regulatory Citation." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Regulation__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
   #501498
    Then I softly see field "Comm Reg(NYS)" inside page block
    When I hovering mouse on help text icon inside page block detail "Comm Reg(NYS)"
    Then I softly see "NYS Commissioner's Regulations." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Comm_Reg__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    #501532
    Then I softly see field "Approp Cit" inside page block
    When I hovering mouse on help text icon inside page block detail "Approp Cit"
    Then I softly see "Cites law chapter and page in state budget. Used for state programs only." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Approp_Cit__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
   #501594
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see fields "ProjectRole__c" is in edit mode
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role    |
      | {SavedValue:EXE Username} | Program Contact |
    Then I softly see value "Program Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    #501411
    Then I softly see field "Law Statutory Authority" inside page block
    Then I see field "Law Statutory Authority" is not editable
     #501428
    Then I softly see field "Regulation" inside page block
    Then I see field "Regulation" is not editable
    #501508
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I see field "Comm Reg(NYS)" is not editable
     #501546
    Then I softly see field "Approp Cit" inside page block
    Then I see field "Approp Cit" is not editable
    #501757
    Then I softly see value "Program Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    #501363
    Then I navigate to "Overview" sub tab
    Then I softly see field "Law Statutory Authority" inside page block
    When I hovering mouse on help text icon inside page block detail "Law Statutory Authority"
    Then I softly see "Statutory Authority." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Law_Statutory_Authority__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    #501380
    Then I softly see field "Regulation" inside page block
    When I hovering mouse on help text icon inside page block detail "Regulation"
    Then I softly see "Regulatory Citation." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Regulation__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
   #501498
    Then I softly see field "Comm Reg(NYS)" inside page block
    When I hovering mouse on help text icon inside page block detail "Comm Reg(NYS)"
    Then I softly see "NYS Commissioner's Regulations." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Comm_Reg__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    #501532
    Then I softly see field "Approp Cit" inside page block
    When I hovering mouse on help text icon inside page block detail "Approp Cit"
    Then I softly see "Cites law chapter and page in state budget. Used for state programs only." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Approp_Cit__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
   #501594
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see fields "ProjectRole__c" is in edit mode
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I wait for "3" seconds
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    #501411
    Then I softly see field "Law Statutory Authority" inside page block
    Then I see field "Law Statutory Authority" is not editable
     #501428
    Then I softly see field "Regulation" inside page block
    Then I see field "Regulation" is not editable
     #501508
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I see field "Comm Reg(NYS)" is not editable
     #501546
    Then I softly see field "Approp Cit" inside page block
    Then I see field "Approp Cit" is not editable
    #501757
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Fiscal Contact" in flex table with id "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I wait for "2" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    #501363
    Then I navigate to "Overview" sub tab
    Then I softly see field "Law Statutory Authority" inside page block
    When I hovering mouse on help text icon inside page block detail "Law Statutory Authority"
    Then I softly see "Statutory Authority." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Law_Statutory_Authority__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Law_Statutory_Authority__c"
    When I click on "Save" in the page details
    Then I softly see field "Law Statutory Authority" as "{SavedValue:Char255}"
    #501380
    Then I softly see field "Regulation" inside page block
    When I hovering mouse on help text icon inside page block detail "Regulation"
    Then I softly see "Regulatory Citation." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Regulation__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Regulation__c"
    When I click on "Save" in the page details
    Then I softly see field "Regulation" as "{SavedValue:Char255}"
    #501498
    Then I softly see field "Comm Reg(NYS)" inside page block
    When I hovering mouse on help text icon inside page block detail "Comm Reg(NYS)"
    Then I softly see "NYS Commissioner's Regulations." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Comm_Reg__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Comm_Reg__c"
    When I click on "Save" in the page details
    Then I softly see field "Comm Reg(NYS)" as "{SavedValue:Char255}"
    #501532
    Then I softly see field "Approp Cit" inside page block
    When I hovering mouse on help text icon inside page block detail "Approp Cit"
    Then I softly see "Cites law chapter and page in state budget. Used for state programs only." shown as help text
    And I click on "Edit" in the page details
    Then I softly see fields "Approp_Cit__c" is in edit mode
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "{SavedValue:Char256}" into field "Approp_Cit__c"
    When I click on "Save" in the page details
    Then I softly see field "Approp Cit" as "{SavedValue:Char255}"
    #501594
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see fields "ProjectRole__c" is in edit mode
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    #501411
    Then I softly see field "Law Statutory Authority" inside page block
    Then I see field "Law Statutory Authority" is not editable
     #501428
    Then I softly see field "Regulation" inside page block
    Then I see field "Regulation" is not editable
     #501508
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I see field "Comm Reg(NYS)" is not editable
     #501546
    Then I softly see field "Approp Cit" inside page block
    Then I see field "Approp Cit" is not editable
    #501757
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Fiscal Contact" in flex table with id "---program:-:contactsTableId---"
    Examples:
      | UserType | Approver      | Non-Owner |
      | PM       | Automation PM | PO        |
#      | EXE      | Automation EXE   | PM         |
#      | PO       | Automation PO    | ADMIN      |
#      | ADMIN    | Automation ADMIN | EXE        |

  @503430 @501761 @Sprint-5 @US-499232 @M04 @M04Planning
  Scenario Outline: Verify that the Peer Reviewer can edit the fields added at Internal Program Layout->Overview tab-> Information section when Allow Record Editing is set to Yes. : a. Law Statutory Authority, b. Regulation, c. Comm Reg(NYS), d. Approp Cit
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | <Reviewer>    | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "<Reviewer>" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "<ReviewerUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Overview" sub tab
    Then I can see top right button "Edit" in page detail
    Then I softly see field "Law Statutory Authority" inside page block
    Then I softly see field "Regulation" inside page block
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I softly see field "Approp Cit" inside page block
    And I click on "Edit" in the page details
    Then I softly see fields "Law_Statutory_Authority__c" is in edit mode
    Then I softly see fields "Regulation__c" is in edit mode
    Then I softly see fields "Comm_Reg__c" is in edit mode
    Then I softly see fields "Approp_Cit__c" is in edit mode
    #501761
    Then I softly can see row level action button "Edit" against "{SavedValue:EXE Username}" in flex table with id "---program:-:contactsTableId---"
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see fields "ProjectRole__c" is in edit mode
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"

    Examples:
      | UserType | Reviewer      | ReviewerUser |
      | PM       | Automation PO | PO           |
#      | PO       | Automation ADMIN |  PM            |

  @503433 @501765 @Sprint-5 @US-499232 @M04 @M04Planning
  Scenario Outline:Verify that the Peer Reviewer cannot edit the fields added at Internal Program Layout->Overview tab-> Information section when Allow Record Editing is set to No. : a. Law Statutory Authority, b. Regulation, c. Comm Reg(NYS), d. Approp Cit
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | <Reviewer>    | Fiscal Reviewer | Automation Test Description | 10       | No                   |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "<Reviewer>" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "<ReviewerUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Law Statutory Authority" inside page block
    Then I softly see field "Regulation" inside page block
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I softly see field "Approp Cit" inside page block
    Then I softly see field "Law Statutory Authority" is not editable
    Then I softly see field "Regulation" is not editable
    Then I softly see field "Comm Reg(NYS)" is not editable
    Then I softly see field "Approp Cit" is not editable
    #501765
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation EXE" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EXE Username}" in flex table with id "---program:-:contactsTableId---"

    Examples:
      | UserType | Reviewer      | ReviewerUser |
      | PM       | Automation PO | PO           |
#      | FO      | Automation PM    |  PM            |
#      | PO       | Automation ADMIN |  EXE           |
#      | FD    | Automation EXE   |  EXE           |

  @501861 @501872 @504089 @Sprint-5 @US-499232 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that the 'Project Role' dropdown in the Create Contact modal on Program layout displays only 'Program Contact' and 'Fiscal Contact', and all other roles are removed.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    #501872 #501861
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Test" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    Then I softly see value "(704) 777-7869" for title "Business Phone" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Test" inside flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    #501872 #501861
    Then I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Test" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    Then I softly see value "(704) 777-7869" for title "Business Phone" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Test" inside flex table with id "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "4" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Reviewed"
    #501872 #501861
    Then I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Test" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    Then I softly see value "(704) 777-7869" for title "Business Phone" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Test" inside flex table with id "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I wait for "2" seconds
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #504089
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Law Statutory Authority" inside page block
    Then I softly see field "Regulation" inside page block
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I softly see field "Approp Cit" inside page block
    Then I softly see field "Law Statutory Authority" is not editable
    Then I softly see field "Regulation" is not editable
    Then I softly see field "Comm Reg(NYS)" is not editable
    Then I softly see field "Approp Cit" is not editable
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Test" in flex table with id "---program:-:contactsTableId---"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Law Statutory Authority" inside page block
    Then I softly see field "Regulation" inside page block
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I softly see field "Approp Cit" inside page block
    Then I softly see field "Law Statutory Authority" is not editable
    Then I softly see field "Regulation" is not editable
    Then I softly see field "Comm Reg(NYS)" is not editable
    Then I softly see field "Approp Cit" is not editable
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Test" in flex table with id "---program:-:contactsTableId---"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Law Statutory Authority" inside page block
    Then I softly see field "Regulation" inside page block
    Then I softly see field "Comm Reg(NYS)" inside page block
    Then I softly see field "Approp Cit" inside page block
    Then I softly see field "Law Statutory Authority" is not editable
    Then I softly see field "Regulation" is not editable
    Then I softly see field "Comm Reg(NYS)" is not editable
    Then I softly see field "Approp Cit" is not editable
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Test" in flex table with id "---program:-:contactsTableId---"
    And I click on "Amend Program" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Being Amended"
    #501872 #501861
    Then I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Test" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    Then I see only the following ordered options in dropdown field "ProjectRole__c" :
      | --None-- | Program Contact | Fiscal Contact |
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "Fiscal Contact" for title "Project Role" against the value "Automation Test" inside table "---program:-:contactsTableId---"
    Then I softly see value "(704) 777-7869" for title "Business Phone" against the value "Automation Test" inside table "---program:-:contactsTableId---"

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | FO      | Automation FO   |
#      | PO       | Automation PO    |
#      | FD    | Automation FD |

  @505295 @Sprint-6 @US-504644 @M04 @M04Planning
  Scenario Outline:Verify that PM/PO/FD/FO profile users can create new internal programs
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @505705 @Sprint-6 @US-504644 @M04 @M04Planning @sanitysuite
  Scenario Outline:Verify that EXE and Admin profile users can not create new internal programs
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    Then I cannot see top right button "New" in flex table with id "---program:-:programsTableId---"

    Examples:
      | UserType |
      | EXE      |
#      | ADMIN     |

  @505715 @506167 @Sprint-6 @US-504644 @M04 @M04Planning
  Scenario Outline: Verify that row-level edits at the internal program list view and program record-level edits are available to the record owner only.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    #506167
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    #506167
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Send to Owner" in the approval decision
    And I wait for "6" seconds
    And I refresh the page
    And I wait for "6" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    #506167
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details

    Examples:
      | UserType | Approver      | NonOwnerType |
      | PM       | Automation PM | EXE          |
#      | FD       | Automation FD  |  PO          |
#      | PO       | Automation PO  |  PM          |
#      | FO       | Automation FO  |  FD          |

  @506143 @NYSED-1899 @NYSED-1777 @Sprint-6 @US-504644 @US-506350 @US-NYSED-1475 @NYSEDSprint-22 @510504 @M04 @M04Planning
  Scenario Outline: Verify that program edits are available to peer reviewer only if edits are allowed.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    #NYSED-1899
    Then I softly see field "Fund Code" added after "Program Name"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | <ReviewerName> | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "<ReviewerName>" inside table
    When I re-login to "As a Grantor" app as "<Reviewer>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    #510504
    Then I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    #510504 #NYSED-1777
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "--None--" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    #510504
    Then I softly see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Test" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    And I enter value "Test" into field "NYSEDOffice__c"
    When I click modal button "Save"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I pause execution for "3" seconds
    Then I see only the following headers in table with id "---program:-:associateContactsTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I see the following rows under the following headers in table with id "---program:-:contactsTableId---" :
      | Name                      | Office          |
      | {SavedValue:EXE Username} | Automation Test |

    Examples:
      | UserType | ReviewerName              | Reviewer |
      | PM       | {SavedValue:EXE Username} | EXE      |
#      | FD       | Automation PO   |  PO          |
#      | PO       | Automation PM   |  PM          |
#      | FO       | Automation FD   |  FD          |

  @506144 @Sprint-6 @US-504644 @Sprint-7 @US-506350 @510505 @M04 @M04Planning
  Scenario Outline: Verify that program edits are available to peer reviewer only if edits are allowed.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | <ReviewerName> | Fiscal Reviewer | Automation Test Description | 10       | No                   |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "<ReviewerName>" inside table
    When I re-login to "As a Grantor" app as "<Reviewer>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:ProgramEGMSID}" in flex table with id "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    #510505
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    Then I softly see field "Deputy Area" added after "Fund Code"
    Then I softly cannot see top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---program:-:contactsTableId---"

    Examples:
      | UserType | ReviewerName              | Reviewer |
      | PM       | {SavedValue:EXE Username} | EXE      |
#      | FD       | Automation PO   |  PO          |
#      | PO       | Automation PM   |  PM          |
#      | FO       | Automation FD   |  FD          |

  @506147 @509495 @Sprint-6 @US-504644 @M04 @M04Planning @bug-538289 @bugID_538739
  Scenario Outline: Verify that when user search program EGMS ID using global search, the edit action is available to PM/PO/FD/FO profile users only and Once the record is open edit button will be available to record owner only.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    #@509495
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I wait for "5" seconds
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I wait for "5" seconds
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I wait for "5" seconds
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I wait for "5" seconds
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly cannot see top right button "Edit" in page detail
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I wait for "5" seconds
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Reviewed"
    Then I softly cannot see top right button "Edit" in page detail
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I re-login to "As a Grantor" app as "<NonOwnerType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I wait for "5" seconds
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I wait for "5" seconds
    And I select "Programs" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:ProgramEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    And I click on row level action button "Edit" against "{SavedValue:ProgramEGMSID}" in global search with id "Programs"
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Edit" in page detail
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

    Examples:
      | UserType | Approver      | NonOwnerType |
#      | PM       | Automation PM  |  EXE         |
      | FD       | Automation FD | PO           |
#      | PO       | Automation PO  |  PM          |
#      | FO       | Automation FO  |  FD          |

  @506163 @NYSED-2230 @NYSED-1783 @NYSED-1785 @NYSED-1790 @NYSED-1781 @NYSED-1788 @NYSED-1789 @NYSED-1779 @NYSED-2229 @Sprint-6
    @US-504644 @NYSEDSprint-22 @US-NYSED-1449 @M04 @M04Planning
  Scenario Outline: Verify that owner can amend active program
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I wait for "3" seconds
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    #NYSED-1788
    Then I softly see field "Fund Code" added after "Program Name"
    Then I see only the following ordered page blocks :
      | Information               |
      | Program Specific Settings |
      | Description               |
      | Contacts                  |
      | System Information        |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "--None--" into field "NYSED_IsNegotiationsAllowed__c"
    When I enter value "--None--" into field "NYSED_IsAdvancePermitted__c"
    And I click on "Save" in the page details
    Then I softly see field "Advance Payment Allowed?" added after "Objectives Required?"
    Then I softly see field "Revisions Allowed?" added after "Advance Payment Allowed?"
    And I click on "Submit For Approval" in the page details
    #NYSED-1789
    Then I softly see the following messages in the page details contains:
      | To Submit, Revisions Allowed? is required in the Overview tab under the Program Specific Settings section. |
    #NYSED-1779
    Then I softly see the following messages in the page details contains:
      | To Submit, Advance Payment Allowed? is required in the Overview tab under the Program Specific Settings section. |
    #NYSED-1789
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I see only the following ordered options in dropdown field "NYSED_IsNegotiationsAllowed__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_IsNegotiationsAllowed__c"
    #NYSED-1779
    Then I see only the following ordered options in dropdown field "NYSED_IsAdvancePermitted__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_IsAdvancePermitted__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1789
    Then I softly cannot see the following messages in the page details contains:
      | To Submit, Revisions Allowed? is required in the Overview tab under the Program Specific Settings section. |
    #NYSED-1779
    Then I softly cannot see the following messages in the page details contains:
      | To Submit, Advance Payment Allowed? is required in the Overview tab under the Program Specific Settings section. |
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    Then I navigate to "Overview" sub tab
    #NYSED-1783
    Then I softly see field "Carry Over Limit" as "No"
    #NYSED-1781
    Then I softly see field "Carry Over" as "No"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "--None--" into field "NYSED_CarryOver__c"
    And I wait for "2" seconds
    #NYSED-1781
    Then I see only the following ordered options in dropdown field "NYSED_CarryOver__c" :
      | --None-- | Yes | No |
    When I enter value "No" into field "NYSED_CarryOver__c"
    When I enter value "No" into field "NYSED_CarryOverLimit__c"
    And I click on "Save" in the page details
    #NYSED-1783
    Then I softly see field "Carry Over" as "No"
    #NYSED-1781
    Then I softly see field "Carry Over Limit" as "No"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "Yes" into field "NYSED_CarryOver__c"
    Then I see only the following ordered options in dropdown field "NYSED_CarryOverLimit__c" :
      | --None-- | Yes | No |
    When I enter value "Yes" into field "NYSED_CarryOverLimit__c"
    And I click on "Save" in the page details
    #NYSED-1783
    Then I softly see field "Carry Over" as "Yes"
    #NYSED-1783
    Then I softly see field "Carry Over Limit" as "Yes"
    And I click on "Submit For Approval" in the page details
    #NYSED-1785 #NYSED-1790
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "101" into field "NYSED_CarryOverLimitPercent__c"
    And I click on "Save" in the page details
    #NYSED-1790
    Then I softly see the following messages in the page details contains:
      | Carry Over Limit % cannot be greater than 100%. |
    When I enter value "-23" into field "NYSED_CarryOverLimitPercent__c"
    And I click on "Save" in the page details
    #NYSED-1790
    Then I softly see the following messages in the page details contains:
      | Carry Over Limit % cannot be negative. |
    When I enter value "23.55" into field "NYSED_CarryOverLimitPercent__c"
    And I click on "Save" in the page details
    #NYSED-1790
    Then I softly see field "Carry Over Limit %" as "23.55%"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #NYSED-1785
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I navigate to "Related Log" sub tab
    #NYSED-2230
    When I hovering mouse on page block help text icon inside table "---program:-:RelatedApplicationsTableId---" for LWC
    Then I softly see "This list contains all applications related to the program." shown as help text
    #NYSED-2229
    Then I see only the following headers in table with id "---program:-:FundingAllocationTableId---" :
      |  | EGMS ID | Announcement Name | Status |
    And I click on "Amend Program" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Being Amended"
    Then I navigate to "Overview" sub tab
    And I wait for "3" seconds
    When I hovering mouse on help text icon inside page block detail "Carry Over"
    #NYSED-1781
    Then I softly see "Indicates whether funds can be carried over to the next year." shown as help text
    When I hovering mouse on help text icon inside page block detail "Carry Over Limit"
    #NYSED-1783
    Then I softly see "Indicates whether a waiver is needed to carry appropriation forward. If "No", no waiver is required and any leftover money can be carried over." shown as help text

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | FD       | Automation FD  |
#      | PO       | Automation PO  |
#      | FO       | Automation FO  |

  @511672 @527757 @Sprint-7 @US-508915 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user of all profiles do not see the Terms and Conditions option (is hidden) under Activities ->Setup at the left navigation menu in the Planning phase.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    Then I softly do not see "Terms and Conditions option" content inside "Activities" subheader on left panel
    And I navigate to "Applications" tab
    #527757
    Then I softly do not see "Pre-Application" content inside "Applications" subheader on left panel

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |
#      | EXE      |
#      |ADMIN     |

  @510344 @510457 @510495 @510500 @510959 @US-506350 @Sprint-7 @bug_id_521640 @M04 @M04Planning
  Scenario Outline: Verify that program owner see that 'Office' field is added after 'Project Role' field in Contact Information section on 'Create Contact' modal on Program when program owner clicks on 'New' button
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "--None--" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    #510495
    Then I softly see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    #510457
    Then I see only the following headers in table with id "---program:-:associateContactsTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    Then I see the following rows under the following headers in table with id "---program:-:contactsTableId---" :
      | Name                      | Office          |
      | {SavedValue:EXE Username} | Automation Test |
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    When I click on "Edit" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see field "Office" is not editable
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    #510344
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB3" into field "NYSEDOffice__c"
    When I click modal button "Save"
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---program:-:contactsTableId---"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    #510500
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    Then I softly cannot see top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I navigate to "Overview" sub tab
    #510457
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I see only the following headers in table with id "---program:-:associateContactsTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I see the following rows under the following headers in table with id "---program:-:contactsTableId---" :
      | Name                      | Office          |
      | {SavedValue:EXE Username} | Automation Test |
    When I click on "Edit" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see field "Office" is not editable
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    #510344
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB3" into field "NYSEDOffice__c"
    When I click modal button "Save"
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---program:-:contactsTableId---"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---program:-:contactsTableId---"
    Then I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "--None--" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    #510495
    Then I softly see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
    #510500
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I navigate to "Overview" sub tab
    #510457
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I see only the following headers in table with id "---program:-:associateContactsTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I see the following rows under the following headers in table with id "---program:-:contactsTableId---" :
      | Name                      | Office          |
      | {SavedValue:EXE Username} | Automation Test |
    When I click on "Edit" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see field "Office" is not editable
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    #510344
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB3" into field "NYSEDOffice__c"
    When I click modal button "Save"
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---program:-:contactsTableId---"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---program:-:contactsTableId---"
    Then I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "--None--" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    #510495
    Then I softly see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
    #510500
    When I re-login to "As a Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #510959
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    Then I softly see field "Deputy Area" added after "Fund Code"
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"
       #510959
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    Then I softly see field "Deputy Area" added after "Fund Code"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
       #510959
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Deputy Area" is not editable
    Then I softly see field "Deputy Area" added after "Fund Code"
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    Then I navigate to "Overview" sub tab
    #510457
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I see only the following headers in table with id "---program:-:associateContactsTableId---" :
      |  | Full Name | Office | Organization Name | Type | Email |
    And I click modal button "Close"
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I see the following rows under the following headers in table with id "---program:-:contactsTableId---" :
      | Name                      | Office          |
      | {SavedValue:EXE Username} | Automation Test |
    When I click on "Edit" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see field "Office" is not editable
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    #510344
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    And I enter value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB3" into field "NYSEDOffice__c"
    When I click modal button "Save"
    Then I softly see value "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz012345670123456AB" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    When I click on "Remove" icon for "Automation Contact" inside flex table with id "---program:-:contactsTableId---"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    Then I softly see value "" for title "Office" against the value "Automation Contact" inside table "---program:-:contactsTableId---"
    Examples:
      | UserType | Approver      | NonOwner |
      | PM       | Automation PM | PO       |
#      | PO       | Automation PO | PM      |
#      | FO       | Automation FO | FD      |
#      | FD       | Automation FD | FO      |

  @518245 @518236 @518261 @518269 @518257 @Sprint-8 @US-508913 @M04 @M04Planning
  Scenario Outline: Verify the task when program owner click on 'Submit for Approval' button  and submits record for approval
  |Verify the task when program owner clicks 'Send for Review' icon on Peer Reviews table|
  |Verify the task when the approver clicks on the 'Forward' action and selecting another user.|
  |Verify the task when the Final approver clicks on 'Approve' action and submit.|
  |Verify the task when the previous program approver clicks on the approve button|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation2" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "ProgID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I navigate to "Overview" sub tab
    And I save the field labeled "Fund Code" as "FundCode"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
      | Automation PO | Step 2  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FD | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FD Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{Savedvalue:ProgID}" in "---program:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---program:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type      | Subject                              | Due Date Only         | Status      |
      | Action menu | {SavedValue:ProgID} | Review Program | Review Program {SavedValue:FundCode} | {Date:M/d/yyyy::d+10} | Not Started |
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Overview" sub tab
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:pendingTaskTableId---" panel
    #518245
    Then I see the following rows under the following headers in table with id "---program:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type       | Subject                               | Due Date Only        | Status      |
      | Action menu | {SavedValue:ProgID} | Approve Program | Approve Program {SavedValue:FundCode} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FD Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Approve Program" in "---program:-:pendingTaskTableId---" panel
    #518261
    Then I see the following rows under the following headers in table with id "---program:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type       | Subject                               | Due Date Only        | Status      |
      | Action menu | {SavedValue:ProgID} | Approve Program | Approve Program {SavedValue:FundCode} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    #518257
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:pendingTaskTableId---" panel
    #518261
    Then I see the following rows under the following headers in table with id "---program:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type       | Subject                               | Due Date Only        | Status      |
      | Action menu | {SavedValue:ProgID} | Approve Program | Approve Program {SavedValue:FundCode} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:pendingTaskTableId---" panel
    #518269
    Then I see the following rows under the following headers in table with id "---program:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                | Due Date Only        | Status      |
      | Action menu | {SavedValue:ProgID} | Activate Program | Activate Program {SavedValue:FundCode} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Approved"
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD        |

  @518280 @527748 @Sprint-8 @US-508913 @M04 @M04Planning
  Scenario Outline: Verify the task when the Last approver clicks on Undo button and clicks ‘Yes’ on the confirmation window.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I wait for "5" seconds
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation2" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "ProgID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I navigate to "Overview" sub tab
    And I save the field labeled "Fund Code" as "FundCode"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    #527748
    Then I softly see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Program Contact' Role. |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #527748
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Program Contact' Role. |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    And I click on "Undo" in the page details
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:pendingTaskTableId---" panel
    Then I see the following rows under the following headers in table with id "---program:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type       | Subject                               | Due Date Only        | Status      |
      | Action menu | {SavedValue:ProgID} | Approve Program | Approve Program {SavedValue:FundCode} | {Date:M/d/yyyy::d+7} | Not Started |
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Approval"


    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD        |

  @520474 @520481 @Sprint-9 @US-518579 @M04 @M04Planning
  Scenario Outline: Verify that the internal user can see the 'Fund Code' field added after the 'KPIs Required?' field in the Program Specific Settings section of the Create Program modal and that the field is required on save.
  |Verify that the program owner can see that the existing Fund Code field, which was required for submit, is now required for save on the program layout.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation2" values from "Program_Field_Values.xlsx"
    When I clear the value from field "Fund_Code__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Fund Code is required in the Information section. |
    And I enter value "Gf#%^" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Fund code can consist only 4 character(0-9). |
    And I enter value "-120" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Fund code can consist only 4 character(0-9). |
    And I enter value "1.88" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Fund code can consist only 4 character(0-9). |
    And I enter value "111" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | The fund code should consist of 4 digits(0-9). |
    And I enter value "1111" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "ProgID"
    Then I softly see field "Fund Code" as "1111"
    And I save the field labeled "Fund Code" as "FundCode"
    And I click on "Edit" in the page details
    When I clear the value from field "Fund_Code__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Fund Code is required in the Overview tab under the Information section. |
    And I enter value "111" into field "Fund_Code__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "2345" into field "Fund_Code__c"
    And I click on "Save" in the page details
    Then I softly see field "Fund Code" as "2345"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
      | Automation PO | Step 2  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Test Description | 10       | Yes                  |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation FD" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:pendingTaskTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    Then I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I clear the value from field "Fund_Code__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Fund Code is required in the Overview tab under the Information section. |
    And I enter value "111" into field "Fund_Code__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Fund code can consist only 4 character(0-9). |
    And I enter value "2345" into field "Fund_Code__c"
    And I click on "Save" in the page details
    Then I softly see field "Fund Code" as "2345"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I perform quick search for "{SavedValue:ProgID}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:ProgID}" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see field "Fund Code" as "2345"
    Then I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD        |

  @520666 @520678 @Sprint-09 @US-514220 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that the program owner sees at least one "Fiscal Contact" is required to submit the program for approval.
  |Verify that the program owner does not see the Grantor Pre-application form under Program Layout->Setup tab->Business Forms.|
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation2" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    Then I softly do not see value "Grantor Pre-application Forms" for title "Package Name" inside table "---program:-:ProgramBusinessFormTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role    |
      | {SavedValue:EXE Username} | Program Contact |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role. |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role   |
      | Automation FD | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details :
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role. |
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @527748-Reviewed @Sprint-08 @US-513806 @M04 @M04Planning
  Scenario Outline:Verify that the program owner sees at least one "Program Contact" is required to submit the program for approval.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    #527748
    Then I softly see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Program Contact' Role. |
    And I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I click on "Submit For Approval" in the page details
    #527748
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Program Contact' Role. |
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    And I click on "Activate" in the page details
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I navigate to "Overview" sub tab
    And I click on "Remove" icon for "Program Contact" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #527748
    Then I softly see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Program Contact' Role. |
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    #527748
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - At least one contact should have the 'Program Contact' Role. |

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |

  @533105 @539255 @NYSEDSprint-12 @US-533105 @M04 @NYSEDSprint-15 @US-537965 @M05
  Scenario Outline:Verify that the Internal users should not see Address Information section, under the Internal Program layout -> Contacts section -> Create Contact modal
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click modal button "Close"
    When I click on "View" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click on back arrow
    When I navigate to "Setup" sub tab
    #539255
    Then I softly do not see "Business Forms" page block displayed
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click modal button "Close"
    When I click on "View" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click on back arrow
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    #539255
    Then I softly do not see "Business Forms" page block displayed
    When I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click modal button "Close"
    When I click on "View" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click on back arrow
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role    |
      | Automation FD             | Program Contact |
      | {SavedValue:EXE Username} | Fiscal Contact  |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    #539255
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    When I navigate to "Setup" sub tab
    #539255
    Then I softly do not see "Business Forms" page block displayed
    And I navigate to "Overview" sub tab
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click modal button "Close"
    When I click on "View" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click on back arrow
    And I navigate to "Planning" tab
    Then I softly do not see the left navigation link "External Programs"
    Then I softly see the left navigation link "Internal Programs"

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |

  @536337 @536339 @536340 @536250 @536266 @536267 @NYSEDSprint-13 @US-535230 @M05
  Scenario Outline: Verify that the 'Create and Edit' and 'Submit and Certify' users see the validation message when the Total Budgeted Amount is more than the Allocation Amount on the Application created for the Formula BAFA Announcement and application status is Created.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name             | Step Weight (%) |
      | Program Office Review | 40              |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Title                 | Step Weight (%) |
      | Grants Finance Review | 40              |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name | Description | Step Weight (%) |
      | 3          | Demo Step | Automation  | 20              |
    And I expand nested table containing column value "Demo Step"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:ReviewFormsTableID---" by clicking "New" :
      | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review | 100.00%         | 1                                         | Checked   | Yes                    |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
      #536337
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Demo Step - Dummy Program Review: At least one section must be added to this form. |
    And I wait for "2" seconds
    And I expand nested table containing column value "Demo Step"
      #536250
    Then I softly do not see "Reviewers" page block displayed
    Then I softly see "Review Forms" page block displayed
      #536266
    Then I see the following rows under the following headers in table with id "---program:-:ReviewFormsTableID---" :
      | Actions     | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Dummy Program Review | 100.00%         | 1                                         | True      | Yes                    |
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header                 | Section Weight (%) |
      | 1             | Automation Dummy Office Review | 100                |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
      #536250
    Then I softly do not see "Reviewers" page block displayed
    Then I softly see "Review Forms" page block displayed
      #536267
    Then I see the following rows under the following headers in table with id "---program:-:ReviewFormsTableID---" :
      | Actions     | Form Name                 | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Grant Finance Review Form | 100.00%         | 1                                         | True      | Yes                    |
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    And I edit the following rows inline in flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "Edit" :
      | Section Order | Section Weight (%) |
      | 1             | 80                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Grants Finance Review"
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
      #536339
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Demo Step - Dummy Program Review: The total section weight must equal 100% or 0%. It is currently 80%. |
      #536340
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Demo Step - Dummy Program Review: A score must be associated to at least one question in the Automation Dummy Office Review section because it is weighted. |

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |

  @536255 @536344 @536279 @536280 @536342 @536281 @NYSEDSprint-13 @US-535230 @M04
  Scenario Outline: Verify the internal user should see validation - For required panel the Minimum Number of Reviews should be greater than zero. and 'Minimum Number of Reviews per Application' field is required
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    #536255
    Then I see the following rows under the following headers in table with id "---program:-:reviewStepTableId---" :
      | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Title                 | Step Weight (%) |
      | Grants Finance Review | 80              |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name | Description | Step Weight (%) |
      | 3          | Demo Step | Automation  | 20              |
    And I expand nested table containing column value "Demo Step"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:ReviewFormsTableID---" by clicking "New" :
      | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review | 100.00%         | 0                                         | Checked   | Yes                    |
        #536344
    Then I softly see the following messages in the page details contains:
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    And I collapse nested table containing column value "Demo Step"
    And I refresh the page
    And I wait for "3" seconds
    And I expand nested table containing column value "Demo Step"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:ReviewFormsTableID---" by clicking "New" :
      | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review | 100.00%         | 1                                         | Checked   | Yes                    |
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---program:-:ReviewFormsTableID---" by clicking "Edit" :
      | Form Name            | Minimum Number of Reviews per Application |
      | Dummy Program Review |                                           |
    #536344
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name | Step Weight (%) |
      | Demo Step | 30              |
    And I wait for "2" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    #536279
    Then I softly see the following messages in the page details contains:
      | Setup Tab - The total Review Step weight must equal 100%. It is currently 110.00%. |
    And I wait for "2" seconds
    Given I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Name | Step Weight (%) |
      | Demo Step | 20              |
    And I wait for "2" seconds
    And I expand nested table containing column value "Demo Step"
    Given I edit the following rows inline in flex table with id "---program:-:ReviewFormsTableID---" by clicking "Edit" :
      | Form Name            | Required? |
      | Dummy Program Review | Unchecked |
    #536342
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |
    And I collapse nested table containing column value "Demo Step"
    And I expand nested table containing column value "Demo Step"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:ReviewFormsTableID---" by clicking "New" :
      | Form Name             | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review1 | 100.00%         | 1                                         | Checked   | Yes                    |
    And I collapse nested table containing column value "Demo Step"
    And I wait for "2" seconds
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    #536280
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Demo Step: The total Review Form weight must equal 100% for a weighted step. It is currently 200.00%. |
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Section Order | Step Name         | Description | Step Weight (%) |
      | 4             | Dummy Review Step | des         | 0               |
    And I click on top right button "Validate" in flex table with id "---program:-:reviewStepTableId---"
    #536281
    Then I softly see the following messages in the page details contains:
      | Setup Tab - Dummy Review Step: At least one form is required for this review step. |

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |

  @536275 @536346 @537630 @NYSEDSprint-13 @US-535230 @M05
  Scenario Outline:Verify that the Internal User i.e. Program Owner should be able to create, edit and delete, details in review step table for Program Office Review step, in the states- Created, Submitted for Review, Reviewed, Under Revision , Being Amended
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click modal button "Close"
    When I click on "View" icon for "Automation EXE" inside flex table with id "---program:-:contactsTableId---"
    Then I softly do not see "Address Information" page block displayed on modal
    And I click on back arrow
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Title                 | Step Weight (%) |
      | Grants Finance Review | 80              |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name | Description | Step Weight (%) |
      | 3          | Demo Step | Automation  | 20              |
    And I expand nested table containing column value "Demo Step"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:ReviewFormsTableID---" by clicking "New" :
      | Form Name            | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Dummy Program Review | 100.00%         | 1                                         | Checked   | Yes                    |
    And I expand nested table containing column value "Demo Step"
    #536275
    Then I softly can see row level action button "Edit" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly can see row level action button "Delete" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly can see row level action button "Edit" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly can see row level action button "Delete" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    #536275
    Then I softly can see row level action button "Review Form" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly can see row level action button "Edit" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly can see row level action button "Delete" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header                   | Section Weight (%) |
      | 1             | Automation Program Office Review | 100                |
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---program:-:ReviewCategoriesTableId---" :
      | Actions     | Section Order | Section Header                 | Section Weight (%) |
      | Action menu | 1             | Automation Dummy Office Review | 100%               |
    #537630
    Then I softly can see row level action button "Edit" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewCategoriesTableId---"
    Then I softly can see row level action button "Delete" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewCategoriesTableId---"
    Given I edit the following rows inline in flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "Edit" :
      | Section Order | Section Header |
      | 1             | Manual         |
    #537630
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---program:-:ReviewCategoriesTableId---" :
      | Actions     | Section Order | Section Header | Section Weight (%) |
      | Action menu | 1             | Manual         | 100%               |
    And I expand nested table containing column value "Manual"
    When I enter the following values into flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "New" :
      | Question Order | Question                | Type    | Max Score |
      | 1              | Automation Dummy Review | Written | 100       |
     #537630
    Then I softly can see row level action button "Edit" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:ReviewQuestionsTableId---" :
      | Actions     | Question Order | Question                | Type    | Max Score |
      | Action menu | 1              | Automation Dummy Review | Written | 100       |
    Given I edit the following rows inline in flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "Edit" :
      | Question Order | Question   |
      | 1              | Automation |
    #537630
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---program:-:ReviewQuestionsTableId---" :
      | Actions     | Question Order | Question   | Type    | Max Score |
      | Action menu | 1              | Automation | Written | 100       |
    And I click on "Delete" icon for "Manual" inside flex table with id "---program:-:ReviewCategoriesTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Demo Step"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header                 | Section Weight (%) |
      | 1             | Automation Dummy Office Review | 100                |
    And I expand nested table containing column value "Automation Dummy Office Review"
    When I enter the following values into flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "New" :
      | Question Order | Question                | Type    | Max Score |
      | 1              | Automation Dummy Review | Written | 10        |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role    |
      | Automation FD             | Program Contact |
      | {SavedValue:EXE Username} | Fiscal Contact  |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I wait for "2" seconds
    And I "Send back" in the approval decision
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Demo Step"
    #536275
    Then I softly can see row level action button "Edit" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly can see row level action button "Delete" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly can see row level action button "Edit" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly can see row level action button "Delete" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    #536275
    Then I softly can see row level action button "Review Form" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly can see row level action button "Edit" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly can see row level action button "Delete" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header                   | Section Weight (%) |
      | 1             | Automation Program Office Review | 100                |
    And I wait for "5" seconds
    Then I see the following rows under the following headers in table with id "---program:-:ReviewCategoriesTableId---" :
      | Actions     | Section Order | Section Header                 | Section Weight (%) |
      | Action menu | 1             | Automation Dummy Office Review | 100%               |
    #537630
    Then I softly can see row level action button "Edit" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewCategoriesTableId---"
    Then I softly can see row level action button "Delete" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewCategoriesTableId---"
    Given I edit the following rows inline in flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "Edit" :
      | Section Order | Section Header |
      | 1             | Manual         |
    #537630
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---program:-:ReviewCategoriesTableId---" :
      | Actions     | Section Order | Section Header | Section Weight (%) |
      | Action menu | 1             | Manual         | 100%               |
    And I expand nested table containing column value "Manual"
    When I enter the following values into flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "New" :
      | Question Order | Question                | Type    | Max Score |
      | 1              | Automation Dummy Review | Written | 100       |
     #537630
    Then I softly can see row level action button "Edit" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I softly can see row level action button "Delete" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:ReviewQuestionsTableId---" :
      | Actions     | Question Order | Question                | Type    | Max Score |
      | Action menu | 1              | Automation Dummy Review | Written | 100       |
    Given I edit the following rows inline in flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "Edit" :
      | Question Order | Question   |
      | 1              | Automation |
    #537630
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---program:-:ReviewQuestionsTableId---" :
      | Actions     | Question Order | Question   | Type    | Max Score |
      | Action menu | 1              | Automation | Written | 100       |
    And I click on "Delete" icon for "Manual" inside flex table with id "---program:-:ReviewCategoriesTableId---" without waiting for record
    And I click modal button "Close"
    And I wait for "2" seconds
    And I expand nested table containing column value "Demo Step"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---program:-:ReviewCategoriesTableId---" by clicking "New" :
      | Section Order | Section Header                 | Section Weight (%) |
      | 1             | Automation Dummy Office Review | 100                |
    And I expand nested table containing column value "Automation Dummy Office Review"
    When I enter the following values into flex table with id "---program:-:ReviewQuestionsTableId---" by clicking "New" :
      | Question Order | Question                | Type    | Max Score |
      | 1              | Automation Dummy Review | Written | 10        |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<NonAnnouncementOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    #536346
    Then I softly cannot see row level action button "Edit" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Edit" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Demo Step"
    #536346
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I expand nested table containing column value "Automation Dummy Office Review"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "2" seconds
    #536346
    Then I softly cannot see row level action button "Edit" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Edit" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Demo Step"
    #536346
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I expand nested table containing column value "Automation Dummy Office Review"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "2" seconds
    #536346
    Then I softly cannot see row level action button "Edit" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Edit" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Demo Step"
    #536346
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I expand nested table containing column value "Automation Dummy Office Review"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I wait for "2" seconds
    #536346
    Then I softly cannot see row level action button "Edit" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Program Office Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Edit" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly cannot see row level action button "Delete" against "Grants Finance Review" in flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Demo Step"
    #536346
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Dummy Program Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I click on "Review Form" icon for "Dummy Program Review" inside flex table with id "---program:-:ReviewFormsTableID---" without waiting for record
    And I wait for "5" seconds
    Then I softly cannot see top right button "New" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Office Review" in flex table with id "---program:-:ReviewFormsTableID---"
    And I expand nested table containing column value "Automation Dummy Office Review"
    Then I softly cannot see row level action button "Edit" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Dummy Review" in flex table with id "---program:-:ReviewQuestionsTableId---"

    Examples:
      | UserType | NonAnnouncementOwner |
      | PM       | EXE                  |
#      | PO       | PM                   |
#      | FO       | PO                   |
#      | FD       | FO                   |

  @NYSED-1065 @NYSED-1064 @US-NYSED-927 @NYSEDSprint-20 @NYSED-1653 @NYSEDSprint-22 @US-NYSED-1449 @October2025 @M04
  Scenario:Verify with the Program Owner if selecting the 'Key Contact' Check box for multiple contacts in 'Program Contact' and 'Fiscal Contact' triggers the validation message upon clicking 'Submit for Approval'.
  |Verify with the Program Owner that if the 'Key Contact' check box is not selected for 'Program Contact' and 'Fiscal Contact,' the validation message appears upon clicking 'Submit for Approval.'|
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   |
      | {SavedValue:EXE Username} | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1065 #NYSED-1064
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "FiscaluniqueEmailID"
    And I enter value "{SavedValue:FiscaluniqueEmailID}" into field "Email"
    And I enter value "Fiscal Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name               | Is Key Contact |
      | Automation Contact | Checked        |
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1064
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I enter value "Automation" into field "FirstName"
    And I enter value "Contact" into field "LastName"
    And I generate the random EmailID and save as "ProgramuniqueEmailID"
    And I enter value "{SavedValue:ProgramuniqueEmailID}" into field "Email"
    And I enter value "Program Contact" into field "ProjectRole__c"
    And I enter value "(704) 777-7869" into field "Phone"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    #NYSED-1064
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I perform quick search for "Automation test description" in "---program:-:checklistTableId---" panel
    #NYSED-1653
    Then I softly see value "Automation test description" for title "Description" against the value "Mandatory" inside table "---program:-:checklistTableId---"
    Then I see only the following headers in table with id "---program:-:focusAreaTableId---" :
      | Actions | EGMS ID | Title | Status | Year Created |
    Then I see only the following headers in table with id "---program:-:objectivesTableId---" :
      | Actions | EGMS ID | Title | Year Created |
    And I click on advance filter of table id "---program:-:checklistTableId---" for LWC
    And I enter advance filter values inside id "---program:-:checklistTableId---" for LWC
      | Description | contains | Automation test description |
    Then I softly see value "Automation test description" for title "Description" inside table "---program:-:checklistTableId---"

  @545862 @545864 @545863 @545865 @546180 @546177 @545999 @NYSED-1801 @NYSED-1794 @NYSED-1793 @NYSED-1634 @NYSED-1799 @NYSEDSprint-19 @US-544758 @US-NYSED-1475 @NYSEDSprint-22 @US-NYSED-1232 @NYSEDSprint-22 @M04
  Scenario Outline: Verify that Internal User able to see 'UGG' and 'EDHAR' field on program layout.
  |Verify that the Internal User able to see Objective required field by default set to NO ,On Program creation screen.|
  |Verify that the Internal User can see Focus Areas Required field is defaulted to 'No'.|
  |Verify with Internal user Deputy Area field changed from optional to mandatory on Internal Program Layout.|
  |Verify with the peer reviewer that the 'UGG' and 'EDHAR' fields are not editable when the "Allow Editing" setting is set to NO.|
  |Verify with the peer reviewer that the 'UGG' and 'EDHAR' fields are editable when the "Allow Editing" setting is set to YES.|
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    Then I softly see field "Objectives Required?" as "No"
    Then I softly see field "Focus Areas Required?" as "No"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Objectives Required?" as "Yes"
    Then I softly see field "Focus Areas Required?" as "Yes"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "OHE" into field "NYSEDDeputy_Area__c"
    Then I softly see field "Objectives Required?" inside page block
    And I enter value "No" into field "---program:-:objectives---"
    And I enter value "No" into field "---program:-:focusArea---"
    And I wait for "2" seconds
    And I enter value "---AUTOEnvData:-:Char256---" into field "---program:-:UGG---" for entering max characters
    And I enter value "---AUTOEnvData:-:Char256---" into field "---program:-:EDGAR---" for entering max characters
    #545865
    And I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |  |
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "--None--" into field "NYSEDDeputy_Area__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |
    And I wait for "2" seconds
    And I enter value "OCE" into field "NYSEDDeputy_Area__c"
    And I click on "Save" in the page details
    #545862
    Then I softly see field "UGG" as "---AUTOEnvData:-:Char255---"
    Then I softly see field "EDGAR" as "---AUTOEnvData:-:Char255---"
    #545864
    Then I softly see field "Objectives Required?" as "No"
    #545863
    Then I softly see field "Focus Areas Required?" as "No"
    When I navigate to "Setup" sub tab
    And I click on top right button "Add" in flex table with id "---program:-:checklistTableId---"
    And I wait for "3" seconds
      #NYSED-1634
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |
    #546180 546177
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | <Reviewer>    | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
      | <Reviewer1>   | Fiscal Reviewer | Automation Test Description | 10       | No                   |
    #NYSED-1232
    Then I see only the following headers in table with id "---program:-:approverTableId---" :
      | Actions | Name | Program | Announcement | FDM | Award | Post Award / Monitoring |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "<Reviewer1>" inside table
    And I click on "Send for Review" icon for "<Reviewer>" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "As a Grantor" app as "<Reviewer1User>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I navigate to "Overview" sub tab
    #NYSED-1794
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "UGG" is not editable
    Then I softly see field "EDGAR" is not editable
    When I re-login to "As a Grantor" app as "<ReviewerUser>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I enter value "Automation Testing" into field "---program:-:UGG---" page block
    And I enter value "Automation Testing" into field "---program:-:EDGAR---" page block
    #NYSED-1793
    And I wait for "2" seconds
    When I enter value "Yes" into field "NYSED_CarryOver__c"
    When I enter value "101" into field "NYSED_CarryOverLimitPercent__c"
    And I click on "Save" in the page details
    #NYSED-1793
    Then I softly see the following messages in the page details contains:
      | Carry Over Limit % cannot be greater than 100%. |
    When I enter value "-23" into field "NYSED_CarryOverLimitPercent__c"
    And I click on "Save" in the page details
    #NYSED-1793
    Then I softly see the following messages in the page details contains:
      | Carry Over Limit % cannot be negative. |
    When I enter value "23.55" into field "NYSED_CarryOverLimitPercent__c"
    And I click on "Save" in the page details
    #NYSED-1793
    Then I softly see field "Carry Over Limit %" as "23.55%"
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "UGG" as "Automation Testing"
    Then I softly see field "EDGAR" as "Automation Testing"
    When I navigate to "Setup" sub tab
    And I click on top right button "Add" in flex table with id "---program:-:checklistTableId---"
    And I wait for "3" seconds
    #NYSED-1799
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |
    #545999
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "UGG" is not editable
    Then I softly see field "EDGAR" is not editable

    Examples:
      | UserType | Reviewer                  | Reviewer1                | Non-Owner | ReviewerUser | Reviewer1User |
      | PM       | {SavedValue:EXE Username} | {SavedValue:FD Username} | PO        | EXE          | FD            |
#      | PO       | {SavedValue:EXE Username} | {SavedValue:FD Username} | PM        | EXE          | FD            |
#      | FO       | {SavedValue:EXE Username} | {SavedValue:FD Username} | FD        | EXE          | FD            |

  @NYSED-1792 @NYSED-1791 @US-NYSED-1475 @NYSEDSprint-22 @M04
  Scenario:Verify renaming of columns in Funding Allocation section
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:AutomationPermanentStaticRecord}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:AutomationPermanentStaticRecord}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I pause execution for "2" seconds
    And I navigate to "Related Log" sub tab
    When I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---program:-:FundingAllocationTableId---"
    And I expand nested table containing column value "{SavedValue:EGMSID}"
    #NYSED-1792 #NYSED-1791
    Then I see only the following headers in table with id "---program:-:ChildFundingAllocationTableId---" :
      | Funding Account | Fund Year | Title | Available Balance | Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Pre-Encumbrance Balance |

  @NYSED-1063 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Marking the contact as key contact at program
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
#    Then I softly see the text containing "Ensure that at least one contact is assigned the 'Program Contact' role and one contact is assigned the 'Fiscal Contact' role. Additionally, exactly one Program Contact and one Fiscal Contact must be marked as the Key Contact."
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    | Is Key Contact |
      | Automation PM | Program Contact | checked        |
      | Automation FO | Fiscal Contact  | checked        |
    #NYSED-1063
    Then I see only the following headers in table with id "---program:-:contactsTableId---" :
      | Actions | Project Role | Name | Office | Email | Is Key Contact | Business Phone | Organization |
    Then I softly see value "True" for title "Is Key Contact" inside table "---program:-:contactsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-1066 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Verify with the Program Owner that if only one key contact check box is selected for the 'Program Contact' and 'Fiscal Contact' roles, then clicking Submit for approval allows the process to move forward successfully.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    Then I click on "Submit For Approval" in the page details
    #NYSED-1066
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-1067 @@NYSED-1068 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Verify with Peer Review: if the "Allow Edit" setting is set to YES, then it should allow updating the Key Contact role.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 16       | Yes                  |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation PO | Fiscal Reviewer | Automation Test Description | 16       | No                   |
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---home:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation FO" in flex table with id "---home:-:contactsTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I softly can see row level action button "Edit" against "Automation PM" in flex table with id "---home:-:contactsTableId---"
    Then I softly can see row level action button "Edit" against "Automation FO" in flex table with id "---home:-:contactsTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "5" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I wait for "5" seconds
    And I enter in modal value "Passed" into field "ReviewComments__c"
    And I click modal button "Save"
    And I click modal button "Submit Review"
    Then I softly see field "Status" as "Submitted for Review"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE      |

  @NYSED-1069 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Verify with the program owner that they are not allowed to update the 'Key Contact' checkbox for 'Program Contact' and 'Fiscal Contact' roles when the program is in the Approved, Active, Cloesd, or Rejected state.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 16       | Yes                  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    Then I click on "Submit For Approval" in the page details
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Overview" sub tab
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---program:-:contactsTableId---"
    And I wait for "2" seconds
    Then I softly cannot see row level action button "Edit" against "Fiscal Contact" in flex table with id "---program:-:contactsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-1069-approved&activate @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Verify with the program owner that they are not allowed to update the 'Key Contact' checkbox for 'Program Contact' and 'Fiscal Contact' roles when the program is in the Approved, Active, Cloesd, or Rejected state.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    Then I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    And I navigate to "Overview" sub tab
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---program:-:contactsTableId---"
    Then I click on "Activate" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly cannot see row level action button "Edit" against "Program Contact" in flex table with id "---program:-:contactsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |


  @NYSED-1070 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Verify with the program owner that, once the program is amended, they are able to update the 'Key Contact' checkbox for any contact assigned to the 'Program Contact' and 'Fiscal Contact' roles.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    Then I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    Then I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I click on "Amend Program" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | unchecked      |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM1 Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM1 Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PO | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation PM1 | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation PM1 | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | checked        |
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I refresh the page
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | unchecked      |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation PM1 | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-1071 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline: Verify with Non Owner profiles able to see the updated data in the contact section in read-only mode across all states.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "3" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I re-login to "As a Grantor" app as "<Non-Owner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---home:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation FO" in flex table with id "---home:-:contactsTableId---"

    Examples:
      | UserType | Approver      | Non-Owner |
      | PM       | Automation PM | PO        |
#      | EXE      | {SavedValue:EXE Username} | PM        |
#      | PO       | Automation PO  | ADMIN     |
#      | PM       | Automation PM  | EXE       |
#      | FO       | Automation PM  | FD        |
#      | FD       | Automation PM  | FO        |

  @NYSED-1072 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that the Forwarded User is able to see the updated data in the contact section in read-only mode.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    Then I click on "Submit For Approval" in the page details
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FD Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly cannot see row level action button "Edit" against "Automation PM" in flex table with id "---home:-:contactsTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation FO" in flex table with id "---home:-:contactsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |
#      | EXE       |

  @NYSED-1073 @NYSEDSprint-21 @US-NYSED-927 @M04
  Scenario Outline:Verify that when Send Back is selected then again record get in created state and able to updated data in the contact section.    Given I login to "As a Grantor" app as "<UserType>" user
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I wait for "5" seconds
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role    |
      | Automation PM | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Project Role   |
      | Automation FO | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Project Role  | Is Key Contact |
      | Automation FO | checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    Then I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    When I select radio button "Send back" in the approval decision
    When I "Send back" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | unchecked      |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | unchecked      |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:PO Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PO Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM1 Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM1 Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role    |
      | Automation PO | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation PM1 | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation PM1 | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PM | checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation FO | checked        |
    And I wait for "2" seconds
    And I refresh the page
    Then I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Exactly one 'Program Contact' and one 'Fiscal Contact' must be marked as Key Contact. |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Is Key Contact |
      | Automation PO | unchecked      |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Is Key Contact |
      | Automation PM1 | unchecked      |
    Then I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-2726 @NYSED-2725 @NYSED-2727 @NYSEDSprint-24 @US-NYSED-2173 @M04 @MO4EXECUTIONREMAINING
  Scenario Outline:Verify that fund code field on Internal program is a required text field which allows only 4 digits without decimal.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    #NYSED-2725
    Then I see the following rows under the following headers in table with id "---program:-:reviewStepTableId---" :
      | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
    And I expand nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    #NYSED-2726
    Then I see the following rows under the following headers in table with id "---program:-:ReviewFormsTableID---" :
      | Actions     | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Group 2   | 0.00%           | 0                                         | False     | Yes                    |
      | Action menu | Group 1   | 0.00%           | 0                                         | False     | Yes                    |
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approver> | Step 1  |
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click on remove for lookup from field "Program__c"
    When I enter in modal value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    #NYSED-2727
    Then I see the following rows under the following headers in table with id "---announcement:-:AnnouncementReviewPanel---" :
      | Actions     | Step Order | Step Name             | Description                                      | Step Weight (%) | # of Panels |
      | Action menu | 1          | Program Office Review | Application completeness and correctness review. | 0.00%           | 2           |
      | Action menu | 2          | Grants Finance Review | Application grants finance review.               | 100.00%         | 1           |
    And I expand nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    #NYSED-2727
    Then I see the following rows under the following headers in table with id "---announcement:-:annReviewFormsTableId---" :
      | Actions     | Form Name | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Action menu | Group 2   | 0.00%           | 0                                         | False     | Yes                    |
      | Action menu | Group 1   | 0.00%           | 0                                         | False     | Yes                    |

    Examples:
      | UserType | Approver                 |
      | PO       | {SavedValue:PO Username} |

  @NYSED-5136 @NYSEDSprint-28 @US-NYSED-4908 @M04 @M04Planning
  Scenario Outline: Verify that the Internal User can view the updated list filter names displayed for Internal Programs table
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    And I wait for "3" seconds
    #NYSED-5136
    Then I softly see toggle option "Internal Programs - All" inside flex table id "---program:-:programsTableId---"
    Then I softly see toggle option "Internal Programs - Active" inside flex table id "---program:-:programsTableId---"
    Then I softly see toggle option "Internal Programs - Created" inside flex table id "---program:-:programsTableId---"
    Then I softly see toggle option "Internal Programs - Rejected" inside flex table id "---program:-:programsTableId---"
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I wait for "3" seconds
    #NYSED-5136
    Then I softly see toggle option "Internal Programs - All" inside flex table id "---program:-:programsTableId---"
    Then I softly see toggle option "Internal Programs - Active" inside flex table id "---program:-:programsTableId---"
    Then I softly see toggle option "Internal Programs - Created" inside flex table id "---program:-:programsTableId---"
    Then I softly see toggle option "Internal Programs - Rejected" inside flex table id "---program:-:programsTableId---"

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |
      | EXE      |

  @NYSED-7428 @NYSED-7429 @NYSEDSprint-31 @US-NYSED-6852 @M05 @yugaC
  Scenario Outline: Verify that the Program owner can see the 'Short Description' field added before the 'Description' field on the Internal Program layout in the Description section.
  |Verify that the Program owner can see the Description is marked as optional on the Planning phase → Internal Program module → Internal Program layout → Description section.|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter unique value in field with apiName "Fund_Code__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:PM Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name       | Program |
      | <Approval> | Step 1  |
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    #NYSED-7428
    Then I softly see field "Short Description" inside "Description" section
    When I hovering mouse on help text icon inside page block detail "Short Description"
    Then I softly see "Description representation in GAN" shown as help text
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:Char301}" into field "NYSED_ShortDescription__c"
    And I click on "Save" in the page details
    Then I softly see field "Short Description" as "{SavedValue:Char300}"
    And I click on "Edit" in the page details
    And I clear the value from field "NYSED_ShortDescription__c"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | To Submit, Short Description is required in the Overview tab under the Description section. |
  #NYSED-7429
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:Char301}" into field "NYSED_ShortDescription__c"
    And I click on "Save" in the page details
    Then I softly see field "Description" inside "Description" section
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see field "Description" as "" in "Description" pageblock

    Examples:
      | UserType | Approval      |
      | PM       | Automation PM |

  @NYSED-10232 @NYSED-Sprint-35 @US-NYSED-9542 @M04
  Scenario Outline: Verify that the Internal User see that on the Planning phase → Internal Program list view → Create Program modal → Abbreviation field is hidden/removed and related validations are removed.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    #NYSED-10232
    Then I softly cannot see field "Abbreviation" inside page block
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter unique value in field with apiName "Fund_Code__c"
    And I click modal button "Save and Continue"
    Then I softly cannot see the following messages in the page details contains:
      | To save, Abbreviation is required in the Information section. |
    And I wait for "2" seconds
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail

    Examples:
      | UserType |
      | PM       |

  @NYSED-5998 @NYSED-Sprint-30 @US-NYSED-5970 @M04
  Scenario Outline:Verify that the Program Owner can see the new field 'First Payment %' is added after the 'Advance Payment Allowed?' field on the Internal Program layout → Overview tab → Program Specific Settings section.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #NYSED-5998
    Then I softly see field "Advance Payment Allowed?" as "No"
    Then I softly do not see field "First Payment %" added after "Advance Payment Allowed?"
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "NYSED_IsAdvancePermitted__c"
    And I click on "Save" in the page details
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "First Payment %" added after "Advance Payment Allowed?"
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | To submit, First Payment % is required in the Overview tab under the Program Specific Settings section. |
    And I click on "Edit" in the page details
    And I enter value "-23" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | First Payment % cannot be negative. |
    And I enter value "101" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | First Payment % cannot be greater than 100%. |
    And I enter value "emk2" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see field "First Payment %" as ""
    And I click on "Edit" in the page details
    And I enter value "99.999" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see field "First Payment %" as "99.99%"
    And I click on "Edit" in the page details
    And I enter value "100" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see field "First Payment %" as "100.00%"
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    Then I softly see "The percentage of the approved budget that will be forwarded to the agency as a first payment. Input 0, for no advance" shown as help text

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |

  @NYSED-6000 @NYSED-Sprint-30 @US-NYSED-5970 @M04
  Scenario Outline:Verify that the Announcement Owner can see that the ‘First Payment %’ value is copied from Program, and it is editable on the announcement layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Overview" sub tab
    #NYSED-6000
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "First Payment %" as "12.60%"
    And I click on "Edit" in the page details
    And I enter value "-23" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | First Payment % cannot be negative. |
    And I enter value "101" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | First Payment % cannot be greater than 100%. |
    And I enter value "emk2" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see field "First Payment %" as ""
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |
    And I click on "Edit" in the page details
    And I enter value "99.999" into field "First_Payment__c"
    And I click on "Save" in the page details
    Then I softly see field "First Payment %" as "99.99%"

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |

  @NYSED-5197 @NYSED-Sprint-29 @US-NYSED-5187 @M04
  Scenario Outline:Verify that the system shows a validation message and prevents saving when an Internal User attempts to create a Program with a fund code that already exists (in any status).
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I save the field labeled "Fund Code" as "FundCode"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    #NYSED-5197
    Then I softly can see top right button "Save" in page detail
    Then I softly see that "Program__r.Fund_Code__c" rendered in view mode only
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "{SavedValue:FundCode}" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    #NYSED-5197
    Then I softly see the following messages in the page details contains:
      | A program for this Fund Code ({SavedValue:FundCode}) already exists. |
    And I click modal button "Close"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role    |
      | Automation FD  | Program Contact |
      | Automation EXE | Fiscal Contact  |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:FD Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "{SavedValue:FundCode}" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    #NYSED-5197
    Then I softly see the following messages in the page details contains:
      | A program for this Fund Code ({SavedValue:FundCode}) already exists. |
    And I click modal button "Close"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "{SavedValue:FundCode}" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    #NYSED-5197
    Then I softly see the following messages in the page details contains:
      | A program for this Fund Code ({SavedValue:FundCode}) already exists. |
    And I click modal button "Close"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    And I click on "Activate" in the page details
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I wait for "2" seconds
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter value "{SavedValue:FundCode}" into field "Fund_Code__c"
    And I click modal button "Save and Continue"
    #NYSED-5197
    Then I softly see the following messages in the page details contains:
      | A program for this Fund Code ({SavedValue:FundCode}) already exists. |

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | PO       |
#      | FO       |

  @NYSED-9307 @Sprint-33 @US-NYSED-8850 @M04
  Scenario Outline: Verify that the Program Owner can see that Carry Over field is marked as required to save on the Internal Program layout → Overview tab → Program Specific Settings section.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter unique value in field with apiName "Fund_Code__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Carry Over" as "No" in "Program Specific Settings" pageblock
    Then I softly see asterisk mark on "Carry Over"
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "--None--" into field "NYSED_CarryOver__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Carry Over is required in the Overview tab under the Program Specific Settings section. |
    And I enter value "Yes" into field "NYSED_CarryOver__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Carry Over" as "Yes" in "Program Specific Settings" pageblock

    Examples:
      | UserType |
      | PM       |

  @NYSED-6537 @Sprint-30 @US-NYSED-6262 @M04
  Scenario Outline: Verify that a validation message is displayed on Save when ‘Carry Over Limit’ is set to Yes and the ‘Carry Over Limit %’ field is left blank.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I enter unique value in field with apiName "Fund_Code__c"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    Then I navigate to "Overview" sub tab
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    And I enter value "Yes" into field "NYSED_CarryOver__c"
    And I enter value "Yes" into field "NYSED_CarryOverLimit__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Carry Over Limit % as Carry Over Limit is set to 'Yes'. |
    And I enter value "No" into field "NYSED_CarryOverLimit__c"
    Then I softly cannot see field "Carry Over Limit %" inside page block
    And I enter value "Yes" into field "NYSED_CarryOverLimit__c"
    And I enter value "11" into field "NYSED_CarryOverLimitPercent__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Carry Over Limit %" as "11.00%" in "Announcement Specific Settings" pageblock

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |