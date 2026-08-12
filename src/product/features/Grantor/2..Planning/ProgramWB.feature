@programWB @grantor-regression @grantor-parallel-regression @planning @regression
Feature: Validate all scenarios for program

  @109448 @VerifySelectionOfChildOrganization @programWBAPI @programWBAPI
  Scenario: Verifying if the user is able to change or add child organization to created program
    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I pause execution for "3" seconds

    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Edit" in the page details
    And I click on remove for lookup from field "Account__c"
    And I enter in the value "Test Automation Organization" in lookup field
    And I click on "Save" in the page details
    Then I softly see field "Internal Organization" as "Test Automation Organization"

  @105386 @VerifyCreationOfStrategicPlanWithFOProfile
  Scenario: Verifying FO user is not able to create Strategic plan
    Given I login to "Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"

  @111272 @111182 @111191 @VerifyActivationOfNGOProgram  @buglogged138933 @programWBAPI
  Scenario Outline: Verifying record owner is able to activate NGO program
    Given I create program records with status "Submitted For Approval" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "2" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I pause execution for "5" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 2  |
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I pause execution for "3" seconds
#    And I click on "Submit For Approval" in the page details
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Program Name>" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "<Program Name>" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    #111182 #monu
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "<Program Name>" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "<Program Name>" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    #111191 #monu
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime External Program} |

  @110502 @110501 @VerifyEditOfCreatedNGOProgram @programWBAPI
  Scenario Outline: Verifying record owner is able to activate NGO program
    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    Given I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    Then I softly can see row level action button "Edit" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    #110504 #monu
    And I pause execution for "2" seconds
    Then I softly can see row level action button "Delete" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    #110501 #monu
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    Then I softly can see row level action button "View" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---program:-:ExternalNGOProgramTableId---"

    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime External Program} |

  @110352 @VerifyAccessOfNGOProgramCreationForFOUser
  Scenario: Verifying FO user do not have access to create NGO program
    Given I login to "Grantor" app as "FO" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    Then I cannot see top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"

  @111167 @VerifyDeletionOfAssociatedContactAtNGOProgram  @buglogged138933 @programWBAPI
  Scenario: Verifying user is able to delete associated contacts from NGO program
    Given I create program records with status "Active" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I click on "Remove" icon for "NGO Contact" inside flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    Then I softly see "Record removed successfully." inside flex table with id "---program:-:ExternalNGOProgramContactTableId---"

  @111264 @111183 @VerifyTaskCreationForNGOProgramActivation  @buglogged138933 @programWBAPI
  Scenario: Verifying record owner should receive generated task inside pending for Program activation after approval of program
    Given I create program records with status "Submitted For Approval" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    And I pause execution for "4" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 2  |
#    And I pause execution for "3" seconds
#    And I click on "Submit For Approval" in the page details
#    And I pause execution for "3" seconds
#    When I "Approve" in the approval decision
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    #111183 #monu
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @111226 @VerifyProgramNotEditableAfterSubmission  @buglogged138933 @programWBAPI
  Scenario Outline: Verifying NGO Program record is not editable once program is submitted for approval
    Given I create program records with status "Submitted For Approval" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I pause execution for "3" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 2  |
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    And I click on "Submit For Approval" in the page details
#    And I pause execution for "3" seconds
#    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime External Program} |

  @111416 @VerifyRejectionOfNGOProgram  @buglogged138933 @programWBAPI
  Scenario: Verifying Executive approver is able to reject NGO Program
    Given I create program records with status "Submitted For Approval" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "2" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I pause execution for "5" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 2  |
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    And I wait for "2" seconds
#    And I click on "Submit For Approval" in the page details
#    And I wait for "2" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Disapprove" in the approval decision
    Then I softly see the following messages in the page details contains:
      | Successfully Disapproved |
    And I wait for "3" seconds
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @111514 @VerifyForwardOfNGOProgram @programWBAPI
  Scenario: Verifying user is able to forward NGO Program to another user during Approval process
    Given I create program records with status "Submitted For Approval" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "2" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I pause execution for "5" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 2  |
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    And I pause execution for "3" seconds
#    And I click on "Submit For Approval" in the page details
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |

  @111515 @VerifySendBackFunctionalityForNGOProgram  @buglogged138933 @programWBAPI
  Scenario: Verifying user is able to send back NGO Program to owner
    Given I create program records with status "Submitted For Approval" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "2" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I pause execution for "5" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 2  |
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    And I pause execution for "3" seconds
#    And I click on "Submit For Approval" in the page details
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
#    And I softly see the following messages in the page details contains:
#      | Successfully sent to Owner. It may take few minutes to process record. |

  @140943 @Verify1StepApprovalAtNGOProgram-RnRFunctionality
  @140941 @Verify2StepApprovalForNGOProgram-RnRFunctionality
  Scenario: Validate user can add step1 as an approver for created NGO Program
  | Validate user can add two step approval for NGO program and complete the approval |
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    Then I softly see "Saved Successfully!" inside flex table with id "---program:-:extapproverTableId---"
    #140941
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @140332 @VerifyErrorMessageAtApproverSectionWhileSkippingAtNGOProgram-RnRFunctionality  @bugonAutoorg @needtoCheckafterorgrefresh
  Scenario: Validate user cannot skip approver step on NGO program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |

  @141801 @VerifyErrorMessageWhileSkippingStepsForNGOProgram-RnRFunctionality @programWBAPI
  Scenario: Verify the validation message is displayed when user skip the approval steps on NGO program
    Given I create program records with status "Active" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"

#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 4  |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - You cannot skip an Approval Step. |

  @169882 @169884 @169886 @169897 @169896 @169898 @ValidateusershouldabletoseenewGrantorPreapplicationformunderthesetuptabinInternalPrograms @sprint-7 @programWBAPI
  Scenario Outline: Validate user should able to see new Grantor Pre application form under the setup tab in Internal Programs
    Given I create program records with status "Created" using "Owner-Automation <User>" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "Edit" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Setup" sub tab
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---program:-:businessFormTableId---"
     #169884
    Then I softly can see row level action button "Preview" against "Grantor Pre-application Form" in flex table with id "---program:-:businessFormTableId---"
     #169886
    And I click on "Preview" icon for "Grantor Pre-application Form" inside flex table with id "---program:-:businessFormTableId---" without waiting for record
    Then I softly see "Preview Package" opens in overLay window
     #169897
    Then I softly can see row level action button "Preview" against "Standard Pre-Application form" in flex table with id "---program:-:previewPackageTableId---"
     #169896
    And I pause execution for "10" seconds
    When I hovering mouse on page block help text icon inside table "---program:-:previewPackageTableId---" for LWC
    Then I softly see "<new_helpText>" shown as help text
     #169898
    And I click on "Preview" icon for "Standard Pre-Application form" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see new tab is opened

    Examples:
      | User | new_helpText                                                 |
      | EXE  | Section Displays List of Forms Associated with this Package. |
      | PM   | Section Displays List of Forms Associated with this Package. |

  @174411 @ValidateusershouldabletoseeGrantorPreApplicationforminPackages @sprint-7
  Scenario: Validate user should able to see Grantor Pre Application form in Packages
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    When I perform quick search for "Grantor Pre-application Form" in "---program:-:packagesTableId---" panel
    Then I softly see value "Grantor Pre-application Form" for title "Package Name" inside table "---program:-:packagesTableId---"
    And I expand nested table containing column value "Grantor Pre-application Form"
    Then I softly see value "Standard Pre-Application form" for title "Form Name" inside table "---program:-:packagesTableId---"

  #Task/Owenership Re-assignment Scenarios
  @197300 @ValidatePMuserisabletotransferhisowntaskofthetasktypeActivatetheProgramstatusasInprogresstoanotherPMuserforinternalprogram @sprint-4  @reassignment @ownvai @programWBAPI
  Scenario: Validate PM user is able to transfer his own task of the task type Activate the Program status as In progress to another PM user for internal program
    Given I create program records with status "Approved" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal

    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I save the value from row "1" for column name "EGMS ID" as "ProgramEGMSID" from flex table "---program:-:programsTableId---"
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    #TODO: Vaibhav to check with Program status-- It's showing Created instead of Approved
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "10" seconds
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "In Progress" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I save the value from row "1" for column name "Created By" as "created" from flex table "---program:-:programsTableId---"
    Then I softly see value "{SavedValue:created}" for title "Created By" inside table "---program:-:programsTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName1" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName1}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I cannot see top right button "Activate" in page detail

  @197309 @ValidateEXEuserisabletotransferhisowntaskofthetasktypeActivateNGOProgramstatusaInprogresstoanotherEXEuserforexternalprogram @sprint-4  @reassignment @taskreassign @programWBAPI
  Scenario: Validate EXE user is able to transfer his own task of the task type Activate NGO Program status as In progress to another EXE user for external program
    Given I create program records with status "Approved" using "Owner-Automation EXE" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I save the value from row "1" for column name "EGMS ID" as "ProgramEGMSID" from flex table "---program:-:ExternalNGOProgramTableId---"
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "10" seconds
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "In Progress" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I save the value from row "1" for column name "Created By ID" as "created" from flex table "---program:-:ExternalNGOProgramTableId---"
    Then I softly see value "{SavedValue:created}" for title "Created By ID" inside table "---program:-:ExternalNGOProgramTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName1" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName1}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I cannot see top right button "Activate" in page detail

  @197312 @ValidatereassignedtaskownerPMuserisabletoactivatetheinternalprogramifanothePMtransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskasNotstarted @sprint-4  @reassignment @programWBAPI
  Scenario: Validate reassigned task owner PM user is able to activate the internal program if another PM transfers task of the task type Activate the Program when status of task as Not started
    Given I create program records with status "Approved" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "PM" user

#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "3" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I pause execution for "5" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision

    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I save the value from row "1" for column name "EGMS ID" as "ProgramEGMSID" from flex table "---program:-:programsTableId---"
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly can see row level action button "Start" against "Record Id" in flex table with id "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly see fields "input" is in edit mode
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    And I pause execution for "3" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I can see top right button "Amend Program" in page detail

  @199391 @ValidatereassignedtaskownerEXEuserisabletoactivattheinternalprogramifadmintransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskisInProgress @sprint-4  @reassignment @programWBAPI
  Scenario: Validate  reassigned task owner EXE user is able to activate the internal program if admin transfers task of the task type Activate the Program when status of task is In Progress
    Given I create program records with status "Approved" using "Owner-Automation EXE1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "EXE1" user

