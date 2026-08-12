@commonAnnouncements @Product-M04 @announcementExecution @Productannouncement
Feature: Validate all common scenarios in the  Announcement tab

  Background: Create Announcement
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"

  @33936 @announcementCreatedDeleteAccessToOwnerFA
  Scenario: Validate that owner can able to delete created status announcement
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When  I click on "Delete" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I do not see value "Record id" for title "Announcement Name" inside table "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @34222 @52400 @70342 @70343 @37029 @52401 @73393 @52402 @52403 @52404 @createdAnnouncementEditionOnlyOwnerFA @annn
  Scenario: Validate that only owner can able to edit created status announcement | To verify user able to enter the description in the details field of overview tab while creating the Announcemennt
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    And I wait for "5" seconds
    When I click on "Edit" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---" without waiting for record
    Then I softly can see top right button "Save" in page detail
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financials Tab - Enter the Estimated Funding Amount.                                                                    |
      | Financials Tab - There should be no gap between the dates. Enter the correct Budget Periods Start Dates and End Dates.  |
      | Financials Tab - Enter at least one Budget Period.                                                                      |
      | Financials tab - At least 1 funding account needs to be associated with announcement, contact FD profile user for same. |
      | Overview Tab - Enter the Description.                                                                                   |
      | Overview Tab - First Payment % is required before submitting announcement for approval.                                 |
      | Overview Tab - Provide the Application Due Date.                                                                        |
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section.                                      |
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval.                                      |
      | Setup Tab - At least one Coordinator should be added for each review step.                                              |
      | Overview Tab - 'Fiscal Approval Required for Amendment?' is required to submit for approval.                            |
      | Overview Tab - You must invite at least one applicant before submitting this Announcement.                              |
      | Financials Tab - Indirect Rate Type is required to submit for approval.                                                 |
      | Responsibilities - At least one approver is required                                                                    |
    When I click on "Edit" in the page details
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I pause execution for "2" seconds
    Then I softly see value "Description" for the field "Automation test description"

  @52406 @announcementBudgetPeriodDissociationFA
  Scenario: Validate the dissociation of Budget Period to the Announcement
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I refresh the page
    When I navigate to "Financials" sub tab
    When I click on "Remove" icon for "BP01" inside flex table with id "---announcement:-:budgetPeriodTableId---" without waiting for record
    And I refresh the page
    When I navigate to "Financials" sub tab
    Then I do not see value "BP01" for title "Budget Period Name" inside table "---announcement:-:budgetPeriodTableId---"

  @52409 @announcementObjectiveDissociationFA
  Scenario: Validate the dissociation of objective to the Announcement
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I click on "Remove" icon for "Automation Permanent Objective2" inside flex table with id "---announcement:-:objectivesTableId---" without waiting for record
    Then I do not see value "Automation Permanent Objective2" for title "EGMS ID" inside table "---announcement:-:objectivesTableId---"

  @45773 @announcementOtherNotAbleToDelete
  Scenario: Validate that other users are not able to delete created announcement
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Delete" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"

  @45774 @announcementOtherNotAbleToEdit
  Scenario: Validate that other users are not able to Edit created announcement
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - All"
    And I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    Then I cannot see row level action button "Edit" against "Record id" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"