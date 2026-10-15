@FormsComponentSanity @Forms @Forms1 @ComponentSanity2 @ComponentSanity2_1
Feature: Component Sanity Testing Forms
  In this feature file, we use the following tags for component-wise execution:@Forms

  ############################ Form Actions ########################

  @549171
  Scenario: LWC - Forms - SPI - Action Config: Verify "Edit" action config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active              | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Standard Action        | Edit              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active              | true          | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message | Test Warning  | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Standard Action        | Edit          | Program Specific Application form | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I click on "Test Button" in the page details without processing
    And I pause execution for "3" seconds
    Then I see confirmation box with message "Test Warning" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Continue" on modal confirmation box
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message Long |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue     | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true              | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Long | Test Warning Long | Program Specific Application form | Name                      | Test Button                |
    And I refresh the page
    And I click on "Test Button" in the page details without processing
    Then I see confirmation box with message "Test Warning Long" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "Continue" on modal confirmation box
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message Long |                   | ApiGeneratedId:1 |

  @549173 @wip
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Logic of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Program Specific Application form | Name                      | Edit                       |
      | Page Layout Action    | Hide for Profile | SPI           | Program Specific Application form | Name                      | Edit                       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    #Hide For Profile
    Then I softly do not see "Test Button" button is displayed
    #Hide For User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for User    |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Hide for Profile |               | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Hide for User    | Applicant     | Program Specific Application form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed
    #Hide For Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Context |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Hide for User    |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Hide for Context | View          | Program Specific Application form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @549174
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                       | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsQuestion1EqualsTest | Program Specific Application form | Name                      | Test Button                |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Test" into field "Question1__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Equals To
    Then I softly do not see "Test Button" button is displayed
   #Not Equals To
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                          | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsQuestion1NotEqualsTest | Program Specific Application form | Name                      | Test Button                |
    And I refresh the page
    Then I softly see "Test Button" button is displayed

  @549174_1
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Field of "Edit" action - Grater Than Equals and Less Than Equals
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                                | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsBaseSalaryLessThanEquals2000 | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I enter value "2000" into field "Base_Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Less Than Equals
    Then I softly do not see "Test Button" button is displayed
    #Greater Than Equals
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                                  | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsBaseSalaryGraterThanEquals2000 | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                  | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @549174_2
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Field of "Edit" action -In and Not In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                          | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsCitizenshipInUsCitizen | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I enter value "US Citizen" into field "Citizenship__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #In - US Citizens Picklist
    Then I softly do not see "Test Button" button is displayed
    #Not-In - US Citizens Picklist
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                             | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsCitizenshipNotInUsCitizen | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Button" button is displayed
    #Contains - US
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                         | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsCitizenshipContainsUS | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @549175
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - $User of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                            | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionFor$UserFirstNameEqualsAutomation | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    #$User Equals First Name Automation
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                               | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionFor$UserFirstNameNotEqualsAutomation | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Button" button is displayed

  @549176
  Scenario:LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - User Type of "Edit" action - USerTypeIn-Applicant&Internal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                          | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForUserTypeInApplicant&Internal | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    #UserTypeInApplicant&Internal
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "3" seconds
    #UserTypeInApplicant&Internal
    Then I softly do not see "Test Button" button is displayed

  @549176_1
  Scenario:LWC - Forms - SPI - USerTypeNotIn-Applicant&Internal - Action Config: Verify Hide Expression JSON - User Type of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                             | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForUserTypeNotInApplicant&Internal | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I close the tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #UserTypeNotInApplicant&Internal
    Then I softly see "Test Button" button is displayed
    And I pause execution for "3" seconds
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    And I click on "Collapse" in page detail
    When I navigate to "Forms and Files" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "3" seconds
    #UserTypeNotInApplicant&Internal
    Then I softly see "Test Button" button is displayed

  @549178
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - User App of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppInRecipient | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I click on "Collapse" in page detail
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #UserAppIn-Recipient
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                        | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppNotInStateAsGrantor | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    #UserApp-NotIn-StateAsGrantor
    Then I softly see "Test Button" button is displayed

  @549179
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Queue of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                      | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForQueueInGovGrantTestQueue | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #QueueInGovGrantTestQueue
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                         | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForQueueNotInGovGrantTestQueue | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    #QueueNotInGovGrantTestQueue
    Then I softly see "Test Button" button is displayed

  @549183
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Context of "Test Button" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                           | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForContextInView | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #ContextInView
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                              | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForContextNotInView | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    #ContextNotInView
    Then I softly see "Test Button" button is displayed

  @549319 @wip
  Scenario: LWC - Forms - SPI - Action Config: Verify "Validate" action config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | RefreshBehaviour |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue           | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active        | true                    | Program Specific Application form | Name                      | Validate                   |
      | Page Layout Action                  | RefreshBehaviour | Refresh the entire page | Program Specific Application form | Name                      | Validate                   |
      | Page Tabs Config:Page Layout Action | Is Active        | true                    | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Refresh Behaviour
    And I click on "Validate" in the page details
    Then I see entire page is refreshing
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active        | true          | Program Specific Application form | Name                      | Validate                   |
      | Page Layout Action                  | Hide for Profile | SPI           | Program Specific Application form | Name                      | Validate                   |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    #Hide For Profile
    Then I softly do not see "Validate" button is displayed

  @549319_1 @wip
  Scenario: LWC - Forms - SPI - Action Config: Verify "Validate" action config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Context |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active        | true          | Program Specific Application form | Name                      | Validate                   |
      | Page Layout Action                  | Hide for Context | View          | Program Specific Application form | Name                      | Validate                   |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Hide For Context
    Then I softly do not see "Validate" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active     | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for User |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active     | true          | Program Specific Application form | Name                      | Validate                   |
      | Page Layout Action                  | Hide for User | Applicant     | Program Specific Application form | Name                      | Validate                   |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    #Hide For User
    Then I softly do not see "Validate" button is displayed

  @549177
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Profile of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                            | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                     | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionProfileSPI | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Hide For Profile - IN
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                          | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionProfileNotInSPI | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    #Hide For Profile - Not In
    Then I softly see "Test Button" button is displayed

  @549180
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - Combination of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                      | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionCombination | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                      | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Combination
    Then I softly do not see "Test Button" button is displayed

  @549181
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios) of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                    | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideAction3GroupsCombinationSPIUser | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #3 Groups Combination
    Then I softly do not see "Test Button" button is displayed

  @549182
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios) of "Test Button" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                    | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideAction2GroupsCombinationSPIUser | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #2 Groups Combination
    Then I softly do not see "Test Button" button is displayed


    ################# Internal User ################
  @549577 @wip
  Scenario: LWC - Forms - EXE - Action Config: Verify "Validate" action config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | RefreshBehaviour |                   | ApiGeneratedId:1 |
   #   | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true                    | General Review Form | Name                      | Validate                   |
      | Page Layout Action    | RefreshBehaviour | Refresh the entire page | General Review Form | Name                      | Validate                   |
     # | Page Tabs Config:Page Layout Action | Is Active        | true                    | General Review Form | Name                      | {SavedValue:TestTab}         |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | NA         |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
     #Refresh Behaviour
    Then I see entire page is refreshing
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
    #  | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | General Review Form | Name                      | Validate                   |
      | Page Layout Action    | Hide for Profile | EXE           | General Review Form | Name                      | Validate                   |
    #  | Page Tabs Config:Page Layout Action | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestTab}         |
    And I refresh the page
    #Hide For Profile
    Then I softly do not see "Validate" button is displayed

  @549577_1 @wip @checkonlocal
  Scenario: LWC - Forms - EXE - Action Config: Verify "Validate" action config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Context |                   | ApiGeneratedId:1 |
    #  | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | General Review Form | Name                      | Validate                   |
      | Page Layout Action    | Hide for Context | View          | General Review Form | Name                      | Validate                   |
    #  | Page Tabs Config:Page Layout Action | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestTab}         |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | NA         |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Hide For Context
    Then I softly do not see "Validate" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active     | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for User |                   | ApiGeneratedId:1 |
     # | Page Tabs Config      | Is Active     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName     | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active     | true          | General Review Form | Name                      | Validate                   |
      | Page Layout Action    | Hide for User | Internal      | General Review Form | Name                      | Validate                   |
      #| Page Tabs Config:Page Layout Action | Is Active     | true          | General Review Form | Name                      | {SavedValue:TestTab}         |
    And I refresh the page
    And I pause execution for "2" seconds
    #Hide For User
    Then I softly do not see "Validate" button is displayed

  @549589
  Scenario: LWC - Forms - EXE - Action Config: Verify "Edit" action config
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active              | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Standard Action        | Edit              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active              | true          | General Review Form | Name                      | Edit                       |
      | Page Layout Action    | Submit Warning Message | Test Warning  | General Review Form | Name                      | Edit                       |
      | Page Layout Action    | Standard Action        | Edit          | General Review Form | Name                      | Edit                       |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | NA         |
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 1     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    And I pause execution for "5" seconds
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details without processing
    And I pause execution for "3" seconds
    Then I see confirmation box with message "Test Warning" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "OK" on modal confirmation box
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message Long |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true              | General Review Form | Name                      | Edit                       |
      | Page Layout Action    | Submit Warning Message Long | Test Warning Long | General Review Form | Name                      | Edit                       |
    And I refresh the page
    And I click on "Edit" in the page details without processing
    Then I see confirmation box with message "Test Warning Long" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box
    And I click "OK" on modal confirmation box
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | RefreshBehaviour |                   | ApiGeneratedId:1 |
   #   | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true                    | General Review Form | Name                      | Edit                       |
      | Page Layout Action    | RefreshBehaviour | Refresh the entire page | General Review Form | Name                      | Edit                       |
    And I refresh the page
    And I click on "Edit" in the page details
    Then I see entire page is refreshing

  @549578
  Scenario: LWC - Forms - EXE - Action Config: Verify Hide Expression JSON - Context of "Test Button" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      #| Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                       | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForContextInViewInternalUser | General Review Form | Name                      | Test Button                |
     # | Page Tabs Config:Page Layout Action | Is Active            | true                                           | General Review Form  | Name                      | {SavedValue:TestTab}         |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    #ContextInView
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
     # | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                 | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                          | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForContextNotInViewInternalUser | General Review Form | Name                      | Test Button                |
     # | Page Tabs Config:Page Layout Action | Is Active            | true                                              | General Review Form | Name                      | {SavedValue:TestTab}         |
    And I refresh the page
    #ContextNotInView
    Then I softly see "Test Button" button is displayed

  @549581
  Scenario: LWC - Forms - EXE - Action Config: Verify Hide Expression JSON - Combination of "Test Button" action - General Review Form
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                  | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionCombinationInternalUser | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Combination
    Then I softly do not see "Test Button" button is displayed

  @549582
  Scenario: LWC - Forms - EXE - Action Config: Verify Hide Expression JSON - Queue of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      #  | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                  | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForQueueInGovGrantTestQueueInternalUser | General Review Form | Name                      | Test Button                |
      #  | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | Program Specific Application form | Name                      | {SavedValue:TestTab}         |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #QueueInGovGrantTestQueue
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                            | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                     | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForQueueNotInGovGrantTestQueueInternalUser | General Review Form | Name                      | Test Button                |
    And I refresh the page
    #QueueNotInGovGrantTestQueue
    Then I softly see "Test Button" button is displayed

  @549583
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - User App of "Edit" action InIn-StateAsGrantor, SateAsGrantee, Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Layout Action                  | Is Active            | true                                                     | General Review Form | Name                      | Test Button                  |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppInStateasGrantor | General Review Form | Name                      | Test Button                  |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User App In StateasGrantor
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                            | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                     | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppInStateasGrantee | General Review Form | Name                      | Test Button                |
    And I refresh the page
    #UserApp In StateAsGrantee
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                       | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppInStateasRecipient | General Review Form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp In Recipient
    Then I softly see "Test Button" button is displayed

  @549583_1
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - User App of "Edit" action In - NotIn-StateAsGrantor, SateAsGrantee, Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                        | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppNotInStateasGrantor | Program Specific Application form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User App NotIn StateasGrantor
    Then I softly see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                        | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppNotInStateasGrantee | General Review Form | Name                      | Test Button                |
    And I refresh the page
    #UserApp NotIn StateAsGrantee
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                 | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                          | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForUserAppNotInStateasRecipient | General Review Form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp Not-In Recipient
    Then I softly do not see "Test Button" button is displayed

  @549584
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - Profile of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                       | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionProfileINEXE | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
 #Hide For Profile - IN
    Then I softly do not see "Test Button" button is displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                 | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                          | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionProfileNotINEXE | General Review Form | Name                      | Test Button                |
    And I refresh the page
    #Hide For Profile - Not In
    Then I softly see "Test Button" button is displayed

  @549585
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - User Type of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                              | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionUserTypeInApplicant | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User Type In Applicant
    Then I softly see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                             | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionUserTypeInInternal | General Review Form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserType In Internal
    Then I softly do not see "Test Button" button is displayed

  @549585_1
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - User Type of "Edit" action - Not In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                 | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionUserTypeNotInApplicant | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User Type NotIn Applicant
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionUserTypeNotInInternal | General Review Form | Name                      | Test Button                |
    And I refresh the page
    #UserType NotIn Internal
    Then I softly see "Test Button" button is displayed

  @549586
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - $User of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                    | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionFor$UserFirstNameEqualsAutomationInternal | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "4" seconds
      #$User Equals First Name Automation
    Then I softly do not see "Test Button" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                       | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionFor$UserFirstNameNotEqualsAutomationInternal | General Review Form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Button" button is displayed

  @549587
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - Field of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                             | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSvProgramFormQ1EqualsTest | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "Test" into field "SvProgramFormQ1__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Equals To
    Then I softly do not see "Test Button" button is displayed
   #Not Equals To
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSvProgramFormQ1NotEqualsTest | General Review Form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Button" button is displayed

  @549587_1
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON  - Grater Than Equals and Less Than Equals
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                       | Is Active            | true                                                            | General Review Form | Name                      | Test Button                |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSalaryLessThanEquals2000 | General Review Form | Name                      | Test Button                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                            | General Review Form | Name                      | {SavedValue:Salary__c}     |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "2000" into field "Salary__c"
    And I click on "Save" in the page details
    #Less Than Equals Salary
    Then I do not see "Test Button" button is displayed
    #Greater Than Equals Salary
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                              | General Review Form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSalaryGraterThanEquals2000 | General Review Form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                              | General Review Form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I do not see "Test Button" button is displayed

  @549587_2
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON  - Grater Than and Less Than
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action                       | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action                       | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                       | Is Active            | true                                                      | General Review Form | Name                      | Test Button                |
      | Page Layout Action                       | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSalaryLessThan2000 | General Review Form | Name                      | Test Button                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                      | General Review Form | Name                      | {SavedValue:Salary__c}     |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "1999" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    #Less Than Equals Salary
    Then I do not see "Test Button" button is displayed
    #Greater Than Equals Salary
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action                  | Is Active            | true                                                        | General Review Form | Name                      | Test Button                |
      | Page Layout Action                  | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSalaryGraterThan2000 | General Review Form | Name                      | Test Button                |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | General Review Form | Name                      | {SavedValue:TestTab}       |
    And I click on "Edit" in the page details
    And I enter value "2200" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I refresh the page
    And I pause execution for "3" seconds
    Then I do not see "Test Button" button is displayed

  @549587_3
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON  - Field of "Edit" action -In and Not In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                              | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSubmittedByInAutomationEXE | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #In - Submitted By - Automation EXE
    Then I softly do not see "Test Button" button is displayed
    #Not-In -  Submitted By - Automation EXE
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                 | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSubmittedByNotInAutomationEXE | General Review Form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Button" button is displayed
    #Contains - Automation
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                                 | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionForFieldsSubmittedByContainsAutomation | General Review Form | Name                      | Test Button                |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Button" button is displayed

  @549182
  Scenario: LWC - Forms - SPI - Action Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios) of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                    | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideAction2GroupsCombinationSPIUser | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #2 Groups combination
    Then I do not see "Test Button" button is displayed

  @549580
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios) of "Edit" action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active            | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                   | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                                            | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:HEJHideActionFor3GroupsCombinationInternalUser | General Review Form | Name                      | Test Button                |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #3 Groups combination
    Then I softly do not see "Test Button" button is displayed

    ####################### Form Page Block ########################################
  @549109
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Information, Fields Configuration, Display Settings config of page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue     | filterId         |
      | Page Block            | Is Active               | true                  | ApiGeneratedId:0 |
      | Page Block            | Page Block Title        | Organization Capacity | ApiGeneratedId:1 |
      | Page Block            | Header Instruction Text |                       | ApiGeneratedId:2 |
      | Page Block            | Help Text               |                       | ApiGeneratedId:3 |
      | Page Block            | Skip for Export         |                       | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active               | true                                             | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Page Block Title        | abcd!@#$1234                                     | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Header Instruction Text | abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543 | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Help Text               | Help Data                                        | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Skip for Export         | true                                             | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly see "abcd!@#$1234" page block displayed
    Then I see "abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543" shown as header instruction text
   # When I hovering mouse on help text "abcd!@#$1234" icon
   # Then I softly see "Help Data" shown as help text
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "abcd!@#$1234" on page "1" of "govgrants" pdf file

  @549111
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Logic of page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue | filterId         |
      | Page Block            | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block            | Hide for Queue |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName      | fieldNewValue       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active      | true                | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Hide for Queue | GovGrant Test Queue | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly do not see "Organization Capacity" page block displayed
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
#      | Page Block            | Is Active        | true              | ApiGeneratedId:0 |
#      | Page Block            | Hide for Profile |                   | ApiGeneratedId:1 |
#    Given I setup test configuration as below:
#      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
#      | Page Block:Page Block Detail | Is Active        | true          | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
#      | Page Block:Page Block Detail | Hide for Profile | SPI           | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
#    And I refresh the page
#    Then I softly do not see "Organization Capacity" page block displayed

  @549111_1 @wip
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Logic of page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Block            | Is Active     | true              | ApiGeneratedId:0 |
      | Page Block            | Hide for User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Hide for User | Applicant     | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly do not see "Organization Capacity" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Block            | Is Active        | true              | ApiGeneratedId:0 |
      | Page Block            | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active        | true          | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Hide for Context | View          | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
    And I refresh the page
    Then I softly do not see "Organization Capacity" page block displayed

  @549113
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                                                   | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEJHidePageBlock$UserFirstNameEqualsAutomationSPIUser | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
#    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly do not see "Organization Capacity" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block:Page Block Detail | Is Active            | true                                                                      | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HEJHidePageBlock$UserFirstNameNotEqualsAutomationSPIUser | Program Specific Application form | Name                      | {SavedValue:OrganizationCapacity} |
    And I refresh the page
    Then I softly see "Organization Capacity" page block displayed

  @549114
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldQuestion1EqualsTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Test" into field "Question1__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Fields - Question1 Equals - Test
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldQuestion1NotEqualsTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
     #Fields - Question1 NotEquals - Test
    Then I softly see "Test Block" page block displayed

  @549114_1
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Field - Less Than Equals and Greater Than Equals
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                      | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                                      | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldBaseSalaryLessThanEquals2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                      | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    And I enter value "2000" into field "Base_Salary__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Less Than Equals
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                         | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                                         | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldBaseSalaryGreaterThanEquals2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                         | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    And I refresh the page
    #Greater Than Equals
    Then I softly do not see "Test Block" page block displayed

  @549114_2
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Field - Less Than and Greater Than
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldBaseSalaryLessThan2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    And I enter value "1999" into field "Base_Salary__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Less Than 2000
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block                               | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                   | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                                   | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block:Page Block Detail             | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldBaseSalaryGreaterThan2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                   | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    When I click on "Edit" in the page details
    And I enter value "2200" into field "Base_Salary__c"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I refresh the page
    And I pause execution for "3" seconds
    #Greater Than 2000
    Then I softly do not see "Test Block" page block displayed

  @549114_3
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Field - In and NotIn and contains
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                         | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldQuestion1InTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "Test" into field "Question1__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #In - Test
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                            | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldQuestion1NotInTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #Not In Test
    Then I softly see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                               | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFieldQuestion1ContainsTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    When I click on "Edit" in the page details
    When I navigate to "Details" sub tab
    And I enter value "Test Data" into field "Question1__c"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Contains Test
    Then I softly do not see "Test Block" page block displayed

  @549115
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Context - In-Not In - Edit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                  | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextInEditSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Context In  - Edit
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextNotInEditSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #Context - Not In- Edit
    Then I softly see "Test Block" page block displayed

  @549115_1
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Context - In-Not In - View
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                  | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextInViewSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Context In  - View
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextNotInViewSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #Context - Not In- View
    Then I softly see "Test Block" page block displayed

  @549116
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                              | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockProfileInSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Profile- In  - SPI
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                 | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockProfileNotInSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #Profile - Not In- SPI
    Then I softly see "Test Block" page block displayed

  @549117
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Queue-In - GovGrantTest Queue
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockQueueNotInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #Queue-NotIn - GovGrantTest Queue
    Then I softly see "Test Block" page block displayed

  @549118
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - User App - State As Grantor
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                            | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserAppInStateAsGrantorSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #UserApp-In - StateAsGrantor
    Then I softly see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                               | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserAppNotInStateAsGrantorSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp-NotIn - StateAsGrantor
    Then I softly do not see "Test Block" page block displayed

  @549118_1
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - User App - State As Grantee
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                            | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                            | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserAppInStateAsGranteeSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #UserApp-In - StateAsGrantee
    Then I softly see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                               | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserAppNotInStateAsGranteeSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp-NotIn - StateAsGrantee
    Then I softly do not see "Test Block" page block displayed

  @549118_2
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - User App - Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserAppInRecipientSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #UserApp-In - Recipient
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserAppNotInRecipientSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp-NotIn - Recipient
    Then I softly see "Test Block" page block displayed

  @549119
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - User Type - Applicant
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                        | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeInApplicantSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #UserType-In - Applicant
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                           | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeNotInApplicantSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserType-NotIn - Applicant
    Then I softly see "Test Block" page block displayed

  @549119_1
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - User Type - Internal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeInInternalSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #UserType-In - Internal
    Then I softly see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeNotInInternalSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserType-NotIn - Internal
    Then I softly do not see "Test Block" page block displayed

  @549120
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlock2GroupsCombinationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #2 Groups Combination
    Then I softly do not see "Test Block" page block displayed

  @549121
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlock3GroupsCombinationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #3 Groups Combination
    Then I softly do not see "Test Block" page block displayed

  @549122
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Combination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockCombinationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    #Combination
    Then I softly do not see "Test Block" page block displayed

  @549534
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Expression JSON - $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                       | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                       | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFor$UserFirstNameEqualsAutomationInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #$User Equals First Name Automation
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                                 | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                          | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                          | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFor$UserFirstNameNotEqualsAutomationInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Block" page block displayed

  @549533
  Scenario: LWC - Forms - EXE - Page Block Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFor2GroupsCombinationInternalUser | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #2 Groups Combination
    Then I softly do not see "Test Block" page block displayed

  @549532
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockFor3GroupsCombinationInternalUser | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #3 Groups Combination
    Then I softly do not see "Test Block" page block displayed

  @549531
  Scenario: LWC - Forms - PM- Page Block Config: Verify Hide Expression JSON - Combination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                     | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockCombinationInternalUser | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    # Combination
    Then I softly do not see "Test Block" page block displayed

  @549530
  Scenario: LWC - Forms - EXE - Page Block Config: Verify Hide Expression JSON - Context - Edit - NOtIn-In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextInEditInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Context In  - Edit
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                      | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextNotInEditInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "4" seconds
    #Context NotIn  - Edit
    Then I softly see "Test Block" page block displayed

  @549530_1
  Scenario: LWC - Forms - EXE - Page Block Config: Verify Hide Expression JSON - Context - View - NOtIn-In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextInViewInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Context In  - View
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                      | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockContextNotInViewInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    #Context NotIn  - View
    Then I softly see "Test Block" page block displayed

  @549529
  Scenario: LWC - Forms - EXE - Page Block Config: Verify Hide Expression JSON - Field - Equals-Not Equals
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSvProgramFormQ1EqualsTest | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "Test" into field "SvProgramFormQ1__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Field - SvProgram - Equals  - Test
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                   | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSvProgramFormQ1NotEqualsTest | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #Fiels -SVProgram Not Equals - Test
    Then I softly see "Test Block" page block displayed

  @549529_1
  Scenario: LWC - Forms - EXE - Page Block Config: Verify Hide Expression JSON - Field - Less Than Equals-Greater Than Equals
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSalaryLessThanEquals2000 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "2000" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Field - Less Than - Equals  - Salary
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                 | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSalaryGraterThanEquals2000 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #Fiels -Greater Than Equals - Salary
    Then I softly do not see "Test Block" page block displayed

  @549529_2
  Scenario: LWC - Forms - EXE - Page Block Config: Verify Hide Expression JSON - Field - Less Than-Greater Than
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                         | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSalaryLessThan1999 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "1999" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Field - Less Than - Salary
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                           | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSalaryGraterThan2200 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I click on "Edit" in the page details
    And I enter value "2200" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    And I pause execution for "3" seconds
    #Fiedls -Greater Than - Salary
    Then I softly do not see "Test Block" page block displayed

  @549529_3
  Scenario: LWC - Forms - EXE - Page Block Config: Verify Hide Expression JSON - Field - In, Not In, Contains
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                 | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSubmittedByInAutomationEXE | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I navigate to "Test Tab" sub tab
    #In - Submitted By - Automation EXE
    Then I softly do not see "Test Block" page block displayed
    #Not-In -  Submitted By - Automation EXE
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                    | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                    | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSubmittedByNotInAutomationEXE | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Block" page block displayed
      #Contains - Automation
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                    | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                    | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForFieldsSubmittedByContainsAutomation | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Block" page block displayed

  @549528
  Scenario: LWC - Forms - EXE- Page Block Config: Verify Hide Expression JSON - Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                 | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                          | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                          | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockProfileINEXE | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Hide For Profile - IN
    Then I softly do not see "Test Block" page block displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                             | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                             | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockProfileNotINEXE | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    #Hide For Profile - Not In
    Then I softly see "Test Block" page block displayed

  @549527
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                            | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                     | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                     | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForQueueInGovGrantTestQueueInternalUser | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #QueueInGovGrantTestQueue
    Then I softly do not see "Test Block" page block displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                                        | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                        | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForQueueNotInGovGrantTestQueueInternalUser | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    #QueueNotInGovGrantTestQueue
    Then I softly see "Test Block" page block displayed

  @549526
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Expression JSON - User App-In-StateAsGrantor, SateAsGrantee, Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                        | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForUserAppInStateasGrantor | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #User App In StateasGrantor
    Then I softly do not see "Test Block" page block displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                        | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForUserAppInStateasGrantee | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    #UserApp In StateAsGrantee
    Then I softly see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                          | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForUserAppInStateasRecipient | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp In Recipient
    Then I softly see "Test Block" page block displayed

  @549526_1
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Expression JSON - User App  In - NotIn-StateAsGrantor, SateAsGrantee, Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                           | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForUserAppNotInStateasGrantor | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #User App NotIn StateasGrantor
    Then I softly do not see "Test Block" page block displayed
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                           | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForUserAppNotInStateasGrantee | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    #UserApp NotIn StateAsGrantee
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                             | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockForUserAppNotInStateasRecipient | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp Not-In Recipient
    Then I softly do not see "Test Block" page block displayed

  @549525
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Expression JSON - User Type
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeInApplicant | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #User Type In Applicant
    Then I softly see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeInInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserType In Internal
    Then I softly do not see "Test Block" page block displayed

  @549525_1
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - User Type of "Edit" action - Not In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                    | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeNotInApplicant | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #User Type NotIn Applicant
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide Expression JSON | govgrants_config:HEJHidePageBlockUserTypeNotInInternal | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    #UserType NotIn Internal
    Then I softly see "Test Block" page block displayed

  @549523
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Logic of page block - Hide For Profile and Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue | filterId         |
      | Page Block            | Is Active      | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active      | false             | ApiGeneratedId:1 |
      | Page Block            | Hide for Queue |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName      | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active      | true                | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active      | true                | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide for Queue | GovGrant Test Queue | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Hide For Queue
    Then I softly do not see "Test Block" page block displayed
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
#      | Page Block            | Is Active        | true              | ApiGeneratedId:0 |
#      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:1 |
#      | Page Block            | Hide for Profile |                   | ApiGeneratedId:2 |
#    Given I setup test configuration as below:
#      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
#      | Page Block:Page Block Detail        | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
#      | Page Tabs Config:Page Layout Action | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
#      | Page Block:Page Block Detail        | Hide for Profile | EXE           | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
#    And I refresh the page
#    And I pause execution for "3" seconds
#    #Hide For Profile
#    Then I softly do not see "Test Block" page block displayed

  @549523_1 @wip @checkonlocal
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Logic of page block - Hide For User and Hide for Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Block            | Is Active     | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active     | false             | ApiGeneratedId:1 |
      | Page Block            | Hide for User |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active     | true          | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide for User | Internal      | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Hide For User
    Then I softly do not see "Test Block" page block displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Block            | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:1 |
      | Page Block            | Hide for Context |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail        | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Hide for Context | View          | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #Hide For Context
    Then I softly do not see "Test Block" page block displayed

  @549522
  Scenario: LWC - Forms - PM - Page Block Config: Verify Information, Fields Configuration, Display Settings config of page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active               | false             | ApiGeneratedId:1 |
      | Page Block            | Is Active               | true              | ApiGeneratedId:0 |
      | Page Block            | Page Block Title        | Test Block        | ApiGeneratedId:1 |
      | Page Block            | Header Instruction Text |                   | ApiGeneratedId:2 |
      | Page Block            | Help Text               |                   | ApiGeneratedId:3 |
      | Page Block            | Skip for Export         |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Tabs Config:Page Layout Action | Is Active               | true                                             | General Review Form | Name                      | {SavedValue:TestTabInternal}   |
      | Page Block:Page Block Detail        | Is Active               | true                                             | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Block:Page Block Detail        | Page Block Title        | abcd!@#$1234                                     | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Block:Page Block Detail        | Header Instruction Text | abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543 | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Block:Page Block Detail        | Help Text               | Help Data                                        | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
      | Page Block:Page Block Detail        | Skip for Export         | true                                             | General Review Form | Name                      | {SavedValue:TestBlockInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    Then I softly see "abcd!@#$1234" page block displayed
    Then I see "abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543" shown as header instruction text
   # When I hovering mouse on help text "abcd!@#$1234" icon
   # Then I softly see "Help Data" shown as help text
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "abcd!@#$1234" on page "1" of "govgrants" pdf file

    ####################### Form Page Tab ########################################

  @548953
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Field - Equals-Not Equals To
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldQuestion1EqualsTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I enter value "Test" into field "Question1__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Equals To
    Then I softly do not see "Test Tab" subtab is present in page details
   #Not Equals To
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                     | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                              | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldQuestion1NotEqualsTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Tab" subtab is present in page details

  @548953_1
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Field - Less Than Equals and Greater Than Equals
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config                         | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                           | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                    | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                                    | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Tabs Config:Page Layout Action      | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldBaseSalaryLessThanEquals2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                    | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    And I enter value "2000" into field "Base_Salary__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Less Than Equals
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config                         | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Tabs Config:Page Layout Action      | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldBaseSalaryGreaterThanEquals2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                       | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    And I refresh the page
    #Greater Than Equals
    Then I softly do not see "Test Tab" subtab is present in page details

  @548953_2
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Field - Less Than and Greater Than
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config                         | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                     | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                              | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                              | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Tabs Config:Page Layout Action      | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldBaseSalaryLessThan2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                              | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    When I navigate to "Test Tab" sub tab
    And I enter value "1999" into field "Base_Salary__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Less Than 2000
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config                         | Hide Expression JSON |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block:Page Block Detail             | Is Active            | true                                                                 | Program Specific Application form | Name                      | {SavedValue:TestBlock}      |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                                                 | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Tabs Config:Page Layout Action      | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldBaseSalaryGreaterThan2000SPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                 | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c} |
    And I refresh the page
    When I click on "Edit" in the page details
    And I pause execution for "3" seconds
    And I enter value "2200" into field "Base_Salary__c"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Greater Than 2000
    Then I softly do not see "Test Tab" subtab is present in page details

  @548953_3
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Field - In and NotIn and contains
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldQuestion1InTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "Test" into field "Question1__c"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #In - Test
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldQuestion1NotInTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #Not In Test
    Then I softly see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFieldQuestion1ContainsTestSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    When I click on "Edit" in the page details
    And I enter value "Test Data" into field "Question1__c"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Contains Test
    Then I softly do not see "Test Tab" subtab is present in page details

  @549095
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                        | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                                 | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                 | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTab$UserFirstNameEqualsAutomationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                           | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                                    | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                    | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTab$UserFirstNameNotEqualsAutomationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Tab" subtab is present in page details

  @549096
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - User Type - Applicant-In-NotIn
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                      | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeInApplicantSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #UserType-In - Applicant
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                         | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeNotInApplicantSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserType-NotIn - Applicant
    Then I softly see "Test Tab" subtab is present in page details

  @549096_1
  Scenario: LWC - Forms - SPI - Page Tab Config: Verify Hide Expression JSON - User Type - Internal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeInInternalSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #UserType-In - Internal
    Then I softly see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                                        | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeNotInInternalSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserType-NotIn - Internal
    Then I softly do not see "Test Tab" subtab is present in page details

  @549098
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                   | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                            | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                            | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabProfileInSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Profile- In  - SPI
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Block            | Is Active            | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                      | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail        | Is Active            | true                                               | Program Specific Application form | Name                      | {SavedValue:TestBlock}     |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                               | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabProfileNotInSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #Profile - Not In- SPI
    Then I softly see "Test Tab" subtab is present in page details

  @549100
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - User App - State As Grantor
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserAppInStateAsGrantorSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #UserApp-In - StateAsGrantor
    Then I softly see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserAppNotInStateAsGrantorSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp-NotIn - StateAsGrantor
    Then I softly do not see "Test Tab" subtab is present in page details

  @549100_1
  Scenario: LWC - Forms - SPI - Page Tab Config: Verify Hide Expression JSON - User App - State As Grantee
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserAppInStateAsGranteeSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #UserApp-In - StateAsGrantee
    Then I softly see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserAppNotInStateAsGranteeSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp-NotIn - StateAsGrantee
    Then I softly do not see "Test Tab" subtab is present in page details

  @549100_2
  Scenario: LWC - Forms - SPI - Page Tab Config: Verify Hide Expression JSON - User App - Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserAppInRecipientSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #UserApp-In - Recipient
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserAppNotInRecipientSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp-NotIn - Recipient
    Then I softly see "Test Tab" subtab is present in page details

  @549106
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Combination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabCombinationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Combination
    Then I softly do not see "Test Tab" subtab is present in page details

  @549107
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTab3GroupsCombinationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #3 Groups Combination
    Then I softly do not see "Test Tab" subtab is present in page details

  @549108
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                            | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTab2GroupsCombinationSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #2 Groups Combination
    Then I softly do not see "Test Tab" subtab is present in page details

  @549105
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabQueueInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Queue-In - GovGrantTest Queue
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                     | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                              | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabQueueNotInGovGrantTestQueueSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #Queue-NotIn - GovGrantTest Queue
    Then I softly see "Test Tab" subtab is present in page details

  @549112
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Expression JSON - Context - In-Not In - Edit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextInEditSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
     #Context In  - Edit
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextNotInEditSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #Context - Not In- Edit
    Then I softly see "Test Tab" subtab is present in page details

  @549112_1
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Expression JSON - Context - In-Not In - View
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextInViewSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Context In  - View
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextNotInViewSPIUser | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    And I pause execution for "3" seconds
    #Context - Not In- View
    Then I softly see "Test Tab" subtab is present in page details

  @548947
  Scenario: LWC - Forms - SPI - Tab Config: Verify Hide Logic of page tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active      | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Queue |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName      | fieldNewValue       | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active      | true                | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide for Queue | GovGrant Test Queue | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide for Profile | SPI           | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    Then I softly do not see "Test Tab" subtab is present in page details

  @548947_1
  Scenario: LWC - Forms - SPI - Page Block Config: Verify Hide Logic of page block
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active     | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide for User | Applicant     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Hide for Context | View          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    And I refresh the page
    Then I softly do not see "Test Tab" subtab is present in page details

  @548955
  Scenario: LWC - Forms - SPI - Tab Config: Verify config of Tab Title, Sort order, Is Active, Skip for Export, Tab Icon, Highlights Panel & Header Instruction Text
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active               | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Tab Title               | Test Tab          | ApiGeneratedId:1 |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:2 |
      | Page Tabs Config      | Help Text               |                   | ApiGeneratedId:3 |
      | Page Tabs Config      | Skip for Export         |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active               | true                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Tab Title               | abcd!@#$1234                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543 | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Help Text               | Help Data                                        | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Skip for Export         | true                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly see "abcd!@#$1234" page block displayed
    Then I see "abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543" shown as header instruction text
   # When I hovering mouse on help text "abcd!@#$1234" icon
   # Then I softly see "Help Data" shown as help text
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "abcd!@#$1234" on page "1" of "govgrants" pdf file

    ################# Form Tab - Internal User #########
  @549501
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Logic of page tab
    Given I have "default" configuration as below:
      | configurationCategory | fieldName      | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active      | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Queue |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName      | fieldNewValue       | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active      | true                | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide for Queue | GovGrant Test Queue | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Hide For Queue
    Then I softly do not see "Test Tab" subtab is present in page details
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
#      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:0 |
#      | Page Tabs Config      | Hide for Profile |                   | ApiGeneratedId:1 |
#    Given I setup test configuration as below:
#      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
#      | Page Tabs Config:Page Layout Action | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestTabInternal} |
#      | Page Tabs Config:Page Layout Action | Hide for Profile | EXE           | General Review Form | Name                      | {SavedValue:TestTabInternal} |
#    And I refresh the page
#    And I pause execution for "3" seconds
#    #Hide For Profile
#    Then I softly do not see "Test Tab" subtab is present in page details

  @549501_1 @wip @checkonlocal
  Scenario: LWC - Forms - PM - Page Block Config: Verify Hide Logic of page block - Hide For User and Hide for Context
    Given I have "default" configuration as below:
      | configurationCategory | fieldName     | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active     | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for User |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName     | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active     | true          | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide for User | Internal      | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Hide For User
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active        | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide for Context |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active        | true          | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide for Context | View          | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #Hide For Context
    Then I softly do not see "Test Tab" subtab is present in page details

  @549502
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - User Type -In-Applicant/Internal
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                      | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                               | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeInApplicant | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User Type In Applicant
    Then I softly see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                              | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeInInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserType In Internal
    Then I softly do not see "Test Tab" subtab is present in page details

  @549502_1
  Scenario: LWC - Forms - PM - Action Config: Verify Hide Expression JSON - User Type of "Edit" action - Not In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                  | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeNotInApplicant | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User Type NotIn Applicant
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabUserTypeNotInInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    #UserType NotIn Internal
    Then I softly see "Test Tab" subtab is present in page details

  @549503
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - User App
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForUserAppInStateasGrantor | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User App In StateasGrantor
    Then I softly do not see "Test Tab" subtab is present in page details
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                      | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForUserAppInStateasGrantee | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    #UserApp In StateAsGrantee
    Then I softly see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                        | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForUserAppInStateasRecipient | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp In Recipient
    Then I softly see "Test Tab" subtab is present in page details

  @549503_1
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - User AppIn - NotIn-StateAsGrantor, SateAsGrantee, Recipient
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForUserAppNotInStateasGrantor | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #User App NotIn StateasGrantor
    Then I softly do not see "Test Tab" subtab is present in page details
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForUserAppNotInStateasGrantee | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    #UserApp NotIn StateAsGrantee
    Then I softly see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForUserAppNotInStateasRecipient | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #UserApp Not-In Recipient
    Then I softly see "Test Tab" subtab is present in page details

  @549504
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - Queue
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForQueueInGovGrantTestQueueInternalUser | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #QueueInGovGrantTestQueue
    Then I softly do not see "Test Tab" subtab is present in page details
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                             | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                      | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForQueueNotInGovGrantTestQueueInternalUser | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    #QueueNotInGovGrantTestQueue
    Then I softly see "Test Tab" subtab is present in page details

  @549505
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - Profile
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                        | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabProfileINEXE | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    And I pause execution for "3" seconds
    #Hide For Profile - IN
    Then I softly do not see "Test Tab" subtab is present in page details
    And I pause execution for "3" seconds
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                  | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                           | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabProfileNotINEXE | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    #Hide For Profile - Not In
    Then I softly see "Test Tab" subtab is present in page details

  @549507
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - Field - EqualsNot Equals
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                              | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSvProgramFormQ1EqualsTest | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter value "Test" into field "SvProgramFormQ1__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Field - SvProgram - Equals  - Test
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSvProgramFormQ1NotEqualsTest | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #Fiels -SVProgram Not Equals - Test
    Then I softly see "Test Tab" subtab is present in page details

  @549507_1
  Scenario: LWC - Forms - EXE - Page Tab Config: Verify Hide Expression JSON - Field - Less Than Equals-Greater Than Equals
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSalaryLessThanEquals2000 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I navigate to "Details" sub tab
    And I enter value "2000" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Field - Less Than - Equals  - Salary
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSalaryGraterThanEquals2000 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    #Fiels -Greater Than Equals - Salary
    Then I softly do not see "Test Tab" subtab is present in page details

  @549507_2
  Scenario: LWC - Forms - EXE - Page Tab Config: Verify Hide Expression JSON - Field - Less Than -Greater Than
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                       | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSalaryLessThan1999 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I navigate to "Details" sub tab
    And I enter value "1999" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #Field - Less Than - Salary
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                         | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSalaryGraterThan2200 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I click on "Edit" in the page details
    And I enter value "2200" into field "Salary__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I refresh the page
    And I pause execution for "3" seconds
    #Fiedls -Greater Than - Salary
    Then I softly do not see "Test Tab" subtab is present in page details

  @549507_3
  Scenario: LWC - Forms - EXE - Page Tab Config: Verify Hide Expression JSON - Field - In, Not In, Contains
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                               | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSubmittedByInAutomationEXE | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #In - Submitted By - Automation EXE
    Then I softly do not see "Test Tab" subtab is present in page details
    #Not-In -  Submitted By - Automation EXE
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                  | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSubmittedByNotInAutomationEXE | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Tab" subtab is present in page details
      #Contains - Automation
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                         | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                  | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabForFieldsSubmittedByContainsAutomation | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly do not see "Test Tab" subtab is present in page details

  @549508
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - Context - Edit - NotIn-In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextInEditInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Context In  - Edit
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextNotInEditInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "4" seconds
    #Context NotIn  - Edit
    Then I softly see "Test Tab" subtab is present in page details

  @549508_1
  Scenario: LWC - Forms - EXE - Page Tab Config: Verify Hide Expression JSON - Context - View - NOtIn-In
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                 | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextInViewInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #Context In  - View
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                           | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                    | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabContextNotInViewInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    #Context NotIn  - View
    Then I softly see "Test Tab" subtab is present in page details

  @549505
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - Combination
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                   | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabCombinationInternalUser | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    # Combination
    Then I softly do not see "Test Tab" subtab is present in page details

  @549510
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - 3Groups (Combination of 3 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFor3GroupsCombinationInternalUser | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    # 3 Groups Combination
    Then I softly do not see "Test Tab" subtab is present in page details

  @549511
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - 2Groups (Combination of 2 Scenarios)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                             | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFor2GroupsCombinationInternalUser | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    # 2 Groups Combination
    Then I softly do not see "Test Tab" subtab is present in page details

  @549512
  Scenario: LWC - Forms - PM - Tab Config: Verify Hide Expression JSON - $User
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                            | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                     | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFor$UserFirstNameEqualsAutomationInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    #$User Equals First Name Automation
    Then I softly do not see "Test Tab" subtab is present in page details
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active            | false             | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                               | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                                        | General Review Form | Name                      | {SavedValue:TestTabInternal} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HEJHidePageTabFor$UserFirstNameNotEqualsAutomationInternal | General Review Form | Name                      | {SavedValue:TestTabInternal} |
    And I refresh the page
    And I pause execution for "3" seconds
    Then I softly see "Test Tab" subtab is present in page details

  @549513
  Scenario: LWC - Forms - PM - Tab Config: Verify config of Tab Title, Sort order, Is Active, Skip for Export, Tab Icon, Highlights Panel & Header Instruction Text
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active               | true              | ApiGeneratedId:0 |
      | Page Tabs Config      | Page Block Title        | Test Tab          | ApiGeneratedId:1 |
      | Page Tabs Config      | Header Instruction Text |                   | ApiGeneratedId:2 |
      | Page Tabs Config      | Help Text               |                   | ApiGeneratedId:3 |
      | Page Tabs Config      | Skip for Export         |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName               | fieldNewValue                                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active               | true                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Page Block Title        | abcd!@#$1234                                     | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Header Instruction Text | abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543 | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Help Text               | Help Data                                        | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
      | Page Tabs Config:Page Layout Action | Skip for Export         | true                                             | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly see "abcd!@#$1234" page block displayed
    Then I see "abcdhjhakskhaskadhskjdjdfjk!!@#%%% 1234567876543" shown as header instruction text
   # When I hovering mouse on help text "abcd!@#$1234" icon
   # Then I softly see "Help Data" shown as help text
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "5" seconds
    Then I cannot see "abcd!@#$1234" on page "1" of "govgrants" pdf file

    ################## Form Layout ##############################
  @549160
  Scenario: LWC - Forms - SPI - Layout Config: Verify config of Save Button Label, Cancel Button Label, Page Instruction Text, Header, Hide PDF Download, Hide On Demand Snaphot
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Save Button Label      |                   | ApiGeneratedId:0 |
      | Page Layout           | Cancel Button Label    | Cancel            | ApiGeneratedId:1 |
      | Page Layout           | Hide Pdf Download      | false             | ApiGeneratedId:2 |
      | Page Layout           | Hide On Demand Snaphot | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Save Button Label      | Test Save     | Program Specific Application form |                           |                            |
      | Page Layout:General   | Cancel Button Label    | Cancel        | Program Specific Application form |                           |                            |
      | Page Layout:General   | Hide Pdf Download      | false         | Program Specific Application form |                           |                            |
      | Page Layout:General   | Hide On Demand Snaphot | true          | Program Specific Application form | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Site Visit" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Site Visit}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Site Visit}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    Then I softly see "Test Save" button is displayed
    Then I softly see "Cancel" button is displayed
    And I click on "Test Save" in the page details
    And I pause execution for "3" seconds
    And I click on "menu" button inside page details in lwc
    And I pause execution for "3" seconds
    Then I softly see "Download as PDF" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Hide On Demand Snaphot | true              | ApiGeneratedId:0 |
      | Page Layout           | Page Instruction Text  |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue                    | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide On Demand Snaphot | false                            | Program Specific Application form | Name                      |                            |
      | Page Layout:General   | Page Instruction Text  | {SavedValue:PageInstructionText} | Program Specific Application form |                           |                            |
    And I refresh the page
    And I click on "menu" button inside page details in lwc
    Then I softly see "Take Snapshot" button is displayed
    And I pause execution for "3" seconds
    Then I see "view more" option is displayed
    And I click on "view more" hyperlink in page instruction block
    Then I see "{SavedValue:PageInstructionText}" shown as page instruction text

  @549500
  Scenario:LWC - Forms - PM - Layout Config: Verify config of Save Button Label, Cancel Button Label, Page Instruction Text, Header, Hide PDF Download, Hide On Demand Snaphot
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Save Button Label      |                   | ApiGeneratedId:0 |
      | Page Layout           | Cancel Button Label    | Cancel            | ApiGeneratedId:1 |
      | Page Layout           | Hide Pdf Download      | false             | ApiGeneratedId:2 |
      | Page Layout           | Hide On Demand Snaphot | true              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Save Button Label      | Test Save     | General Review Form |                           |                            |
      | Page Layout:General   | Cancel Button Label    | Cancel        | General Review Form |                           |                            |
      | Page Layout:General   | Hide Pdf Download      | false         | General Review Form |                           |                            |
      | Page Layout:General   | Hide On Demand Snaphot | true          | General Review Form | Name                      |                            |
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see "Save" button is displayed
    Then I softly see "Cancel" button is displayed
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "menu" button inside page details in lwc
    And I pause execution for "3" seconds
    Then I softly see "Download as PDF" button is displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName              | fieldOrignalValue | filterId         |
      | Page Layout           | Hide On Demand Snaphot | true              | ApiGeneratedId:0 |
      | Page Layout           | Page Instruction Text  |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName              | fieldNewValue                    | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout:General   | Hide On Demand Snaphot | false                            | General Review Form | Name                      |                            |
      | Page Layout:General   | Page Instruction Text  | {SavedValue:PageInstructionText} | General Review Form |                           |                            |
    And I refresh the page
    And I click on "menu" button inside page details in lwc
    Then I softly see "Take Snapshot" button is displayed
    And I pause execution for "3" seconds
    Then I see "view more" option is displayed
    And I click on "view more" hyperlink in page instruction block
    Then I see "{SavedValue:PageInstructionText}" shown as page instruction text

    ##################### All Forms - View/Edit/Menu ###################
  @548915
  Scenario: LWC - Forms - SPI - To verify that, user can view Program Application Form by clicking View action from All Forms table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Details" sub tab
    And I pause execution for "4" seconds
    And I save the field labeled "Form ID" as "FORMID"
    Then I softly see "Form ID" as "{SavedValue:FORMID}" in page details
    Then I softly see "Form Name" as "Program Application Form" in page details
    Then I softly see "1a. Describe the activities and/or services to be provided. (10 points)" as "Describe the activities and/or services to be provided" in page details
    Then I softly see "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" as "Describe the methodologies that will be used to complete activities/provide services" in page details
    Then I softly see "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "2b. Describe the characteristics of population to be served. (10 points)" as "Describe how the project will be completed within the required 24-month timeline" in page details
    Then I softly see "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5a. Experience in successful implementation of Public Services Projects. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly see "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" as "Describe how the project will be completed within the required 24-month timeline." in page details
    Then I softly do not see fields "Question1__c" is in edit mode
    Then I softly do not see fields "Question2__c" is in edit mode
    Then I softly do not see fields "Question3__c" is in edit mode
    Then I softly do not see fields "Question4__c" is in edit mode
    Then I softly do not see fields "Question5__c" is in edit mode
    Then I softly do not see fields "Question6__c" is in edit mode
    Then I softly do not see fields "Question7__c" is in edit mode
    Then I softly do not see fields "Question8__c" is in edit mode
    Then I softly do not see fields "Question9__c" is in edit mode
    Then I softly do not see fields "Question10__c" is in edit mode
    Then I softly do not see fields "Question11__c" is in edit mode

  @548920 @5491841
  Scenario: LWC - Forms - SPI - To verify that, Edit, Back, Validate actions & Menu on form view layout
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    Then I softly see "Validate" button is displayed
    Then I softly see "Back" button is displayed
    Then I softly see "Edit" button is displayed
    And I click on "Back" in the page details
    And I pause execution for "3" seconds
    Then I softly see "All Forms" page block displayed

  @549184
  Scenario: LWC - Forms - SPI - To verify that, user can edit Program Application Form by clicking Edit action from All Forms table
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    Then I softly see fields "Question1__c" is in edit mode
    Then I softly see fields "Question2__c" is in edit mode
    Then I softly see fields "Question3__c" is in edit mode
    Then I softly see fields "Question4__c" is in edit mode
    Then I softly see fields "Question5__c" is in edit mode
    Then I softly see fields "Question6__c" is in edit mode
    Then I softly see fields "Question7__c" is in edit mode
    Then I softly see fields "Question8__c" is in edit mode
    Then I softly see fields "Question9__c" is in edit mode
    Then I softly see fields "Question10__c" is in edit mode
    Then I softly see fields "Question11__c" is in edit mode
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I see the following message in the page details contains:
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form Validated Successfully. |

  @549344
  Scenario: LWC - Forms - SPI - All Forms - To verify, Percent column under all forms table on the basis of required to submit fields
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "3" seconds
    And I switch to tab number "1"
    And I enter value "qw" into field "Question1__c"
    And I enter value "er" into field "Question2__c"
    And I enter value "qw" into field "Question3__c"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see value "27.27%" for title "Percentage" inside table "---applicationIntake:-:allFormsTableId---"
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I click on "Edit" in the page details
    And I enter value "ytr" into field "Question4__c"
    And I enter value "bgf" into field "Question5__c"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see value "45.45%" for title "Percentage" inside table "---applicationIntake:-:allFormsTableId---"
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I click on "Edit" in the page details
    And I enter value "ABC" into field "Question6__c"
    And I enter value "XYZ" into field "Question7__c"
    And I enter value "QWER" into field "Question8__c"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see value "72.72%" for title "Percentage" inside table "---applicationIntake:-:allFormsTableId---"
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I click on "Edit" in the page details
    And I enter value "GHG" into field "Question9__c"
    And I enter value "OPU" into field "Question10__c"
    And I enter value "GFD" into field "Question11__c"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    Then I softly see value "100.00%" for title "Percentage" inside table "---applicationIntake:-:allFormsTableId---"

  @549516
  Scenario: LWC - Forms - PM - All Forms - To verify, Percent column under all forms table on the basis of required to submit fields
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"

  @549517
  Scenario: LWC - Forms - PM - To verify that, user can view Program Application Form by clicking View action from All Forms table
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"

  @549519
  Scenario: LWC - Forms - PM - To verify that, user can edit Program Application Form by clicking Edit action from All Forms table
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I save the field labeled "Form ID" as "FORMID"
    Then I softly see "Form ID" as "{SavedValue:FORMID}" in page details
    Then I softly see "Form Name" as "General Review Form" in page details
    Then I softly see "Site Visit Overview" page block displayed
    Then I softly see "Overall" page block displayed
    Then I softly see "Facilities & Equipment" page block displayed
    Then I softly see "Personnel" page block displayed
    Then I softly see "Submission Details" page block displayed
    Then I softly see field "SvProgramFormQ1__c" inside page block
    Then I softly see field "SvProgramFormQ2__c" inside page block
    Then I softly see field "SvProgramFormQ3__c" inside page block
    Then I softly see field "SvProgramFormQ4__c" inside page block
    Then I softly see field "SvProgramFormQ5__c" inside page block
    Then I softly see field "SvProgramFormQ6__c" inside page block
    Then I softly see field "SvProgramFormQ7__c" inside page block
    Then I softly see field "SvProgramFormQ8__c" inside page block
    Then I softly see field "SvProgramFormQ9__c" inside page block
    Then I softly do not see fields "SvProgramFormQ1__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ2__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ3__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ4__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ5__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ6__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ7__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ8__c" is in edit mode
    Then I softly do not see fields "SvProgramFormQ9__c" is in edit mode

  @549518
  Scenario: LWC - Forms - PM - To verify that, Edit, Back, Validate actions & Menu on form view layout
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see fields "SvProgramFormQ1__c" is in edit mode
    Then I softly see fields "SvProgramFormQ2__c" is in edit mode
    Then I softly see fields "SvProgramFormQ3__c" is in edit mode
    Then I softly see fields "SvProgramFormQ4__c" is in edit mode
    Then I softly see fields "SvProgramFormQ5__c" is in edit mode
    Then I softly see fields "SvProgramFormQ6__c" is in edit mode
    Then I softly see fields "SvProgramFormQ7__c" is in edit mode
    Then I softly see fields "SvProgramFormQ8__c" is in edit mode
    Then I softly see fields "SvProgramFormQ9__c" is in edit mode
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I see the following message in the page details contains:
      | Form cannot be validated because data is missing in one or more fields that are required to submit. To view the fields that are required to submit, click the Edit button. |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form Validated Successfully. |