#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
#      | Reviewer Name | Responsibility  | Description                 | Due Date |
#      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
#    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
#    And I wait for "2" seconds
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Home" tab
#    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
#    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
#    And I navigate to "Responsibilities" sub tab
#    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
#    And I wait for "2" seconds
#    When I enter in modal value "Cannot Rate" into field "Rating__c"
#    And I enter in modal value "Passed" into field "ReviewComments__c"
#    When I click modal button "Save"
#    And I click on submit review
#    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
#    And I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | Step 1  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Complete Review" in the page details
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal

    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I save the value from row "1" for column name "EGMS ID" as "ProgramEGMSID" from flex table "---program:-:programsTableId---"

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE1" into field "input-source"
    And I select value "Automation EXE" into field "input-target"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "In Progress" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName1" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName1}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I can see top right button "Amend Program" in page detail

  @195200 @195206 @195208 @195211 @ValidateAdminusershouldabletoseethenewoptionofownershipunderreassignsectiononleftnavigationbarofAsaGrantorApp @sprint-4  @reassignment
  Scenario: Validate Admin user should able to see the new option of ownership under reassign section on left navigation bar of As a Grantor App
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
     #195206
    Then I see "My Tasks" inside "Reassign" is displayed
     #195208
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    Then I softly see fields "input-1" is in edit mode
     #195211
    And I enter value "Automation FO" in reassign lookup
    And I pause execution for "4" seconds
    Then I softly see "Automation FO" inside auto search result
    Then I softly see "Automation FO1" inside auto search result
    And I select value "Automation FO" into field "input-1"
    Then I softly see fields "input-2" is in edit mode
    And I enter value "Automation FO1" in reassign lookup
    Then I softly see "Automation FO1" inside auto search result
    And I refresh the page
    And I select value "Automation FO" into field "input-1"
    And I enter value "Undertaker FO" in reassign lookup
    Then I softly do not see "Undertaker FO" inside auto search result

  @195212 @Validateusershouldabletoreassigntheownershiptaskbetweensameprofileandthesameorganization @sprint-4  @reassignment @ownvai
  Scenario: Validate user should able to re-assign the ownership task between same profile and the same organization
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I wait for "5" seconds
    #And I save the value from row "1" for column name "Owner" as "OwnerName1" from flex table "---program:-:adminTargetOwnerReplaceTableId---"
    Then I see value "Automation PM1" for title "Owner" inside table "---program:-:adminTargetOwnerReplaceTableId---"

  @195222 @ValidateuserselectsourceuserasPMuser&targetuserasEXEuserthenusershouldgetanerrorafterclickingontheStarticon @sprint-4  @reassignment
  Scenario: Validate user select source user  as PM user & target user as EXE user then user should get an error after clicking on the Start icon
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I enter value "Automation EXE" in reassign lookup
    Then I softly do not see "Automation EXE" inside auto search result

  @195223 @ValidateuserselectsourceuserasPMuser&targetuserasFDuserthenusershouldgeterrormessageafterclickingontheplayicon @sprint-4  @reassignment
  Scenario: Validate user select source user  as PM user & target user as FD user then user should get error message after clicking on the play icon
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Pratiksha PM" into field "input-1"
    And I enter value "Automation FD" in reassign lookup
    Then I softly do not see "Automation FD" inside auto search result

  @195234 @Validateusershouldnavigatedtothesepagewhereusershouldabletoseelistofalltheprogramsafterclickonreassignbutton/icon @sprint-4  @reassignment
  Scenario: Validate user should navigated to these page where user should able to see list of all the programs after click on reassign button/icon
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    Then I softly see "Programs Available for Reassignment " page block displayed

  @195251 @195254 @ValidateProgramSourceusershouldshowalltheprogramsInternalProgramNGOexternalprogramsofthesourceuser @sprint-4  @reassignment @programWBAPI
  Scenario: Validate Program -Source user should show all the programs(Internal Program/NGO external programs of the source user
    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |

#    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter in modal "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
#    And I click on "Save" in the page details
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I login to "Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I save the value from row "1" for column name "EGMS ID" as "ProgramEGMSID" from flex table "---program:-:programsTableId---"
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I save the value from row "1" for column name "EGMS ID" as "ProgramEGMSID1" from flex table "---program:-:ExternalNGOProgramTableId---"

    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "Program ID" inside table "---program:-:adminOwnerReplaceTableId---"
    #195254
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID1}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"

  @195259 @ValidateUserisenforcedtoselectonrecordbyusingcheckboxpostclickonthetransferownershipbutton  @sprint-4  @reassignment
  Scenario: Validate User is enforced to select on record by using check box post click on the transfer ownership button
    When I login to "Grantor" app as "Admin" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see the following messages in the page details contains:
      | You need to select at least one record |

  @195268 @Validatetherecordistransferredthenusershouldabletoseethesamerecordinthetargetuserstable @sprint-4  @reassignment @programWBAPI
  Scenario: Validate the record is transferred then user should able to see the same record in the target user's table
    Given I create program records with status "Created" using "Owner-Automation EXE" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime Internal Program}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:Automation Runtime Internal Program}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"

  @195273 @195278 @195277 @Validateuserclickontransferbuttonusershouldgetfollowingwarningmessage @sprint-4  @reassignment @programWBAPI
  Scenario: Validate user click on transfer button user should  get following warning message
    Given I create program records with status "Created" using "Owner-Automation EXE" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:adminOwnerReplaceTableId---" panel
    And I save the value from row "1" for column name "Program ID" as "ProgramEGMSID" from flex table "---program:-:adminOwnerReplaceTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    #195278
    And I click "Cancel" on modal confirmation box
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminOwnerReplaceTableId---"
    #195277
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    Then I softly see the following messages in the page details contains:
      | Transfer is in progress, Kindly wait for email confirmation (Warning: if another user has already performed this action, no further processing will take place) |

  @195317 @195347 @ValidateownershipistransferredforaProgramincreatedstateValidateallthevisibilityofallthebuttonsoftheprogramisavailabletothenewowner @sprint-4  @reassignment @FieldHistoryExclude @programWBAPI
  Scenario: Validate ownership is transferred for a Program in created state Validate all the visibility of all the buttons of the program is available to the new owner
    Given I create program records with status "Created" using "Owner-Automation PM1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |

#    When I login to "Grantor" app as "PM1" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:adminOwnerReplaceTableId---" panel
    And I save the value from row "1" for column name "Program ID" as "ProgramEGMSID" from flex table "---program:-:adminOwnerReplaceTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Overview" sub tab
    Then  I can see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    Then  I can see top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    Then  I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:approverTableId---"
    When I navigate to "Files" sub tab
    Then  I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    #195347
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM" for title "New Value" inside field history table
    Then I softly see value "Automation PM1" for title "Original Value" inside field history table

  @195340 @Validatenameoftheownershouldgetupdatedinresponsibilitytab @sprint-1  @reassignment @programWBAPI
  Scenario: Validate name of the owner should  get updated in responsibility tab
    Given I create program records with status "Created" using "Owner-Automation PM1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"

  @196652 @ValidateownershipistransferredforaProgramSubmittedforapprovalValidateapprovercanapprovetheprogram&newprogramownergetstheActivaterelatedtaskandhasbuttonsonUI @sprint-4  @reassignment @programWBAPI
  Scenario: Validate ownership is transferred for a Program Submitted for approval Validate approver can approve the program  & new program owner gets the Activate related task and has buttons on UI
    Given I create program records with status "Submitted For Approval" using "Owner-Automation PM1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I get the "EGMS ID"

#    When I login to "Grantor" app as "PM1" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 2  |

    When I navigate to "Responsibilities" sub tab
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "3" contains text "Approved"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I can see top right button "Amend Program" in page detail
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:completedTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:completedTaskTableId---"

  @196688 @ValidateownershipistransferredforaPrograminSubmittedforReviewstateValidateallthevisibilityofallthebuttonsoftheprogramisavailabletothenewowner @sprint-4  @reassignment @ownvai @programWBAPI
  Scenario: Validate ownership is transferred for a Program in Submitted for Review state Validate all the visibility of all the buttons of the program is available to the new owner
    Given I create program records with status "Created" using "Owner-Automation PM1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
#      | Reviewer Name | Responsibility  | Description                 | Due Date |
#      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |

    When I navigate to "Responsibilities" sub tab
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I pause execution for "3" seconds
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    Then I softly can see row level action button "Edit" against "Automation EXE" in flex table with id "---program:-:peerReviewTableId---"
    And I pause execution for "3" seconds
    Then I softly can see row level action button "Delete" against "Automation EXE" in flex table with id "---program:-:peerReviewTableId---"
    And I pause execution for "3" seconds
    Then I softly can see row level action button "Send for Review" against "Automation EXE" in flex table with id "---program:-:peerReviewTableId---"
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly can see top right button "Complete Review" in page detail
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "2" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I click on Menu icon present on top right corner of the page
    Then I softly can see top right button "Submit For Approval" in page detail

  @196706 @Validatepeerreviewtasksnotstartedremainwithassignedreviewer&arenotautomaticallyassignedtonewownerofprogramwhenownershipofsuchinternalsprogramistransferred @sprint-4  @reassignment @programWBAPI
  Scenario: Validate peer review tasks (not started) remain with assigned reviewer & are not automatically assigned to new owner of program when ownership of such internals program is transferred
    Given I create program records with status "Created" using "Owner-Automation PM1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
#      | Reviewer Name  | Responsibility   | Description                 | Due Date |
#      | Automation EXE | Program Reviewer | Automation Test Description | 10       |

    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:peerReviewTableId---" by clicking "Edit" :
      | Status  | Reviewer Name  | Allow Record Editing |
      | Created | Automation EXE | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I see value "Review Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @196764 @ValidatethevisibilityofallthebuttonsoftheprogramisnotavailablefortheinitialownerwhenownershipistransferredtonewuserforaPrograminSubmittedforReviewstate @sprint-4  @reassignment @programWBAPI
  Scenario: Validate the visibility of all the buttons of the program is not available for the initial owner when ownership is transferred to a new user for a Program in Submitted for Review state
    Given I create program records with status "Created" using "Owner-Automation PM1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "10" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
