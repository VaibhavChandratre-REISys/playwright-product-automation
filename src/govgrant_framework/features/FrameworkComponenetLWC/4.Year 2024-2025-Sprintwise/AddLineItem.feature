@Sprint-2025 @AddLineItem
Feature:Flex Grid Scenarios -  Sprint 7 2025 (Suite ID: 506093) User Story 502337
Business Need: To ensure that the relevant title of the Budget category in the modal of our web pages meets the needs of different user roles: admin, internal users
1.US-502337 - Add Line Item
2.US-551571 - Analysis of queue base ownership

  @504421 @US-502337
  Scenario Outline:LWC- Grid -PM- To verify presence of "Add Line-Item Details" button for category.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I pause execution for "5" seconds
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly can see row level action button "Add Line Item Details" against "Architectural and engineering fees" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly can see row level action button "Add Line Item Details" against "Construction" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly can see row level action button "Add Line Item Details" against "Contingencies" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    Then I softly can see row level action button "Add Line Item Details" against "Equipment" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"

    Examples:
      | User | defaultconfig                  | setupconfig |
      | PM   | govgrants_config:DefaultConfig |             |

  @504423 @504426 @US-502337
  Scenario Outline: LWC- Grid -PM- To verify that,  on click of "Add Line-Item Details" action modal functionality should work
  |LWC- Grid -PM- To verify that, Selected category name should display on click of "Add Line Item Deatil" action modal|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Architectural and engineering fees" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Architectural and engineering fees" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Construction" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Contingencies" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Contingencies" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Equipment" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Indirect costs" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Indirect costs" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "6" seconds
    And I click on "Add Line Item Details" icon for "Land, structures, rights-of-way, appraisals, etc." with excluding regx inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Land, structures, rights-of-way, appraisals, etc." inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Miscellaneous" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Miscellaneous" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Other architectural and engineering fees" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Other architectural and engineering fees" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Project inspection fees" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Project inspection fees" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Relocation expenses and payments" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Relocation expenses and payments" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Site work" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Site work" inside page block

    Examples:
      | User | defaultconfig                  | setupconfig |
      | PM   | govgrants_config:DefaultConfig |             |

  @504429 @US-502337
  Scenario Outline: LWC- Grid -PM- To verify that , budget category Modal Close action functionality should work
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I close "App Line Items" modal by clicking the top right x button
    Then I see "EnhanceAppBudCateGrantorFlexTable" flex table is displayed

    Examples:
      | User | defaultconfig                  | setupconfig |
      | PM   | govgrants_config:DefaultConfig |             |

  @504431 @US-502337
  Scenario Outline: LWC- Grid -SPI- To verify presence of "Add Line-Item Details" button for category.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - My Records"
    And I pause execution for "6" seconds
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I close "App Line Items" modal by clicking the top right x button
    Then I see "EnhanceAppBudCateGrantorFlexTable" flex table is displayed

    Examples:
      | User | defaultconfig                  | setupconfig |
      | SPI3 | govgrants_config:DefaultConfig |             |

  @504432 @US-502337
  Scenario Outline: LWC- Grid -SPI- To verify clicking "Add Line-Item Details" button open modal correctly.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - My Records"
    And I pause execution for "6" seconds
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window

    Examples:
      | User | defaultconfig                  | setupconfig |
      | SPI3 | govgrants_config:DefaultConfig |             |

  @504437 @US-502337
  Scenario Outline: LWC- Grid -SPI- To verify correct category name is display in opened modal.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
      | Flex Table            | Default Page Size    | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Grid:General     | Default Page Size    | 20            | EnhanceAppBudCateGrantorFlexTable | Name                      |                            |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Administrative and legal expenses" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Architectural and engineering fees" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Architectural and engineering fees" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Construction" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Contingencies" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Contingencies" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Equipment" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Indirect costs" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Indirect costs" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "6" seconds
    And I click on "Add Line Item Details" icon for "Land, structures, rights-of-way, appraisals, etc." with excluding regx inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Land, structures, rights-of-way, appraisals, etc." inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Miscellaneous" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Miscellaneous" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Other architectural and engineering fees" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Other architectural and engineering fees" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Project inspection fees" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Project inspection fees" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Relocation expenses and payments" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Relocation expenses and payments" inside page block
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Site work" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    Then I softly see field "Site work" inside page block

    Examples:
      | User | defaultconfig                  | setupconfig |
      | SPI3 | govgrants_config:DefaultConfig |             |

  @504441 @504442 @US-502337
  Scenario Outline: LWC- Grid -SPI- To verify adding new line item successfully.
  |LWC- Grid -SPI- To verify attempt to add line item with mandatory field blank.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
      | Flex Table            | Default Page Size    | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Grid:General     | Default Page Size    | 20            | EnhanceAppBudCateGrantorFlexTable | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I close "App Line Items" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I click on "Add Line Item Details" icon for "Architectural and engineering fees" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Title | Narrative | Award Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Test  | Test Data | 34           | 10         | 20             | 30             |
    And I pause execution for "6" seconds
    #504441
    And I see the following message in the page details :
      | Saved Successfully! |
    And I click on column name "Title" for sorting of table "---applicationReview:-:addLineItemsModalTableId---"
    And I pause execution for "4" seconds
    When I click on "Edit" icon for "Test" inside flex table with id "---applicationReview:-:addLineItemsModalTableId---" without accept popup
    And I clear the value from field "Title__c"
    Then I softly see error message contains text "Complete this field." if mandatory fields are not filled
    And I click on top right button "Save" in flex table with id "---applicationReview:-:addLineItemsModalTableId---"
     #504442
    Then I see the following message in the page details :
      | Please complete all field(s) marked in red. |

    Examples:
      | User | defaultconfig                  | setupconfig |
      | SPI3 | govgrants_config:DefaultConfig |             |

  @504445 @US-502337
  Scenario Outline: LWC- Grid -SPI- To verify close button functionality of modal.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
      | Flex Table            | Default Page Size    | 10                | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | EnhanceAppBudCateGrantorFlexTable | Name                      | Add Line Item Details      |
      | Flex Grid:General     | Default Page Size    | 20            | EnhanceAppBudCateGrantorFlexTable | Name                      |                            |
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default-Automation EXE user"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - My Records"
    And I pause execution for "6" seconds
    And I click on "View" action for first record of table
    When I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Administrative and legal expenses" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"
    And I click on "Add Line Item Details" icon for "Administrative and legal expenses" inside flex table with id "---applicationIntake:-:BudgetCategoriesTableId---" without waiting for record
    Then I softly see "App Line Items" opens in overLay window
    And I close "App Line Items" modal by clicking the top right x button
    Then I see "EnhanceAppBudCateGrantorFlexTable" flex table is displayed

    Examples:
      | User | defaultconfig                  | setupconfig |
      | SPI3 | govgrants_config:DefaultConfig |             |

    ####################### US-551571 ####################
  @552765 @wip
  Scenario: LWC : Queue Base Ownership : Admin : To verify that if the Queue member creates any record then Queue Name should be display as Owner ID
    #Added queue details on objects and created queue below queue for this functionality
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see "Owner ID" as "Queue Base Ownership" in page details

  @552769 @wip
  Scenario: LWC : Queue Base Ownership : EXE: To verify that if the Non Queue member creates any record then User's Name should be display as Owner ID
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see "Owner ID" as "Automation EXE" in page details

