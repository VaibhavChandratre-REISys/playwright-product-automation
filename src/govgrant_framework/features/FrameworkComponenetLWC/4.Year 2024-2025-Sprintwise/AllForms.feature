@AllForms @Sprint-2025
Feature: All Forms Files View/Preview
Business Need:- This includes below user stories
1. Preview Action for forms @US-502336
2. Form Number and Form Version @US-508868
3. PDF generation for Form Preview @US-508752
4. US-551571

  @509435 @509441 @509446 @509449 @US-502336
  Scenario Outline: LWC - Admin/PM - Form - To verify that, by clicking the preview action, form should display in view mode, showing all disable fields and no added data should be present.
  |LWC - Admin/PM - Form - To verify that, by clicking the preview action, form should not be submitted, and no data should be saved in the backend.|
  |LWC - Admin/PM - Form - To verify that, on Preview of the form, actions should not be displayed|
  |LWC - Admin/PM - Form - To verify that, on Preview of the form, required to submit icon for required to submit fields should be displayed|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | false         | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition-app" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 1000   | 100        | 100            | 100            |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And  I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "2" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I navigate to "Overview" sub tab
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Submitted"
    When I perform quick search for "<Application Name>" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see "<Application Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    Given I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    #509449
    #And I navigate to "Details" sub tab
    #Then I see field message with text as "Required to Save" and "Required to Submit"
    Then I softly do not see "Save" button is displayed
    Then I softly do not see "Cancel" button is displayed
    Then I softly do not see "Validate" button is displayed
    Then I softly do not see "Edit" button is displayed
    Then I softly do not see "Back" button is displayed
    #Then I softly see form header "Create Application Detail (FORMS) - Preview"
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

    Examples:
      | Application Name                                         | User |
      | {SavedValue:Automation Runtime Announcement Application} | PM   |
     # | {SavedValue:Automation Runtime Announcement Application} | ADMIN |

  @509440 @509442 @509447 @509450 @US-502336
  Scenario: LWC - SPI - Form - To verify that, by clicking the preview action, form should display in view mode, showing all disable fields and no added data should be present.
  |LWC - SPI - Form - To verify that, by clicking the preview action, form should not be submitted, and no data should be saved in the backend.|
  |LWC - SPI - Form - To verify that, on Preview of the form, actions should not be displayed|
  |LWC - SPI - Form - To verify that, on Preview of the form, required to submit icon for required to submit fields should be displayed|
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
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "5" seconds
      #509450
    And I switch to tab number "1"
   # Then I see field message with text as "Required to Save" and "Required to Submit"
      #Then I softly see form header "Create Application Detail (FORMS) - Preview"
    Then I softly do not see "Save" button is displayed
    Then I softly do not see "Cancel" button is displayed
    Then I softly do not see "Validate" button is displayed
    Then I softly do not see "Edit" button is displayed
    Then I softly do not see "Back" button is displayed
    Then I softly see field "Question1__c" is not editable
    Then I softly see field "Question2__c" is not editable
    Then I softly see field "Question3__c" is not editable
    Then I softly see field "Question4__c" is not editable
    Then I softly see field "Question5__c" is not editable
    Then I softly see field "Question6__c" is not editable
    Then I softly see field "Question7__c" is not editable
    Then I softly see field "Question8__c" is not editable
    Then I softly see field "Question9__c" is not editable
    Then I softly see field "Question10__c" is not editable
    Then I softly see field "Question11__c" is not editable

  @509451 @US-502336
  Scenario Outline: LWC - Admin/PM - Form - To verify that, on Preview of the form, available multiple page blocks, empty page block and multiple tabs should match the form’s original layout in view/edit mode, with appropriate data
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    #And I navigate to "Details" sub tab
    Then I softly see "Project Characteristics" page block displayed
    Then I softly see "Need for Project" page block displayed
    Then I softly see "Significance" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    When I navigate to "Test Tab" sub tab
    And I switch to parent tab
    And I pause execution for "5" seconds
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "2"
    And I navigate to "Details" sub tab
    And I pause execution for "5" seconds
    Then I softly see "Project Characteristics" page block displayed
    Then I softly see "Need for Project" page block displayed
    Then I softly see "Significance" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @509452 @US-502336
  Scenario:LWC - SPI - Form - To verify that, on Preview of the form, available multiple page blocks, empty page block and multiple tabs should match the form’s original layout in view/edit mode, with appropriate data
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | true              | ApiGeneratedId:0 |
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
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I navigate to "Details" sub tab
    Then I softly see "Project Characteristics" page block displayed
    Then I softly see "Need for Project" page block displayed
    Then I softly see "Significance" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    When I navigate to "Test Tab" sub tab
    And I switch to parent tab
    And I pause execution for "5" seconds
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "2"
    #And I navigate to "Details" sub tab
    And I pause execution for "5" seconds
    Then I softly see "Project Characteristics" page block displayed
    Then I softly see "Need for Project" page block displayed
    Then I softly see "Significance" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed
    Then I softly see "Project Goals" page block displayed
    Then I softly see "Organization Capacity" page block displayed

  @509455 @509459 @509461 @US-502336
  Scenario Outline: LWC - Admin/PM - Form - To verify that, on Preview of the form, Application name, Form ID and Form Name should not be displayed, only header should be displayed
  |LWC - Admin/PM - Form - To verify that, if the user fills the form and then clicks on Preview then should not displayed the added data on Preview of the form|
  |LWC - Admin/PM - Form - To verify that, after refreshing the page, data should be displayed in view format on Preview of the form|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
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
    When I navigate to "Test Tab" sub tab
    And I switch to parent tab
    And I pause execution for "5" seconds
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "2"
    And I navigate to "Details" sub tab
    And I pause execution for "5" seconds
      #509459
    Then I softly see only field "Form ID" in page details
    Then I softly see only field "Form Name" in page details
    Then I softly see only field "1a. Describe the activities and/or services to be provided. (10 points)" in page details
    Then I softly see only field "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" in page details
    Then I softly see only field "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" in page details
    Then I softly see only field "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" in page details
    Then I softly see only field "2b. Describe the characteristics of population to be served. (10 points)" in page details
    Then I softly see only field "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" in page details
    Then I softly see only field "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" in page details
    Then I softly see only field "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" in page details
    Then I softly see only field "5a. Experience in successful implementation of Public Services Projects. (10 points)" in page details
    Then I softly see only field "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" in page details
    Then I softly see only field "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" in page details
    And I refresh the page
      #509461
    And I pause execution for "5" seconds
    Then I softly see only field "Form ID" in page details
    Then I softly see only field "Form Name" in page details
    Then I softly see only field "1a. Describe the activities and/or services to be provided. (10 points)" in page details
    Then I softly see only field "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" in page details
    Then I softly see only field "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" in page details
    Then I softly see only field "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" in page details
    Then I softly see only field "2b. Describe the characteristics of population to be served. (10 points)" in page details
    Then I softly see only field "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" in page details
    Then I softly see only field "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" in page details
    Then I softly see only field "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" in page details
    Then I softly see only field "5a. Experience in successful implementation of Public Services Projects. (10 points)" in page details
    Then I softly see only field "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" in page details
    Then I softly see only field "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" in page details

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @509456 @509460 @509462 @US-502336
  Scenario: LWC - SPI - Form - To verify that, on Preview of the form, Application name, Form ID and Form Name should not be displayed, only header should be displayed
  |LWC - SPI - Form - To verify that, if the user fills the form and then clicks on Preview then should not displayed the added data on Preview of the form|
  |LWC - SPI - Form - To verify that, after refreshing the page, data should be displayed in view format on Preview of the form|
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
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "APPEGMSID"
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I navigate to "Details" sub tab
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to tab number "1"
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
    When I navigate to "Test Tab" sub tab
    And I switch to parent tab
    And I pause execution for "5" seconds
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "2"
    And I navigate to "Details" sub tab
    And I pause execution for "5" seconds
        #509460
    Then I softly see only field "Form ID" in page details
    Then I softly see only field "Form Name" in page details
    Then I softly see only field "1a. Describe the activities and/or services to be provided. (10 points)" in page details
    Then I softly see only field "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" in page details
    Then I softly see only field "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" in page details
    Then I softly see only field "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" in page details
    Then I softly see only field "2b. Describe the characteristics of population to be served. (10 points)" in page details
    Then I softly see only field "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" in page details
    Then I softly see only field "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" in page details
    Then I softly see only field "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" in page details
    Then I softly see only field "5a. Experience in successful implementation of Public Services Projects. (10 points)" in page details
    Then I softly see only field "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" in page details
    Then I softly see only field "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" in page details
    And I refresh the page
        #509462
    Then I softly see only field "Form ID" in page details
    Then I softly see only field "Form Name" in page details
    Then I softly see only field "1a. Describe the activities and/or services to be provided. (10 points)" in page details
    Then I softly see only field "1b. Describe the methodologies that will be used to complete activities/provide services. (10 points)" in page details
    Then I softly see only field "1c. Describe how the project will be completed within the required 24-month timeline. (10 points)" in page details
    Then I softly see only field "2a. Describe the critical need that will be addressed including how other resources are not available to meet the need. (10 points)" in page details
    Then I softly see only field "2b. Describe the characteristics of population to be served. (10 points)" in page details
    Then I softly see only field "3a. Explain the expected results of the proposed project and how it will result in the provision of a new service or the expansion of an existing service. (10 points)" in page details
    Then I softly see only field "4a. Identify the goals of the project and describe how these goals will be met. (5 points)" in page details
    Then I softly see only field "4b. Describe how the project goals support the goals of Project H.E.A.T. (5 points)" in page details
    Then I softly see only field "5a. Experience in successful implementation of Public Services Projects. (10 points)" in page details
    Then I softly see only field "5b. Describe your organization’s experience in successfully implementing projects of similar scope and of comparable complexity. (10 points)" in page details
    Then I softly see only field "5c. Describe your organization’s experience in providing services to low and moderate income residents, other high need populations. (10 points)" in page details

  @509466 @509453 @US-502336
  Scenario Outline: LWC - Admin/PM - Form - To verify that, on Preview of the form, provided default value should not be displayed for any data type field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName | fieldOrignalValue | filterId         |
      | Page Tabs Config      | Is Active | false             | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Tabs Config:Page Layout Action | Is Active | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}       |
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    And I navigate to "Test Tab" sub tab
    Then I softly see only field "Acknowledgement" in page details
    Then I softly see only field "Agency Routing Identifier" in page details
    Then I softly see only field "Agreement1" in page details
    Then I softly see only field "Applicant Identifier" in page details
    Then I softly see only field "Applicant Review Date" in page details
    Then I softly see only field "Application" in page details
    Then I softly see only field "Base Salary" in page details
    Then I softly see only field "CheckboxType" in page details
    Then I softly see only field "Citizenship" in page details
    Then I softly see only field "Email" in page details
    Then I softly see only field "Degree Year" in page details
    Then I softly see only field "Estimated Funding Applicant" in page details
    Then I softly see only field "Federal Share" in page details
    Then I softly see only field "Federal Share" in page details
    Then I softly see only field "Preapplication Title" in page details
    Then I softly see only field "Date And Time" in page details
    Then I softly see only field "Project Abstract" in page details
    Then I softly see only field "Phone" in page details
    Then I softly see only field "Time" in page details
    Then I softly see only field "Website" in page details

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @509467 @509454 @US-502336
  Scenario: LWC - SPI - Form - To verify that, on Preview of the form, provided default value should not be displayed for any data type field
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
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    Then I softly see only field "Acknowledgement" in page details
    Then I softly see only field "Agency Routing Identifier" in page details
    Then I softly see only field "Agreement1" in page details
    Then I softly see only field "Applicant Identifier" in page details
    Then I softly see only field "Applicant Review Date" in page details
    Then I softly see only field "Application" in page details
    Then I softly see only field "Base Salary" in page details
    Then I softly see only field "CheckboxType" in page details
    Then I softly see only field "Citizenship" in page details
    Then I softly see only field "Email" in page details
    Then I softly see only field "Degree Year" in page details
    Then I softly see only field "Estimated Funding Applicant" in page details
    Then I softly see only field "Federal Share" in page details
    Then I softly see only field "Federal Share" in page details
    Then I softly see only field "Preapplication Title" in page details
    Then I softly see only field "Date And Time" in page details
    Then I softly see only field "Project Abstract" in page details
    Then I softly see only field "Phone" in page details
    Then I softly see only field "Time" in page details
    Then I softly see only field "Website" in page details

  @509470 @US-502336
  Scenario Outline:LWC - Admin/PM - Form - To verify that, on Preview of the form, Hide expression JSON for all data types should work properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:38 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:TestTab}                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                  | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfilePM | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    And I navigate to "Test Tab" sub tab
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Agency Routing Identifier" inside page block
    Then I softly cannot see field "Agreement1" inside page block
    Then I softly cannot see field "Applicant Identifier" inside page block
    Then I softly cannot see field "Applicant Review Date" inside page block
    Then I softly cannot see field "Application" inside page block
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Degree Year" inside page block
    Then I softly cannot see field "Estimated Funding Applicant" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "Preapplication Title" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Project Abstract" inside page block
    Then I softly cannot see field "Phone" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Website" inside page block

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @509471 @US-502336
  Scenario: LWC - SPI - Form - To verify that, on Preview of the form, Hide expression JSON for all data types should work properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active            | false             | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:38 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Tabs Config:Page Layout Action      | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:TestTab}                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                   | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEForFieldsProfileSPI | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
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
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Agency Routing Identifier" inside page block
    Then I softly cannot see field "Agreement1" inside page block
    Then I softly cannot see field "Applicant Identifier" inside page block
    Then I softly cannot see field "Applicant Review Date" inside page block
    Then I softly cannot see field "Application" inside page block
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Degree Year" inside page block
    Then I softly cannot see field "Estimated Funding Applicant" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "Preapplication Title" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Project Abstract" inside page block
    Then I softly cannot see field "Phone" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Website" inside page block

  @507473 @US-502336
  Scenario Outline:LWC - Admin/PM - Form - To verify that, on Preview of the form, Hide Logic config for all data types should work properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active     | false             | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:38 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Tabs Config:Page Layout Action      | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}                      |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide For User | Internal      | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    And I navigate to "Test Tab" sub tab
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Agency Routing Identifier" inside page block
    Then I softly cannot see field "Agreement1" inside page block
    Then I softly cannot see field "Applicant Identifier" inside page block
    Then I softly cannot see field "Applicant Review Date" inside page block
    Then I softly cannot see field "Application" inside page block
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Degree Year" inside page block
    Then I softly cannot see field "Estimated Funding Applicant" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "Preapplication Title" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Project Abstract" inside page block
    Then I softly cannot see field "Phone" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Website" inside page block

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @509472 @US-502336
  Scenario: LWC - SPI - Form - To verify that, on Preview of the form, Hide Logic config for all data types should work properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName     | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active     | false             | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true              | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Hide For User |                   | ApiGeneratedId:38 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName     | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Tabs Config:Page Layout Action      | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:TestTab}                      |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Acknowledgement__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:AgencyRoutingIdentifier__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Agreement1__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:ApplicantIdentifier__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:ApplicantReviewDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Application__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Base_Salary__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Citizenship__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Email__c}                     |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Degree_Year__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:EstimatedFundingApplicant__c} |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:FederalShare__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Preapplication_Title__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:PAF_Date_And_PAF_Time__c}     |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:ProjectAbstract__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:PAF_Phone__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:PAF_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active     | true          | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
      | Page Block Config:Page Block Rule Detail | Hide For User | Applicant     | Program Specific Application form | Name                      | {SavedValue:Website__c}                   |
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
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    Then I softly cannot see field "Acknowledgement" inside page block
    Then I softly cannot see field "Agency Routing Identifier" inside page block
    Then I softly cannot see field "Agreement1" inside page block
    Then I softly cannot see field "Applicant Identifier" inside page block
    Then I softly cannot see field "Applicant Review Date" inside page block
    Then I softly cannot see field "Application" inside page block
    Then I softly cannot see field "Base Salary" inside page block
    Then I softly cannot see field "CheckboxType" inside page block
    Then I softly cannot see field "Citizenship" inside page block
    Then I softly cannot see field "Email" inside page block
    Then I softly cannot see field "Degree Year" inside page block
    Then I softly cannot see field "Estimated Funding Applicant" inside page block
    Then I softly cannot see field "Federal Share" inside page block
    Then I softly cannot see field "Preapplication Title" inside page block
    Then I softly cannot see field "Date And Time" inside page block
    Then I softly cannot see field "Project Abstract" inside page block
    Then I softly cannot see field "Phone" inside page block
    Then I softly cannot see field "Time" inside page block
    Then I softly cannot see field "Website" inside page block

  @509794 @US-502336
  Scenario Outline: LWC - Admin/PM - Form - To verify that, on Preview of the form, for multi-select picklist if alternate rendering config is applied then on UI checkboxes/radio buttons should not be displayed in disabled mode
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active                    | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action      | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:TestTab}         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c} |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    And I click on "View" action for first record of table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    And I navigate to "Test Tab" sub tab
    Then I softly see only field "CheckboxType" in page details

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @509795 @US-502336
  Scenario: LWC - SPI - Form - To verify that, on Preview of the form, for multi-select picklist if alternate rendering config is applied then on UI checkboxes/radio buttons should not be displayed in disabled mode
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Tabs Config                         | Is Active                    | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false             | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue              | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Tabs Config:Page Layout Action      | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:TestTab}         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true                       | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | MultiPicklistRenderTestApp | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Select All Checkbox     | false                      | Program Specific Application form | Name                      | {SavedValue:CheckboxType__c} |
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
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I navigate to "Test Tab" sub tab
    Then I softly see only field "CheckboxType" in page details