#      | Reviewer Name  | Responsibility   | Description                 | Due Date |
#      | Automation EXE | Program Reviewer | Automation Test Description | 10       |

    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:peerReviewTableId---" by clicking "Edit" :
      | Status  | Reviewer Name  | Allow Record Editing |
      | Created | Automation EXE | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly cannot see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then  I cannot see top right button "New" in flex table with id "---program:-:peerReviewTableId---"

  @196693 @Validatetasksareremovedforoldowner&newprogramownergetstheActivaterelatedtaskandhasbuttonsonUIwhenownershipistransferredforaProgramofapprovedstatus @sprint-4  @reassignment @programWBAPI
  Scenario: Validate tasks are removed for old owner & new program owner gets the Activate related task and has buttons on UI when ownership is transferred for a Program of approved status
    Given I create program records with status "Approved" using "Owner-Automation EXE" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "4" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:adminOwnerReplaceTableId---" panel
    And I save the value from row "1" for column name "Program ID" as "ProgramEGMSID" from flex table "---program:-:adminOwnerReplaceTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:completedTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail

  @196699 @Validateapprovercanapprovetheexternalprogram&newownergetstheActivaterelatedtasksandhasbuttonsonUIwhenownershipistransferredforaExternalProgramSubmittedforapproval  @sprint-4  @reassignment @programWBAPI
  Scenario: Validate  approver can approve the external program & new owner gets the Activate related tasks and has buttons on UI when ownership is transferred for a External Program Submitted for approval
    Given I create program records with status "Submitted for Approval" using "Owner-Automation PM1" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 2  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    And I wait for "5" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I navigate to "History" sub tab
    And I wait for "3" seconds
    Then I softly see column "Overall Status" at position "3" contains text "Approved"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:completedTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:completedTaskTableId---"

  @197125 @Validateownershiptasksareroutedtoappropriateuserwhentransferofownershipisdonesimultaneouslyfor4internalprogramsindifferentstateshasrelatedtasksonthem @sprint-4  @reassignment @programWBAPI
  Scenario: Validate ownership & tasks are routed to appropriate user when transfer of ownership is done simultaneously for 4 internal programs in different states & has related tasks on them
    Given I create program records with status "Created" using "Owner-Automation PM1" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"

    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:peerReviewTableId---" by clicking "Edit" :
      | Status  | Reviewer Name  | Allow Record Editing |
      | Created | Automation EXE | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"

#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "10" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
#      | Reviewer Name  | Responsibility   | Description                 | Due Date |
#      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
#    And I pause execution for "2" seconds
#    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
#    And I pause execution for "5" seconds

    #Program2
    Given I create program records with status "Created" using "Owner-{SavedValue:PM1 Username},approver1-{SavedValue:FO Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Name                      | Program |
      | {SavedValue:FO Username}  | Step 1  |
      | {SavedValue:EXE Username} | NA      |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "10" seconds

#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |

    #Program3
    Given I create program records with status "Approved" using "Owner-{SavedValue:PM1 Username},approver1-{SavedValue:EXE Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID3"

#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID3"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision

    #Program4
    Given I create program records with status "Approved" using "Owner-{SavedValue:PM1 Username},approver1-{SavedValue:EXE Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    And I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID4"

#    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID4"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:ProgramEGMSID4}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID1}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID2}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID2}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I navigate to "Records of Source User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID3}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID3}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I navigate to "Records of Source User" sub tab
    And I pause execution for "3" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID4}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID4}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID2}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID3}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID3}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID4}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID4}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID2}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Approve Program {SavedValue:ProgramEGMSID2}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Review Program {SavedValue:ProgramEGMSID1}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @197246 @Validateuserselectprogramthenreassignmenthistoryshouldtrackedinthefieldhistorytableinhistorytabforexternalprogram @sprint-4  @reassignment @FieldHistoryExclude @programWBAPI
  Scenario: Validate user select program then reassignment history should tracked in the field history table in history tab for external program
    Given I create program records with status "Active" using "Owner-Automation PM1" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |

#    When I login to "Grantor" app as "PM1" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "NGO Programs - All"
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
#    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
#    And I click on "Activate" in the page details
#    Then I softly see status in Progress-bar is "Active" and is "dark blue"
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime External Program}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:Automation Runtime External Program}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM" for title "New Value" inside field history table
    Then I softly see value "Automation PM1" for title "Original Value" inside field history table

  @198789 @ValidateapprovaltaskassignedtoinitialownerofprogramEXEisnottransferredtonewownerwhenaexternalprograminsubmitforapprovalstatusistransferredtonewownerEXE&emailissenttocorrectowneruponrejecting @sprint-4  @reassignment @programWBAPI
  Scenario: Validate approval task assigned to initial owner of program <EXE> is not transferred to new owner when a external program in submit for approval status is transferred to new owner (EXE) & email is sent to correct owner upon rejecting
    Given I create program records with status "Submitted For Approval" using "Owner-{SavedValue:EXE Username},approver1-{SavedValue:EXE Username},approver2-NA" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "3" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:adminOwnerReplaceTableId---" panel
    And I save the value from row "1" for column name "Program ID" as "ProgramEGMSID" from flex table "---program:-:adminOwnerReplaceTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "50" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    Then I softly see value "Automation EXE1" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Program #{SavedValue:ProgramEGMSID} has been Rejected
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that Program #{SavedValue:ProgramEGMSID} has been rejected.

      Log in to EGMS and click here to see details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com, if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @198790  @sprint-4  @reassignment
  Scenario: Validate newly assigned owner PM receives an email after internal program is sent to owner during approvals when ownership is transferred before post program is Reviewed
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
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
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Announcement | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Step 1       | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "3" seconds
    And I click on "Complete Review" in the page details
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Program | Announcement | Announcement | FDM    | Award | Post Award / Monitoring | Closeout |
      | Step 1  | Step 1       | Step 1       | Step 1 | NA    | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Award |
      | {SavedValue:PM Username} | NA    |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Award  |
      | Automation EXE1 | Step 1 |
    Then I softly can see top right button "Submit For Approval" in page detail
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I "Send to Owner" in the approval decision
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox:Notification: Request to Approve {SavedValue:ProgramEGMSID}
      """
    Then I see the mail text is as follows :
      """
       Hello Automation EXE,

       This email is to notify you that Program #{SavedValue:ProgramEGMSID} has been created and is waiting for your approval.

       Program Details:
       Program ID: {SavedValue:ProgramEGMSID}
       Program Name: {SavedValue:Automation Runtime Internal Program}

       Log in to EGMS and click here to start reviewing the Program.

       Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

       Thank you.
       The EGMS Team
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    When I navigate to "Overview" sub tab
    Then  I can see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    Then  I can see top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    Then  I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:approverTableId---"
    When I navigate to "Files" sub tab
    Then  I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"

  @199612 @validateownershipreassignmentissuccessfulforainternalprogramonRejectedstatus @sprint-4  @reassignment @programWBAPI
  Scenario: Validate ownership reassignment is successful for a internal program on Rejected status
    Given I create program records with status "Rejected" using "Owner-{SavedValue:PM1 Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |

#    When I login to "Grantor" app as "PM1" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "10" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                      | Program |
#      | {SavedValue:EXE Username} | Step 1  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Reject" in the approval decision
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:adminOwnerReplaceTableId---" panel
    And I save the value from row "1" for column name "Program ID" as "ProgramEGMSID" from flex table "---program:-:adminOwnerReplaceTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Rejected"

  @197314  @sprint-4  @reassignment @ownvai @programWBAPI
  Scenario: Validate reassigned task owner EXE user is able to activate the external program if another EXE transfers task of the task type Activate NGO Program when status of task as Not started
    Given I create program records with status "Approved" using "Owner-{SavedValue:EXE Username}" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @197549 @ValidateownershiptasksareroutedtoretainedbyappropriateuserwhentaskshavingdifferentpurposearereassignedsimultaneouslytoanotherPMuserfor3differentexternalprograms @sprint-4  @reassignment @programWBAPI
  Scenario: Validate ownership & tasks are routed to retained by appropriate user when tasks having different purpose are reassigned simultaneously to another PM user for 3 different external programs
    #Program1
    Given I create program records with status "Submited For Approval" using "approver1-{SavedValue:PM1 Username},approver2-NA" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "4" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name          | Program |
#      | Automation PM | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name           | Program |
#      | Automation PM1 | Step 1  |
#    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details

    #Program2
    Given I create program records with status "Submited For Approval" using "Owner-{SavedValue:EXE Username},approver1-{SavedValue:PM1 Username},approver2-NA" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"

#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "4" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name          | Program |
#      | Automation PM | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name           | Program |
#      | Automation PM1 | Step 1  |
#    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details

    #Program3
    Given I create program records with status "Approved" using "Owner-{SavedValue:PM1 Username},approver1-{SavedValue:PM1 Username},approver2-NA" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"

#    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "4" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name          | Program |
#      | Automation PM | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name           | Program |
#      | Automation PM1 | Step 1  |
#    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I "Approve" in the approval decision

    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    And I click on advance filter of table id "---program:-:grantorTaskReassignTableId---" for LWC
    And I enter advance filter values inside id "---program:-:grantorTaskReassignTableId---" for LWC
      | EGMS ID | contains | {SavedValue:ProgramEGMSID} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I click on top right button "Clear" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I enter advance filter values inside id "---program:-:grantorTaskReassignTableId---" for LWC
      | EGMS ID | contains | {SavedValue:ProgramEGMSID1} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID1}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID1}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I click on top right button "Clear" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I enter advance filter values inside id "---program:-:grantorTaskReassignTableId---" for LWC
      | EGMS ID | contains | {SavedValue:ProgramEGMSID2} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:ProgramEGMSID2}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID2}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started " for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID2}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Approve NGO Program {SavedValue:ProgramEGMSID1}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID1}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation EXE" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID2}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID2}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

  @199388 @ValidatereassignedtaskownerPMuserisabletoactivatetheexternalprogramifadmintransferstaskofthetasktypeActivateNGOProgramwhenstatusoftaskisNotStarted @sprint-4  @reassignment @programWBAPI
  Scenario: Validate reassigned task owner PM user is able to activate the external program if admin transfers task of the task type Activate NGO Program when status of task is Not Started
    Given I create program records with status "Approved" using "Owner-{SavedValue:PM1 Username},approver1-{SavedValue:FO Username},approver2-NA" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    When I login to "Grantor" app as "PM1" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "2" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I pause execution for "5" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @199398  @sprint-4  @reassignment @programWBAPI
  Scenario: Validate reassigned task owner ADMIN user is able to activate the external program when he she transfers task of the task type Activate NGO Program to another user having profile as ADMIN
    Given I create program records with status "Approved" using "Owner-{SavedValue:ADMIN Username},approver1-{SavedValue:ADMIN1 Username},approver2-NA" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    When I login to "Grantor" app as "ADMIN" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "10" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name              | Program |
