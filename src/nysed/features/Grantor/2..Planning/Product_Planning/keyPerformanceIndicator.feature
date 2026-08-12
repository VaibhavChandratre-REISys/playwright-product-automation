@kpi @planning @productplanning
Feature: Validate all scenarios in Key Performance Indicator(KPI)

  @51028 @editionOfKPI
  Scenario Outline: Edition of KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @51029 @addAttachmentToKPI
  Scenario Outline: Addition of Attachment to KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---keyperformanceindicator:-:GrantorKPIFilesTableId---"
    And I wait for "5" seconds
    And I upload attachment "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Other" has been added in "KPI Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---keyperformanceindicator:-:GrantorKPIFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Supporting Documents" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---keyperformanceindicator:-:GrantorKPIFilesTableId---"
    Then I softly see value "Supporting Documents" for title "Classification" inside table "---keyperformanceindicator:-:GrantorKPIFilesTableId---"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @34736 @kpiHappyPath @smoke
  Scenario Outline: Happy Path of KPI
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I wait for "4" seconds
    And I click on "Save" in the page details
    And I wait for "4" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---keyperformanceindicator:-:GrantorKPIFilesTableId---"
    And I wait for "4" seconds
    And I upload attachment "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Examples:
      | User  |
      | ADMIN |
      | EXE   |

  @kpiCreationPM
  Scenario: Negative Case - Verify that other users (Other than Admin/EXE) are not able to create KPI
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    Then  I cannot see top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"

  @52625 @userFOEditKPI
  Scenario: Negative Case-Verfiy that PM user cannot Edit the record
    Given I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---keyperformanceindicator:-:kpiTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:Automation Runtime KPI}" in flex table with id "---keyperformanceindicator:-:kpiTableId---"

  @52622 @userFODeleteKPI
  Scenario: Negative Case-Verfiy that PM user cannot Delete the record
    Given I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---keyperformanceindicator:-:kpiTableId---" panel
    Then I cannot see row level action button "Delete" against "{SavedValue:Automation Runtime KPI}" in flex table with id "---keyperformanceindicator:-:kpiTableId---"

  @52623 @deactivateKPI
  Scenario Outline: Negative Case-Verfiy that EXE can deactivate the record
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Inactive" and is "dark blue"
    Examples:
      | User  |
      | ADMIN |
#      | EXE   |

  @52536 @deactivateKPIFOUser
  Scenario Outline:  Negative Case- Verfiy that other users (other than Admin, EXE) can not deactivate KPI
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) -Active"
    When I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I cannot see top right button "Deactivate" in page detail
    Examples:
      | User |
      | EXE  |

  @52535 @closedKPIListView
  Scenario: Verfiy that user can see Closed KPI under Inactive KPI list view.
    Given I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    When I click on "Activate" in the page details
    And I click on "Deactivate" in the page details
    And I wait for "2" seconds
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Inactive"
    When I perform quick search for "{SavedValue:Automation Runtime KPI}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime KPI}" inside table
    Then I see status in Progress-bar is "Inactive" and is "dark blue"

  @105456 @VerifyActiveStrategicPlan
  Scenario: Validate user is able to see activated strategic plan
    Given I login to "As a Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - All"
    When I perform quick search for "Automation Permanent Strategic Plan" in "---strategicplan:-:StrategicPlansTableId---" panel
    Then I see value "Active" for title "Status" against the value "Automation Permanent Strategic Plan" inside table "---strategicplan:-:StrategicPlansTableId---"

  @106645 @VerifyRelatedObjectiveDetails @smoke
  Scenario: Validate user is able to see related objective
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "Title" as "KPINAME"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Execution Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    When I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Execution Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Related Log" sub tab
    And I click on top right button "Associate" in flex table with id "---strategicplan:-:ObjectivesKPITableId---"
    And I wait for "3" seconds
    When I click "Add" after selection of "{SavedValue:KPINAME}" in the table "---strategicplan:-:ListOfActiveKPITableId---"
#    When I click modal button "Close"
    And I refresh the page
    When I navigate to "Related Log" sub tab
    And I wait for "3" seconds
    Then I softly see that "{SavedValue:KPINAME}" has been added in flextable with Id "---strategicplan:-:ObjectivesKPITableId---"
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) -Active"
    When I perform quick search for "{SavedValue:KPINAME}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:KPINAME}" inside table
    When I navigate to "Related Log" sub tab
    Then I softly see value "Execution Objective" for title "Title" inside table "---keyperformanceindicator:-:ObjectiveTableId---"