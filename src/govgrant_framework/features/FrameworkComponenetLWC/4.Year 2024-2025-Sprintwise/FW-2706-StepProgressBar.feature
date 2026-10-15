@StepProgressBar @US-FW-2706
Feature: The user must create an Step ProgressBar at the LWC Object level.
  LWC - Test Set - Change step progress bar behavior when hide logic is applied to current record status.

  @FW-2707
  Scenario:LWC: Step Progress Bar: PM: To Verify that when user hide active step Created of step progress bar then Created step is not displayed and all remaining steps appear in gray color.
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName      | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide For Users |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName      | fieldNewValue | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide For Users | Internal      | Program Progress Bar | Name                      | Created                    |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly do not see "Created" step is diplayed on step progress bar
    Then I softly see field "Status" as "Created"
    Then I softly see background color "Light Gray" displayed for step "Submitted for Approval"
    Then I softly see background color "Light Gray" displayed for step "Approved"

  @FW-2709
  Scenario: LWC: Step Progress Bar: PM: To Verify that when user hide active step submitted for review of step progress bar then submitted for review step is not displayed and all remaining steps appear in gray color.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    Then I softly see "Submitted for Review" step is diplayed on step progress bar
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue                                | filterId         |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:SubmittedForReviewDefaultConfig | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                                    | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:SubmittedForReviewContextInView | Program Progress Bar | Name                      | Submitted for Review       |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see "Submitted for Review" step is diplayed on step progress bar
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly see background color "Light Gray" displayed for step "Submitted for Approval"
    Then I softly see background color "Light Gray" displayed for step "Reviewed"
    And I click on "Next Step" on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Approved"
    Then I softly see background color "Light Gray" displayed for step "Active"
    Then I softly see background color "Light Gray" displayed for step "Closed"

  @FW-2711
  Scenario: LWC: Step Progress Bar: PM: To Verify that when user hide active step reviewed of step progress bar then reviewed step is not displayed and all remaining steps appear in gray color.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility   | Description            | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Program Reviewer | Automation Description | 5        | No                   |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    Then I softly see "Submitted for Review" step is diplayed on step progress bar
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see "Submitted for Review" step is diplayed on step progress bar
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "Automation PM" inside flex table with id "---program:-:peerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click modal button "Submit Review"
    When I click modal button "Close"
    Given I click on "Complete Review" in the page details
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    Then I softly see "Reviewed" step is diplayed on step progress bar
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue                      | filterId         |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:ReviewedDefaultConfig | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                              | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:ReviewedProfileInPMConfig | Program Progress Bar | Name                      | Reviewed                   |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see "Reviewed" step is diplayed on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Submitted for Approval"
    And I click on "Next Step" on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Approved"
    And I click on "Next Step" on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Active"
    And I click on "Next Step" on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Closed"

  @FW-2712
  Scenario: LWC: Step Progress Bar: PM: To Verify that when user hide active step Submitted for approval of step progress bar then Submitted for approval step is not displayed and all remaining steps appear in gray color.
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
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide Expression Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                                                   | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:SubmitForApprovalUserAppInStateAsGrantorConfig | Program Progress Bar | Name                      | Submitted for Approval     |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see "Submitted for Approval" step is diplayed on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Approved"
    Then I softly see background color "Light Gray" displayed for step "Active"

  @FW-2713
  Scenario: LWC: Step Progress Bar: PM: To Verify that when user hide active step approved of step progress bar then approved step is not displayed and all remaining steps appear in gray color.
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
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide Expression Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                                        | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:ApprovedFieldStatusFreeTextApproved | Program Progress Bar | Name                      | Approved                   |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see "Approved" step is diplayed on step progress bar
    And I click on "Next Step" on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Active"

  @FW-2714
  Scenario:LWC: Step Progress Bar: PM: To Verify that when user hide active step rejected of step progress bar then rejected step is not displayed and all remaining steps appear in gray color.
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
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see status in Progress-bar is "Rejected" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide Expression Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                                     | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:RejectedQueueInGovGrantTestQueue | Program Progress Bar | Name                      | Rejected                   |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see "Rejected" step is diplayed on step progress bar
    And I click on "Next Step" on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Submitted For Approval"
    Then I softly see background color "Light Gray" displayed for step "Approved"
    Then I softly see background color "Light Gray" displayed for step "Active"

  @FW-2715
  Scenario:LWC: Step Progress Bar: PM: To Verify that when user hide active step active of step progress bar then active step is not displayed and all remaining steps appear in gray color.
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
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
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
    And I click on "Activate" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide Expression Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                             | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:ActiveUserTypeInInternal | Program Progress Bar | Name                      | Active                     |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see "Active" step is diplayed on step progress bar
    And I click on "Next Step" on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Closed"

  @FW-23517
  Scenario: LWC: Step Progress Bar: SPI: To Verify that when user hide active step Created of step progress bar then Created step is not displayed and all remaining steps appear in gray color.
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName      | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide For Users |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName      | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide For Users | External      | External Application Progress Bar | Name                      | Created                    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly do not see "Created" step is diplayed on step progress bar
    Then I softly see field "Status" as "Created"
    Then I softly see background color "Light Gray" displayed for step "Submitted"
    Then I softly see background color "Light Gray" displayed for step "Converted to Award"

  @FW-23523
  Scenario: LWC: Step Progress Bar: SPI: To Verify that when user hide active step submitted of step progress bar then submitted step is not displayed and all remaining steps appear in gray color.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName      | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide For Users |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName      | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide For Users | External      | External Application Progress Bar | Name                      | Submitted                  |
    And I refresh the page
    Then I softly do not see "Submitted" step is diplayed on step progress bar
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly see background color "Light Gray" displayed for step "Converted to Award"

  @FW-23524
  Scenario: LWC: Step Progress Bar: SPI: To Verify that when user hide active step review initiated of step progress bar then review initiated step is not displayed and all remaining steps appear in gray color.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Application" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Application}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Application}" in "---applicationReview:-:announcementListTableId---" panel
    And I pause execution for "5" seconds
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement for Application}" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I pause execution for "2" seconds
    And I wait for "5" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    Then I softly see field "Status" as "Review Initiated"
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide Expression Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:ReviewInitiatedFieldStausEqualsReviewInitiated | External Application Progress Bar | Name                      | Review Initiated           |
    And I refresh the page
    Then I softly do not see "Review Initiated" step is diplayed on step progress bar
    Then I softly see field "Status" as "Review Initiated"
    Then I softly see background color "Light Gray" displayed for step "Converted to Award"

  @FW-23526
  Scenario: LWC: Step Progress Bar: SPI: To Verify that when user hide active step reviewed of step progress bar then reviewed step is not displayed and all remaining steps appear in gray color.
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Reviewed"
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    Then I softly see background color "Light Gray" displayed for step "Converted to Award"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    Then I softly see field "Status" as "Reviewed"
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide Expression Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:ReviewedSPIUserAppInRecipient | External Application Progress Bar | Name                      | Reviewed                   |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see "Reviewed" step is diplayed on step progress bar
    Then I softly see field "Status" as "Reviewed"
    Then I softly see background color "Light Gray" displayed for step "Review Initiated"

  @FW-23527
  Scenario: LWC: Step Progress Bar: SPI:  To Verify that when user hide active step converted to award  of step progress bar then converted to award step is not displayed and all remaining steps appear in gray color.
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I enter value "Automation Test Description" into field "GrantAwardDescription__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside table
    Then I softly see field "Status" as "Converted to Award"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    Then I softly see field "Status" as "Converted to Award"
    Given I have "default" configuration as below:
      | configurationCategory   | fieldName            | fieldOrignalValue | filterId         |
      | Step Progressbar Detail | Hide Expression Json |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory   | fieldName            | fieldNewValue                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Step Progressbar Detail | Hide Expression Json | govgrants_config:ConvertedToAwardContextInView | External Application Progress Bar | Name                      | Converted to Award         |
    And I refresh the page
    Then I softly see field "Status" as "Converted to Award"
    Then I softly do not see "Converted to Award" step is diplayed on step progress bar
    Then I softly see background color "Light Gray" displayed for step "Reviewed"
