@programWB @planning @planningRemainingExe @productplanning
Feature: Validate all scenarios for program - task reassignment and ownership

  @197300 @ValidatePMuserisabletotransferhisowntaskofthetasktypeActivatetheProgramstatusasInprogresstoanotherPMuserforinternalprogram @sprint-4  @reassignment @ownvai
  Scenario: Validate PM user is able to transfer his own task of the task type Activate the Program status as In progress to another PM user for internal program
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "10" seconds
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
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
    And I wait for "5" seconds
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

  @197312 @ValidatereassignedtaskownerPMuserisabletoactivatetheinternalprogramifanothePMtransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskasNotstarted @sprint-4  @reassignment
  Scenario: Validate reassigned task owner PM user is able to activate the internal program if another PM transfers task of the task type Activate the Program when status of task as Not started
    When I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I softly can see row level action button "Start" against "Record Id" in flex table with id "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    Then I softly see fields "input" is in edit mode
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    And I pause execution for "3" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I can see top right button "Amend Program" in page detail

  @199391 @ValidatereassignedtaskownerEXEuserisabletoactivattheinternalprogramifadmintransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskisInProgress @sprint-4  @reassignment
  Scenario: Validate  reassigned task owner EXE user is able to activate the internal program if admin transfers task of the task type Activate the Program when status of task is In Progress
    When I login to "As a Grantor" app as "PO" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "3" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Complete Review" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-source"
    And I select value "Automation PO1" into field "input-target"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "{SavedValue:FO Username}" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName1" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName1}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I can see top right button "Amend Program" in page detail

  @195200 @195206 @195208 @195211 @ValidateAdminusershouldabletoseethenewoptionofownershipunderreassignsectiononleftnavigationbarofAsaGrantorApp @sprint-4  @reassignment
  Scenario: Validate Admin user should able to see the new option of ownership under reassign section on left navigation bar of As a Grantor App
    When I login to "As a Grantor" app as "ADMIN" user
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
    When I login to "As a Grantor" app as "dynamicUser" user
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    Then I see value "Automation PM1" for title "Owner" inside table "---program:-:adminTargetOwnerReplaceTableId---"

  @195222 @ValidateuserselectsourceuserasPMuser&targetuserasEXEuserthenusershouldgetanerrorafterclickingontheStarticon @sprint-4  @reassignment
  Scenario: Validate user select source user  as PM user & target user as EXE user then user should get an error after clicking on the Start icon
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I enter value "Automation EXE" in reassign lookup
    Then I softly do not see "Automation EXE" inside auto search result

  @195223 @ValidateuserselectsourceuserasPMuser&targetuserasFDuserthenusershouldgeterrormessageafterclickingontheplayicon @sprint-4  @reassignment
  Scenario: Validate user select source user  as PM user & target user as FD user then user should get error message after clicking on the play icon
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I enter value "Automation FD" in reassign lookup
    Then I softly do not see "Automation FD" inside auto search result

  @195234 @Validateusershouldnavigatedtothesepagewhereusershouldabletoseelistofalltheprogramsafterclickonreassignbutton/icon @sprint-4  @reassignment
  Scenario: Validate user should navigated to these page where user should able to see list of all the programs after click on reassign button/icon
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    Then I softly see "Programs Available for Reassignment " page block displayed

  @195268 @Validatetherecordistransferredthenusershouldabletoseethesamerecordinthetargetuserstable @sprint-4  @reassignment
  Scenario: Validate the record is transferred then user should able to see the same record in the target user's table
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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

  @195273 @195278 @195277 @Validateuserclickontransferbuttonusershouldgetfollowingwarningmessage @sprint-4  @reassignment
  Scenario: Validate user click on transfer button user should  get following warning message
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-1"
    And I select value "Automation PO1" into field "input-2"
    And I select module "Program" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminOwnerReplaceTableId---" panel
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

  @195317 @195347 @ValidateownershipistransferredforaProgramincreatedstateValidateallthevisibilityofallthebuttonsoftheprogramisavailabletothenewowner @sprint-4  @reassignment @FieldHistoryExclude
  Scenario: Validate ownership is transferred for a Program in created state Validate all the visibility of all the buttons of the program is available to the new owner
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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

  @195340 @Validatenameoftheownershouldgetupdatedinresponsibilitytab @sprint-1  @reassignment
  Scenario: Validate name of the owner should  get updated in responsibility tab
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"

  @196652 @ValidateownershipistransferredforaProgramSubmittedforapprovalValidateapprovercanapprovetheprogram&newprogramownergetstheActivaterelatedtaskandhasbuttonsonUI @sprint-4  @reassignment
  Scenario: Validate ownership is transferred for a Program Submitted for approval Validate approver can approve the program  & new program owner gets the Activate related task and has buttons on UI
    When I login to "As a Grantor" app as "PM1" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 2  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "3" contains text "Approved"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I can see top right button "Amend Program" in page detail
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Planning" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:completedTaskTableId---"

  @196688 @ValidateownershipistransferredforaPrograminSubmittedforReviewstateValidateallthevisibilityofallthebuttonsoftheprogramisavailabletothenewowner @sprint-4  @reassignment @ownvai
  Scenario: Validate ownership is transferred for a Program in Submitted for Review state Validate all the visibility of all the buttons of the program is available to the new owner
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I wait for "2" seconds
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I click on Menu icon present on top right corner of the page
    Then I softly can see top right button "Submit For Approval" in page detail

  @196706 @Validatepeerreviewtasksnotstartedremainwithassignedreviewer&arenotautomaticallyassignedtonewownerofprogramwhenownershipofsuchinternalsprogramistransferred @sprint-4  @reassignment
  Scenario: Validate peer review tasks (not started) remain with assigned reviewer & are not automatically assigned to new owner of program when ownership of such internals program is transferred
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:EXE Username}" for title "Reviewer Name" inside table "---program:-:peerReviewTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I see value "Review Program 1990" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @196764 @ValidatethevisibilityofallthebuttonsoftheprogramisnotavailablefortheinitialownerwhenownershipistransferredtonewuserforaPrograminSubmittedforReviewstate @sprint-4  @reassignment
  Scenario: Validate the visibility of all the buttons of the program is not available for the initial owner when ownership is transferred to a new user for a Program in Submitted for Review state
    When I login to "As a Grantor" app as "PM1" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly cannot see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then  I cannot see top right button "New" in flex table with id "---program:-:peerReviewTableId---"

  @196693 @Validatetasksareremovedforoldowner&newprogramownergetstheActivaterelatedtaskandhasbuttonsonUIwhenownershipistransferredforaProgramofapprovedstatus @sprint-4  @reassignment
  Scenario: Validate tasks are removed for old owner & new program owner gets the Activate related task and has buttons on UI when ownership is transferred for a Program of approved status
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:completedTaskTableId---" panel
    Then I do not see value "Record Id" for title "EGMS ID" inside table "---program:-:completedTaskTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail

  @197125 @Validateownershiptasksareroutedtoappropriateuserwhentransferofownershipisdonesimultaneouslyfor4internalprogramsindifferentstateshasrelatedtasksonthem @sprint-4  @reassignment @wip
  Scenario: Validate ownership & tasks are routed to appropriate user when transfer of ownership is done simultaneously for 4 internal programs in different states & has related tasks on them
    When I login to "As a Grantor" app as "PM1" user
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
    And I save the field labeled "EGMS ID" as "ProgramEGMSID1"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Is Key Contact |
      | {SavedValue:EXE Username} | Checked        |
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
      | Reviewer Name  | Responsibility   | Description                 | Due Date |
      | Automation EXE | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "2" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    And I pause execution for "5" seconds
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
    And I save the field labeled "EGMS ID" as "ProgramEGMSID2"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I pause execution for "10" seconds
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
    And I save the field labeled "EGMS ID" as "ProgramEGMSID3"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
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
    And I save the field labeled "EGMS ID" as "ProgramEGMSID4"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID4}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID4}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID2}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID2}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Approve Program {SavedValue:ProgramEGMSID2}" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID1}" in "---program:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:ProgramEGMSID1}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    Then I softly see value "Review Program {SavedValue:ProgramEGMSID1}" for title "Subject" inside table "---program:-:pendingTaskTableId---"

  @199612 @validateownershipreassignmentissuccessfulforainternalprogramonRejectedstatus @sprint-4  @reassignment
  Scenario: Validate ownership reassignment is successful for a internal program on Rejected status
    When I login to "As a Grantor" app as "PM1" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Reject" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Rejected"

  @199405 @ValidatereassignedtaskownerADMINuserisabletoactivatetheinternalprogramifanotherADMINtransferstaskofthetasktypeActivatetheProgramwhenstatusoftaskasNotstarted @sprint-4  @reassignment
  Scenario: Validate reassigned task owner ADMIN user is able to activate the internal program if another ADMIN transfers task of the task type Activate the Program when status of task as Not started
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI For Admin" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I navigate to "Home" tab
    When I navigate to "All Tasks as Admin" content inside "Reassign" subheader on left panel
    And I select value "Automation PO" into field "input-source"
    And I select value "Automation PO1" into field "input-target"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:adminTaskReassignmentTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:adminTaskReassignmentTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:adminTaskReassignmentTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:adminTaskReassignmentTableId---"
    And I pause execution for "30" seconds
    When I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Amend Program" in page detail

  @204027 @ValidateTheinternaluserPMcanadddescriptionandotherdetailsinSupportingDocumentChecklist @sprint-7-US-202724
  Scenario: Validate The internal user<PM> can add description and other details in Supporting Document Checklist
    When I login to "As a Grantor" app as "dynamicUser" user
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
    Then I softly see value "Automation test description" for title "Description" inside table "---program:-:checklistTableId---"
    Then I softly see value "Mandatory" for title "Required" inside table "---program:-:checklistTableId---"
    Then I softly see value "Application" for title "Applies To" inside table "---program:-:checklistTableId---"
    Then I softly see value "Active" for title "Status" inside table "---program:-:checklistTableId---"

  @204031 @ValidateUserAdminclickonUploadTemplateiconamodalwillopenanditwillbereplacedbynewmodalnamedasAddFile @sprint-7-US-202724
  Scenario: Validate  User <Admin> click on "Upload Template" icon  a modal will open and it will be replaced by new modal named as Add File
    When I login to "As a Grantor" app as "PM" user
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
    Then I softly see "Add Files" opens in overLay window

  @204033 @ValidatenewmodalofaddfilesopenitwillhaveoneoptionUploadFilefromComputer @sprint-7-US-202724
  Scenario: Validate new modal of add files open it will have one option Upload File from Computer
    When I login to "As a Grantor" app as "PO" user
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
    Then I see "Upload File from Computer" page block displayed

  @204034 @ValidateUploadFIlesfromComputerwillhavesectionslikeClassificationUploadFileChooseaFileORDragithereDescription @sprint-7-US-202724
  Scenario: Validate Upload FIles from Computer will have sections like: Classification, Upload File (Choose a File OR Drag it here), Description
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    Then I see field "Classification" as "Select file classification" on modal
    Then I see field "Upload File" as " " on modal
    Then I see field "Description" as " " on modal

  @204037 @ValidateUserPMcanseetwobuttonsatthebottomofUploadFilesfromComputerUploadItwillenableonlyafterwechooseafiletouploadelseitwillbedisabled @sprint-7-US-202724
  Scenario: Validate User PM can see two buttons at the bottom of Upload Files from Computer Upload It will enable only after we choose a file to upload else it will be disabled
    When I login to "As a Grantor" app as "PM" user
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
    Then I see "Upload" button is disabled at modal under library
    When I upload file "AttachmentTesting.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library

  @204036 @ValidateUserPMcanseetwobuttonsatthebottomofUploadFilesfromComputerupload&Cancel @sprint-7-US-202724
  Scenario: Validate User PM can see two buttons at the bottom of Upload Files from Computer upload & Cancel
    When I login to "As a Grantor" app as "PM" user
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
    Then I see "Upload" button is disabled at modal under library
    Then I see "Cancel" button is displayed On Modal

  @204038 @ValidateCancelbuttonIfclickonCancelthanthemodalwillcloseanddetailsfilledwillbelost @sprint-7-US-202724
  Scenario: Validate Cancel button If click on Cancel than the modal will close and details filled will be lost
    When I login to "As a Grantor" app as "PO" user
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
    And I click modal button "Close"
    Then I see value "Not Applicable" for title "Template Link" against the value "Active" inside table "---program:-:checklistTableId---"

  @204046 @ValidateCancelbuttonwillalwaysbeenabled @sprint-7-US-202724
  Scenario: Validate Cancel button will always be enabled
    When I login to "As a Grantor" app as "PM" user
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
    Then I do not see "Cancel" button is disabled at modal under library

  @197530 @ValidatereassignedtaskownerEXEuserisabletocompletetheworkflowoninternalprogramifanotherEXEtransferstaskoftypeActivatetheProgramwhenprogramisamendedafteractivation @sprint-12-US-226646  @reassignment
  Scenario: Validate reassigned task owner EXE user is able to complete the workflow on internal program if another EXE transfers task of type Activate the Program when program is amended after activation
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    Then I softly see value "{SavedValue:FO Username}" for title "Name" inside table "---program:-:approverTableId---"
    And I save the value from row "1" for column name "Name" as "OwnerName" from flex table "---program:-:programOwnerTableId---"
    Then I softly see value "{SavedValue:OwnerName}" for title "Name" inside table "---program:-:programOwnerTableId---"
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    Then I see value "Record Id" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "Planning" for title "Phase" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:grantorTaskReassignTableId---"
    Then I softly see value "Not Started" for title "Status" inside table "---program:-:grantorTaskReassignTableId---"
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I can see top right button "Activate" in page detail
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    Then I can see top right button "Amend Program" in page detail

  @217607 @ValidateInternalProgapproveandownerofprogramaresamevalidateafterreassigningtheapprovaltaskownershipofrecordisnotchanged @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Prog approver and owner of a program are same validate after reassigning the approval task ownership of record is not changed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM" for title "Name" inside table "---program:-:programOwnerTableId---"

  @217752 @ValidateInternalProgadditionalentriesmadeduetoreassignmentforR&Rincontexttonextmodulearecarriedahead @sprint-12-US-226646  @reassignment @wip
  Scenario: Validate Internal Prog additional entries made due to reassignment for R&R in context to next module are carried ahead
    When I login to "As a Grantor" app as "PM" user
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
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Post Award / Monitoring |
      | {SavedValue:PM Username} | Step 2  | Step 1                  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Post Award / Monitoring |
      | Automation EXE1 | NA      | Step 1                  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "NA" for title "Program" against the value "Automation EXE" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation EXE1" inside table "---program:-:approverTableId---"

  @217602 @ValidateInternalProgtaskreassignmentdoesnothappenwhenusertriestoreassignhistasktoanotheruserisresponsiblefordifferentstepofsamemodule @sprint-12-US-226646  @reassignment
  Scenario: Validate Internal Prog_ Validate task reassignment does not happen when a user tries to reassign his task to another user is responsible for different step of same module
    When I login to "As a Grantor" app as "PM" user
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
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program | Announcement | FDM    | Award  | Post Award / Monitoring |
      | {SavedValue:EXE Username} | Step 1  | Step 2       | Step 2 | Step 2 | Step 2                  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Announcement | FDM    | Award  | Post Award / Monitoring |
      | Automation EXE1 | Step 2  | Step 1       | Step 1 | Step 1 | Step 1                  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program | Announcement | FDM    |
      | Automation FO | Step 3  | Step 3       | Step 3 |
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
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    Then I softly see value "Step 2" for title "Program" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "FDM" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Award" against the value "Automation EXE1" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Post Award / Monitoring" against the value "Automation EXE1" inside table "---program:-:approverTableId---"

  @223421 @ValidatetransferofpeerreviewtasksisfailedincaseofanyreasonthenR&RonInternalprogramshouldnotgetupdated @sprint-12-US-226646  @reassignment @FieldHistoryExclude
  Scenario: Validate transfer of peer review tasks is failed in case of any reason then R&R on Internal program should not get updated
    When I login to "As a Grantor" app as "PM" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | FDM    |
      | {SavedValue:PM Username} | Step 1  | Step 1 |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program | Announcement | FDM    | Award  | Post Award / Monitoring |
      | Automation PM1 | Step 2  | Step 2       | Step 2 | Step 2 | Step 2                  |
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    Then I softly see field "Created by" as "Automation PM"
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:programOwnerTableId---"
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "FDM" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly see value "{SavedValue:ProgramEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"

  @195749 @Validateuserseevalidationmessageifuserhasalreadyre-assignedthetasksandheistryingtore-assigntasksagainandbatchjobisalreadyrunning @sprint-12-US-226646  @reassignment
  Scenario: Validate user see validation message if user has already re-assigned the tasks and he is trying to re-assign tasks again and batch job is already running
    When I login to "As a Grantor" app as "PM1" user
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
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
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
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation PM1"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:ProgramEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    Then I softly see the following messages in the page details :
      | Reassignment is still in progress, kindly wait for few minutes. |

  @191032 @ValidatePlanningPMasrecordownercanseenewlyreassignApprovernameinapproversection @sprint-11-US-224734  @reassignment
  Scenario: Validate Planning PM as record owner can see newly reassign Approver name in approver section
    When I login to "As a Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
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

  @217601 @ValidateInternalProgstep2approverisinsertedforprogramcolumnwhenapprovaltaskisreassigned @sprint-7-US-191250  @reassignment @wip
  Scenario: Validate Internal Prog step2 approver is inserted for program column when approval task is reassigned
    When I login to "As a Grantor" app as "PM" user
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
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
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
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Post Award / Monitoring |
      | {SavedValue:PM Username} | Step 2  | Step 1                  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Announcement | Program |
      | {SavedValue:FO Username} | Step 3       | Step 3  |
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
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    Then I softly see value "Step 2" for title "Program" against the value "Automation PM1" inside table "---program:-:approverTableId---"

  @217603 @validateInternalProgtaskreassignmentissuccessfulwhenusertriestoreassignhistasktoanotheruserisresponsibleforsamestepofdifferentmodules @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog task reassignment is successful when a user tries to reassign his task to another user is responsible for same step of different modules
    When I login to "As a Grantor" app as "PM" user
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
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program | Announcement | FDM    | Award  | Post Award / Monitoring |
      | {SavedValue:EXE Username} | Step 1  | Step 2       | Step 2 | Step 2 | Step 2                  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name            | Program | Announcement | FDM    | Award  | Post Award / Monitoring |
      | Automation EXE1 | Step 2  | Step 1       | Step 1 | Step 1 | Step 1                  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement | FDM | Award | Post Award / Monitoring |
      | {SavedValue:FO Username} | Step 3  | NA           | NA  | NA    | NA                      |
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
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 3" for title "Program" against the value "Automation FO1" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Post Award / Monitoring" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "FDM" against the value "Automation FO" inside table "---program:-:approverTableId---"
    Then I softly see value "NA" for title "Award" against the value "Automation FO" inside table "---program:-:approverTableId---"

  @217609 @ValidateInternalProgIfapproverandownerofprogramaresameafterreassigningtheownershipofrecordapprovernameshouldnotchanged @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog If approver and owner of a program are same validate after reassigning the ownership of record approver name should not changed
    When I login to "As a Grantor" app as "PM" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
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
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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

  @217655 @ValidateInternalProgapproverdefinitionisnotmodifiedoninitialrecordifapproversarechangedatruntime @sprint-7-US-191250  @reassignment @wip
  Scenario: Validate Internal Prog approver definition is not modified on initial record if approvers are changed at runtime
    When I login to "As a Grantor" app as "PM" user
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
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program | Announcement |
      | {SavedValue:PM Username} | Step 1  | Step 1       |
    And I refresh the page
    And I wait for "2" seconds
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
And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
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
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    And I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I click modal button "Close"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM1" inside table "---announcement:-:approversTableId---"
    Then I softly see value "NA" for title "Announcement" against the value "Automation PM" inside table "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly see value "Step 1" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"
    Then I softly see value "Step 1" for title "Announcement" against the value "Automation PM" inside table "---program:-:approverTableId---"

  @217762 @ValidateInternalProgadditionalentriesmadeduetoreassignmentforR&Rincontexttonextmodulearenotcarriedahead @sprint-7-US-191250  @reassignment
  Scenario: Validate Internal Prog additional entries made due to reassignment for R&R in context to next module are not carried ahead
    When I login to "As a Grantor" app as "PM1" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
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
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
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

  @224336 @ValidateInternalProgapprovershouldabletoapproveprogramafterreassigntheforwardedapprovaltasktootherapprover @sprint-11-US-218319  @reassignment
  Scenario: Validate Internal Prog approver should able to approve program after reassign the forwarded approval task to other approver
    When I login to "As a Grantor" app as "PM" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:FO Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @204485 @ValidatePMusercanaddeditdeletenotesonhisInternalProgramincreatedStatus @sprint-7-US-201927  @Notes
  Scenario: Validate PM user can add/edit/delete notes on his Internal Program in created Status
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"

  @204512 @ValidateEXEusercantaddnotesbuteditdeletehisnotesonhisInternalPrograminRejectedStatus @sprint-7-US-201927  @Notes
  Scenario: Validate EXE user cant add notes but edit/delete his notes on his Internal Program in Rejected Status
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I "Reject" in the approval decision
    And I refresh the page
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
      | Created By    | Title         | Description       |
      | Automation PM | Notes Record1 | Automation Notes1 |
    Then I softly see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes1" for title "Description" inside table "---program:-:internalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---program:-:internalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---program:-:internalProgramNotesTableId---"

  @204513 @ValidatePMuserusercantaddnotesbuteditdeletehisnotesonInternalProgramcreatedbyEXEuserwhenitsstatusisRejected @sprint-7-US-201927  @Notes
  Scenario: Validate PM user user cant add notes but edit/delete his notes on Internal Program created by EXE user when its status is Rejected
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
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
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I pause execution for "5" seconds
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
      | Created By     | Title         | Description       |
      | Automation EXE | Notes Record2 | Automation Notes2 |
    Then I softly see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation Notes2" for title "Description" inside table "---program:-:internalProgramNotesTableId---"
    And I click on "Delete" icon for "Notes Record2" inside flex table with id "---program:-:internalProgramNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record2" for title "Title" inside table "---program:-:internalProgramNotesTableId---"

  @204522 @ValidateAuditorusercantaddeditdeletenotesonaInternalProgram @sprint-7-US-201927  @Notes
  Scenario:Validate Auditor user cant add, edit, delete notes on a Internal Program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
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
#    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    And I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
#    And I navigate to "Files" sub tab
#    Then I softly cannot see top right button "New" in flex table with id "---program:-:internalProgramNotesTableId---"
#    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"
#    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---program:-:internalProgramNotesTableId---"

  @204536 @ValidatePMEXEFOcanaddnotesonainternalprogramwhichissubmittedforReview&Reviewed @sprint-7-US-201927  @Notes
  Scenario: Validate PM,EXE,FO can add notes on a internal program which is submitted for Review & Reviewed
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role   |
      | Automation PM | Fiscal Contact |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    And I wait for "5" seconds
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date |
      | Automation PM | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
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
    Then I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Then I softly see field "Status" as "Approved"
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Active"
    And I navigate to "Files" sub tab
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title          | Description        |
      | Notes Record10 | Automation Notes10 |
    Then I softly see value "Notes Record10" for title "Title" inside table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "Automation PM" for title "Created By" inside table "---program:-:internalProgramNotesTableId---"
    And I save the value from row "1" for column name "Created Date" as "CreatedDate" from flex table "---program:-:internalProgramNotesTableId---"
    Then I softly see value "{SavedValue:CreatedDate}" for title "Created Date" inside table "---program:-:internalProgramNotesTableId---"
    Then I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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

  @204887 @ValidateFiscalReviewerEXEcanaddnotesonaInternalprogramwhenitssentforreviewevenifAllowrecordeditisNo @sprint-7-US-201927  @Notes
  Scenario: Validate Fiscal Reviewer EXE can add notes on a Internal program when its sent for review even if Allow record edit is No
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role   |
      | Automation PM | Fiscal Contact |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role   |
      | Automation PM | Fiscal Contact |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date | Allow Record Editing |
      | Automation PO | Program Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "4" seconds
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
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    And I perform quick search for "{SavedValue:PM Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:PM Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name          | Project Role   |
      | Automation PM | Fiscal Contact |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description                 | Due Date | Allow Record Editing |
      | Automation FO | Fiscal Reviewer | Automation Test Description | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I wait for "5" seconds
    And I enter values into fields
      | Value       | Field             |
      | Cannot Rate | Rating__c         |
      | Passed      | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    Then I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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

  @204035 @ValidatethatuserEXEshouldhavetwooptionsifIclickonClassificationinUploadFilefromcomputerATemplateforPlanningBOthers @sprint-7-US-202724
  Scenario: Validate that user EXE should have two options if I click on Classification in Upload File from computer A.Template for Planning B. Others
    When I login to "As a Grantor" app as "PM" user
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

  @330560 @330580 @330611 @330615 @ValidatePMusershouldseevaluepopulatesinSubjectFromAddressToAddressAttentiontoEmailsubjectccaddresscolumnsonMessagessectionundercollabtabofInternalProgram @SystemEmail @bugID_538571
  Scenario: Validate PM user should see value populates in " Subject, From Address, To Address, Attention to, Email subject,cc address" columns on Messages section under collab tab of Internal Program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    And I wait for "3" seconds
    And I send the email under collab tab with following details:
      | To                       | Subject         | Body                       |
      | {SavedValue:FOYopmailId} | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---program:-:programCollabMessagesTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Subject         | From Address             | CC Address | To Address               | Attention To | Email Subject   |
      | Automation Test | {SavedValue:PMYopmailId} |            | {SavedValue:FOYopmailId} |              | Automation Test |
    #330580
    And I click on "Reply" icon for "Automation Test" inside flex table with id "---program:-:programCollabMessagesTableId---" without waiting for record
    And I wait for "3" seconds
    And I send the email under collab tab with following details:
      | To                       | Subject              | Body                          |
      | {SavedValue:FOYopmailId} | RE: Automation Test1 | Automation Re-Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" against the value "RE: Automation Test1" inside table "---program:-:programCollabMessagesTableId---"
    #330611
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Subject         | From Address             | CC Address | To Address               | Attention To | Email Subject   |
      | Automation Test | {SavedValue:PMYopmailId} |            | {SavedValue:FOYopmailId} |              | Automation Test |
    #330615
    And I click on "Reply" icon for "Automation Test" inside flex table with id "---program:-:programCollabMessagesTableId---" without waiting for record
    And I send the email under collab tab with following details:
      | To                       | Subject              | Body                                |
      | {SavedValue:FOYopmailId} | RE: Automation Test2 | Automation Re-Test Email Body Again |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" against the value "RE: Automation Test2" inside table "---program:-:programCollabMessagesTableId---"

  @331481 @331482 @331479 @331477 @331478 @ValidatethatSarahPMAndPeerReviewerVictorEXEwillseesystemEmailafterSarahPmsendsInternalProgramforPeerreview @Sprint-11-US-327737 @SystemEmail @bug_id_492596 @skipOnJenkins
  Scenario: Validate that Sarah PM And Peer Reviewer Victor EXE will see system Email after Sarah Pm sends Internal Program for Peer review
    When I login to "As a Grantor" app as "PM" user
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
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name           | Project Role   |
      | Automation EXE | Fiscal Contact |
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
      | Reviewer Name  | Responsibility  | Description                 | Due Date |
      | Automation EXE | Fiscal Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:PMYopmailId}" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:EXEYopmailId}" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "{SavedValue:EXEYopmailId}" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | {SavedValue:PMYopmailId}                                              |
      | {SavedValue:EXEYopmailId}                                             |
      | Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Program {SavedValue:ProgramEGMSID} awaiting Peer Review" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:PMYopmailId}" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:EXEYopmailId}" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "{SavedValue:EXEYopmailId}" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | {SavedValue:PMYopmailId}                                              |
      | {SavedValue:EXEYopmailId}                                             |
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
    Then I softly see value "{SavedValue:EXEYopmailId}" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:PMYopmailId}" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | {SavedValue:EXEYopmailId}                                               |
      | {SavedValue:PMYopmailId}                                                |
      | Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside table
    And I navigate to "Messages" sub tab
    Then I softly see value "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:EXEYopmailId}" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:PMYopmailId}" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "Notification: Program {SavedValue:ProgramEGMSID} has been Peer Reviewed" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | {SavedValue:EXEYopmailId}                                               |
      | {SavedValue:PMYopmailId}                                                |
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

  @331854 @ValidatethatSystemEmailwillgenerateinmessagestabwhenlastApproverClickonundobuttononApprovedInternalProgram @Sprint-11-US-327737 @SystemEmail @bug_id_492596 @bug_id_538295
  Scenario: Validate that System Email will generate in messages tab when last Approver Click on undo button on Approved Internal Program
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I cannot see top right button "Undo" in page detail
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
    When I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" by showing entries "All" in flex table with id "---program:-:associateFocusAreaTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    When I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    And I pause execution for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    And I wait for "2" seconds
    Then I softly see value "Notification: Approver has initiated Undo Action on Program 1990" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:POYopmailId}" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:POYopmailId}" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "{SavedValue:POYopmailId}" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | {SavedValue:POYopmailId}                                         |
      | {SavedValue:POYopmailId}                                         |
      | Notification: Approver has initiated Undo Action on Program 1990 |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I refresh the page
    Then I softly see value "Notification: Approver has initiated Undo Action on Program 1990" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:POYopmailId}" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:EXEYopmailId}" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "{SavedValue:EXEYopmailId}" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | {SavedValue:POYopmailId}                                         |
      | {SavedValue:EXEYopmailId}                                        |
      | Notification: Approver has initiated Undo Action on Program 1990 |
    When I close "System Email" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I refresh the page
    Then I softly see value "Notification: Approver has initiated Undo Action on Program 1990" for title "Subject" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:POYopmailId}" for title "From Address" inside table "---program:-:systemEmailsTableId---"
    Then I softly see value "{SavedValue:PMYopmailId}" for title "To Address" inside table "---program:-:systemEmailsTableId---"
    And I click on "View" icon for "{SavedValue:PMYopmailId}" inside flex table with id "---program:-:systemEmailsTableId---" without waiting for record
    Then I softly see following details for email sent under collab:
      | {SavedValue:POYopmailId}                                         |
      | {SavedValue:PMYopmailId}                                         |
      | Notification: Approver has initiated Undo Action on Program 1990 |

  @331862 @331869 @ValidatethatEmailwillnotgenerateSystemEmailmessagestabwhenOwnerofprogramclicksonActivatebuttononInternalProgram @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that Email will not generate System Email in messages tab when Owner of program clicks on Activate button on Internal Program
    When I login to "As a Grantor" app as "PM" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    Then I softly see value "Activate Program 1990" for title "Subject" inside table "---program:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331869
    And I click on "Amend Program" in the page details
    Then I softly see field "Status" as "Being Amended"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331476 @331881 @331480 @ValidatethatAmeliafduserwillnotseeEmailsentfrommessageSectioninmessagestabonSystemEmailSectionofCollabtab @Sprint-11-US-327737 @SystemEmail @bugID_538571
  Scenario: Validate that Amelia fd user will not see Email sent from message section in messages tab on System Email Section of Collab tab
    When I login to "As a Grantor" app as "PM" user
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    And I send the email under collab tab with following details:
      | To                       | Subject         | Body                       |
      | {SavedValue:PMYopmailId} | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---program:-:programCollabMessagesTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Subject         | From Address             | To Address               | CC Address | Attention To | Email Subject   |
      | Automation Test | {SavedValue:FDYopmailId} | {SavedValue:PMYopmailId} |            |              | Automation Test |
    And I refresh the page
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331480
    Then I softly see quick search inside table id "---program:-:systemEmailsTableId---"

  @331489 @331812 @ValidatethatSystemEmailWillnotGenerateafterSarahPmsubmitsinternalProgramforApproval @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that System Email Will not Generate after Sarah Pm submits internal Program for Approval
    When I login to "As a Grantor" app as "PM" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331812
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331820 @331821 @331823 @ValidatethatAfterApproverclicksonSendbackbuttonforInternalProgramthenSystemEmaildonotgenerateinmessagestab @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that After Approver clicks on Send back button for Internal Program then System Email do not generate in messages tab
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I "Send to Owner" in the approval decision
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Created"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    And I wait for "2" seconds
    #331821
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    #331823
    And I "Reject" in the approval decision
    And I wait for "3" seconds
    Then I softly see field "Status" as "Rejected"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331853 @ValidatethatSystemEmailwillnotgenerateinmessagestabwhenApproverApprovesInternalProgramtowhenitisassignedtosubmitforapproval @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that System Email will not generate in messages tab when Approver Approves Internal Program to when it is assigned to submit for approval
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    And I wait for "180" seconds
    And I refresh the page
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @331855 @ValidatethatSystemEmailwillnotgenerateinmessagestabofInternalProgramwhenApprovaltaskisReassignstootheruserbyapprover @Sprint-11-US-327737 @SystemEmail
  Scenario: Validate that System Email will not generate in messages tab of Internal Program when Approval task is Reassigns to other user by approver
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
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
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see "No Records Found" inside flex table with id "---program:-:systemEmailsTableId---"

  @330620 @330624 @ValidateEXEusershouldseevaluepopulatesinSubjectFromAddressToAddressAttentiontoEmailsubjectcolumnsonMessagessectionundercollabtabofInternalProgram @Sprint-11-US-326332 @SystemEmail @bugID_538571
  Scenario: Validate EXE user should see value populates in " Subject, From Address, To Address, Attention to, Email subject" columns on Messages section under collab tab of Internal Program
    When I login to "As a Grantor" app as "PM" user
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
      | To                       | Subject         | Body                       |
      | {SavedValue:FOYopmailId} | Automation Test | Automation Test Email Body |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" inside table "---program:-:programCollabMessagesTableId---"
    Then I see the following rows under the following headers in table with id "---program:-:programCollabMessagesTableId---" :
      | Actions     | Subject         | From Address             | To Address               | CC Address | Attention To | Email Subject   | Preview                    |
      | Action menu | Automation Test | {SavedValue:PMYopmailId} | {SavedValue:FOYopmailId} |            |              | Automation Test | Automation Test Email Body |
    #330624
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    And I click on "Reply" icon for "Automation Test" inside flex table with id "---program:-:programCollabMessagesTableId---" without waiting for record
    And I send the email under collab tab with following details:
      | To                       | Subject              | Body                                |
      | {SavedValue:FOYopmailId} | RE: Automation Test2 | Automation Re-Test Email Body Again |
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    Then I softly see value "" for title "Attention To" against the value "{SavedValue:POYopmailId}" inside table "---program:-:programCollabMessagesTableId---"

  @330625 @330629 @330617 @330598 @ValidatethatFDusercanSeeSendEmailbuttononmessagessectionofmessagestabinAnystateofInternalProgram @Sprint-11-US-326332 @SystemEmail
  Scenario: Validate that FD user can See Send Email button on messages section of messages tab in Any state of Internal Program
    When I login to "As a Grantor" app as "PM" user
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
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click modal button "Close"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I refresh the page
    #330598
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
#    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    When I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
#    And I navigate to "Messages" sub tab
#    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #330598
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
#    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    When I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
#    Then I softly see field "Status" as "Submitted for Approval"
#    And I navigate to "Messages" sub tab
#    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Approved"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
#    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    When I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
#    Then I softly see field "Status" as "Approved"
#    And I navigate to "Messages" sub tab
#    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Approved"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
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
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"
    #330629
#    When I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
#    When I click toggle button to select "Internal Programs - All"
#    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
#    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
#    Then I softly see field "Status" as "Active"
#    And I navigate to "Messages" sub tab
#    Then I cannot see top right button "Send Email" in flex table with id "---program:-:programCollabMessagesTableId---"
    #330617
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    When I click toggle button to select "Internal Programs - All"
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:programsTableId---"
    Then I softly see field "Status" as "Active"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "---program:-:programCollabMessagesTableId---"