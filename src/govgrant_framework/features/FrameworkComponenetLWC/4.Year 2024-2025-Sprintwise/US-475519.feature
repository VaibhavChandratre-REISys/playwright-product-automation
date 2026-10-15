@Sprint-2025 @US-475519 @JuneRelease1
Feature:Sprint Scenarios for Support to hide child/grandchild table top action.
Business Need: - Support to hide child/grandchild table top action.

  @546904
  Scenario: LWC - Grid - PM - To verify that, the hide logic should be worked from the parent table object for the top-level actions of child table.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentFieldPreScreen | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"

  @546924
  Scenario: LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then the top actions in the child table should be hidden from the user.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentFieldPreScreen | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"

  @546926
  Scenario: LWC - Grid - PM - To verify that, when a parent record updates the values, then the visibility of child actions should update in real-time.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                    | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                             | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentFieldStepWeight | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                             | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Order | Step Weight (%) |
      | 1          | 25              |
    And I refresh the page
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"

  @546928
  Scenario: LWC - Grid - PM - To verify that, when the parent record does not meet any defined condition, then all top actions for the child grid should remain visible by default.
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #And I navigate to url "https://test8-internal--afsautoqa.sandbox.lightning.force.com/lightning/r/Program__c/a37Da000000eHNDIA2/view"
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I edit the following rows inline in flex table with id "---program:-:reviewStepTableId---" by clicking "Edit" :
      | Step Order | Step Weight (%) |
      | 1          | 25              |
    And I refresh the page
    Then I softly see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"

  @546930_1 @546931 @546935
  Scenario: LWC - Grid - PM - To verify that, logic should support both direct parent-child relationships and deeper levels (e.g., parent → child → grandchild) for controlling visibility.
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then there should be no impact on child table data|
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then child table layout remains consistent.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentFieldPreScreen | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Application completeness and correctness review" for title "Description" against the value "Pre-Screen Review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Pre-Screen Review" for title "Step Name" against the value "Application completeness and correctness review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "0.00%" for title "Step Weight (%)" against the value "Pre-Screen Review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see value "Pre-Screen" for title "Form Name" against the value "Yes" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    And I expand nested table containing column value "Pre-Screen"
    Then I softly see value "Eligibility" for title "Review Form Name" against the value "1" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Completeness" for title "Review Form Name" against the value "2" inside table "---program:-:ReviewCategoriesTestTableId---"


  @546930_2 @546931 @546935
  Scenario: LWC - Grid - PM - To verify that, logic should support both direct parent-child relationships and deeper levels (e.g., parent → child → grandchild) for controlling visibility.
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then there should be no impact on child table data|
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then child table layout remains consistent.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentFieldPreScreen | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Detailed subject matter expert review" for title "Description" against the value "SME Review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "SME Review" for title "Step Name" against the value "Detailed subject matter expert review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "75.00%" for title "Step Weight (%)" against the value "Detailed subject matter expert review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Compliance Review" for title "Form Name" against the value "Yes" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Fiscal Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Program Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    And I expand nested table containing column value "Compliance Review"
    Then I softly see value "Schedule" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Environment" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Permits" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"
    And I expand nested table containing column value "Fiscal Review"
    Then I softly see value "Budget" for title "Review Form Name" against the value "75%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Match" for title "Review Form Name" against the value "15%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Program Income" for title "Review Form Name" against the value "10%" inside table "---program:-:ReviewCategoriesTestTableId---"
    And I expand nested table containing column value "Program Review"
    Then I softly see value "Capability" for title "Review Form Name" against the value "15%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Approach" for title "Review Form Name" against the value "60%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Impact" for title "Review Form Name" against the value "25%" inside table "---program:-:ReviewCategoriesTestTableId---"

  @546930_3 @546931 @546935 @547009
  Scenario: LWC - Grid - PM - To verify that, logic should support both direct parent-child relationships and deeper levels (e.g., parent → child → grandchild) for controlling visibility.
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then there should be no impact on child table data|
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then child table layout remains consistent.|
  |LWC - Grid - PM - To verify that, when a parent record meets specific conditions, then there should be no impact on child table data|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentFieldPreScreen | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                            | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Management Review" for title "Step Name" against the value "Leadership review to finalize decisions" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "Leadership review to finalize decisions" for title "Description" against the value "Management Review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "25.00%" for title "Step Weight (%)" against the value "Management Review" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I expand nested table containing column value "Management Review"
    Then I softly see value "Management Review" for title "Form Name" against the value "Yes" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Return on Investment (ROI)" for title "Review Form Name" against the value "60^" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Strategic Alignment" for title "Review Form Name" against the value "40%" inside table "---program:-:ReviewCategoriesTestTableId---"

  @546941 @546949 @546939 @546943
  Scenario: LWC - Grid - PM - To verify that, for all datatypes, after applying Hide Expression JSON using Field left operand on the basis of parent object, then the top actions in the child table should be hidden from the user.
  |LWC - Grid - PM - To verify that, the hide logic should be worked from the parent table object for the top-level actions of child table when we enable the 'Enable Parent Hide Logic' config at the flex table action level|
  |LWC - Grid - PM - To verify that, after applying Hide Expression JSON using Field left operand on the basis of parent object,  then the top actions in the child table should be hidden from the user.|
  |LWC - Grid - PM - To verify that, the hide logic should be worked from the parent table object for the top-level actions of child table when actions record type is "FlexGrid Enhanced Action"|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                              | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepDFN},AutTestName__c,Email__c,URL__c,EndDate__c,Phone__c,Currency__c,Justification__c | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Step Order | Step Weight (%) | # of Panels | AutTestName | Email           | URL            | X_End Date | Phone      | Currency | Justification |
      | 1          | 25              | 1           | Data        | vrush@gmail.com | www.google.com | 5/11/2026  | 9527371482 | 500      | Text Area     |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                          | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentAllDataTypes | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                          | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"

  @546941_1
  Scenario: LWC - Grid - PM - To verify that, for all datatypes, after applying Hide Expression JSON using Field left operand on the basis of parent object, then the top actions in the child table should be hidden from the user.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                              | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepDFN},AutTestName__c,Email__c,URL__c,EndDate__c,Phone__c,Currency__c,Justification__c | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" by clicking "Edit" :
      | Step Order | Step Weight (%) | # of Panels | Email           | URL            | X_End Date | Phone      | Currency | Justification |
      | 1          | 25              | 1           | vrush@gmail.com | www.google.com | 5/11/2026  | 9527371482 | 500      | Text Area     |
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                           | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewStepParentDateDataTypes | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                           | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"

  @546937
  Scenario: LWC - Grid - PM - To verify that, the hide logic should not be worked from the page layout object for the top-level actions of child table.
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                   | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:PageLayoutParentField | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                   | ProgramReviewStepPanelTemplates | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly see top right button "Test Button" inside flex table "---afsautoqa:-:ProgramReviewStepChildTableId---"

  @546923 @546925
  Scenario: LWC - Grid - PM - To verify that, the hide logic should be worked from the child table object for the top-level actions of grand-child table.
  |LWC - Grid - PM - To verify that, when a child record meets specific conditions, then the top actions in the grandchild table should be hidden from the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                  | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewFormChildFieldPreScreen | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"

  @546927 @546940
  Scenario:LWC - Grid - PM - To verify that, when a child record updates the values, then the visibility of grandchild actions should update in real-time.
  |LWC - Grid - PM - To verify that, after applying Hide Expression JSON using Field left operand on the basis of child object, then the top actions in the grandchild table should be hidden from the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Pre-Screen | 50              | 1                                         | Checked   | No                     |
    And I pause execution for "5" seconds
    Then I softly see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                     | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewFormChildFieldRealTimeData | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                              | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"

  @546929
  Scenario: LWC - Grid - PM - To verify that, when the child record does not meet any defined condition, then all top actions for the grandchild grid should remain visible by default.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Pre-Screen | 50              | 1                                         | Checked   | No                     |
    Then I softly see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                     | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | govgrants_config:ReviewFormChildFieldRealTimeData | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared |
      | Pre-Screen | 50              | 2                                         | Checked   | No                     |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"

  @546932 @546936
  Scenario:LWC - Grid - PM - To verify that, when a child record meets specific conditions, then there should be no impact on grandchild table data
  |LWC - Grid - PM - To verify that, when a child record meets specific conditions, then grandchild table layout remains consistent.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                  | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewFormChildFieldPreScreen | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Eligibility" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Completeness" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"

  @546932_1
  Scenario:LWC - Grid - PM - To verify that, when a child record meets specific conditions, then there should be no impact on grandchild table data
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                  | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewFormChildFieldPreScreen | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"
    And I expand nested table containing column value "SME Review"
    Then I softly see value "Compliance Review" for title "Form Name" against the value "Yes" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Fiscal Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Program Review" for title "Form Name" against the value "50.00%" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    And I expand nested table containing column value "Compliance Review"
    Then I softly see value "Schedule" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Environment" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Permits" for title "Review Form Name" against the value "0%" inside table "---program:-:ReviewCategoriesTestTableId---"
    And I expand nested table containing column value "Fiscal Review"
    Then I softly see value "Budget" for title "Review Form Name" against the value "75%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Match" for title "Review Form Name" against the value "15%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Program Income" for title "Review Form Name" against the value "10%" inside table "---program:-:ReviewCategoriesTestTableId---"
    And I expand nested table containing column value "Program Review"
    Then I softly see value "Capability" for title "Review Form Name" against the value "15%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Approach" for title "Review Form Name" against the value "60%" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Impact" for title "Review Form Name" against the value "25%" inside table "---program:-:ReviewCategoriesTestTableId---"

  @546932_2
  Scenario:LWC - Grid - PM - To verify that, when a child record meets specific conditions, then there should be no impact on grandchild table data
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                  | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewFormChildFieldPreScreen | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                           | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"
    And I expand nested table containing column value "Management Review"
    Then I softly see value "Management Review" for title "Form Name" against the value "Yes" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"
    Then I softly see value "Return on Investment (ROI)" for title "Review Form Name" against the value "60^" inside table "---program:-:ReviewCategoriesTestTableId---"
    Then I softly see value "Strategic Alignment" for title "Review Form Name" against the value "40%" inside table "---program:-:ReviewCategoriesTestTableId---"

  @546942 @546946 @546950
  Scenario: LWC - Grid - PM - To verify that, for all datatypes, after applying Hide Expression JSON using Field left operand on the basis of child object,  then the top actions in the grandchild table should be hidden from the user.
  |LWC - Grid - PM - To verify that, the hide logic should be worked from the child table object for the top-level actions of grandchild table when actions record type is "FlexGrid Enhanced Action"|
  |LWC - Grid - PM - To verify that, the hide logic should be worked from the child table object for the top-level actions of grandchild table when we enable the 'Enable Parent Hide Logic' config at the flex table action level|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn},DueInDays__c,TextArea__c,TestCurrency__c,EndDate__c,PercentageTest__c,Phone__c,Email__c,URL__c,Lookup__c | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" by clicking "Edit" :
      | Form Name  | Form Weight (%) | Minimum Number of Reviews per Application | Required? | Review Response Shared | Due in Days | TextArea  | TestCurrency | Phone      | Email           | URL            | Program     |
      | Pre-Screen | 50              | 1                                         | Checked   | No                     | 2           | Test Data | 500          | 9527371482 | vrush@gmail.com | www.google.com | PG-TAO-2202 |
    And I pause execution for "5" seconds
    Then I softly see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                     | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                              | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:ReviewFormChildFieldAllDataTypes | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                              | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"

  @546938
  Scenario: LWC - Grid - PM - To verify that, the hide logic should not be worked from the page layout obejct for the top-level actions of grand-child table.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                         | coreComponentField   | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                  | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:PageLayoutChildField | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                  | ReviewCategoriesTest | Name                      | Grand Child Test Button    |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I expand nested table containing column value "Pre-Screen"
    Then I softly see top right button "Grand Child Test Button" inside flex table "---program:-:ReviewCategoriesTestTableId---"

  @546953 @546955 @546970
  Scenario: LWC - Grid - SPI - To verify that, the hide logic should be worked from the parent table object for the top-level actions of child table.
  |LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then the top actions in the child table should be hidden from the user.|
  |LWC - Grid - SPI - To verify that, after applying Hide Expression JSON using Field left operand on the basis of parent object,  then the top actions in the child table should be hidden from the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                    | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},URL__c,FeeFundRequested__c,Email__c,Modified__c,Status__c,Notes__c,Time__c,Phone__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:BudgetPeriodParentFieldSupportYear | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"

  @546957
  Scenario: LWC - Grid - SPI - To verify that, when a parent record updates the values, then the visibility of child actions should update in real-time.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                    | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},URL__c,FeeFundRequested__c,Email__c,Modified__c,Status__c,Notes__c,Time__c,Phone__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Budget Period # | URL            |
      | BP01            | www.google.com |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                         | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:BudgetPeriodParentFieldURLFieldRealTimeData | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                         | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"

  @546959
  Scenario: LWC - Grid - SPI - To verify that, when the parent record does not meet any defined condition, then all top actions for the child grid should remain visible by default.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                    | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},URL__c,FeeFundRequested__c,Email__c,Modified__c,Status__c,Notes__c,Time__c,Phone__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Budget Period # | URL                |
      | BP01            | www.salesforce.com |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                         | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:BudgetPeriodParentFieldURLFieldRealTimeData | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                         | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"

  @546961 @546962
  Scenario: LWC - Grid - SPI - To verify that, logic should support both direct parent-child relationships and deeper levels (e.g., parent → child → grandchild) for controlling visibility.
  |LWC - Grid - SPI - To verify that, when a parent record meets specific conditions, then there should be no impact on child table data|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                    | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},URL__c,FeeFundRequested__c,Email__c,Modified__c,Status__c,Notes__c,Time__c,Phone__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" by clicking "Edit" :
      | Budget Period # | URL            |
      | BP01            | www.google.com |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                         | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:BudgetPeriodParentFieldURLFieldRealTimeData | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                         | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Budget Period #" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "Start Date" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see column header "End Date" displayed in tableId "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Administrative and legal expenses" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Architectural and engineering fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Construction" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Contingencies" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Equipment" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Indirect costs" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Land, structures, rights-of-way, appraisals, etc." for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Miscellaneous" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Other architectural and engineering fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Project inspection fees" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly see value "Relocation expenses and payments" for title "Category Name" inside table "---applicationIntake:-:BudgetCategoriesTableId---"

  @546968
  Scenario: LWC - Grid - SPI - To verify that, the hide logic should not be worked from the page layout object for the top-level actions of child table.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:PageLayoutParentFieldStatusCreated | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"

  @546972 @546974 @546980
  Scenario: LWC - Grid - SPI - To verify that, for all datatypes, after applying Hide Expression JSON using Field left operand on the basis of parent object, then the top actions in the child table should be hidden from the user.
  |LWC - Grid - SPI - To verify that, the hide logic should be worked from the parent table object for the top-level actions of child table when actions record type is "FlexGrid Enhanced Action"|
  |LWC - Grid - SPI - To verify that, the hide logic should be worked from the parent table object for the top-level actions of child table when we enable the 'Enable Parent Hide Logic' config at the flex table action level|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                     | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},Status__c,SequenceNumber__c,Modified__c,Email__c,FeeFundRequested__c,Percent__c,Testmultiselect__c,URL__c,Notes__c,Phone__c,Grant__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period # | End Date  | Status | Sequence Number | Modified | Email            | Fee Fund Requested | Percent | Testmultiselect | URL            | Notes     | Phone      | Grant         |
      | BP01            | 7/14/2026 | Active | 1               | Checked  | john@yopmail.com | 2323               | 67      | Step2;Step3     | www.google.com | Text Area | 9527371482 | GT-1234-01558 |
    And I pause execution for "3" seconds
    And I expand nested table containing column value "BP01"
    Then I softly see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"
    And I pause execution for "5" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:BudgetPeriodParentFieldAllDataTypes | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                 | EnhanceAppBudCateGrantorFlexTable | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "5" seconds
    Then I softly do not see top right button "Test Button" inside flex table "---applicationIntake:-:BudgetCategoriesTableId---"

  @546977 @546971 @546981 @546954 @546956
  Scenario: LWC - Grid - SPI - To verify that, the hide logic should be worked from the child table object for the top-level actions of grandchild table when actions record type is "FlexGrid Enhanced Action"
  |LWC - Grid - SPI - To verify that, after applying Hide Expression JSON using Field left operand on the basis of child object, then the top actions in the grandchild table should be hidden from the user.|
  |LWC - Grid - SPI - To verify that, the hide logic should be worked from the child table object for the top-level actions of grandchild table when we enable the 'Enable Parent Hide Logic' config at the flex table action level|
  | LWC - Grid - SPI - To verify that, the hide logic should be worked from the child table object for the top-level actions of grand-child table.|
  |LWC - Grid - SPI - To verify that, when a child record meets specific conditions, then the top actions in the grandchild table should be hidden from the user.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                    | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:TestAutomationFlexTable2ChildFieldName | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                    | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"

  @547037 @546967
  Scenario: LWC - Grid - SPI - To verify that, when a child record meets specific conditions, then there should be no impact on grandchild table data
  |LWC - Grid - SPI - To verify that, when a child record meets specific conditions, then grandchild table layout remains consistent.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                           | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                    | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:TestAutomationFlexTable2ChildFieldName | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                    | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"
    Then I softly see value "Test Grand Child Record" for title "Eligibility Sub Question Name" inside table "---afsautoqa:-:TestAutomationFlexTable3---"
    Then I softly see value "Permanent Grand Child Record" for title "Eligibility Sub Question Name" inside table "---afsautoqa:-:TestAutomationFlexTable3---"

  @546969
  Scenario: LWC - Grid - SPI - To verify that, the hide logic should not be worked from the page layout obejct for the top-level actions of grand-child table.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                 | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                          | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:TestAutomationFlexTable2ChildPageLayoutField | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                          | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"

  @546973
  Scenario: LWC - Grid - SPI - To verify that, for all datatypes, after applying Hide Expression JSON using Field left operand on the basis of child object, then the top actions in the grandchild table should be hidden from the user.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                                                                                                                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}                                                                                                                                                                                                                                      | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn},ChildEmail__c,ChildUrl__c,ChildLookup__c,ChildPhone__c,ChildText__c,Test_Multi_select_Picklist__c,ChildPercentageTest__c,ChildTextArea__c,ChildFormulaTest__c,ChildCheckbox__c,ChildLongTextArea__c,ChildRichTextArea__c,ChildDate__c | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn}                                                                                                                                                                                                                                  | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Eligibility Question Name | ChildCurrencyTest | Test Number | PickList 2 | ChildEmail             | ChildUrl       | ChildLookup | ChildPhone     | ChildText            | Test Multi Picklist | Child Percentage Test | ChildTextArea            | ChildFormulaTest       | ChildCheckbox | ChildLongTextArea            | ChildRichTextArea            | ChildDate |
      | Permanent Child Record    | 232323            | 232323      | Step 5     | childemail@yopmail.com | www.google.com | Cat-0010    | (987) 654-3210 | ChildTextColumnValue | Test Option 1       | 232323                | ChildTextAreaColumnValue | Permanent Child Record | True          | ChildLongTextAreaColumnValue | ChildRichTextAreaColumnValue | 1/1/2026  |
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                           | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:TestAutomationFlexTable2ChildFieldAllDataType | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                           | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"

  @546960
  Scenario: LWC - Grid - SPI - To verify that, when the child record does not meet any defined condition, then all top actions for the grandchild grid should remain visible by default.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Eligibility Question Name | ChildCurrencyTest | Test Number | PickList 2 | ChildEmail             | ChildUrl       | ChildLookup | ChildPhone     | ChildText            | Test Multi Picklist | Child Percentage Test | ChildTextArea            | ChildFormulaTest       | ChildCheckbox | ChildLongTextArea            | ChildRichTextArea            | ChildDate |
      | Permanent Child Record    | 232323            | 232323      | Step 5     | childemail@yopmail.com | www.google.com | Cat-0010    | (987) 654-3210 | ChildTextColumnValue | Test Option 1       | 232323                | ChildTextAreaColumnValue | Permanent Child Record | True          | ChildLongTextAreaColumnValue | ChildRichTextAreaColumnValue | 1/1/2026  |
    And I pause execution for "3" seconds
    And I pause execution for "4" seconds
    Then I softly see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"

  @546963
  Scenario: LWC - Grid - SPI - To verify that, when a child record meets specific conditions, then there should be no impact on grandchild table data
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                                                                                                                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}                                                                                                                                                                                                                                      | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn},ChildEmail__c,ChildUrl__c,ChildLookup__c,ChildPhone__c,ChildText__c,Test_Multi_select_Picklist__c,ChildPercentageTest__c,ChildTextArea__c,ChildFormulaTest__c,ChildCheckbox__c,ChildLongTextArea__c,ChildRichTextArea__c,ChildDate__c | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn}                                                                                                                                                                                                                                  | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Eligibility Question Name | ChildCurrencyTest | Test Number | PickList 2 | ChildEmail             | ChildUrl       | ChildLookup | ChildPhone     | ChildText            | Test Multi Picklist | Child Percentage Test | ChildTextArea            | ChildFormulaTest       | ChildCheckbox | ChildLongTextArea            | ChildRichTextArea            | ChildDate |
      | Permanent Child Record    | 232323            | 232323      | Step 5     | childemail@yopmail.com | www.google.com | Cat-0010    | (987) 654-3210 | ChildTextColumnValue | Test Option 1       | 232323                | ChildTextAreaColumnValue | Permanent Child Record | True          | ChildLongTextAreaColumnValue | ChildRichTextAreaColumnValue | 1/1/2026  |
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                           | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:TestAutomationFlexTable2ChildFieldAllDataType | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                           | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"
    Then I softly see value "Test Grand Child Record" for title "Eligibility Sub Question Name" inside table "---afsautoqa:-:TestAutomationFlexTable3---"
    Then I softly see value "Permanent Grand Child Record" for title "Eligibility Sub Question Name" inside table "---afsautoqa:-:TestAutomationFlexTable3---"

  @546958
  Scenario: LWC - Grid - SPI - To verify that, when a child record updates the values, then the visibility of grandchild actions should update in real-time.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     |                    | ApiGeneratedId:0 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      |                    | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} |                    | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                                                                                                                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn}                                                                                                                                                                                                                                      | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.dfn},ChildEmail__c,ChildUrl__c,ChildLookup__c,ChildPhone__c,ChildText__c,Test_Multi_select_Picklist__c,ChildPercentageTest__c,ChildTextArea__c,ChildFormulaTest__c,ChildCheckbox__c,ChildLongTextArea__c,ChildRichTextArea__c,ChildDate__c | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn}                                                                                                                                                                                                                                  | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I pause execution for "5" seconds
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "2" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    Then I softly see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    When I click on button "resetIcon" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly do not see "Eligibility Question Name" in flex table header "---flexgrid:-:TestAutomationFlexTable2---"
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I expand nested table containing column value "Permanent Child Record"
    And I pause execution for "3" seconds
    Then I softly see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetPeriodTableId---" by clicking "Edit" :
      | Eligibility Question Name | ChildCurrencyTest | Test Number | PickList 2 | ChildEmail             | ChildUrl       | ChildLookup | ChildPhone     | ChildText            | Test Multi Picklist | Child Percentage Test | ChildTextArea            | ChildFormulaTest       | ChildCheckbox | ChildLongTextArea            | ChildRichTextArea            | ChildDate |
      | Permanent Child Record    | 232323            | 232323      | Step 5     | childemail@yopmail.com | www.google.com | Cat-0010    | (987) 654-3210 | ChildTextColumnValue | Test Option 1       | 232323                | ChildTextAreaColumnValue | Permanent Child Record | True          | ChildLongTextAreaColumnValue | ChildRichTextAreaColumnValue | 1/1/2026  |
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                | fieldOrignalValue | filterId         |
      | Flex Table Action     | Is Active                | true              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON     |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Enable Parent Hide Logic | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                | fieldNewValue                                                  | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Is Active                | true                                                           | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Hide Expression JSON     | govgrants_config:TestAutomationFlexTable2ChildFieldAllDataType | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
      | Flex Table Action     | Enable Parent Hide Logic | true                                                           | TestAutomationFlexTable3 | Name                      | Grand Child Test Button    |
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see top right button "Grand Child Test Button" inside flex table "---afsautoqa:-:TestAutomationFlexTable3---"