#      | Automation ADMIN1 | Step 1  |
#    Then I softly see value "Automation ADMIN1" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "ADMIN1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation ADMIN" into field "input-source"
    And I select value "Automation ADMIN1" into field "input-target"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    And I pause execution for "5" seconds
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @199405 @ValidatereassignedtaskownerADMINuserisabletoactivatetheinternalprogramifanotherADMINtransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskasNotstarted @sprint-4  @reassignment @programWBAPI
  Scenario: Validate reassigned task owner ADMIN user is able to activate the internal program if another ADMIN transfers task of the task type Activate the Program when status of task as Not started
    Given I create program records with status "Approved" using "Owner-{SavedValue:ADMIN Username},approver1-{SavedValue:ADMIN1 Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I login to "Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details
#    And I click on "Edit" in the page details
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I perform quick search for "Automation ADMIN" in "---program:-:associateContactsTableId---" panel
#    When I click "Associate" after selection of "Automation ADMIN" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click modal button "Close"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Strategic Objectives Admin" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click modal button "Close"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I perform quick search for "Automation Permanent KPI For Admin" in "---program:-:associateKPITableId---" panel
#    When I click "Associate" after selection of "Automation Permanent KPI For Admin" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    And I click modal button "Close"
#    And I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name              | Program |
#      | Automation ADMIN1 | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name              | Program |
#      | Automation ADMIN1 | Step 1  |
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "ADMIN1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation ADMIN" into field "input-source"
    And I select value "Automation ADMIN1" into field "input-target"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Amend Program" in page detail

  @199393 @ValidatereassignedtaskownerPOuserisabletoactivatetheexternalprogramwhentransferstaskofthetasktypeActivateNGOProgramtoanotheruserhavingprofileasPO @sprint-4  @reassignment @programWBAPI
  Scenario: Validate reassigned task owner PO user is able to activate the external program when transfers task of the task type Activate NGO Program to another user having profile as PO
    Given I create program records with status "Approved" using "Owner-{SavedValue:PO Username},approver1-{SavedValue:FO Username},approver2-NA" properties
      | Title                               | RecordType  |
      | Automation Runtime External Program | NGO Program |
    When I login to "Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime External Program}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime External Program}" inside flex table with id "---program:-:ExternalNGOProgramTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    When I login to "Grantor" app as "PO" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "2" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I pause execution for "3" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:completedTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Completed" for title "Status" inside table "---program:-:completedTaskTableId---"

  #Supporting Document Checklist
  @204027 @ValidateTheinternaluserPMcanadddescriptionandotherdetailsinSupportingDocumentChecklist @sprint-7-US-202724 @programWBAPI
  Scenario: Validate The internal user<PM> can add description and other details in Supporting Document Checklist
    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---"

#    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details

    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    Then I softly see value "Automation test description" for title "Description" inside table "---program:-:checklistTableId---"
    Then I softly see value "Mandatory" for title "Required" inside table "---program:-:checklistTableId---"
    Then I softly see value "Application" for title "Applies To" inside table "---program:-:checklistTableId---"
    Then I softly see value "Active" for title "Status" inside table "---program:-:checklistTableId---"

  @204031 @ValidateUserAdminclickonUploadTemplateiconamodalwillopenanditwillbereplacedbynewmodalnamedasAddFile @sprint-7-US-202724 @programWBAPI
  Scenario: Validate  User <Admin> click on "Upload Template" icon  a modal will open and it will be replaced by new modal named as Add File
    Given I create program records with status "Created" using "Owner-{SavedValue:ADMIN Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record

#    When I login to "Grantor" app as "ADMIN" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details

    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I softly see "Upload Document" opens in overLay window

  @204033 @ValidatenewmodalofaddfilesopenitwillhaveoneoptionUploadFilefromComputer @sprint-7-US-202724 @programWBAPI
  Scenario: Validate new modal of add files open it will have one option Upload File from Computer
    Given I create program records with status "Created" using "Owner-{SavedValue:EXE Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details

    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I see "Upload File from Computer" page block displayed

  @204034 @ValidateUploadFIlesfromComputerwillhavesectionslikeClassificationUploadFileChooseaFileORDragithereDescription @sprint-7-US-202724 @programWBAPI
  Scenario: Validate Upload FIles from Computer will have sections like: Classification, Upload File (Choose a File OR Drag it here), Description
    Given I create program records with status "Created" using "Owner-{SavedValue:EXE Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "5" seconds

    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I see field "Classification" as "Select file classification" on modal
    Then I see field "Upload File" as "Choose a File OR Drag it here" on modal
    Then I softly see field on modal "Description" inside page block

  @204037 @ValidateUserPMcanseetwobuttonsatthebottomofUploadFilesfromComputerUploadItwillenableonlyafterwechooseafiletouploadelseitwillbedisabled @sprint-7-US-202724 @programWBAPI
  Scenario: Validate User PM can see two buttons at the bottom of Upload Files from Computer Upload It will enable only after we choose a file to upload else it will be disabled
    Given I create program records with status "Created" using "Owner-{SavedValue:EXE Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details

    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Others" at upload file modal
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library

  @204036 @ValidateUserPMcanseetwobuttonsatthebottomofUploadFilesfromComputerupload&Cancel @sprint-7-US-202724 @programWBAPI
  Scenario: Validate User PM can see two buttons at the bottom of Upload Files from Computer upload & Cancel
    Given I create program records with status "Created" using "Owner-{SavedValue:EXE Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details

    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I see "Upload" button is disabled at modal under library
    Then I see "Cancel" button is displayed On Modal

  @204038 @ValidateCancelbuttonIfclickonCancelthanthemodalwillcloseanddetailsfilledwillbelost @sprint-7-US-202724 @programWBAPI
  Scenario: Validate Cancel button If click on Cancel than the modal will close and details filled will be lost
    Given I create program records with status "Created" using "Owner-{SavedValue:ADMIN Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record

#    When I login to "Grantor" app as "ADMIN" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details

    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I click modal button "Close"
    Then I see value "Not Applicable" for title "Template Link" against the value "Active" inside table "---program:-:checklistTableId---"

  @204046 @ValidateCancelbuttonwillalwaysbeenabled @sprint-7-US-202724 @programWBAPI
  Scenario: Validate Cancel button will always be enabled
    Given I create program records with status "Created" using "Owner-{SavedValue:EXE Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    And I click on "Save" in the page details

    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I do not see "Cancel" button is disabled at modal under library


  @198791 @ValidateemailnotificationregardingReviewcompletionoftheinternalprogramissenttothenewowneruponreviewcompletionwhenownershipistransferredforPrograminSubmittedforReviewstate @sprint-5-US-195182  @reassignment @buglogged-199105
  Scenario: Validate email notification regarding Review completion of the internal program is sent to the new owner upon review completion when ownership is transferred for a Program in Submitted for Review state
    Given I create program records with status "Created" using "Owner-{SavedValue:PM1 Username}" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table

