@staticRecordCreation
Feature: Validate all scenarios for static data creation

  @Create_PermanentStandardAssurancesFormForSPI
  Scenario: Permanent Standard Assurances Form For SPI
    Given I published "Competitive" type announcement having name "Permanent Standard Assurances Form For SPI" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Permanent Standard Assurances Form For SPI}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Permanent Standard Assurances Form For SPI}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    Then I can see row level action button "View" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Preview" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Splitview" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "View" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Edit" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Preview" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Splitview" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"

  @Check_PermanentStandardAssurancesFormForSPI
  Scenario:Check Permanent Standard Assurances Form For SPI
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - My Records"
    And I perform quick search for "{SavedValue:PermanentStandardAssurancesFormForSPI}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:PermanentStandardAssurancesFormForSPI}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "10" seconds
    And I navigate to "Forms and Files" sub tab
    Then I can see row level action button "View" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Edit" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Preview" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Splitview" against "Standard Assurances Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "View" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Edit" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Preview" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"
    Then I can see row level action button "Splitview" against "Program Application Form" in flex table with id "---applicationReview:-:allFormsTableId---"

  @Create_PermanentGeneralReviewFormForEXE
  Scenario:Create Permanent General Review Form For EXE
    Given I activated standalone subaward "Permanent General Review Form For EXE" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "5" seconds
    Then I can see row level action button "Preview" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"
    Then I can see row level action button "Splitview" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"
    Then I can see row level action button "View" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"
    Then I can see row level action button "Edit" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"

  @Check_PermanentGeneralReviewFormForEXE
  Scenario:Check Permanent General Review Form For EXE
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    Then I can see row level action button "Preview" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"
    Then I can see row level action button "Splitview" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"
    Then I can see row level action button "View" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"
    Then I can see row level action button "Edit" against "General Review Form" in flex table with id "---sitevisits:-:reportsTableId---"
