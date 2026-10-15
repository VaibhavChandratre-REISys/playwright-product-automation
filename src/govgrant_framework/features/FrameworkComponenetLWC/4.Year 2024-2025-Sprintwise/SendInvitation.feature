@Sprint-1-2026 @SendInvitation @Sprint-2026 @US-548996 @wip
Feature: Send Invitation Top Level Action Button On Page Layout
Business Need:- This includes user stories - @US-548996

  @550631
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that, Send Invitation action should be available on top of page layout
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    And I enter into value "Automation EXE" into lookup field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "menu" button inside page details in lwc
    Then I softly see field "Status" as "Created"
    Then I softly see "Send Invitation" button is displayed

  @550641
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that, “Send Invitation” action should be hidden as per hide logic
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | Grantor State Program | Name                      | Send Invitation            |
      | Page Layout Action    | Hide for Profile | PM            | Grantor State Program | Name                      | Send Invitation            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I get the "EGMS ID"
    And I enter into value "Automation EXE" into lookup field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I click on "menu" button inside page details in lwc
    Then I softly do not see "Send Invitation" button is displayed

  @550645 @550647
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that action remains visible and functional after page refresh
  |LWC - Page Layout - PM - Support of Send invitation action - To verify that on click of Send Invitation action, UI does not freeze or crash|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I click on "Edit" in the page details
    And I enter into value "Automation EXE" into lookup field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Status" as "Created"
    And I click on "menu" button inside page details in lwc
    Then I softly see "Send Invitation" button is displayed
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see "Send Invitation" button is displayed
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window

  @550651
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that Send Invitation action should be visible immediately after record creation
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"
    And I click on "menu" button inside page details in lwc
    Then I softly see "Send Invitation" button is displayed

  @550652
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that action should remain available/visible after record status change
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I enter into value "Automation EXE" into lookup field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Status" as "Created"
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "Automation EXE" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           | Program |
      | Automation EXE | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "<Focus Area>" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Strategic Objectives Admin" by showing entries "All" in flex table with id "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI For Admin" by showing entries "All" in flex table with id "---program:-:associateKPITableId---"
    And I wait for "3" seconds
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    And I refresh the page
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see "Send Invitation" button is displayed

  @550658
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that on click of "Send Invitation" action, Send Invitation modal should open and user should be able to send invitation after filling required data
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I enter into value "Automation EXE" into lookup field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @550659
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that user should get success message after sending invitation
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I enter into value "Automation EXE" into lookup field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @550664
  Scenario: LWC - Page Layout - PM - Support of Send invitation action - To verify that user can send invitation after clicking on Send action of modal
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I pause execution for "5" seconds
    And I enter into value "Automation EXE" into lookup field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I click on "Send" button in send email modal
    Then I softly see "Email Sent Successfully." message is displayed on Send Email Modal

  @550681
  Scenario: LWC - Forms - PM - Support of Send invitation action - To verify that action remains visible and functional after page refresh
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see "Send Invitation" button is displayed
    And I refresh the page
    Then I softly see "Send Invitation" button is displayed

  @550682
  Scenario: LWC - Forms - PM - Support of Send invitation action - To verify that, Send Invitation action should be available on top of Forms
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I can see top right button "Send Invitation" in page detail
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window
    When I enter value "pm.automation@yopmail.com" into field "{testData:CcField}" on send email modal
    When I enter value "Test automation mail subject 1" into field "Subject" on send email modal
    When I enter value "Test automation mail body content" into field "Body Content" on send email modal
    And I click on "Send" button in send email modal


  @550683
  Scenario: LWC - Forms - PM - Support of Send invitation action - To verify that, “Send Invitation” action should be hidden as per hide logic
    Given I have "default" configuration as below:
      | configurationCategory | fieldName        | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active        | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Hide for Profile |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active        | true          | General Review Form | Name                      | Send Invitation            |
      | Page Layout Action    | Hide for Profile | EXE           | General Review Form | Name                      | Send Invitation            |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly do not see "Send Invitation" button is displayed

  @550686
  Scenario: LWC - Forms - PM - Support of Send invitation action - To verify that on click of Send Invitation action, UI does not freeze or crash
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I click on "Send Invitation" in the page details
    Then I softly see "Send Invitation" opens in overLay window

