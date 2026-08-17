@AlaskaRegression @AlaskaAnnouncementModule @AlaskaAnnouncement
Feature: Announcement releted Scenarios

  @Sprint-26-US-492760 @494674
  Scenario: As Grantor, Verify Budget Category Type options in the dropdown while creating announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    Then I see only the following ordered options in dropdown field "Budget_Category_Package__c" :
      | --None-- | Construction | Non-Construction | Construction and Non-Construction |

  @Sprint-26-US-492760 @494697
  Scenario: As Grantor, Verify Budget Category Type options in the dropdown while creating Direct Grant
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "3" seconds
    Then I see only the following ordered options in dropdown field "BudgetCategoryPackage__c" :
      | --None-- | Construction | Non-Construction | Construction and Non-Construction |

  @Sprint-27-US-497924 @499477
  Scenario: As Grantor, Verify Is a Detailed Budget Required on the Application? field under Budget Specific Settings on the announcement Layout
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I wait for "2" seconds
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    Then I softly see field "Is a Detailed Budget Required on the Application?" inside "Budget Specific Settings" section
    Then I softly see that "DetailedBudgetingRequired__c" rendered in view mode only
    Then I softly see field "Is a Detailed Budget Required on the Application?" as "No"

  @Sprint-27-US-497924 @499268
  Scenario: As Grantor, Verify that Are Expense Details Required on Reimbursements? field on Create Grant Modal Window
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_CreationNew" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    Then I softly see field "Are Expense Details Required on Reimbursements?" as "No"
    Then I softly see that "AreExpensesBuildIUpLevel__c" rendered in view mode only

  @Sprint-27-US-497924 @499253
  Scenario: As Grantor, Verify Are Expense Details Required on Reimbursements? field under Announcement Specific Settings on the announcement Layout
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I wait for "2" seconds
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Are Expense Details Required on Reimbursements?" inside "Announcement Specific Settings" section
    Then I softly see field "Are Expense Details Required on Reimbursements?" as "No"

  @Sprint-27-US-497924 @499259
  Scenario: As Grantor, Verify that Is Detailed Budget Required on the Subaward? field on Create Grant Modal Window
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_CreationNew" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "No"
    Then I softly see that "IsBuildUpFunctionality__c" rendered in view mode only

  @Sprint-27-US-497924 @499269
  Scenario: As Grantor, Verify that Are Expense Details Required on Reimbursements? field under the Grant Details section on Grant layout
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_CreationNew" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition3" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    Then I softly see field "Are Expense Details Required on Reimbursements?" inside "Grant Details" section
    Then I softly see field "Are Expense Details Required on Reimbursements?" as "No"
    Then I softly see that "AreExpensesBuildIUpLevel__c" rendered in view mode only

  @Sprint-27-US-497924 @499264
  Scenario: As Grantor, Verify that Is Detailed Budget Required on the Subaward? field under the Grant Details section on Grant layout
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_CreationNew" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition3" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    Then I softly see field "Is Detailed Budget Required on the Subaward?" inside "Grant Details" section
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "No"
    And I wait for "2" seconds
    Then I softly see that "IsBuildUpFunctionality__c" rendered in view mode only

  @Sprint-26-US-492760 @494687
  Scenario: As Grantor, Verify that 'Type' column is hidden on the Budget Category Table
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I wait for "2" seconds
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I see "Associate Budget Categories" opens in overLay window
    Then I softly do not see "Type" in flex table header "---announcement:selectProgramBudgetCategory---"

  @Sprint-26-US-492760 @494681
  Scenario: As Grantor, Verify that Budget Category list displays based on Budget Category Type - Construction
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I wait for "2" seconds
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I see "Associate Budget Categories" opens in overLay window
    Then I softly do not see "Type" in flex table header "---announcement:selectProgramBudgetCategory---"
    Then I softly see value "Acquisition / Lease" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Architectural and Engineering" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Construction" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Contingencies" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Contractual" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Demolition and removal" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Equipment" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Freight" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Fringe Benefits" for title "Category Name" inside table "SelectProgramBudgetCategory"
    Then I softly see value "Furniture, Fixtures, Equipment" for title "Category Name" inside table "SelectProgramBudgetCategory"

  @Sprint-26-US-492760 @494704
  Scenario: As Grantor, Verify that 'Shared Revenue' budget category is defaults to any Budget Type When Program is Shared Revenue for Direct Grant
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_CreationNewShare" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEditionshareDire" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "RelatedAwards1" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Shared Revenue" for title "Budget Category" inside table "SubAwardBudgetCategoryFlexGrid"

  @Sprint-26-US-492760 @494683
  Scenario: As Grantor, Verify that Budget Category list displays based on Budget Category Type - Construction & Non-Construction
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I enter "CompetitiveCons&NonAnn" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I wait for "2" seconds
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I see "Associate Budget Categories" opens in overLay window
    Then I softly see value "Acquisition / Lease" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Administrative" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Architectural and Engineering" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Construction" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Contingencies" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Contractual" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Demolition and removal" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Equipment" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Freight" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Fringe Benefits" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"

  @Sprint-26-US-492760 @494705
  Scenario: As Grantor, Verify that Only 'Shared Revenue' budget category is displayed, and other categories are not shown for Direct Grant
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_CreationNewShare" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "GrantEditionshareDire" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Execution Award}" inside flex table with id "RelatedAwards1" without waiting for record
    And I navigate to "Budget" sub tab
    Then I softly see value "Shared Revenue" for title "Budget Category" inside table "SubAwardBudgetCategoryFlexGrid"

  @Sprint-26-US-492760 @494682
  Scenario: As Grantor, Verify that Budget Category list displays based on Budget Category Type - Non-Construction
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnNonConstru" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I wait for "2" seconds
    When I enter "Creation Second Modal Ann" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I see "Associate Budget Categories" opens in overLay window
    Then I softly see value "Acquisition / Lease" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Administrative" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Architectural and Engineering" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Contingencies" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Contractual" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Equipment" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Freight" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Fringe Benefits" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "Furniture, Fixtures, Equipment" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    Then I softly see value "General Purpose Equipment" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"

  @Sprint-23-US-481611 @487818 @487822 @487819
  Scenario: As Grantor, verify that Project Period End Date should be populated by default on Announcement when program is shared revenue
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "DirectAnn" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal2" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Estimated Project Period End Date" inside "Key Dates" section
#    487822
    Then I softly see field "Estimated Project Period End Date" is not editable
#    487819
    Then I softly see field "Estimated Project Period Start Date" as "7/1/2025"
    Then I softly see field "Estimated Project Period End Date" as "6/30/2026"



