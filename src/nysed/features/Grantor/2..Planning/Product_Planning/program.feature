@programExecution @planning @productplanning
Feature: Validate all scenarios for program

  Background: Create Program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    And I click on "Save" in the page details

  @105872 @VerifyDeletionOfCreatedProgram
  Scenario Outline: Verifying if the owner of program is ablr to delete created program
    When I navigate to "Planning" tab
    And I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "<Program flextable Header>"
    When I perform quick search for "<Program>" in "---program:-:programsTableId---" panel
    And I click on "Delete" icon for "<Program>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I perform quick search for "<Program>" in "---program:-:programsTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---program:-:programsTableId---"
    Examples:
      | Program flextable Header  | Program                                          |
      | Internal Programs - Draft | {SavedValue:Automation Runtime Internal Program} |

  @105880 @ValidateDeletionOfAssociatedContact
  Scenario Outline: Verify user is able to delete associated contact
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    And I refresh the page
    Then I softly see that "<Contact>" has been added in flextable with Id "---program:-:contactsTableId---"
    And I click on "Remove" icon for "<Contact>" inside flex table with id "---program:-:contactsTableId---" without waiting for record
  #  Then I softly see the following messages in the page details contains:
   #   | Record removed successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:contactsTableId---"

    Examples:
      | Contact                   |
      | {SavedValue:EXE Username} |

  @106094 @VerifyDeletionOfAssociatedFocusArea
  Scenario Outline: Validate user is able to delete associated focus area for the Internal Program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Title>" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    Then I softly see that "<Title>" has been added in flextable with Id "---program:-:focusAreaTableId---"
    And I click on "Remove" icon for "<Title>" inside flex table with id "---program:-:focusAreaTableId---" without waiting for record
   # Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:focusAreaTableId---"

    Examples:
      | Title                           |
      | Automation Permanent Focus Area |

  @105920 @VerifyErrorMessageForFocusArea
  Scenario: Validate user is able to see error message for focus area after making program detail changes
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    And I click modal button "Close"
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter value "No" into field "FocusAreaRequired__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Setup Tab - Remove all the Focus Areas associated with this program if the Focus Area Required is "No". |

  @106288 @VerifyDeletionOfAssociatedProgramObjective
  Scenario Outline: Validate user is able to delete associated objective from program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "<Objective>" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see that "<Objective>" has been added in flextable with Id "---program:-:objectivesTableId---"
    And I click on "Remove" icon for "<Objective>" inside flex table with id "---program:-:objectivesTableId---" without waiting for record
 #   Then I softly see the following messages in the page details contains:
  #    | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:objectivesTableId---"

    Examples:
      | Objective                      |
      | Automation Permanent Objective |

  @106096 @verifyDeletionOfAssociatedProgramKPI
  Scenario Outline: Validate user is able to delete associated kpi from program
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "<EGMS Id>" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I softly see that "<EGMS Id>" has been added in flextable with Id "---program:-:kpiTableId---"
    And I click on "Remove" icon for "<EGMS Id>" inside flex table with id "---program:-:kpiTableId---" without waiting for record
   # Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:kpiTableId---"

    Examples:
      | EGMS Id                  |
      | Automation Permanent KPI |

  @106079 @106078 @105941 @ValidateDeletionOfSupportingDocuments
  Scenario: Validate user is able to delete the attachment checklist for the Internal Program
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    Then I softly see value "Active" for title "Status" inside table "---program:-:checklistTableId---"
#    Then I softly see that "Active" has been added in flextable with Id "---program:-:checklistTableId---"
    #106078 #monu
    And I edit the following rows inline in flex table with id "---program:-:checklistTableId---" by clicking "Edit" :
      | Required  | Description     |
      | Mandatory | Automation test |
    And I wait for "1" seconds
    Then I softly see that "Automation test" has been added in flextable with Id "---program:-:checklistTableId---"
    #106079 #monu
    When I click on "Delete" icon for "Mandatory" inside flex table with id "---program:-:checklistTableId---" without waiting for record
  #  Then I softly see the following messages in the page details contains:
   #   | Record deleted successfully. |
    Then I softly see "No records found" inside flex table with id "---program:-:checklistTableId---"

  @106083 @VerifyViewOfAddedLinkAtSupportingDocument
  Scenario: Validate user is able to download uploaded document by clicking on view link
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    Then I softly see that "Active" has been added in flextable with Id "---program:-:checklistTableId---"
    Then I click in table hyperlink containing value "View"

  @34754 @programApproval @smoke
  Scenario: Validate the approval of Internal Program
    And I wait for "10" seconds
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
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Automation test description" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Setup" sub tab
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I see status in Progress-bar is "Approved" and is "dark blue"

  @106336 @programRejection1 @smoke
  Scenario: Validate user should be able to reject program
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
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    And I pause execution for "2" seconds
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I wait for "5" seconds
    And I upload attachment "Attachment.pdf" of type "Program Artifacts" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I wait for "3" seconds
    And I "Reject" in the approval decision
    And I refresh the page
    And I wait for "5" seconds
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @53689 @verifyRelatedLogsTableForFocusAreaForActiveProgram
  Scenario Outline: Verify related log table for focus area for Active Program
    And I wait for "10" seconds
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
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---focusarea:-:relatedProgramsTableId---"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @53690 @Verify_Relatedlogs_table_for_focusArea_for_Draft_Program  @smoke
  Scenario Outline: Verify related log table for focus area for draft Program
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---focusarea:-:relatedProgramsTableId---"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:EXE Username}cution Internal Program |

  @53692 @Verify_Relatedlogs_table_for_focusArea_for_Active_Program_ViewAction
  Scenario Outline: Verify related log table for focus area for Active Program view Action
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
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
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
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I pause execution for "5" seconds
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Active"
    And I perform quick search for "<Focus Area>" in "---focusarea:-:focusAreaTableId---" panel
    When I click on "View" icon for "<Focus Area>" inside flex table with id "---focusarea:-:focusAreaTableId---" without waiting for record
    And I navigate to "Related Log" sub tab
    When I perform quick search for "<Program Name>" in "---focusarea:-:relatedProgramsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---focusarea:-:relatedProgramsTableId---" without waiting for record
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @106332 @106322 @106319 @106317 @verifyActivationOfAmendedProgram
  Scenario Outline: Verify user is able to activate the amended internal program
    And I wait for "10" seconds
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
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
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
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    #106317 #monu
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on "Amend Program" in the page details
    #106322 #monu
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    #106319 #monu
    Then I softly see field "Status" as "Being Amended"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "<Program Name>" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Examples:
      | Focus Area                      | Program Name                                     |
      | Automation Permanent Focus Area | {SavedValue:Automation Runtime Internal Program} |

  @106313 @verifyTaskCreationForProgramActivation
  Scenario Outline: Verify user is able to see created task to activate program inside pending tasks
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
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    |
      | {SavedValue:PM Username} | Program Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Is Key Contact |
      | {SavedValue:PM Username} | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Program" for title "Task Type" inside table "---program:-:pendingTaskTableId---"

    Examples:
      | Focus Area                      |
      | Automation Permanent Focus Area |

  @105969 @VerifyAllActiveFocusArea
  Scenario: Validate user is able to see all active focus area on associate modal
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    And I check "All" boxes in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    Then I see value "Active" for title "Status" against the value "Automation Permanent Focus Area2" inside table "---program:-:focusAreaTableId---"
    Then I see value "Active" for title "Status" against the value "Automation Permanent Focus Area" inside table "---program:-:focusAreaTableId---"

  @138467 @VerifyUserShouldNotBeAbleToAddSameStepForMultipleUserAtProgramApprover-RnRFuntionality
  Scenario: Validate program owner cant add same step for multiple users for program while defining approvers on program record
    And I wait for "2" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    Then I softly see "You cannot specify the same step for multiple users for Program." inside flex table with id "---program:-:approverTableId---"

  @138464 @VerifyErrorMessageWhileSkippingStepsAtProgramApproverSection-RnRFuntionality
  Scenario:  Validate owner of the program cannot skip any approval steps for program approval while defining the approval on the program
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 4  |
    And I wait for "9" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Responsibilities - You cannot skip an Approval Step. |

  @passe@138465 @VerifyUserShouldNotBeAbleToAddSameUserForMultipleStepAtProgram-RnRFunctionality  @buglogged154221
  Scenario: Validate program owner cant add same user for multiple steps  while assigning approvers for program on program record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 2  |
    Then I softly see "You cannot specify the same user for multiple steps for Program" inside flex table with id "---program:-:approverTableId---"