#    When I login to "Grantor" app as "PM1" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "10" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
#      | Reviewer Name | Responsibility  | Description                 | Due Date |
#      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |

    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM1" into field "input-1"
    And I select value "Automation PM" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then  I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Automation EXE" in flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see row level action button "Delete" against "Automation EXE" in flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see row level action button "Send for Review" against "Automation EXE" in flex table with id "---program:-:peerReviewTableId---"
    When I click on "Delete" icon for "Automation EXE" inside flex table with id "---program:-:peerReviewTableId---"
    Then I softly can see top right button "Complete Review" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
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
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Program {SavedValue:ProgramEGMSID} has been PeerReviewed
      """
    Then I see the mail text is as follows :
      """
      This email is to notify you that {SavedValue:ProgramEGMSID} has been peer reviewed.

   Program Details:
   Program ID: {SavedValue:ProgramEGMSID}
   Program Name: {SavedValue:Automation Runtime Internal Program}

   Log in to EGMS and click here to start reviewing the details.

   Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
   Thank you.
   The EGMS Team
      """
    Then I refresh the page
    And I am on "INTERNAL" portal
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I can see top right button "Submit For Approval" in page detail

  @197527 @ValidatereassignedtaskownerPMuserisabletoactivatetheexternalprogramifadmintransferstaskofthetasktypeActivateNGOProgramwhenstatusoftaskisNotStarted @sprint-12-US-226646  @reassignment @
  Scenario: Validate reassigned task owner PM user is able to activate the external program if admin transfers task of the task type Activate NGO Program when status of task is Not Started
    Given I create program records with status "Approved" using "approver1-{SavedValue:FO Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    When I login to "Grantor" app as "PM" user
#    And I navigate to "Planning" tab
#    When I navigate to "External Programs" content inside "Programs" subheader on left panel
#    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
#    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I wait for "5" seconds
#    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
#    When I click on "Save" in the page details
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
#    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    And I click modal button "Close"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:extapproverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-source"
    And I select value "Automation PM1" into field "input-target"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    And I pause execution for "5" seconds
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    And I pause execution for "3" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:adminTaskReassignmentTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate NGO Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @197530 @ValidatereassignedtaskownerEXEuserisabletocompletetheworkflowoninternalprogramifanotherEXEtransferstaskoftypeActivatetheProgramwhenprogramisamendedafteractivation @sprint-12-US-226646  @reassignment
  Scenario: Validate reassigned task owner EXE user is able to complete the workflow on internal program if another EXE transfers task of type Activate the Program when program is amended after activation
    Given I create program records with status "Approved" using "Owner-{SavedValue:EXE Username},approver1-{SavedValue:FO Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

#    When I login to "Grantor" app as "EXE" user
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - Draft"
#    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
#    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
#    And I click modal button "Save and Continue"
#    And I pause execution for "2" seconds
#    When I enter "Edition" values from "Program_Field_Values.xlsx"
#    And I click on "Save" in the page details
#    And I pause execution for "5" seconds
#    And I get the "EGMS ID"
#    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
#    When I navigate to "Overview" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
#    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
#    When I navigate to "Setup" sub tab
#    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
#    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
#    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
#    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
#    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
#    When I navigate to "Responsibilities" sub tab
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:PM Username} | NA      |
#    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
#      | Name                     | Program |
#      | {SavedValue:FO Username} | Step 1  |
#    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
#    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
#    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
#    And I pause execution for "5" seconds
#    And I click on "Submit For Approval" in the page details
#    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
#    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
#    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
#    When I "Approve" in the approval decision
#    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal

    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Amend Program" in page detail

  @162651 @ValidateSystemAdminSAuserscannotreassignpendingtasksforAuditorprofileuser @sprint-12-US-226646  @reassignment
  Scenario: Validate System Admin SA users cannot reassign pending tasks for Auditor profile user
    Given I create program records with status "Created" using "Owner-{SavedValue:PM1 Username},approver1-{SavedValue:FO Username},approver2-NA" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |

    Given I create program records with status "Created" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
    Given I login to "Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Internal Program}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"

    When I login to "Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "Automation ADMIN" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "Automation ADMIN" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Strategic Objectives Admin" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI For Admin" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name              | Program |
      | Automation ADMIN1 | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name              | Program |
      | Automation ADMIN1 | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation AUDITOR"
    And I pause execution for "4" seconds
    Then I softly do not see "Automation AUDITOR" inside auto search result

  @217607 @ValidateInternalProgapproveandownerofprogramaresamevalidateafterreassigningtheapprovaltaskownershipofrecordisnotchanged @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Prog approver and owner of a program are same validate after reassigning the approval task ownership of record is not changed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 2  |
    And I pause execution for "4" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"

  @217752 @ValidateInternalProgadditionalentriesmadeduetoreassignmentforR&Rincontexttonextmodulearecarriedahead @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Prog additional entries made due to reassignment for R&R in context to next module are carried ahead
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Post Award / Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 2  | Step 1                  | Step 1   |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation PM" inside table "---program:-:approverTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on remove for lookup from field "Program__c"
    And I enter in modal value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I wait for "2" seconds
    And I click modal button "Continue"
    And I pause execution for "3" seconds
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"

  @217759 @ValidateInternalProgstepshouldgetupdatedifVictorEXEstep1approverreassignapprovertaskofsamerecordtoScottEXEwhosestepisNAforprogram @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Prog_ Verify step should get updated if Victor EXE step 1 approver reassign approver task of same record to Scott EXE whose step is NA for program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Post Award / Monitoring | Closeout |
      | Automation EXE1 | NA      | Step 1                  | Step 1   |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation EXE1" inside table "---program:-:approverTableId---"

  @217602 @ValidateInternalProgtaskreassignmentdoesnothappenwhenusertriestoreassignhistasktoanotheruserisresponsiblefordifferentstepofsamemodule @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Prog_ Validate task reassignment does not happen when a user tries to reassign his task to another user is responsible for different step of same module
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1  | Step 2       | Step 2 | Step 2 | Step 2                  | Step 2   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation EXE1 | Step 2  | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program | Announcement | FDM    |
      | Automation FO | Step 3  | Step 3       | Step 3 |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "FDM" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Award" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Post Award / Monitoring" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Closeout" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "FDM" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Award" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation EXE1" inside table "---program:-:approverTableId---"

  @223421 @ValidatetransferofpeerreviewtasksisfailedincaseofanyreasonthenR&RonInternalprogramshouldnotgetupdated @sprint-12-US-226646  @reassignment @FieldHistoryExclude
  Scenario: Validate transfer of peer review tasks is failed in case of any reason then R&R on Internal program should not get updated
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | FDM    | Closeout |
      | {SavedValue:PM Username} | Step 1  | Step 1 | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation PM1 | Step 2  | Step 2       | Step 2 | Step 2 | Step 2                  | Step 2   |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name   | Responsibility   | Description                 | Due Date |
      | Automation EXE1 | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:EXE1 Username}" inside table
    And I pause execution for "3" seconds
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly see field "Created by" as "Automation PM"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "FDM" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Closeout" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "FDM" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Announcement" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Award" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Post Award / Monitoring" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Automation EXE" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    Then I softly see value "Automation EXE1" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation PM1" for title "New Value" inside field history table
    Then I softly see value "Automation PM" for title "Original Value" inside field history table
    And I click on back arrow
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @195757 @ValidateEmailistriggeredtoreassigneduserontheclickofReassignAll @sprint-12-US-226646  @reassignment
  Scenario: Validate Email is triggered to the reassigned user on the click of Reassign All
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description                 | Due Date |
      | {SavedValue:PM Username} | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.



      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @217621 @ValidateInternalProgIapeerreviewerisalreadyaddedforsimilarroleandreviewertriestoreassignsuchtasktootherreviewerwithsameresponsibilityprogramreviewervalidatereassignmentfails @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Prog If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (program reviewer)validate reassignment fails
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation FO | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation FO1 | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Automation FO1" inside table
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "fo1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID	Type	Status	Subject	Assigned By	Reason of Failure
      {SavedValue:ProgramEGMSID}	Review Grantor Program	Not Started	Review Program {SavedValue:ProgramEGMSID}	Automation FO	Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @161994 @ValidateForpeerreviewtasksifausertriestoreassignareviewtasktoauserwhowasalreadyassignedasreviewerontherecordandforthesametypeprogramorfiscalthetasksdogetreassigned @sprint-12-US-226646  @reassignment
  Scenario: Validate For peer review tasks, if a user tries to reassign a review task to a user who was already assigned as a reviewer on the record, and for the same type (program or fiscal), the tasks do not get reassigned
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I wait for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "Automation PM" inside table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Automation PM1" inside table
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID	Type	Status	Subject	Assigned By	Reason of Failure
      {SavedValue:ProgramEGMSID}	Review Grantor Program	Not Started	Review Program {SavedValue:ProgramEGMSID}	Automation PM	Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @224662 @ValidateInternalProgramfailureemailshouldgeneratedforapproversandsuccessemailgeneratedforpeerreviewers @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Program failure email should generated for approvers and success email generated for peer reviewers
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement |
      | {SavedValue:PM Username} | Step 1  | Step 1       |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 2  |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 10       |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "Program Reviewer" inside table
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside table
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "All" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I logout
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:ProgramEGMSID} Approve Program Not Started Approve Program {SavedValue:ProgramEGMSID} Automation PM You cannot specify the same user for multiple steps for Program


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID1} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID1} Automation PM {Date:yyyy-MM-dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    Given I login to "Grantor" app as "PM1" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "{SavedValue:ProgramEGMSID1}" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Reviewer Name" against the value "Program Reviewer" inside table "---program:-:peerReviewTableId---"
    Then I softly see value "Automation PM1" for title "Reviewer Name" against the value "Fiscal Reviewer" inside table "---program:-:peerReviewTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "{SavedValue:PM Username}" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"

  @195749 @Validateuserseevalidationmessageifuserhasalreadyre-assignedthetasksandheistryingtore-assigntasksagainandbatchjobisalreadyrunning @sprint-12-US-226646  @reassignment
  Scenario: Validate user see validation message if user has already re-assigned the tasks and he is trying to re-assign tasks again and batch job is already running
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I pause execution for "3" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    Then I softly see the following messages in the page details :
      | Reassignment is still in progress, kindly wait for few minutes. |

  @195279 @ValidateProgramwhentheownershipofrecordischangedthenemailnotificationshouldsenttotheSAuserpreviousowner @sprint-11-US-224734  @reassignment
  Scenario: Validate Program when the ownership of a record is changed then email notification should sent to the SA user(previous owner)
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:ProgramEGMSID} Automation ADMIN Program

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @195280 @ValidateProgramwhentheownershipofrecordischangedthenemailnotificationshouldsenttothenewuser @sprint-11-US-224734  @reassignment
  Scenario: Validate Program when the ownership of a record is changed then email notification should sent to the new user
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I click on top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:ProgramEGMSID} Automation ADMIN Program

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """

  @162073 @ValidateEmailistriggeredtothereassigneduserontheclickofReassignselected @sprint-11-US-224734  @reassignment
  Scenario: Validate Email is triggered to the reassigned user on the click of Reassign selected
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description                 | Due Date |
      | {SavedValue:PM Username} | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation PM {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """


  @191032 @ValidatePlanningPMasrecordownercanseenewlyreassignApprovernameinapproversection @sprint-11-US-224734  @reassignment
  Scenario: Validate Planning PM as record owner can see newly reassign Approver name in approver section
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @195753 @ValidateEmailistriggeredtothereassigneduserontheclickofReassignselected @sprint-7-US-191250  @reassignment
  Scenario: Validate Email is triggered to the reassigned user on the click of Reassign selected
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Responsibility   | Description                 | Due Date |
      | {SavedValue:EXE Username} | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation EXE {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.



      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """
    Given I am on "INTERNAL" portal
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below have been reassigned from [Automation EXE] to [Automation EXE1] successfully. Please find the details below:

      EGMS ID Type Status Subject Assigned By Due Date
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation EXE {Date:yyyy/MM/dd 00:00:00::d+10}


      Because these tasks have been reassigned, the original reviewer may have lost edit access to the record. However, they may still view the record.
      Login in to EGMS and click on EGMS IDs to access the assigned record.



      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """


  @217601 @ValidateInternalProgstep2approverisinsertedforprogramcolumnwhenapprovaltaskisreassigned @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog step2 approver is inserted for program column when approval task is reassigned
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Post Award / Monitoring | Closeout |
      | {SavedValue:PM Username} | Step 2  | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement | Program |
      | {SavedValue:FO Username} | Step 3       | Step 3  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Closeout" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"

  @217603 @validateInternalProgtaskreassignmentissuccessfulwhenusertriestoreassignhistasktoanotheruserisresponsibleforsamestepofdifferentmodules @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog task reassignment is successful when a user tries to reassign his task to another user is responsible for same step of different modules
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | {SavedValue:EXE Username} | Step 1  | Step 2       | Step 2 | Step 2 | Step 2                  | Step 2   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Announcement | FDM    | Award  | Post Award / Monitoring | Closeout |
      | Automation EXE1 | Step 2  | Step 1       | Step 1 | Step 1 | Step 1                  | Step 1   |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement | FDM | Award | Post Award / Monitoring | Closeout |
      | {SavedValue:FO Username} | Step 3  | NA           | NA  | NA    | NA                      | Step 3   |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 3" for title "Program" against the value "Automation FO1" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Post Award / Monitoring" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 3" for title "Closeout" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "FDM" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Award" against the value "Automation FO" inside table "---program:-:approverTableId---"

  @217609 @ValidateInternalProgIfapproverandownerofprogramaresameafterreassigningtheownershipofrecordapprovernameshouldnotchanged @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog If approver and owner of a program are same validate after reassigning the ownership of record approver name should not changed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "Step 3" for title "Program" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"

  @217655 @ValidateInternalProgapproverdefinitionisnotmodifiedoninitialrecordifapproversarechangedatruntime @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog approver definition is not modified on initial record if approvers are changed at runtime
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement |
      | {SavedValue:PM Username} | Step 1  | Step 1       |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I pause execution for "3" seconds
    When I "Approve" in the approval decision
    And I pause execution for "3" seconds
    And I click on Menu icon present on top right corner of the page
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on remove for lookup from field "Program__c"
    When I enter in modal value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I wait for "2" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
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
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:AnnEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM" inside table "---program:-:approverTableId---"

  @217745 @ValidateInternalProgIfpeerreviewerisalreadyaddedforsimilarroleandreviewertriestoreassignsuchtasktootherreviewerwithsameresponsibilityfiscalreviewervalidatereassignmentfails @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (fiscal reviewer) reassignment fails
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation FO1 | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Automation FO1" inside table
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "fo1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID Type Status Subject Assigned By Reason of Failure
      {SavedValue:ProgramEGMSID} Review Grantor Program Not Started Review Program {SavedValue:ProgramEGMSID} Automation FO Responsibilities Tab - A person with the same role cannot be added again.


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """

  @217761 @ValidateInternalProgusershouldgetfailureemailifusertriestoreassignsameuserformultipleapprovalsteps @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog user should get failure email if user tries to reassign same user for multiple approval steps
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program |
      | Automation EXE1 | Step 2  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "120" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Task Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,


      The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

      EGMS ID	Type	Status	Subject	Assigned By	Reason of Failure
      {SavedValue:ProgramEGMSID}	Approve Program	Not Started	Approve Program {SavedValue:ProgramEGMSID}	Automation EXE	You cannot specify the same user for multiple steps for Program


      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you,

      The EGMS Team.
      """


  @217762 @ValidateInternalProgadditionalentriesmadeduetoreassignmentforR&Rincontexttonextmodulearenotcarriedahead @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog additional entries made due to reassignment for R&R in context to next module are not carried ahead
    When I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program | Announcement |
      | {SavedValue:EXE1 Username} | Step 1  | Step 1       |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---program:-:approverTableId---" by clicking "Edit" :
      | Name                       | Announcement |
      | {SavedValue:EXE1 Username} | Step 1       |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click on remove for lookup from field "Program__c"
    When I enter in modal value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I wait for "2" seconds
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation EXE1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation EXE" inside table "---announcement:-:approversTableId---"

  @234010 @ValidateExternalProgramstep2approverisinsertedforprogramcolumnwhenapprovaltaskisreassigned @sprint-13-US-231194  @reassignment
  Scenario: Validate External Program step2 approver is inserted for program column when approval task is reassigned
    When I login to "Grantor" app as "PM" user
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
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | NA      |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 2  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 3  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation PM1" inside table "---program:-:extapproverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM" inside table "---program:-:extapproverTableId---"

  @226835  @sprint-11-US-218319  @reassignment
  Scenario: Validate Internal Prog If a peer reviewer is already added for similar role and reviewer tries to reassign such task to other reviewer with same responsibility (program reviewer)validate reassignment fails Keep target user in created state
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name   | Responsibility   | Description                 | Due Date |
      | Automation EXE1 | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "Automation EXE" inside table
    And I pause execution for "5" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Automation EXE1" inside table
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I checkout to yopmail with mailid "exe.automation.qa2@yopmail.com"
    And I pause execution for "150" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
     Sandbox: Task Reassignment Report
      """

    Then I see the mail text is as follows :
      """
     Hello,


     The task(s) below were failed to reassigned as user was already assigned as a reviewer on this record.

     EGMS ID	Type	Status	Subject	Assigned By	Reason of Failure
     {SavedValue:ProgramEGMSID}	Review Grantor Program	Not Started	Review Program {SavedValue:ProgramEGMSID}	Automation EXE	Responsibilities Tab - A person with the same role cannot be added again.

     Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

     Thank you,

     The EGMS Team.
      """

  @223527 @ValidateProgramModuleifprogramrecordisinsubmittedforreviewstate&submittedreviewbyreviewerafterchangingtheownershipofprogramthenemailshouldbesendtothenewowner @sprint-11-US-217998  @reassignment
  Scenario: Validate Program Module if program record is in submitted for review state & submitted review by reviewer after changing the ownership of  program then email should be send to the new owner
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation PM1 | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "Automation PM1" inside table
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---program:-:peerReviewTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Automation PM1" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "180" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Program {SavedValue:ProgramEGMSID} has been PeerReviewed
      """
    Then I see the mail text is as follows :
      """
      Hello Automation,
      This email is to notify you that Program {SavedValue:ProgramEGMSID} has been peer reviewed.
      Program Details:
      Program ID: {SavedValue:ProgramEGMSID}
      Program Name: {SavedValue:Automation Runtime Internal Program}
      Log in to EGMS and click here to start reviewing the details.
      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.
      Thank you.
      The EGMS Team
      """


  @223481 @ValidateProgramModulaftertransferringthemorethan10recordtonewownerthenallfuturetaskaccessvisibletonewowner @sprint-11-US-217998  @reassignment
  Scenario: Validate Program Module after transferring the more than 10 record to new owner then all future task access visible to new owner
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID3"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID4"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID5"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID6"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID7"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID8"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID9"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation_Bulk_Record" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID10"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    And I pause execution for "5" seconds
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Internal Program For Bulk Records}" in "---program:-:adminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime Internal Program For Bulk Records}" boxes in flex table with id "---program:-:adminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---program:-:adminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID1}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID2}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID3}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID4}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID5}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID5}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID6}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID6}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID7}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID7}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID8}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID8}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID9}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID9}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    When I perform quick search for "{SavedValue:ProgramEGMSID10}" in "---program:-:adminTargetOwnerReplaceTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID10}" for title "Program ID" inside table "---program:-:adminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID1}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then  I can see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    Then  I can see top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    Then  I can see top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    Then  I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:approverTableId---"
    When I navigate to "Files" sub tab
    Then  I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then  I can see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID2}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I can see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    Then I can see top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then I can see top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    Then I can see top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:approverTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID3}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID3}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I can see top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    Then I can see top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then I can see top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    Then I can see top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    Then I can see top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---program:-:peerReviewTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:approverTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID4}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID5}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID5}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID6}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID6}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID7}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID7}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Amend Program" in page detail
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID8}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID8}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Amend Program" in page detail
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID9}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID9}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Amend Program" in page detail
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID10}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID10}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I can see top right button "Amend Program" in page detail
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "10" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Owner Reassignment Report
      """
    Then I see the mail text is as follows :
      """
      Hello,

     The record(s) below have been reassigned from [Automation PM] to [Automation PM1] successfully. Please find the details below:

      EGMS ID Assigned By Module Name
      {SavedValue:ProgramEGMSID1} Automation ADMIN Program
      {SavedValue:ProgramEGMSID2} Automation ADMIN Program
      {SavedValue:ProgramEGMSID3} Automation ADMIN Program
      {SavedValue:ProgramEGMSID4} Automation ADMIN Program
      {SavedValue:ProgramEGMSID5} Automation ADMIN Program
      {SavedValue:ProgramEGMSID6} Automation ADMIN Program
      {SavedValue:ProgramEGMSID7} Automation ADMIN Program
      {SavedValue:ProgramEGMSID8} Automation ADMIN Program
      {SavedValue:ProgramEGMSID9} Automation ADMIN Program
      {SavedValue:ProgramEGMSID10} Automation ADMIN Program

      Because these records have been reassigned, the original reviewer may have only view access to the record.

      Log in to EGMS and click on EGMS IDs to access the assigned record.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this record.

      Thank you,
      The EGMS Team
      """


  @224336 @ValidateInternalProgapprovershouldabletoapproveprogramafterreassigntheforwardedapprovaltasktootherapprover @sprint-11-US-218319  @reassignment
  Scenario: Validate Internal Prog approver should able to approve program after reassign the forwarded approval task to other approver
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation PM1 | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program | Award  |
      | Automation EXE | Step 2  | Step 1 |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "FO1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 2" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Award" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation FO"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @204485 @ValidatePMusercanaddeditdeletenotesonhisInternalProgramincreatedStatus @sprint-7-US-201927  @Notes
  Scenario: Validate PM user can add/edit/delete notes on his Internal Program in created Status
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PM | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:internalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---program:-:internalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"

  @204487 @ValidatePMusercanaddnotesonInternalProgramcreatedbyEXEuserwhenitsstatusiscreated @sprint-7-US-201927  @Notes
  Scenario:Validate PM user can add notes on Internal Program created by EXE user when its status is created
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"

  @204488 @ValidateP0usercanaddnotesonInternalProgramcreatedbyPMuserwhenitsstatusisBeingamended @sprint-7-US-201927  @Notes
  Scenario: Validate P0 user can add notes on  Internal Program created by PM user when its status is Being amended
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "5" seconds
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on "Amend Program" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"

  @204489 @ValidatePMusercanteditdeletenotesaddedbyEXEonaInternalProgramwhenthestatusiscreated @sprint-7-US-201927  @Notes
  Scenario:Validate PM user cant edit/ delete notes added by EXE on a Internal Program when the status is created
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"

  @204512 @ValidateEXEusercantaddnotesbuteditdeletehisnotesonhisInternalPrograminRejectedStatus @sprint-7-US-201927  @Notes
  Scenario: Validate EXE user cant add notes but edit/delete his notes on his Internal Program in Rejected Status
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Created By     | Title         | Description       |
      | Automation EXE | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:internalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:internalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"

  @204513 @ValidatePMuserusercantaddnotesbuteditdeletehisnotesonInternalProgramcreatedbyEXEuserwhenitsstatusisRejected @sprint-7-US-201927  @Notes
  Scenario: Validate PM user user cant add notes but edit/delete his notes on Internal Program created by EXE user when its status is Rejected
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PM | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---program:-:internalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---program:-:internalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"

  @204522 @ValidateAuditorusercantaddeditdeletenotesonaInternalProgram @sprint-7-US-201927  @Notes
  Scenario:Validate Auditor user cant add, edit, delete notes on a Internal Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"

  @204536 @ValidatePMEXEFOcanaddnotesonainternalprogramwhichissubmittedforReview&Reviewed @sprint-7-US-201927  @Notes
  Scenario: Validate PM,EXE,FO can add notes on a internal program which is submitted for Review & Reviewed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record4 | Automation Notes4 |
    Then I softly see value "Notes Record4" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"

  @204537 @ValidatePOFDADMINcanaddnotesonainternalprogramwhichisReviewed @sprint-7-US-201927  @Notes
  Scenario:Validate PO,FD, ADMIN can add notes on a internal program which is Reviewed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "5" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"

  @204544 @204545 @204546 @ValidatePMEXEPOcanaddnotesonainternalprogramwhichissubmittedforapproval&Approved @sprint-7-US-201927  @Notes
  Scenario: Validate PM,EXE,PO can add notes on a internal program which is submitted for approval & Approved
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record4 | Automation Notes4 |
    Then I softly see value "Notes Record4" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    #204545
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record7 | Automation Notes7 |
    Then I softly see value "Notes Record7" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record9 | Automation Notes9 |
    Then I softly see value "Notes Record9" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    #204546
    Then I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title          | Description        |
      | Notes Record10 | Automation Notes10 |
    Then I softly see value "Notes Record10" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title          | Description        |
      | Notes Record11 | Automation Notes11 |
    Then I softly see value "Notes Record11" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title          | Description        |
      | Notes Record12 | Automation Notes12 |
    Then I softly see value "Notes Record12" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"

  @204552 @204587 @ValidateAuditorusercantaddeditdeletenotesonaExternalProgram @sprint-7-US-201927  @Notes
  Scenario: Validate Auditor user cant add, edit, delete notes on a External Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    #204587
    Then I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PM | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PO | Notes Record4 | Automation Notes4 |
    Then I softly see value "Notes Record4" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---program:-:externalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By     | Title         | Description       |
      | Automation EXE | Notes Record7 | Automation Notes7 |
    Then I softly see value "Notes Record7" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---program:-:externalProgramNotesTableId---"

  @204589 @ValidatePMEXEADMINusercanaddeditdeletenotesonExternalPrograminApprovedstatus @sprint-7-US-201927  @Notes
  Scenario: Validate PM,EXE, ADMIN user can add/edit/delete notes on  External Program in Approved status
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "4" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I pause execution for "4" seconds
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PM | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By     | Title         | Description       |
      | Automation EXE | Notes Record4 | Automation Notes4 |
    Then I softly see value "Notes Record4" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes4" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record5" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record5" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record6 | Automation Notes6 |
    Then I softly see value "Notes Record6" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record6" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record6" in flex table with id "---program:-:externalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By       | Title         | Description       |
      | Automation ADMIN | Notes Record7 | Automation Notes7 |
    Then I softly see value "Notes Record7" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes7" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record8 | Automation Notes8 |
    Then I softly see value "Notes Record8" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record8" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record8" for title "Title" inside table "---program:-:externalProgramNotesTableId---"

  @204837 @ValidatePMEXEPOFOFDADMINAuditorusercantaddnotesbuteditanddeletetheirnoteswhenExternalProgramisrejected @sprint-7-US-201927  @Notes
  Scenario: Validate PM, EXE, PO, FO, FD, ADMIN, Auditor user cant add notes but edit and delete their notes when External Program is rejected
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record3 | Automation Notes3 |
    Then I softly see value "Notes Record3" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record4 | Automation Notes4 |
    Then I softly see value "Notes Record4" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title         | Description       |
      | Notes Record5 | Automation Notes5 |
    Then I softly see value "Notes Record5" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation ADMIN" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record5" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record2" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record3" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record4" in flex table with id "---program:-:externalProgramNotesTableId---"

  @204887 @ValidateFiscalReviewerEXEcanaddnotesonaInternalprogramwhenitssentforreviewevenifAllowrecordeditisNo @sprint-7-US-201927  @Notes
  Scenario: Validate Fiscal Reviewer EXE can add notes on a Internal program when its sent for review even if Allow record edit is No
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Created By     | Title         | Description       |
      | Automation EXE | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:internalProgramNotesTableId---"

  @204888 @ValidateProgramReviewerPOcanaddnotesonaInternalprogramwhenallowrecordeditisYesandevenifreviewissubmitted @sprint-7-US-201927  @Notes
  Scenario:Validate Program Reviewer PO can add notes on a Internal program when allow record edit is Yes and even if review is submitted
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date | Allow Record Editing |
      | Automation PO | Program Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PO | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:internalProgramNotesTableId---"

  @204890 @ValidateFiscalReviewerFOhavingAllowrecordeditpermissionasYescanaddnotesonaInternalprogramwhenitsreviewed @sprint-7-US-201927  @Notes
  Scenario:Validate Fiscal Reviewer FO  having Allow record edit permission as Yes, can add notes on a Internal program when its reviewed
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    Then I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    And I edit the following rows inline in flex table with id "---program:-:internalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation FO | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:internalProgramNotesTableId---"

  @204588 @ValidatePMEXEADMINusercanaddeditdeletenotesonExternalPrograminApprovedstatus @sprint-7-US-201927  @Notes @invalid @bug444531
  Scenario: Validate PM,EXE, ADMIN user can add/edit/delete notes on  External Program in Approved status
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    Then I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PM | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation FO | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation FD" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation FD | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Admin" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By       | Title         | Description       |
      | Automation ADMIN | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"

  @204590 @ValidatePMEXEFOPOusercanaddeditdeletenotesonExternalPrograminActivestatus @sprint-7-US-201927  @Notes
  Scenario: Validate PM,EXE, FO,PO user can add/edit/delete notes on  External Program in Active status
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "Record Id" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PM | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation EXE" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By     | Title         | Description       |
      | Automation EXE | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation FO" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation FO | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation PO" for title "Created By" inside table "---program:-:externalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I edit the following rows inline in flex table with id "---program:-:externalProgramNotesTableId---" by clicking "Edit" :
      | Created By    | Title         | Description       |
      | Automation PO | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:externalProgramNotesTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:externalProgramNotesTableId---"

  @204035 @ValidatethatuserEXEshouldhavetwooptionsifIclickonClassificationinUploadFilefromcomputerATemplateforPlanningBOthers @sprint-7-US-202724
  Scenario: Validate that user EXE should have two options if I click on Classification in Upload File from computer A.Template for Planning B. Others
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Template for Planning | Others |

  @330560 @330580 @330611 @330615 @ValidatePMusershouldseevaluepopulatesinSubjectFromAddressToAddressAttentiontoEmailsubjectccaddresscolumnsonMessagessectionundercollabtabofInternalProgram @SystemEmail
  Scenario: Validate PM user should see value populates in " Subject, From Address, To Address, Attention to, Email subject,cc address" columns on Messages section under collab tab of Internal Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    And I send the email under collab tab with following details:
      | To                            | Subject         | Body                       |
      | fo.automation.qa2@yopmail.com | Automation Test | Automation Test Email Body |
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I softly see value "" for title "Attention To" inside table "---program:-:programCollabMessagesTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Subject         | From Address                  | CC Address | To Address                    | Attention To | Email Subject   |
      | Automation Test | pm.automation.merge@yopmail.com|            | fo.automation.qa2@yopmail.com |              | Automation Test |
    #330580
    And I click on "Reply" icon for "Automation Test" inside flex table with id "---program:-:programCollabMessagesTableId---" without waiting for record
    And I send the email under collab tab with following details:
      | To                            | Subject              | Body                          |
      | fo.automation.qa2@yopmail.com | RE: Automation Test1 | Automation Re-Test Email Body |
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I see value "" for title "Attention To" against the value "RE: Automation Test1" inside table "---program:-:programCollabMessagesTableId---"
    #330611
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Subject         | From Address                  | CC Address | To Address                    | Attention To | Email Subject   |
      | Automation Test | pm.automation.merge@yopmail.com|            | fo.automation.qa2@yopmail.com |              | Automation Test |
    #330615
    And I click on "Reply" icon for "Automation Test" inside flex table with id "---program:-:programCollabMessagesTableId---" without waiting for record
    And I send the email under collab tab with following details:
      | To                            | Subject              | Body                                |
      | fo.automation.qa2@yopmail.com | RE: Automation Test2 | Automation Re-Test Email Body Again |
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I see value "" for title "Attention To" against the value "RE: Automation Test2" inside table "---program:-:programCollabMessagesTableId---"

  @331481 @331482 @331479 @331477 @331478 @ValidatethatSarahPMAndPeerReviewerVictorEXEwillseesystemEmailafterSarahPmsendsInternalProgramforPeerreview @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that Sarah PM And Peer Reviewer Victor EXE will see system Email after Sarah Pm sends Internal Program for Peer review
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "exe.automation.qa2@yopmail.com" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "exe.automation.qa2@yopmail.com" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | pm.automation.merge@yopmail.com                                        |
      | exe.automation.qa2@yopmail.com                                        |
      | Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "exe.automation.qa2@yopmail.com" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "exe.automation.qa2@yopmail.com" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | pm.automation.merge@yopmail.com                                        |
      | exe.automation.qa2@yopmail.com                                        |
      | Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review |
    When I close "System Email" modal by clicking the top right x button
    #331482
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "exe.automation.qa2@yopmail.com" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | exe.automation.qa2@yopmail.com                                          |
      | pm.automation.merge@yopmail.com                                          |
      | Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "exe.automation.qa2@yopmail.com" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | exe.automation.qa2@yopmail.com                                          |
      | pm.automation.merge@yopmail.com                                          |
      | Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed |
    When I close "System Email" modal by clicking the top right x button
    #331477
    Then I softly see "Created Date" in flex table header "---program:-:systemEmailsTableId---"
    Then I softly see "From Address" in flex table header "---program:-:systemEmailsTableId---"
    Then I softly see "To Address" in flex table header "---program:-:systemEmailsTableId---"
    Then I softly see "Subject" in flex table header "---program:-:systemEmailsTableId---"
    Then I softly see "Actions" in flex table header "---program:-:systemEmailsTableId---"
    #331478
    Then I softly can see row level action button "View" against "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" in flex table with id "---program:-:systemEmailsTableId---"
    Then I softly can see row level action button "View" against "Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review" in flex table with id "---program:-:systemEmailsTableId---"
    #331479
    And I save the value from row "1" for column name "Subject" as "newSubject" from flex table "---program:-:systemEmailsTableId---"
    Then I softly see that the saved value "{SavedValue:newSubject}" and "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" are equal
    And I save the value from row "2" for column name "Subject" as "oldSubject" from flex table "---program:-:systemEmailsTableId---"
    Then I softly see that the saved value "{SavedValue:oldSubject}" and "Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review" are equal

  @331854 @ValidatethatSystemEmailwillgenerateinmessagestabwhenlastApproverClickonundobuttononApprovedInternalProgram @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that System Email will generate in messages tab when last Approver Click on undo button on Approved Internal Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I can see top right button "Undo" in page detail
    And I click on "Undo" in the page details without processing
    Then I softly see confirmation box with body "WARNING: This action will reopen the approval decision made earlier. Do you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I wait for "180" seconds
    And I navigate to "Messages" sub tab
    And I refresh the page
    Then I softly see value "Notification: Approver has initiated Undo Action on Program #{SavedValue:ProgramEGMSID}." for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "automation.po.qa2@yopmail.com" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | automation.po.qa2@yopmail.com                                                            |
      | automation.po.qa2@yopmail.com                                                            |
      | Notification: Approver has initiated Undo Action on Program #{SavedValue:ProgramEGMSID}. |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I refresh the page
    Then I softly see value "Notification: Approver has initiated Undo Action on Program #{SavedValue:ProgramEGMSID}." for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "exe.automation.qa2@yopmail.com" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "exe.automation.qa2@yopmail.com" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | automation.po.qa2@yopmail.com                                                            |
      | exe.automation.qa2@yopmail.com                                                           |
      | Notification: Approver has initiated Undo Action on Program #{SavedValue:ProgramEGMSID}. |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I refresh the page
    Then I softly see value "Notification: Approver has initiated Undo Action on Program #{SavedValue:ProgramEGMSID}." for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "automation.po.qa2@yopmail.com" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "pm.automation.qa2@yopmail.com" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "pm.automation.qa2@yopmail.com" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | automation.po.qa2@yopmail.com                                                            |
      | pm.automation.merge@yopmail.com                                                           |
      | Notification: Approver has initiated Undo Action on Program #{SavedValue:ProgramEGMSID}. |

  @331862 @331869 @ValidatethatEmailwillnotgenerateSystemEmailmessagestabwhenOwnerofprogramclicksonActivatebuttononInternalProgram @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that Email will not generate System Email in messages tab when Owner of program clicks on Activate button on Internal Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331869
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331476 @331881 @331480 @ValidatethatAmeliafduserwillnotseeEmailsentfrommessageSectioninmessagestabonSystemEmailSectionofCollabtab @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that Amelia fd user will not see Email sent from message section in messages tab on System Email Section of Collab tab
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I navigate to "Messages" sub tab
    #331476
    Then I softly see "System Emails" page block displayed
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    And I send the email under collab tab with following details:
      | To                            | Subject         | Body                       |
      | pm.automation.merge@yopmail.com| Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---program:-:programCollabMessagesTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Subject         | From Address                  | CC Address | To Address                    | Attention To | Email Subject   |
      | Automation Test | automation.fd.qa2@yopmail.com |            | pm.automation.merge@yopmail.com|              | Automation Test |
    And I refresh the page
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331480
    Then I softly see quick search inside table id "---program:-:systemEmailsTableId---"

  @331489 @331812 @ValidatethatSystemEmailWillnotGenerateafterSarahPmsubmitsinternalProgramforApproval @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that System Email Will not Generate after Sarah Pm submits internal Program for Approval
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331812
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331820 @331821 @331823 @ValidatethatAfterApproverclicksonSendbackbuttonforInternalProgramthenSystemEmaildonotgenerateinmessagestab @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that After Approver clicks on Send back button for Internal Program then System Email do not generate in messages tab
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I "Send to Owner" in the approval decision
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Created"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331821
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:PM Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331823
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331853 @ValidatethatSystemEmailwillnotgenerateinmessagestabwhenApproverApprovesInternalProgramtowhenitisassignedtosubmitforapproval @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that System Email will not generate in messages tab when Approver Approves Internal Program to when it is assigned to submit for approval
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331855 @ValidatethatSystemEmailwillnotgenerateinmessagestabofInternalProgramwhenApprovaltaskisReassignstootheruserbyapprover @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that System Email will not generate in messages tab of Internal Program when Approval task is Reassigns to other user by approver
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Messages" sub tab
    Then I see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @330620 @330624 @ValidateEXEusershouldseevaluepopulatesinSubjectFromAddressToAddressAttentiontoEmailsubjectcolumnsonMessagessectionundercollabtabofInternalProgram @Sprint-11-US-326332 @SystemEmail
  Scenario: Validate EXE user should see value populates in " Subject, From Address, To Address, Attention to, Email subject" columns on Messages section under collab tab of Internal Program
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    And I send the email under collab tab with following details:
      | To                            | Subject         | Body                       |
      | fo.automation.qa2@yopmail.com | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---program:-:programCollabMessagesTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Subject         | From Address                   | CC Address | To Address                    | Attention To | Email Subject   |
      | Automation Test | exe.automation.qa2@yopmail.com |            | fo.automation.qa2@yopmail.com |              | Automation Test |
    #330624
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I click on "Reply" icon for "Automation Test" inside flex table with id "---program:-:programCollabMessagesTableId---" without waiting for record
    And I send the email under collab tab with following details:
      | To                            | Subject              | Body                                |
      | fo.automation.qa2@yopmail.com | RE: Automation Test2 | Automation Re-Test Email Body Again |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I see value "" for title "Attention To" against the value "RE: Automation Test2" inside table "---program:-:programCollabMessagesTableId---"

  @330625 @330629 @330617 @330598 @ValidatethatFDusercanSeeSendEmailbuttononmessagessectionofmessagestabinAnystateofInternalProgram @Sprint-11-US-326332 @SystemEmail
  Scenario: Validate that FD user can See Send Email button on messages section of messages tab in Any state of Internal Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I refresh the page
    #330598
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #330598
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Messages" sub tab
    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Approved"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Approved"
    And I navigate to "Messages" sub tab
    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Approved"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Internal Program {SavedValue:ProgramEGMSID}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    #330598
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    And I click on "Activate" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Active"
    #330598
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
    When I re-login to "Grantor" app as "AUDITOR" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Messages" sub tab
    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"

  @Notags @ValidateNewButtonForContactSection
  Scenario: Validate New Button functio ality on contact section
    When I login to "Grantor" app as "PM" user
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
    And I click on top right button "New" in flex table with id "---program:-:contactsTableId---"
    And I wait for "2" seconds
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Mobile Phone" inside page block
    Then I softly see field on modal "Office Phone" inside page block
    Then I softly see field on modal "Project Role" inside page block

  @533308 @validateTerms&ConditionMasterRecordPM,PO,EXE,FO,FD,AuditoruserViewTermandconditionscreatedbyAdminuserfromsameorganization @GrantorFlexP1
  Scenario Outline: Validate PM, PO, EXE, FO, FD, Auditor user View Terms and conditions created by Admin user from same organization
    Given I login to "Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I click modal button "Close"
    And I pause execution for "3" seconds
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---home:-:termsAndConditionsTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
    When I re-login to "Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:EGMSID}" in "---home:-:termsAndConditionsTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---home:-:termsAndConditionsTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---home:-:termsAndConditionsTableId---"
    Examples:
      | User    |
      | PO      |
      | PM      |
      | EXE     |
      | FO      |
      | FD      |
      | AUDITOR |

  @527118 @527250 @validatethatrecordssharingforInternalProgramwithPO/FO/FD/auditor/Admin/EXEfromsameOrginallstatesofInternalProgram @GrantorFlexP1
  Scenario Outline: Validate that records sharing for Internal Program with PO/FO/FD/auditor/Admin/EXE from same Org in all states of Internal Program
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I refresh the page
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:contactsTableId---"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:contactsTableId---"
    And I navigate to "Setup" sub tab
    Then I softly see value "Mandatory" for title "Required" inside table "---program:-:checklistTableId---"
    Then I softly see value "Application" for title "Applies To" inside table "---program:-:checklistTableId---"
    Then I softly see value "Active" for title "Status" inside table "---program:-:checklistTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I <Validation> top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"

    Examples:
      | NonOwner | Validation |
      | PO       | can see    |
      | EXE      | can see    |
      | FO       | can see    |
      | FD       | can see    |
      | AUDITOR  | cannot see |

  @535723 @535719 @535715 @ValidateExternal/NGOorg1users(PM/PO/EXE)cancreateExternal/NGOProgramthenallusersshouldhaveviewaccesstoitirrespectiveofparticularorganization. @GrantorFlexP1
  Scenario Outline: Validate External/NGO org 1 users (PM/PO/EXE)can create External/NGO Program then all users should have view access to it irrespective of particular organization.
  / Validate that Approver section can visible to all internal users once NGO program is created
  /Validate External/ NGO program when submit  External/ NGO program is Activated
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Program Information" page block displayed
    Then I softly see "Details" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "NGO Contact" for title "Name" inside table "---program:-:ExternalNGOProgramContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I pause execution for "3" seconds
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see "Program Information" page block displayed
    Then I softly see "Details" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    Then I cannot see top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    Then I softly see value "NGO Contact" for title "Name" inside table "---program:-:ExternalNGOProgramContactTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Program Information" page block displayed
    Then I softly see "Details" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    Then I cannot see top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    Then I softly see value "NGO Contact" for title "Name" inside table "---program:-:ExternalNGOProgramContactTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I <Validation> top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Examples:
      | NonOwner | Validation |
      | PO       | can see    |
      | EXE      | can see    |
      | FO       | can see    |
      | FD       | can see    |
      | AUDITOR  | cannot see |

  @535717 @ValidatethatInternal/ExternalusersseeContactstablewithallthedetails @GrantorFlexP1
  Scenario Outline: Validate that Internal/ External users see Contacts table with all the details
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "4" seconds
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Program Information" page block displayed
    Then I softly see "Details" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "NGO Contact" for title "Name" inside table "---program:-:ExternalNGOProgramContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I pause execution for "3" seconds
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    When I enter the following values into flex table with id "---program:-:externalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    When I re-login to "Grantor" app as "<NonOwner>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see "Program Information" page block displayed
    Then I softly see "Details" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "System Information" page block displayed
    Then I cannot see top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    Then I softly see value "NGO Contact" for title "Name" inside table "---program:-:ExternalNGOProgramContactTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:PM Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Name" inside table "---program:-:extapproverTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:nonFedAddFilesTableId---"
    Then I <Validation> top right button "New" in flex table with id "---program:-:externalProgramNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:externalProgramNotesTableId---"
    Examples:
      | NonOwner | Validation |
      | PO       | can see    |
      | EXE      | can see    |
      | FO       | can see    |
      | FD       | can see    |
      | AUDITOR  | cannot see |
