@kpiNysed @planningNysed @planning
Feature: Validate all scenarios in Key Performance Indicator(KPI)

  @492818 @Sprint-01 @US-490341 @M04 @M04Planning @sanitysuite
  Scenario Outline: Verify that the Internal user see only Edit button at the KPI page layout and other record flow action buttons at page level action dropdown
    Given I am on "INTERNAL" portal
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    Then I softly can see top right dropdown button "Deactivate" in page detail
    And I click on "Deactivate" in the page details
    Then I see status in Progress-bar is "Inactive" and is "dark blue"
    And I wait for "2" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Activate" in page detail
    Then I softly cannot see top right dropdown button "Deactivate" in page detail

    Examples:
      | UserType |
      | EXE      |
#      | ADMIN    |