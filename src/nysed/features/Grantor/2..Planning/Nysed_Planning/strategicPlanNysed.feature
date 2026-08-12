@StrategicPlanNysed @planningNysed @planning
Feature: Validate all scenarios in Strategic Plan

  @492813 @Sprint-01 @US-490341 @M04 @M04Planning
  Scenario Outline: Verify that the Internal user see only Edit button at the Strategic Plan page layout and other record flow action buttons at page level action dropdown
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Activate" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Automation Strategic Goal" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Back To Strategic Plan" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Back To Strategic Goal" in page detail
    Then I softly can see top right dropdown button "Download as PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType |
      | PM       |
#      | EXE      |
#      | ADMIN    |