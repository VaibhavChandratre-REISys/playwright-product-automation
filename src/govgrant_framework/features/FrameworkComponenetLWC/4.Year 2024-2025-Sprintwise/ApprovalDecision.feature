@Sprint-PageLayout @Sprint-2025 @US-521809 @ApprovalDecision
Feature:Delegated Approver Scenarios - Delegated approver - Sprint 2 2024 (Suite ID: 392305)
Business Need: To ensure that the Delegated Approver of our web pages meets the needs of different user roles: admin, internal users

  @399404 @400099 @400102 @400104 @sprint2
  Scenario Outline: LWC - Delegated Approver - Admin - To verify task should be generated for the Delegated Approver as well when current date is between the Delegate From and Delegate to dates.
  |LWC - Delegated Approver - Admin - To verify Forward action decision should not be present for the delegated approver|
  |LWC - Delegated Approver - Admin - To verify Approve action decision should be present for the delegated approver|
  |LWC - Delegated Approver - Admin - To verify Reject action decision should be present for the delegated approver|
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I wait for "10" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation EXE" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name              | Program |
      | Automation ADMIN1 | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Strategic Objectives Admin" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI For Admin" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    #399404
    Then I softly can see row level action button "Start" against "{SavedValue:PEGMSID}" in flex table with id "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "7" seconds
    #400099 #400102 #400104
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Send back |

    Examples:
      | Focus Area                      |
      | Automation Permanent Focus Area |


  @400021 @400100 @400103 @400105 @sprint2
  Scenario Outline: LWC - Delegated Approver - PM - To verify task should be generated for the Delegated Approver as well when current date is between the Delegate From and Delegate to dates.
  |LWC - Delegated Approver - PM - To verify Forward action decision should not be present for the delegated approver|
  |LWC - Delegated Approver - PM - To verify Approve action decision should be present for the delegated approver|
  |LWC - Delegated Approver - PM - To verify Reject action decision should be present for the delegated approver|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    #400021
    Then I softly can see row level action button "Start" against "{SavedValue:PEGMSID}" in flex table with id "---program:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I pause execution for "5" seconds
    #400100 #400103 #400105
    Then I see only the following ordered radio buttons in the approval decision :
      | Approve | Reject | Send back |

    Examples:
      | Focus Area                      |
      | Automation Permanent Focus Area |

  ############## User Story - 521809 #####################
  @548595 @548622 @548597 @548605 @US-521809
  Scenario:LWC - Approval History Table - PM - To verify that if the page size dropdown is enabled, then the user should be able to select different page size options (e.g., 5, 10, 20, 50, 100), and the table should refresh accordingly
  |LWC - Approval History Table - PM - To verify that total record count and pagination update correctly after new records are added.|
  |Test Case 548597: LWC - Approval History Table - PM - To verify that when the table is filtered or sorted, then the pagination and total record count must reflect the filtered/sorted result set accurately.|
  |LWC - Approval History Table - PM - To verify that the total number of records is displayed correctly.|
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I navigate to "History" sub tab
    Then I softly see "No Records Found" inside flex table with id "Approval History"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    And I refresh the page
    Then I softly see column "Overall Status" at position "1" contains text "Pending"
    Then I softly see column "stepName" at position "1" contains text "Step : Step 1 (Pending for approval)"
    Then I softly see column "stepName" at position "2" contains text "Approval Request Submitted"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I see Total Records count "Total Records: 5" in table name "Approval History"
    When I navigate to "History" sub tab
    When I click on "Amend Program" in the page details
    And I refresh the page
    And I pause execution for "3" seconds
    When I click on "Submit For Approval" in the page details
    And I refresh the page
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHcHIAU/view"
    Then I softly see "Approval History" page block displayed
    Then I softly see show entries are enabled for "Approval History"
    Then I see Total Records count "Total Records: 7" in table name "Approval History"

  @548596 @548601 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that Enable Pagination, Default Page Size and Records Count feature should be available on Approval History Table
  |  LWC - Approval History Table - PM - To verify that the Approval History table displays the correct number of records per the default page size.|
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I see Total Records count "Total Records: 5" in table name "Approval History"
    And I select value inside table "Approval History" is "10"

  @548600 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that pagination controls (e.g. page numbers, next/previous buttons) are displayed on the Approval History table.
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Amend Program" in the page details
    And I pause execution for "3" seconds
    When I click on "Submit For Approval" in the page details
     # And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHcHIAU/view"
    When I navigate to "History" sub tab
    Then I see pagination "Next" arrow displayed inside table id "Approval History"
    And I click on page navigation arrow "Next" for table id "Approval History"
    Then I see "Previous" page is displayed inside table "Approval History"

  @548611 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that if there are no record, Table should display a “No records found” message. Pagination controls should be hidden or disabled. Total record count should show “0”.
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
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "No Records Found" inside flex table with id "Approval History"
    Then I softly do not see pagination are enabled for "Approval History"

  @548602 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that clicking the "Next" button displays the next set of records.
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Amend Program" in the page details
    And I pause execution for "3" seconds
    When I click on "Submit For Approval" in the page details
     # And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHcHIAU/view"
    When I navigate to "History" sub tab
    Then I see pagination "Next" arrow displayed inside table id "Approval History"
    And I pause execution for "5" seconds
    And I click on page navigation arrow "Next" for table id "Approval History"
    Then I see "Previous" page is displayed inside table "Approval History"
    Then I see "First" page is displayed inside table "Approval History"
    Then I softly see column "Status" at position "4" contains text "Started"

  @548603 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that clicking the "Previous" button navigates back to the previous page of records.
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Amend Program" in the page details
    And I pause execution for "3" seconds
    When I click on "Submit For Approval" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHcHIAU/view"
    When I navigate to "History" sub tab
    Then I see pagination "Next" arrow displayed inside table id "Approval History"
    Then I see pagination "Last" arrow displayed inside table id "Approval History"
    And I pause execution for "5" seconds
    And I click on page navigation arrow "Next" for table id "Approval History"
    Then I see "Previous" page is displayed inside table "Approval History"
    Then I see "First" page is displayed inside table "Approval History"
    And I click on page navigation arrow "Previous" for table id "Approval History"
    Then I softly see column "Status" at position "6" contains text "Approved"
    Then I see pagination "Next" arrow displayed inside table id "Approval History"
    Then I see pagination "Last" arrow displayed inside table id "Approval History"

  @548604 @548615 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that “First” and “Last” pagination buttons work correctly.
  |LWC - Approval History Table - PM - To verify that pagination should show the correct number of pages (e.g. 6 pages for 55 records at 10/page).|
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Amend Program" in the page details
    And I pause execution for "3" seconds
    When I click on "Submit For Approval" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHcHIAU/view"
    When I navigate to "History" sub tab
    Then I see pagination "Next" arrow displayed inside table id "Approval History"
    Then I see pagination "Last" arrow displayed inside table id "Approval History"
    And I pause execution for "5" seconds
    And I click on page navigation arrow "Last" for table id "Approval History"
    Then I see "Previous" page is displayed inside table "Approval History"
    Then I see "First" page is displayed inside table "Approval History"
    And I click on page navigation arrow "First" for table id "Approval History"
    Then I softly see column "Status" at position "6" contains text "Approved"
    Then I see pagination "Next" arrow displayed inside table id "Approval History"
    Then I see pagination "Last" arrow displayed inside table id "Approval History"
    Then I softly see column "Assigned To" at position "10" contains text "Automation PO"
    Then I softly see column "Assigned To" at position "8" contains text "Automation EXE"
    Then I softly see column "Assigned To" at position "6" contains text "Automation EXE1"
    Then I softly see column "Assigned To" at position "4" contains text "Automation PM"
    Then I softly see column "stepName" at position "7" contains text "Step : Step 3"
    Then I softly see column "stepName" at position "9" contains text "Step : Step 2"
    Then I softly see column "stepName" at position "5" contains text "Approval Request Submitted"

  @548606 @548616 @548620 @548621 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that, changing the page size updates the number of records displayed accordingly.
  |LWC - Approval History Table - PM - To verify that the currently active page number is visually highlighted.|
  |LWC - Approval History Table - PM - To verify that changing the page size updates view while maintaining continuity of displayed records.|
  |LWC - Approval History Table - PM - To verify that last page should show only remaining records (e.g., 2 records on page 6).|
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I click on "Amend Program" in the page details
    And I pause execution for "3" seconds
    When I click on "Submit For Approval" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHcHIAU/view"
    When I navigate to "History" sub tab
    Then I see pagination "Next" arrow displayed inside table id "Approval History"
    Then I see pagination "Last" arrow displayed inside table id "Approval History"
    And I pause execution for "5" seconds
    Then I softly see page number "Page 1 of 2" tableId "Approval History"
    And I click on page navigation arrow "Last" for table id "Approval History"
    Then I see "Previous" page is displayed inside table "Approval History"
    Then I see "First" page is displayed inside table "Approval History"
    Then I softly see page number "Page 2 of 2" tableId "Approval History"
    And I select value inside table "Approval History" is "10"
    And I pause execution for "3" seconds
    Then I softly do not see pagination are enabled for "Approval History"
    Then I softly see column "Assigned To" at position "5" contains text "Automation PO"
    Then I softly see column "Assigned To" at position "7" contains text "Automation EXE"
    Then I softly see column "Assigned To" at position "9" contains text "Automation EXE1"
    Then I softly see column "Assigned To" at position "11" contains text "Automation PM"
    Then I softly see column "stepName" at position "13" contains text "Step : Step 1 (Pending for approval)"
    Then I softly see column "stepName" at position "11" contains text "Step : Step 4"
    Then I softly see column "stepName" at position "9" contains text "Step : Step 3"
    Then I softly see column "stepName" at position "7" contains text "Step : Step 2"
    Then I softly see column "stepName" at position "5" contains text "Step : Step 1"
    Then I softly see column "stepName" at position "2" contains text "Approval Request Submitted"
    Then I softly see column "Status" at position "1" contains text "Started"

  @548607 @548608 @548601 @US-521809
  Scenario:LWC - Approval History Table - PM - To verify that pagination controls are hidden when total records are less than or equal to the default page size.
  |LWC - Approval History Table - PM - To verify that records are not duplicated or skipped between pages.|
    |LWC - Approval History Table - PM - To verify that the Approval History table displays the correct number of records per the default page size.|
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "History" sub tab
    Then I softly do not see pagination are enabled for "Approval History"
    Then I softly see column "Assigned To" at position "5" contains text "Automation PO"
    Then I softly see column "Assigned To" at position "7" contains text "Automation EXE"
    Then I softly see column "Assigned To" at position "9" contains text "Automation EXE1"
    Then I softly see column "Assigned To" at position "1" contains text "Automation PM"
    Then I softly see column "stepName" at position "10" contains text "Step : Step 4 (Pending for approval)"
    Then I softly see column "stepName" at position "8" contains text "Step : Step 3"
    Then I softly see column "stepName" at position "6" contains text "Step : Step 2"
    Then I softly see column "stepName" at position "2" contains text "Step : Step 1"
    Then I softly see column "stepName" at position "2" contains text "Approval Request Submitted"
    Then I softly see column "Status" at position "1" contains text "Started"

  @548599 @US-521809
  Scenario:LWC - Approval History Table - PM - To verify, if user preference saving is supported, then the selected page size should persist for the user across sessions or reloads.
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I navigate to "History" sub tab
    Then I softly see "No Records Found" inside flex table with id "Approval History"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    And I refresh the page
    Then I softly see column "stepName" at position "1" contains text "Step : Step 1 (Pending for approval)"
    Then I softly see column "stepName" at position "2" contains text "Approval Request Submitted"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly see page number "Page 1 of 2" tableId "Approval History"
    Then I see Total Records count "Total Records: 5" in table name "Approval History"
    When I navigate to "History" sub tab
    When I click on "Amend Program" in the page details
    And I refresh the page
    And I pause execution for "3" seconds
    When I click on "Submit For Approval" in the page details
    And I refresh the page
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHcHIAU/view"
    Then I softly see "Approval History" page block displayed
    Then I softly see show entries are enabled for "Approval History"
    Then I softly see page number "Page 1 of 2" tableId "Approval History"
    Then I see Total Records count "Total Records: 7" in table name "Approval History"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    When I navigate to "History" sub tab
    Then I softly see page number "Page 1 of 2" tableId "Approval History"

  @548590 @548593 @548594 @US-521809
  Scenario: LWC - Approval History Table - PM - To verify that pagination should be display on Approval History Table
  |LWC - Approval History Table - PM - To verify that default page size should be display on Approval History Table|
  |LWC - Approval History Table - PM - To verify that total record count should be display on Approval History Table|
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
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    #548593 #548594
    Then I see table contains "Showing 1 to 5" inside table id "Approval History"
    #548590
    Then I see pagination "Next" arrow displayed inside table id "Approval History"

  @548590_1 @US-521809
  Scenario:LWC - Approval History Table - PM - To verify that pagination should be display on Approval History Table
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PO Username} | Step 2  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 3  |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                       | Program |
      | {SavedValue:EXE1 Username} | Step 4  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "3" seconds
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I get current URL
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I navigate to "History" sub tab
    Then I see scroll at approval history table
    And I get current URL
    Then I softly see scroll at approval history table