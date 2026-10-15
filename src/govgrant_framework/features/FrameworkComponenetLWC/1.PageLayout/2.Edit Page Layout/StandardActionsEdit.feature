@PageLayout @StandardActionsEdit @EditLayout @PageLayout2
Feature: Page Layout Scenarios
Business Need: to ensure that the page layout of our web pages meets the needs of different user roles: admin, internal users, and external users.

  @319146 @319145 @319060 @319059
  Scenario Outline:LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on "Save" button then filled data should be saved successfully and get rendered on view layout.
  LWC - Flex Edit Layout - Page Layout Actions - UI - PM- To verify when user click on "Save" button then filled data should get saved and redirected to view layout
    Given I delete the record "Automation Runtime Internal Program" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail

    Examples:
      | User |
   #   | Admin |
      | PM   |

  @319114 @319112
  Scenario Outline: LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on "Save" button without filling required field then error message "(Field Name) is required to save under (Tab Name)." should be display on top of the page
    Given I delete the record "Automation Runtime Internal Program" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I clear the value from field "ProgramName__c"
    And I click on "Save" in the page details
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Program Name is required in the Overview tab under the Information section. |

    Examples:
      | User |
      #| Admin |
      | PM   |

  @319094 @319093
  Scenario Outline: LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on "Cancel" button and again click "Yes" button on confirmation box then user should get redirected to view layout without saving filled data
    Given I delete the record "Automation Runtime Internal Program" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I pause execution for "5" seconds
    And I click on "Cancel" in the page details without processing
    # I see confirmation box with body "Are you sure you want to cancel?" is displayed
    Then I see confirmation box with message "Are you sure you want to cancel?" is displayed
    And I click "OK" on modal confirmation box
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @319091 @319085 @319083 @319077 @319073 @319070 @319069 @319067 @319054 @319053 @319052 @319051
  Scenario Outline: LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on "Cancel" button and again click "No" button on confirmation box then confirmation box should be closed and user will stay on edit layout
  LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on "Cancel" button then "Cancel" & "OK" buttons should be display on confirmation box at right bottom
  LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on "Cancel" button then confirmation message "Are you sure you want to cancel?" should be display in confirmation box
  LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify when user click on "Cancel" button then confirmation box should be pop up
  LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify user should able to see "Cancel" button on right top of Edit layout
  LWC - Flex Edit Layout - Page Layout Actions - UI - PM - To verify user should able to see "Save" button on right top of Edit layout
    Given I delete the record "Automation Runtime Internal Program" from the object "Program__c" with field "ProgramName__c"
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "10" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "OK" button is displayed on alert popup
    And I click "Cancel" on modal confirmation box
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail

    Examples:
      | User |
     # | Admin |
      | PM   |
