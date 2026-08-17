@TestDataAlaska
Feature: Validate sanity testing of Complete Business Flow

  @submitApplicationAlaskaTest
  Scenario: Validate once the application is submitted to Grantor and then status changes to Submitted for Program type BEAD - City1 user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_BEAD"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Alaska Broadband Grant Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "BEAD City1 Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application" sub tab
    Then I softly see "Criterion 13. Low-Cost Option - Data Entry" page block displayed
    And I click on "Edit" icon for "0" inside flex table with id "---applicationIntake:-:low-CostOption-DataEntry---"
    And I select input value "100" in field "Monthly_Service_Price__c"
    And I select input value "100" in field "Non_Recurring_Cost__c"
    And I select input value "100" in field "Download_Bandwidth_Minimum_100_Mbp__c"
    And I select input value "100" in field "Upload_Bandwidth_Minimum_20_Mbps__c"
    And I select dropdown value "Yes" in field "Committed_Average_Latency__c"
    And I select dropdown value "Yes" in field "Usage_Limit__c"
    And I select dropdown value "Yes" in field "Committed_to_FCC_Reporting_Metric__c"
    And I select dropdown value "Yes" in field "Affordable_Connectivity_Program_Allowed__c"
    And I select dropdown value "Yes" in field "No_Cost_Upgrade__c"
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:low-CostOption-DataEntry---"
    And I wait for "3" seconds
    Then I softly see "Criterion 14. Middle Class Affordability - Data Entry" page block displayed
    And I click on "Edit" icon for "0" inside flex table with id "---applicationIntake:-:middleClassAffordability-DataEntry---"
    And I select input value "100" in field "Monthly_Service_Price__c"
    And I select input value "100" in field "Non_Recurring_Cost__c"
    And I select input value "100" in field "Download_Bandwidth_Minimum_100_Mbp__c"
    And I select input value "100" in field "Upload_Bandwidth_Minimum_20_Mbps__c"
    And I select dropdown value "Yes" in field "Committed_Average_Latency__c"
    And I select dropdown value "Yes" in field "Usage_Limit__c"
    And I select dropdown value "Yes" in field "Committed_to_FCC_Reporting_Metric__c"
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:middleClassAffordability-DataEntry---"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I see status in Progress-bar is "Submitted" and is "dark blue"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "3" seconds

  @ApplicationTestdataCreation
  Scenario: Alaska App test
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Converted to Application - Open"
    And I perform quick search for "Automation Runtime Announcement Application Intake100306" in "ConvertedAnnouncementsExternal" panel
    When I click on "View" icon for "Automation Runtime Announcement Application Intake100306" inside flex table with id "ConvertedAnnouncementsExternal"
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name             | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                 | Is Key Contact |
      | Automation City1 SPI | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Alaska Broadband Grant Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "BEAD City1 Form Fields" values from "ApplicationForm_Field_Values.xlsx"
    And I navigate to "Application" sub tab
    Then I softly see "Criterion 13. Low-Cost Option - Data Entry" page block displayed
    And I click on "Edit" icon for "0" inside flex table with id "---applicationIntake:-:low-CostOption-DataEntry---"
    And I select input value "100" in field "Monthly_Service_Price__c"
    And I select input value "100" in field "Non_Recurring_Cost__c"
    And I select input value "100" in field "Download_Bandwidth_Minimum_100_Mbp__c"
    And I select input value "100" in field "Upload_Bandwidth_Minimum_20_Mbps__c"
    And I select dropdown value "Yes" in field "Committed_Average_Latency__c"
    And I select dropdown value "Yes" in field "Usage_Limit__c"
    And I select dropdown value "Yes" in field "Committed_to_FCC_Reporting_Metric__c"
    And I select dropdown value "Yes" in field "Affordable_Connectivity_Program_Allowed__c"
    And I select dropdown value "Yes" in field "No_Cost_Upgrade__c"
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:low-CostOption-DataEntry---"
    And I wait for "3" seconds
    Then I softly see "Criterion 14. Middle Class Affordability - Data Entry" page block displayed
    And I click on "Edit" icon for "0" inside flex table with id "---applicationIntake:-:middleClassAffordability-DataEntry---"
    And I select input value "100" in field "Monthly_Service_Price__c"
    And I select input value "100" in field "Non_Recurring_Cost__c"
    And I select input value "100" in field "Download_Bandwidth_Minimum_100_Mbp__c"
    And I select input value "100" in field "Upload_Bandwidth_Minimum_20_Mbps__c"
    And I select dropdown value "Yes" in field "Committed_Average_Latency__c"
    And I select dropdown value "Yes" in field "Usage_Limit__c"
    And I select dropdown value "Yes" in field "Committed_to_FCC_Reporting_Metric__c"
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:middleClassAffordability-DataEntry---"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    And I click on "Validate" in the page details
    And I pause execution for "3" seconds
    And I switch to parent tab
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

  @initiatApplicationReviewAlaskaTest
  Scenario: Alaska initiate application review
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_BEAD"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"