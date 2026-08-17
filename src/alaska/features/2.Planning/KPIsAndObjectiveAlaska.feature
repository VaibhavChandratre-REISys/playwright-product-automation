@AlaskaRegression @AlaskaPlanning
Feature: Planning-Pre Award-: Unhide Objectives and KPIs

  @Sprint-19-US-465282 @477298 @477299
  Scenario: Planning-Pre Award-: Unhide Objectives and KPIs
    Given I login to "As a Grantor" app as "ADMIN" user
    #477298
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    #477299
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @Sprint-19-US-465282 @476489
  Scenario Outline: Verify the Admin EXE and PM user can navigate to strategic plan and KPI
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @Sprint-19-US-465282 @476490 @476491
  Scenario Outline: Verify Strategic Plan and KPI fields should be displayed in Create Program Details modal of Planning Module
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    #476490
    Then I softly see fields "DcraProgramType_DCRA__c" is visible
    Then I softly see fields "IsGoalsRequired__c" is visible
    Then I softly see fields "KPIsRequired__c" is visible
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Program Specific Settings" page block displayed
    #476491
    Then I softly see fields "DcraProgramType_DCRA__c" is visible
    Then I softly see fields "IsGoalsRequired__c" is visible
    Then I softly see fields "KPIsRequired__c" is visible
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @Sprint-19-US-465282 @476492 @476493
  Scenario Outline: Verify Objective and KPI fields should be displayed in Create Program Details modal of Announcement Module
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    #476492
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I softly see fields "IsGoalsRequired__c" is visible
    Then I softly see fields "KPIsRequired__c" is visible
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #476493
    When I navigate to "Overview" sub tab
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I softly see fields "IsGoalsRequired__c" is visible
    Then I softly see fields "KPIsRequired__c" is visible
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @Sprint-12-US-446961 @450198 @450199 @450190 @450227 @450196 @452005 @452016 @VaishaliD
  Scenario Outline: Verify Focus Area should be hidden from Create Announcement modal of Announcement Module
  | Verify Focus Area should be hidden from Announcement Layout of Announcement Module
  | Verify Focus Area menus should be hidden from left Navigator Pane Under Activities>Setup Menu of Planning Module
  | Verify Focus Area menus should be hidden from Create Program Details modal of Planning Module
  | Verify Focus Area menus should be hidden from Program Details layout of Planning Module
  | Verify Focus Area menus should be hidden from left Navigator Pane Under Activities>Setup Menu of Planning Module
  | Verify External, NGO Programs menus should be hidden from Edit Announcement Layout of Announcement Module
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I wait for "2" seconds
    #450198
    Then I cannot see field on modal "Focus Area Required?" inside page block
    Then I softly do not see fields "FocusAreaRequired__c" is visible
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    #452016
    Then I softly do not see "Federal/NGO Program" page block displayed
    #450199
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I softly do not see fields "FocusAreaRequired__c" is visible
    And I navigate to "Planning" tab
    #450190
    Then I softly do not see "Focus Areas" content inside "Setup" subheader on left panel
    #452005
    Then I softly do not see "External Programs" content inside "Programs" subheader on left panel
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see "Program Specific Settings" page block displayed
    #450227
    Then I softly do not see fields "FocusAreaRequired__c" is visible
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see "Program Specific Settings" page block displayed
    #450196
    Then I softly do not see fields "FocusAreaRequired__c" is visible
    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |