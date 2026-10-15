@Sprint-2025 @JuneRelease @Sprint23-2025
Feature:Test suite: GovGrants\Framework\Sprint 23 2025 Nov 3 - Nov 14 (Suite ID: 547393)
Business Need: To ensure that the relevant title of the Budget category in the modal of our web pages meets the needs of different user roles: admin, internal users
1.US-543491
2.US-547789
3.US-539717
4.US-541035

  @547225 @US-543491
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when record is in edit mode and user closes the browser action without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I wait for "4" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box

  @547226 @US-543491
  Scenario:LWC - Unsaved Data - Data Table Enhanced/Grid - SPI - To verify when table record is inline edit mode and user closes the browser tab without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "4" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside table with table id "---preApplication:-:preAppContactTableId---" without processing
    When I click on "Submit to Grantor" in the page details without processing
    Then I softly see confirmation box with header "Confirm" is displayed
    Then I softly see confirmation box with body "This action will submit the pre-application to grantor and it will not be editable . Are you sure you want to proceed?" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box

  @547228 @US-543491
  Scenario:LWC - Unsaved Data - Form Layout - SPI - To verify when record is in edit mode and user closes the browser tab without saving data then system should be generate alert for unsaved data
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
    And I wait for "3" seconds
    And I get current URL
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I close the tab
    Then I softly see confirmation box with header "Confirm" is displayed
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box

  @547231 @US-543491
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when record is in edit mode and user clicks on any tab from navigator bar (for ex. Home, Application etc), without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I click on "Create Application" in the page details
    And I wait for "4" seconds
    When I click modal button "Save and Continue"
    And I enter value "1231" into field "GranteeProgramincome__c"
    And I navigate to "Opportunities" tab
    Then I softly see confirmation box with header "Saved Changes" is displayed
    Then I see "Discard Changes" button is displayed on confirmation box
    Then I see "Continue Editing" button is displayed on confirmation box

  @547229 @US-543491
  Scenario: LWC - Unsaved Data - Page Layout - SPI - To verify when record is in edit mode and user clicks the browser back button without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I click on "Create Application" in the page details
    And I wait for "4" seconds
    When I click modal button "Save and Continue"
    And I enter value "1231" into field "GranteeProgramincome__c"
    And I click on back arrow
    Then I softly see confirmation box with header "Saved Changes" is displayed
    Then I see "Changes you made may not be saved." button is displayed on confirmation box

  @547235 @US-543491
  Scenario: LWC - Unsaved Data - Form Layout - SPI - To verify when record is in edit mode and user clicks on the cancel action without saving data then system should be generate alert for unsaved data
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
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with header "Confirm" is displayed
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box

  @547237 @US-543491
  Scenario: LWC - Unsaved Data - Data Table Enhanced/Grid - SPI - To verify when table record is inline edit mode and user click on any tab from navigator bar (for ex. Home, Application etc), without saving data then system should be generate alert for unsaved data
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "4" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside table with table id "---preApplication:-:preAppContactTableId---" without processing
    And I navigate to "Opportunities" tab
    Then I softly see confirmation box with header "Saved Changes" is displayed
    Then I see "Discard Changes" button is displayed on confirmation box
    Then I see "Continue Editing" button is displayed on confirmation box

  @548434 @548487 @US-547789
  Scenario: LWC : Page Layout Hide action : PM : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json
  |LWC : Page Layout Hide action : Admin : To verify that the user should be able to hide page layout action on the basis of child object field value by using hide expression json|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                      | filterId         |
      | Page Layout Action    | Is Active            | true                                   | ApiGeneratedId:0 |
      | Page Layout Action    | Hide Expression JSON |                                        | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names  | {CommonConfigFileTest:ContactTableDFN} | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                               | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active            | true                                        | Grantor State Program           | Name                      | Test Button                |
      | Page Layout Action    | Hide Expression JSON | govgrants_config:PageLayoutHideAction548434 | Grantor State Program           | Name                      | Test Button                |
      | Flex Table:General    | Display Field Names  | {CommonConfigFileTest:ContactTableDFN}      | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    #548434
    Then I softly see "Test Button" button is displayed
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
   #548487
    Then I softly do not see "Test Button" button is displayed


  @548884 @548876 @US-539717
  Scenario: LWC - isLightning - PM - To verify that, all redirections happen in LWC when isLightningOrg BooleanValue__c custom setting is true
  |LWC - isLightning - PM - To verify that, whether the execution is happening in Lightning Experience with isLightningOrg BooleanValue__c custom setting is true|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I wait for "2" seconds
    Then I see "sandbox.lightning.force.com/lightning/n/Planning" in current url
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    Then I see "sandbox.lightning.force.com/lightning/n/Announcement" in current url
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I see "sandbox.lightning.force.com/lightning/r/ServiceArea__c" in current url

  @548879 @548882 @US-539717
  Scenario: LWC - isLightning - PM - To verify that, system should be able to detect wherever LWC code is running if isLightningOrg BooleanValue__c custom setting is true
  |LWC - isLightning - PM - To verify that, user should not navigate to classic page when isLightningOrg BooleanValue__c custom setting is true|
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "4" seconds
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get current URL
    And I pause execution for "4" seconds
    Then I see "sandbox.lightning.force.com/lightning/" in current url

  @548886 @US-539717
  Scenario: LWC - isLightning - SPI - To verify that, after refreshing the page system should be able to detect wherever LWC code is running if isLightningOrg BooleanValue__c custom setting is true
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I see "sandbox.my.site.com/recipient/s/RecipientAnnouncements" in current url
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "4" seconds
    Then I see "sandbox.my.site.com/recipient/s/announcement" in current url

  @548887 @548889 @US-539717
  Scenario: LWC - isLightning - SPI - To verify that, all redirections happen in LWC when isLightningOrg BooleanValue__c custom setting is true
  |LWC - isLightning - SPI - To verify that, system should be able to detect wherever LWC code is running if isLightningOrg BooleanValue__c custom setting is true|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I pause execution for "3" seconds
    #548887
    Then I see "sandbox.my.site.com/recipient/s/RecipientAnnouncements" in current url
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I see "sandbox.my.site.com/recipient/s/RecipientAnnouncements" in current url
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "4" seconds
    #548889
    Then I see "sandbox.my.site.com/recipient/s/announcement" in current url

  @548890 @US-539717
  Scenario: LWC - isLightning - SPI - To verify that, user should be able to see all LWC pages when isLightningOrg BooleanValue__c custom setting is true
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I wait for "2" seconds
    Then I see "sandbox.my.site.com/recipient/s" in current url
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I wait for "2" seconds
    Then I see "sandbox.my.site.com/recipient/s/grant" in current url

  @548893 @US-539717
  Scenario: LWC - isLightning - SPI - To verify that, whether the execution is happening in Lightning Experience with isLightningOrg BooleanValue__c custom setting is true
    Given I activated standalone subaward "Automation Runtime Award" with properties "SECOND_FOCUS_AREA_BUD_CAT_BUILDUP_YES-Automation PO user" of type "Formula_By_Applicant"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    And I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    Then I see "sandbox.my.site.com/recipient/s/award" in current url

  @548883 @US-539717
  Scenario: LWC - isLightning - PM - To verify that, user should be able to see all LWC pages when isLightningOrg BooleanValue__c custom setting is true
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I pause execution for "4" seconds
    Then I see "sandbox.lightning.force.com/lightning/n/Grants" in current url
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see "sandbox.lightning.force.com/lightning/r/Grant__c" in current url

  @548891 @US-539717
  Scenario: LWC - isLightning - SPI - To verify that, user should not navigate to classic page when isLightningOrg BooleanValue__c custom setting is true
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I see "sandbox.my.site.com/recipient/s/announcement" in current url
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I wait for "2" seconds
    When I navigate to "Opportunities" tab
    And I wait for "2" seconds
    Then I see "sandbox.my.site.com/recipient/s/RecipientAnnouncements" in current url
    When I navigate to "Grants" tab
    And I wait for "2" seconds
    Then I see "sandbox.my.site.com/recipient/s/RecipientAwards" in current url

  @548701 @548706 @548708 @548709 @US-541035
  Scenario: LWC - Export - View/Preview - PM - To verify that, header instruction text added in the page block should be included and clearly visible in the downloaded PDF under its respective page block section.
  |LWC - Export - View/Preview - PM - To verify that, header instruction text should appear immediately at the top of the section it belongs to, matching the structure of the layout.|
  |LWC - Export - View/Preview - PM - To verify that, for each block's header instruction text should appear under its respective section.|
  |LWC - Export - View/Preview - PM - To verify that, If a page block has no header instruction text, the PDF should not show any placeholder or empty space in its place.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Header Instruction Text |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                      | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Page block Header Instruction Text | Grantor State Program | Name                      | PB-11276                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    #548701
    Then I see "Page block Header Instruction Text" shown as header instruction text
    When I click on "Download as PDF" in the page details
    And I download the file
    And I pause execution for "2" seconds
    #548706 #548708 #548709
    Then I see "Page block Header Instruction Text" on page "1" of "govgrants" pdf file

  @548702 @US-541035
  Scenario: LWC - Export - View/Preview - PM - To verify that, header instruction text is not added in a Page Block, then no placeholder or empty space should be inserted or displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Header Instruction Text |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text |               | Grantor State Program | Name                      | PB-11276                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see "Page block Header Instruction Text" shown as header instruction text
    When I click on "Download As PDF" in the page details
    And I download the file
    And I pause execution for "2" seconds
    Then I cannot see "Page block Header Instruction Text" on page "1" of "govgrants" pdf file

  @548710 @US-541035
  Scenario: LWC - Export - View/Preview - PM - To verify that, header instruction text should appear in the language currently selected in the layout when downloaded as PDF.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block            | Header Instruction Text |                   | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | , * # - → [] () | Grantor State Program | Name                      | PB-11276                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
      #548710
    Then I see ", * # - → [] ()" shown as header instruction text
    When I click on "Download As PDF" in the page details
    And I download the file
    And I pause execution for "2" seconds
    #548710
    Then I see ", * # - → [] ()" on page "1" of "govgrants" pdf file

  @548711 @US-541035
  Scenario: LWC - Export - View/Preview - SPI - To verify that, header instruction text added in the page block should be included and clearly visible in the downloaded PDF under its respective page block section.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Page block Header Instruction Text | RecipientGrant     | Name                      | PB-12087                   |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I see "Page block Header Instruction Text" shown as header instruction text
    When I click on "Download As PDF" in the page details
    And I download the file
    And I pause execution for "2" seconds
    Then I see "Page block Header Instruction Text" on page "1" of "govgrants" pdf file

  @548712 @US-541035
  Scenario:LWC - Export - View/Preview - SPI - To verify that, header instruction text is not added in a Page Block, then no placeholder or empty space should be inserted or displayed
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text |               | RecipientGrant     | Name                      | PB-12087                   |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I click on "Download As PDF" in the page details
    And I download the file
    And I pause execution for "2" seconds
    Then I cannot see "Page block Header Instruction Text" on page "1" of "govgrants" pdf file

  @548714 @US-541035
  Scenario: LWC - Export - View/Preview - SPI - To verify that, header instruction text should appear immediately at the top of the section it belongs to, matching the structure of the layout.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Page block Header Instruction Text | RecipientGrant     | Name                      | PB-12087                   |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I see "Page block Header Instruction Text" shown as header instruction text

  @548715 @US-541035
  Scenario: LWC - Export - View/Preview - SPI - To verify that, for each block's header instruction text should appear under its respective section.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:0 |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:1 |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                             | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | Page block Header Instruction Text        | RecipientGrant     | Name                      | PB-12087                   |
      | Page Block:Page Block Detail | Header Instruction Text | System Information Instruction Text       | RecipientGrant     | Name                      | PB-12094                   |
      | Page Block:Page Block Detail | Header Instruction Text | Subrecipient Information Instruction Text | RecipientGrant     | Name                      | PB-12099                   |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I see "Page block Header Instruction Text" shown as header instruction text
    Then I see "System Information Instruction Text" shown as header instruction text
    Then I see "Subrecipient Information Instruction Text" shown as header instruction text

  @548716 @US-541035
  Scenario: LWC - Export - View/Preview - SPI - To verify that, If a page block has no header instruction text, the PDF should not show any placeholder or empty space in its place.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | PDFNotDisplayedNoPlaceholderOrEmptySpaceHereNowPDF | RecipientGrant     | Name                      | PB-12087                   |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I see "PDFNotDisplayedNoPlaceholderOrEmptySpaceHereNowPDF" shown as header instruction text
    When I click on "Download As PDF" in the page details
    And I download the file
    And I pause execution for "2" seconds
    Then I see "PDFNotDisplayedNoPlaceholderOrEmptySpaceHereNowPDF" on page "1" of "govgrants" pdf file

  @548717 @US-541035
  Scenario: LWC - Export - View/Preview - SPI - To verify that, header instruction text should appear in the language currently selected in the layout when downloaded as PDF.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName               | fieldOrignalValue | coreComponentField | filterId         |
      | Page Block            | Header Instruction Text |                   | RecipientGrant     | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName               | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block:Page Block Detail | Header Instruction Text | *@^@^@&***    | RecipientGrant     | Name                      | PB-12087                   |
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    Then I see "*@^@^@&***" shown as header instruction text
    When I click on "Download As PDF" in the page details
    And I download the file
    And I pause execution for "1" seconds
    Then I see "*@^@^@&***" on page "1" of "govgrants" pdf file