#################################### User Story 508868 --- Form Number and Form Version ###############
  @516173 @516202 @US-508868 @Sprint-9-2025
  Scenario Outline: LWC-Admin/PM-Form-To verify that form number and form version on form layout view mode.
  |LWC-Admin/PM-To verify that after refreshing the page the form number and form version should be display on form layout in view mode.|
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms
    And I refresh the page
    And I pause execution for "5" seconds
    #516202
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @516240 @516251 @US-508868
  Scenario Outline: LWC-Admin/PM-Form-To verify that form number and form version should be visible on form layout edit mode.
  |LWC-Admin/PM-To verify that after refreshing the page the form number and form version should be display on form layout in edit mode|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue | filterId         |
      | Flex Table Action     | Hide Expression JSON | <defaultconfig>   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON | <setupconfig> | FormEnhancedTable  | Name                      | Edit                       |
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms
    And I refresh the page
    And I pause execution for "5" seconds
    #516251
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

    Examples:
      | User | defaultconfig                                          | setupconfig |
      | PM   | govgrants_Config:HideExpressionConfigForEditButtonForm |             |

  @516257 @516268 @US-508868
  Scenario Outline: LWC-Admin/PM-Form- To verify that the Form Number and Form Version should not displayed when a user views the form in preview mode.
  |LWC-Admin/PM-To verify that after refreshing the page the form number and form version should not display on form layout in preview mode.|
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly do not see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly do not see the field "Form Version : " as "1.0" on forms
    And I refresh the page
    And I pause execution for "5" seconds
    #516268
    Then I softly do not see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly do not see the field "Form Version : " as "1.0" on forms

    Examples:
      | User |
      | PM   |

  @516297 @US-508868
  Scenario Outline: LWC-Admin/PM-From-To verify that when user check show footer text config then on UI form number and form version should be display on form layout..
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Forms                 | Show Footer Text | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Forms:General         | Show Footer Text | true          | Program Specific Application form |                           |                            |
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms
    And I refresh the page
    And I pause execution for "5" seconds
    #516268
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

    Examples:
      | User |
      | PM   |

  @516301 @US-508868
  Scenario Outline: LWC-Admin/PM-From-To verify that when user uncheck show footer text then on UI from number and form version should not be display on form layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Forms                 | Show Footer Text | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Forms:General         | Show Footer Text | false         | Program Specific Application form |                           |                            |
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
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly do not see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly do not see the field "Form Version : " as "1.0" on forms

    Examples:
      | User |
      | PM   |

  @516309 @US-508868
  Scenario Outline: LWC-Admin/PM-From-To verify that, form number and form version should  exactly match on UI with from number and form version provided in config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Forms                 | Show Footer Text | true              | ApiGeneratedId:0 |
      | Forms                 | Version          | 1.0               | ApiGeneratedId:0 |
    #  | Forms                 | Form Number      | PSAF - 001        | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Forms:General         | Show Footer Text | true          | Program Specific Application form |                           |                            |
      | Forms:General         | Version          | 1.0           | Program Specific Application form |                           |                            |
   #   | Forms:General         | Form Number      | PSAF - 001    | Program Specific Application form |                           |                            |
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
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
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
    And I close the tab
    When I navigate to "Overview" sub tab
    And I click on "Collapse" in page detail
    And I pause execution for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role | Is Key Contact |
      | {SavedValue:SPI3 Username} | Ebiz POC     | Checked        |
    When I click on "Submit Application" in the page details
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    When I perform quick search for "{SavedValue:APPEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:APPEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---" without waiting for record
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

    Examples:
      | User |
      | PM   |

  @516300 @US-508868
  Scenario: LWC-SPI-From-To verify that when user uncheck show footer text then on UI from number and form version should not be display on form layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Forms                 | Show Footer Text | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Forms:General         | Show Footer Text | false         | Program Specific Application form |                           |                            |
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
    And I pause execution for "5" seconds
    Then I softly do not see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly do not see the field "Form Version : " as "1.0" on forms

  @516304 @US-508868
  Scenario: LWC-SPI-From-To verify that when user check show footer text config then on UI form number and form version should be display form layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Forms                 | Show Footer Text | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Forms:General         | Show Footer Text | true          | Program Specific Application form |                           |                            |
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
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

  @516310 @US-508868
  Scenario: LWC-SPI-From-To verify that, form number and form version should  exactly match on UI with from number and form version provided in config.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Forms                 | Show Footer Text | true              | ApiGeneratedId:0 |
      | Forms                 | Version          | 1.0               | ApiGeneratedId:0 |
    #  | Forms                 | Form Number      | PSAF - 001        | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Forms:General         | Show Footer Text | true          | Program Specific Application form |                           |                            |
      | Forms:General         | Version          | 1.0           | Program Specific Application form |                           |                            |
   #   | Forms:General         | Form Number      | PSAF - 001    | Program Specific Application form |                           |                            |
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
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

  @516253 @516208 @US-508868
  Scenario: LWC-SPI-To verify that after refreshing the page the form number and form version should be display on form layout in edit mode.
  |LWC-SPI-Form-To verify that form number and form version should be visible on form layout edit mode.|
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
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

  @516248 @516193 @US-508868
  Scenario: LWC-SPI-To verify that after refreshing the page the form number and form version should be display on form layout in view mode.
  |LWC-SPI-Form-To verify that form number and form version on form layout view mode.|
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
    And I pause execution for "5" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly see the field "Form Version : " as "1.0" on forms

  @516270 @516258 @US-508868
  Scenario: LWC-SPI-To verify that after refreshing the page the form number and form version should not display on form layout in preview mode.
  |LWC-SPI-Form-To verify that the Form Number and Form Version should not  displayed when a user views the form in preview mode.|
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
    When I click on "Preview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I pause execution for "5" seconds
    Then I softly do not see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly do not see the field "Form Version : " as "1.0" on forms
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly do not see the field " Form Number : " as "PSAF - 001 " on forms
    Then I softly do not see the field "Form Version : " as "1.0" on forms

    ##################  PDF generation for Form Preview - User Story - 508752 ################

  @514914 @US-508752
  Scenario Outline: LWC- Admin/PM – Form – PDF generation for Form Preview - To verify that, when user clicks on Download as PDF under form layout then Form PDF should be downloaded/open in new window
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    When I enter value "Automation Runtime Internal Program" into field "ProgramName__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    Then I softly see "Business Forms" page block displayed
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside flex table with id "---program:-:ProgramBusinessFormTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    When I click on "Preview" icon for "Federal Financial Report - SF-425" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I switch to tab number "1"
    And I click on "menu" button inside page details in lwc
    And I pause execution for "3" seconds
    Then I see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened

    Examples:
      | User |
      | PM   |

  @514936 @US-508752
  Scenario Outline: LWC - Admin/PM – Form – PDF generation for Form Preview - To verify that, Download as PDF action should be displayed under Menu of Form Preview Layout.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    When I enter value "Automation Runtime Internal Program" into field "ProgramName__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    Then I softly see "Business Forms" page block displayed
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside flex table with id "---program:-:ProgramBusinessFormTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I click on "Menu" button inside table id "---program:-:previewPackageTableId---"
    Then I softly see "Download as PDF" button is displayed
    And I refresh the page
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside flex table with id "---program:-:ProgramBusinessFormTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I click on "Menu" button inside table id "---program:-:previewPackageTableId---"
    Then I softly see "Download as PDF" button is displayed

    Examples:
      | User |
      | PM   |

  @514938 @US-508752
  Scenario Outline: LWC - Admin/PM – Form – PDF generation for Form Preview - To verify that, after refreshing the page, form content should be display correctly in Downloaded PDF under Menu of Form Preview Layout.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "lwcProgram_Field_Values.xlsx"
    When I enter value "Automation Runtime Internal Program" into field "ProgramName__c"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    Then I softly see "Business Forms" page block displayed
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside flex table with id "---program:-:ProgramBusinessFormTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    And I perform quick search for "Federal Financial Report - SF-425" in "---program:-:previewPackageTableId---" panel
    When I click on "Preview" icon for "Federal Financial Report - SF-425" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I switch to tab number "1"
    And I click on "menu" button inside page details in lwc
    And I pause execution for "3" seconds
    Then I see "Download as PDF" button is displayed
    And I refresh the page
    And I click on "menu" button inside page details in lwc
    Then I see "Download as PDF" button is displayed

    Examples:
      | User |
      | PM   |

  @514942 @514960 @US-508752
  Scenario: LWC - SPI – Form – PDF generation for Form Preview - To verify that, when user clicks on Download as PDF under form layout then Form PDF should be downloaded/open in new window
  |LWC - SPI – Form – PDF generation for Form Preview - To verify that, Download as PDF action should be displayed under Menu of Form Preview Layout.|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I click on "View" action for first record of table
    And I pause execution for "4" seconds
    When I navigate to "Forms and Files" sub tab
    When I perform quick search for "Federal Financial Report - SF-425" in "---progressreport:-:formTableId---" panel
    When I click on "Preview" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressreport:-:formTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I pause execution for "4" seconds
    And I click on "menu" button inside page details in lwc
    Then I see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened

  @514961 @US-508752
  Scenario: LWC - SPI – Form – PDF generation for Form Preview - To verify that, after refreshing the page, form content should be display correctly in Downloaded PDF under Menu of Form Preview Layout.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - My Records"
    And I click on "View" action for first record of table
    And I pause execution for "4" seconds
    When I navigate to "Forms and Files" sub tab
    When I perform quick search for "Federal Financial Report - SF-425" in "---progressreport:-:formTableId---" panel
    When I click on "Preview" icon for "Federal Financial Report - SF-425" inside flex table with id "---progressreport:-:formTableId---"
    And I pause execution for "8" seconds
    Then I softly see new tab is opened
    And I switch to tab number "1"
    And I pause execution for "4" seconds
    And I click on "menu" button inside page details in lwc
    Then I see "Download as PDF" button is displayed
    And I refresh the page
    And I click on "menu" button inside page details in lwc
    Then I see "Download as PDF" button is displayed

  @515555 @US-508752
  Scenario Outline:LWC- Admin/PM – Form – PDF generation for Form Preview - To verify that, users should be able to see download as PDF action under menu of split screen.
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I pause execution for "5" seconds
    When I perform quick search for "{SavedValue:ApplicationRecordSubmittedStateInternal}" in "{applicationIntake:appAllTableId}" panel
    When I click on "View" icon for "{SavedValue:ApplicationRecordSubmittedStateInternal}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    When I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "4" seconds
    And I click on "menu" button inside split view
    Then I see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened

    Examples:
      | User |
      | PM   |

  @515554 @US-508752
  Scenario: LWC- SPI – Form – PDF generation for Form Preview - To verify that, users should be able to see download as PDF action under menu of split screen.
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
    When I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I pause execution for "8" seconds
    And I pause execution for "4" seconds
    And I click on "menu" button inside split view
    Then I see "Download as PDF" button is displayed
    When I click on "Download as PDF" in the page details
    Then I softly see new tab is opened

  @552765 @US-551571
  Scenario: LWC : Queue Base Ownership : Admin : To verify that if the Queue member creates any record then Queue Name should be display as Owner ID
    #Added queue details on objects and created queue below queue for this functionality
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see "Owner ID" as "Queue Base Ownership" in page details

  @552769 @US-551571
  Scenario: LWC : Queue Base Ownership : EXE: To verify that if the Non Queue member creates any record then User's Name should be display as Owner ID
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see "Owner ID" as "Automation EXE" in page details