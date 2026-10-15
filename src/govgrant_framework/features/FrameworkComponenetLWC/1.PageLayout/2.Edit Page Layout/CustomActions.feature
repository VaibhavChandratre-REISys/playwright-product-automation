@PageLayout @CustomActionsEdit @EditLayout @PageLayout2
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @319389 @319388 @319047 @319039
  Scenario Outline: LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on 'Edit' action then layout should open in same window when Action Behavior is set to 'None' in page layout action config.
  LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on Edit button then user should get redirected to Edit layout
    Given I have "default" configuration as below:
      | configurationCategory | fieldName       | fieldOrignalValue | filterId         |
      | Page Layout Action    | Action Behavior |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName       | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Action Behavior |               | Grantor State Program | Name                      | Edit                       |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    Then I see "Save" button is displayed
    Then I see "Cancel" button is displayed

    Examples:
      | Users |
     # | Admin |
      | PM    |

  @319298 @319313
  Scenario Outline: LWC - Flex Edit Layout - Page Layout Actions - Config - Admin - To verify Action should be render as button when 'Type' is selected as 'Button' in page layout action details config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue | filterId         |
      | Page Layout Action    | Is Active   | true              | Grantor State Program | Name                      | Edit                       | ApiGeneratedId:0 |
      | Page Layout Action    | Layout Type | View              | Grantor State Program | Name                      | Edit                       | ApiGeneratedId:1 |
      | Page Layout Action    | Type        | Button            | Grantor State Program | Name                      | Edit                       | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true          | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Layout Type | View          | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Type        | Button        | Grantor State Program | Name                      | Edit                       |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    Then I see "Save" button is displayed
    Then I see "Cancel" button is displayed

    Examples:
      | User |
     # | Admin |
      | PM   |

  @337297 @337309
  Scenario Outline: LWC - Flex Edit Layout - Page Layout Actions - UI - PM- To verify when user click on action then entire page should be refreshed when Refresh Behavior is set to 'Refresh the entire page' in page layout action config.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    Then I see "Save" button is displayed
    And I click on "Save" in the page details
    Then I see "Edit" button is displayed

    Examples:
      | User |
     # | Admin |
      | PM   |
