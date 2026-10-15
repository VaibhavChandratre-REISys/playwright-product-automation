@Sprint-PageLayout @sprintwise2024 @PageLayoutDm @US-391941 @Sprint-2025 @JuneRelease
Feature: Sprint 1 - User Story 385577: LWC - QA Verification - Restructure of Layout Action (Suite ID: 392310)
Business Need: This includes below user stories
1. @US-391941 - Sprint-3-2024
2. @US-392989 - Sprint-4-2024
3. BrowserBackRedirection @US-514198 Sprint-10-2025
4. ErrorMessageScroll @US-521687 Sprint-10-2025
5. FormPreview @US-514059 Sprint-10-2025
6. FilesViewPreview @US-502146 Sprint-8-2025

  @sprint3 @393329 @393331 @393332 @393333
  Scenario Outline:BM _PM_To verify when internal PM user sends a program record to another internal FO user for approval then pending task gets generated.
  |BM _Admin_To verify when internal admin user sends a program record to another internal FO user for approval then pending task gets generated.|
  |BM _PM_To verify when internal PM user forwards program record to another internal FO user for approval then pending task gets generated.|
  |BM _Admin_To verify when internal admin user forwards program record to another internal FO user for approval then pending task gets generated.|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    And I wait for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    #393329 #393331
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Forward" in the approval decision
    And I select user "{SavedValue:EXE Username}" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    #393332 #393333
    Then I softly see field "Status" as "Submitted for Approval"
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @sprint3 @393334 @393337 @399970
  Scenario: BM _PM_To verify when internal PM user who is approver, sends back program record then pending task gets generated.|
  |BM _Admin_To verify when internal admin user who is approver, sends back program record then pending task gets generated.|
  | LWC- Page Layout- UI- To verify recently opened items on page layout|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I wait for "5" seconds
    And I click on "Submit For Approval" in the page details
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I select radio button "Send back" in the approval decision
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I pause execution for "120" seconds
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    #393334 #393337
    Then I softly see status in Progress-bar is "Created" and is "dark blue"

  @sprint4 @399919 @399922
  Scenario: LWC- Navigator- UI- To verify accordion sub header is visible when user expands accordion header and accordion content is visible when user expands accordion subheader.
  |LWC- Navigator- UI- To verify expand and collapse arrows of accordion header and subheader|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    #399919
    Then I softly see minus icon is displayed at "Task" menu inside sidebar
   #399922
    Then I see changed label as "Pending Tasks" inside "My Tasks" in side bar sub menu

  @sprint4 @399938 @399941 @399942 @399943
  Scenario Outline: LWC- Step Progressbar- UI- To verify when step progressbar is enabled in edit page then it shows on top of the page
  |LWC- Step Progressbar- UI- To verify completed step showing in blue color with white tickmark|
  |LWC- Step Progressbar- UI- To verify current step is showing in navy blue color with label in white color|
  |LWC- Step Progressbar- UI- To verify future step is showing grey color with label in blue color|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---program:-:associateFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    And I wait for "5" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    #399942
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    #399938 #399941
    Then I softly see status in Progress-bar is "Created" and is "blue"
    #399943
    Then I softly see status in Progress-bar is "Approved" and is "grey"

    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @sprint4 @399947 @399950 @399951 @399952 @399953 @399954 @399955
  Scenario Outline: LWC- Step Progressbar- UI- To verify page tabs with icons are displaying on layout.
  | LWC- Page Layout- UI- To verify page tabs with icons are displaying on layout.|
  | LWC- Page Layout- UI- To verify top level actions are displaying on layout|
  | LWC- Page Layout- UI- To verify page block title is displaying on layout|
  | LWC- Page Layout- UI- To verify required to save asterisk mark is showing on view layout|
  | LWC- Page Layout- UI- To verify help text icon is visible on view layout|
  | LWC- Page Layout- UI- To verify required to submit icon is visible on view layout|
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see field message with text as "Required to Save" and "Required to Submit"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    #399947 #399950 #399951
    Then I see "Overview" subtab is present with icon "knowledge_base" in page details
    #399952
    Then I softly see "Information" page block displayed
   #399953
    And I click on Menu icon present on top right corner of the page
    Then I softly see "Submit For Approval" button is displayed
    Then I softly see "Edit" button is displayed
   #399954
    Then I see helpIcon displayed beside "Type" respective field or column
    #399955
    Then I see field message with text as "Required to Save" and "Required to Submit"
    Examples:
      | User |
      #| ADMIN |
      | PM   |

  @314753 @314754 @314757 @314758 @356055 @356056 @sprint4 @399958 @FieldDataTypes
  Scenario Outline: LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Currency' datatype field should be rendered on Page block
  LWC-Flex View Layout - Page Block Details - UI - Admin - To verify that 'Rich Text Area' datatype field should be rendered on Page block
  | LWC- Page Layout- UI- To verify rich text area on page layout|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:Test_Description__c}        |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{flexgrid:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{flexgrid:ProgramRecord}" inside table
    And I pause execution for "8" seconds
    When I navigate to "Overview" sub tab
    Then I softly see field "FundedAmount__c" inside page block
    Then I softly see field "Test_Description__c" inside page block

    Examples:
      | User |
    #  | Admin |
      | PM   |

  @318238 @318242 @318249 @318252 @319241 @319244 @319358 @319359 @sprint4 @399956 @399957
  Scenario Outline: LWC - Flex View Layout - Page Layout Actions - UI - Admin - To verify when user click on 'Menu' icon then user should be able to see "Download as PDF" action in list
  |LWC- Page Layout- UI- To verify icons are displaying for download as PDF and Take Snapshot action|
  | LWC- Page Layout- UI- To verify only 2 top level actions are showing on layout and remaining actions are displaying inside menu icon|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName   | fieldOrignalValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue | filterId         |
      | Page Layout Action    | Is Active   | true              | Grantor State Program | Name                      | Edit                       | ApiGeneratedId:0 |
      | Page Layout Action    | Layout Type | View              | Grantor State Program | Name                      | Edit                       | ApiGeneratedId:1 |
      | Page Layout Action    | Type        | Button            | Grantor State Program | Name                      | Edit                       | ApiGeneratedId:2 |
      | Page Layout Action    | Is Active   | true              | Grantor State Program | Name                      | Submit For Approval        | ApiGeneratedId:3 |
      | Page Layout Action    | Layout Type | View              | Grantor State Program | Name                      | Submit For Approval        | ApiGeneratedId:4 |
      | Page Layout Action    | Type        | Button            | Grantor State Program | Name                      | Submit For Approval        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName   | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active   | true          | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Layout Type | View          | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Type        | Button        | Grantor State Program | Name                      | Edit                       |
      | Page Layout Action    | Is Active   | true          | Grantor State Program | Name                      | Submit For Approval        |
      | Page Layout Action    | Layout Type | View          | Grantor State Program | Name                      | Submit For Approval        |
      | Page Layout Action    | Type        | Button        | Grantor State Program | Name                      | Submit For Approval        |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - My Records"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    Then I see "Submit For Approval" button is displayed
    Then I see "Edit" button is displayed
    And I click on "menu" button inside page details in lwc
    Then I see "Download as PDF" button is displayed
    Then I see "Take Snapshot" button is displayed
    Examples:
      | User |
     # | Admin |
      | PM   |

  @399965 @399966 @399967 @399968 @399969 @sprint4
  Scenario: LWC- Page Layout- UI- To verify lookup field on layout
  | LWC- Page Layout- UI- To verify picklist field on layout|
  | LWC- Page Layout- UI- To verify readonly field on layout|
  | LWC- Page Layout- UI- To verify date field on edit layout with calendar|
  | LWC- Page Layout- UI- To verify date and time field on edit layout with calendar and time picklist|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}       |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - My Records"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "lwcProgram_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see "PrimaryFundingOrganization__c" lookup field is displayed
    Then I softly see "AuthorizedSignatory__c" lookup field is displayed
    Then I softly see field "Type" inside page block
    Then I softly see field "Published Date" inside page block
    Then I softly see field "Date And Time" inside page block

  @sprint4 @US-392989 @398016 @398017 @398235 @398236 @398305 @398309 @398328 @398331 @398477 @398478 @398493 @398498
  Scenario Outline: LWC-SI-Potential Reviewer Contact - Admin-To verify that, 'send invitation' action should be clickable on UI.
  |LWC-SI-Potential Reviewer Contact - PM -To verify that, 'send invitation' action should be clickable on UI.|
  |LWC-SI-Potential Reviewer Contact- Admin-To verify, user should be able to see send invitation modal window on click of 'Send Invitation' action button.|
  |LWC-SI-Potential Reviewer Contact- PM-To verify, user should be able to see send invitation modal window on click of 'Send Invitation' action button.|
  |LWC-SI-Potential Reviewer Contact - Admin-To verify, user should be able to see send recipient email address (To) in read only on send invitation modal window.|
  |LWC-SI-Potential Reviewer Contact - PM -To verify, user should be able to see send recipient email address (To) in read only on send invitation modal window.|
  |LWC-SI-Potential Reviewer Contact - Admin -To verify, user should be able to see 'CC' field is editable on send invitation modal window.|
  |LWC-SI-Potential Reviewer Contact - PM -To verify, user should be able to see 'CC' field is editable on send invitation modal window.|
  |LWC-SI- Potential Reviewer Contact- Admin-To verify, user should be able to see by default subject coming from send invitation email template on send invitation modal window |
  |LWC-SI- Potential Reviewer Contact- PM -To verify, user should be able to see by default subject coming from send invitation email template on send invitation modal window |
  |LWC-SI-Potential Reviewer Contact- Admin-To verify, subject field should be editable which comes from send invitation email template on the send invitation modal window |
  |LWC-SI-Potential Reviewer Contact-PM-To verify, subject field should be editable which comes from send invitation email template on the send invitation modal window |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    Then I softly see "Full Name" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Email" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Invited By" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Status" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Sponsoring Agency" in flex table header "---grantor_tableId:-:PotentialReviewerContactTableId---"
    #398016 #398017
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    #398235 #398236
    Then I softly see "Reviewers" opens in overLay window
    #398305 #398309
    Then I do not see field lable contains "To" on modal is editable
    Then I see field lable contains "Cc" on modal is editable
    #398493 #398498
    Then I see field lable contains "Subject" on modal is editable
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully" in modal
    #398477 #398478
    Then I see the text "Notification: You have been Invited to Register in the Enterprise Grants Management System (EGMS)" in modal
    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @398543 @398544 @398544 @398570 @398571 @398575 @398577
  Scenario Outline: LWC-SI- Potential Reviewer Contact- Admin-To verify, user should be able to add file by clicking on 'Choose File' option on send invitation modal.
  |LWC-SI- Potential Reviewer Contact- Admin-To verify, user should be able to add file by clicking on 'Choose File' option on send invitation modal.|
  |LWC-SI- Potential Reviewer Contact- PM-To verify, user should be able to add file by clicking on 'Choose File' option on send invitation modal.|
  |LWC-SI- Potential Reviewer Contact- Admin-To verify, user should be able to see added file on send invitation modal.|
  |LWC-SI- Potential Reviewer Contact- PM-To verify, user should be able to see added file on send invitation modal.|
  |LWC-SI-  Potential Reviewer Contact - Admin-To verify, user should be able to see by default email body template which comes from send invitation email template on send invitation modal window.|
  |LWC-SI-  Potential Reviewer Contact - PM-To verify, user should be able to see by default email body template which comes from send invitation email template on send invitation modal window.|
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I click "Send" button in modal
    Then I see the text "Notification: You have been Invited to Register in the Enterprise Grants Management System (EGMS)" in modal
    Then I see the text "Attachment.pdf" in modal
    Then I see the text "Hello {SavedValue:Automation Runtime Contact} Contact," in modal
    Then I see the text "Congratulations on being selected as a Subject Matter Expert (SME) Reviewer for EGMS applications. Please click the link below to register and create your login account." in modal
    Then I see the text "You will be required to provide your contact details and area(s) of expertise in order to create a profile in the system. You will also be prompted to sign a Non-Disclosure Agreement and Conflict of Interest Agreement." in modal
    Then I see the text "Click" in modal
    Then I see the text "Please do not reply to this system-generated email. You may contact the GovGrants Support Team at" in modal
    Then I see the text "Thank you," in modal
    Then I see the text "The EGMS Team" in modal

    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @398591 @398592 @398762 @398816 @398817 @398818
  Scenario Outline: LWC-SI-  Potential Reviewer Contact - Admin-To verify, user should be able to edit by default email body template which comes from send invitation email template on send invitation modal window.
  |LWC-SI-  Potential Reviewer Contact -PM-To verify, user should be able to edit by default email body template which comes from send invitation email template on send invitation modal window.|
  |LWC-SI- Potential Reviewer Contact - PM-To verify, user should be able to send the invitation on click of send button on send invitation modal window. |
  |LWC-SI- Potential Reviewer Contact - Admin -To verify, user should be able to send the invitation on click of send button on send invitation modal window. |
  |LWC-SI- Potential Reviewer Contact - Admin -To verify, user should be able to validation message as 'Email Sent Successfully' on click of send button on the send invitation modal.|
  |LWC-SI- Potential Reviewer Contact - PM -To verify, user should be able to validation message as 'Email Sent Successfully' on click of send button on the send invitation modal.|
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I do not see field lable contains "To" on modal is editable
    Then I see field lable contains "Cc" on modal is editable
    Then I see field lable contains "Subject" on modal is editable
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully" in modal
    Then I see the text "Notification: You have been Invited to Register in the Enterprise Grants Management System (EGMS)" in modal
    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @398958 @398965
  Scenario Outline: LWC-SI- Potential Reviewer Contact - PM -To verify, recipient should receive an email in their inbox after clicking on send button on send invitation modal.
  |LWC-SI- Potential Reviewer Contact -Admin -To verify, recipient should receive an email in their inbox after clicking on send button on send invitation modal.|
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I click "Send" button in modal
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "200" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)
      """
    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @399100 @399102 @399106 @399108 @399401 @399402 @399417 @399418 @399420 @399421
  Scenario Outline: LWC-UI -SI -Potential Reviewer Contact- Admin-To verify, user should be able to see input field for  'CC/Subject/Attachments' field below field title.
  |LWC-UI -SI -Potential Reviewer Contact- PM-To verify, user should be able to see input field for 'CC' field below field title.|
  |LWC-UI -SI -Potential Reviewer Contact- PM-To verify, user should be able to see input field title for attachment field as 'Attachment'.|
  |LWC-UI -SI -Potential Reviewer Contact- Admin-To verify, user should be able to see input field title for attachment field as 'Attachment'.|
  |LWC-UI -SI -Potential Reviewer Contact- Admin-To verify, user should be able to see input field title as 'Body' for email body at the top of the field.|
  |LWC-UI -SI -Potential Reviewer Contact- PM-To verify, user should be able to see input field title as 'Body' for email body at the top of the field.|
  |LWC-SI -Potential Reviewer Contact- PM -To verify, click 'here' link should get work from email body.|
  |LWC-SI -Potential Reviewer Contact- Admin -To verify, provided email link should get work from email body.|
  |LWC-SI -Potential Reviewer Contact- Admin -To verify, provided email link should get work from email body. |
  |LWC-SI -Potential Reviewer Contact- PM -To verify, provided email link should get work from email body. |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I pause execution for "10" seconds
   #399100 #399102
    Then I softly see field lable contains "Cc" on modal is editable
    #399106
    Then I softly see field lable contains "Subject" on modal is editable
   #399108
    Then I softly see field lable contains "Upload Files" on modal is editable
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    #399401
    Then I see the text "Email Sent Successfully." in modal
    Then I see the text "Attachment.pdf" in modal
    And I click on hyperlink containing value "here"
   #399417 #399418 #399420 #399421
    Then I softly see new tab is opened
    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @399421 @399463 @399466 @399470 @399479 @399480
  Scenario Outline: LWC-UI -SI -Potential Reviewer Contact - Admin -To verify, user is able to see  'Send' button at the right side bottom corner on send invitation modal.
  |LWC-UI -SI -Potential Reviewer Contact - PM -To verify, user is able to see  'Send' button at the right side bottom corner on send invitation modal. |
  |LWC-UI -SI -Potential Reviewer Contact - PM -To verify, user is able to see separate grey color scroll bar for email body input field on send invitation modal|
  |LWC-UI -SI -Potential Reviewer Contact - Admin -To verify, user is able to see separate grey color scroll bar for email body input field on send invitation modal|
  |LWC-UI -SI -Potential Reviewer Contact - Admin-To verify, user is able to see separate grey color scroll bar for email body input field on send invitation modal|
  |LWC-UI -SI -Potential Reviewer Contact -PM-To verify, user is able to see separate dark grey color scroll bar for email body input field on send invitation modal|
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I pause execution for "10" seconds
   #399421 #399463
    Then I see button "Send"
  #399466 #399470 #399479 #399480
    Then I softly see grey colored scroll bar on modal
    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @399780 @399781 @399841 @399842 @400134 @400136
  Scenario Outline: LWC-SI-UI- Potential Reviewer Contact - Admin -To verify, sent invitation email will display in view mode after send invitation.
  |LWC-SI-UI- Potential Reviewer Contact - PM -To verify, sent invitation email will display in view mode after send invitation.|
  |LWC-UI-SI- Potential Reviewer Contact - Admin -To verify, sent invitation email will display in view mode on modal after send invitation.|
  |LWC-UI-SI- Potential Reviewer Contact - PM -To verify, sent invitation email will display in view mode on modal after send invitation.|
  |LWC-UI-SI- Potential Reviewer Contacts -PM-To verify, Application should display title as 'Reviewers' for send invitation modal window.|
  |LWC-UI-SI- Potential Reviewer Contacts -Admin-To verify, Application should display title as 'Reviewers' for send invitation modal window.|
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Reviewers" opens in overLay window
    And I pause execution for "5" seconds
    Then I see field lable contains "Cc" on modal is editable
    And I click "Send" button in modal
    And I wait for "2" seconds
   #399780 #399781
    Then I softly see "Reviewers" opens in overLay window
    Then I see the text "Email Sent Successfully" in modal
    #399841 #399842 #400134 #400136
    Then I softly do not see field lable contains "Cc" on modal is editable
    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @401793 @401792
  Scenario Outline: LWC-SI-Potential Reviewer Contact -PM-To verify, user should be able to see error message for entered invalid email address.
  |LWC-SI-Potential Reviewer Contact -Admin-To verify, user should be able to see error message for entered invalid email address. |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I softly see "Reviewers" opens in overLay window
    And I pause execution for "5" seconds
    When I enter value "invalidemailaddress" into field "{testData:CcField}" on send email modal
    And I click "Send" button in modal
    Then I see the text "Invalid Email Address." in modal

    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @401780 @401782 @bug-502064
  Scenario Outline: LWC-SI- Potential Reviewer Contact - PM-To verify, user should be able to attach different type of files in attachment like pdf, xls, docx, png, jpg, txt etc.
  |LWC-SI- Potential Reviewer Contact -Admin-To verify, user should be able to attach different type of files in attachment like pdf, xls, docx, png, jpg, txt etc.|
  |LWC-SI- Potential Reviewer Contact - Admin-To verify, user should be able to add multiple email ids in CC field separated by semi colon |
  |LWC-SI- Potential Reviewer Contact - PM-To verify, user should be able to add multiple email ids in CC field separated by semi colon |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I pause execution for "3" seconds
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "Award_Field_Values.xlsx" in Send Email Modal
    When I upload attachment "blank.txt" in Send Email Modal
    When I upload attachment "TestFileSharing.docx" in Send Email Modal
    When I enter value "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" into field "{testData:CcField}" on send email modal
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    #401780 #401782
    Then I see the text "TestFileSharing.docx" in modal
    #401733 #401734
    Then I see the text "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" in modal

    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @401733 @401734
  Scenario Outline:   LWC-SI- Potential Reviewer Contact - Admin-To verify, user should be able to add multiple email ids in CC field separated by semi colon
  |LWC-SI- Potential Reviewer Contact - PM-To verify, user should be able to add multiple email ids in CC field separated by semi colon |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I pause execution for "3" seconds
    When I enter value "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" into field "{testData:CcField}" on send email modal
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    Then I see the text "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" in modal

    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @398826 @398828 @398843 @398844 @398845 @398847 @398850 @398882 @398888
  Scenario: LWC-SI -SPI -  To verify, user should be able to see  'send invitation' action on the contacts available under the contacts section of subrecipient  organization profile, if 'is active'  checkbox is checked in the config.
  |LWC-SI -SPI - To verify, user should be able to click on 'send invitation' icon for the contacts available under the contacts section of subrecipient  organization profile. |
  |LWC-SI -SPI -To verify, user should be able to see 'Send Invitation' modal window on click of send invitation icon. |
  |LWC-SI -SPI -To verify, user should be able to see send recipient email address (To) in read only on send invitation modal window.|
  |LWC-SI -SPI -To verify, user should be able to see 'CC' field is editable on send invitation modal window.|
  |LWC-SI -SPI -To verify, user should be able to see by default subject coming from send invitation email template on send invitation modal window |
  |LWC-SI -SPI -To verify, subject field should be editable which comes from send invitation email template on the send invitation modal window |
  |LWC-SI -SPI -To verify, user should be able to edit by default email body template which comes from send invitation email template on send invitation modal window.|
  |LWC-SI -SPI -To verify, user should be able to see by default email body template which comes from send invitation email template on send invitation modal window.|
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Send Invitation" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly see "Send Invitation" opens in overLay window
    Then I do not see field lable contains "To" on modal is editable
    Then I see field lable contains "Cc" on modal is editable
    Then I see field lable contains "Subject" on modal is editable
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    Then I see the text "Email Sent Successfully" in modal
    Then I see the text "Notification: Invitation to be a user of EGMS" in modal
    Then I see the text "You are invited to become an Enterprise Grants Management System (EGMS) user." in modal
    Then I see the text "Please click" in modal
    Then I see the text "You will be prompted to sign a Legal Disclaimer upon registration." in modal
    Then I see the text "Please do not reply to this system-generated email. You may contact the GovGrants Support Team at" in modal
    Then I see the text "Thank you." in modal
    Then I see the text "The EGMS Team" in modal

  @sprint4 @US-392989 @398901 @398914 @398933 @398948 @399447 @399449 @399451 @399454
  Scenario:LWC-SI -SPI -To verify, user should be able to add file by clicking on 'Choose File' option on send invitation modal.
  |LWC-SI -SPI - To verify, user should be able to see added file on send invitation modal.|
  |LWC-SI -SPI -To verify, user should be able to send the invitation on click of send button on send invitation modal window. |
  |LWC-SI -SPI- To verify, user should be able to validation message as 'Email Sent Successfully' on click of send button on the send invitation modal.|
  |LWC-UI -SI - SPI-To verify, user should be able to see input field for  'CC/Subject/Attachments' field below field title.|
  |LWC-UI -SI -SPI -To verify, user should be able to see input field for 'CC' field below field title.|
  |LWC-UI -SI -SPI -To verify, user should be able to see input field title for attachment field as 'Attachment'.|
  |LWC-UI -SI -SPI -To verify, user should be able to see 'Send' button at the right side bottom corner on send invitation modal. |
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Send Invitation" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "10" seconds
   #399447 #  399449
    Then I softly see field lable contains "Cc" on modal is editable
    Then I softly see field lable contains "Subject" on modal is editable
    Then I softly see field lable contains "Upload Files" on modal is editable
    #399451
    Then I see field "Attachment" inside page block
    When I enter value "body content is edited" into field "Body Content" on send email modal
    When I upload attachment "Attachment.pdf" in Send Email Modal
    And I pause execution for "4" seconds
    #399454
    Then I see button "Send"
    And I click "Send" button in modal
    And I wait for "2" seconds
  #398933 #398948
    Then I see the text "Email Sent Successfully." in modal
   #398901 #398914
    Then I see the text "Attachment.pdf" in modal
   #399449
    Then I see the text "body content is edited" in modal
    And I click on hyperlink containing value "here"
    Then I softly see new tab is opened

  @sprint4 @US-392989 @399483 @399485 @399787 @401735 @400129
  Scenario: LWC-UI -SI -SPI-To verify, user is able to see separate grey color scroll bar for email body input field on send invitation modal
  |LWC-UI -SI -SPI-To verify, user is able to see dark grey color scroll bar for on send invitation modal|
  |LWC-UI-SI- SPI-To verify, sent invitation email will display in view mode on modal after send invitation.|
  |LWC-SI-SPI-To verify, user should be able to add multiple email ids in CC field separated by semi colon |
  |LWC-UI-SI- SPI-To verify, Application should display title as 'Send invitation' for send invitation modal window. |
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Send Invitation" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    #399483 #399485
    Then I softly see grey colored scroll bar on modal
    When I enter value "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" into field "{testData:CcField}" on send email modal
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
   #399787
    Then I see the text "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" in modal
    #399787 #400129
    Then I softly see "Send Invitation" opens in overLay window

  @sprint4 @US-392989 @401799 @401800
  Scenario Outline: LWC-UI -SI -Potential Reviewer Contact-Admin-To verify, user should be able to see send invitation icon
  |LWC-UI -SI -Potential Reviewer Contact-PM-To verify, user should be able to see send invitation icon |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    And I enter in modal "smeReviewerRegistration" values from "Registration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    And I click modal button "Save"
    And I wait for "4" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Contact} Contact" in "---grantor_tableId:-:PotentialReviewerContactTableId---" panel
    When I click on Chevron Button for "{SavedValue:Automation Runtime Contact} Contact" inside flex table with id "---grantor_tableId:-:PotentialReviewerContactTableId---"
    Then I see option "Send Invitation" with icon
    Examples:
      | User |
     # | Admin |
      | PM   |

  @sprint4 @US-392989 @399448
  Scenario: LWC-UI -SI-SPI -To verify, user is able to see email body template should get display properly on UI.(No extra spaces, commas, same formats, alignment etc.)
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Send Invitation" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    When I enter value "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" into field "{testData:CcField}" on send email modal
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    Then I see the text "Notification: Invitation to be a user of EGMS" in modal
    Then I see the text "You are invited to become an Enterprise Grants Management System (EGMS) user." in modal
    Then I see the text "Please click" in modal
    Then I see the text "You will be prompted to sign a Legal Disclaimer upon registration." in modal
    Then I see the text "Please do not reply to this system-generated email. You may contact the GovGrants Support Team" in modal
    Then I see the text "if you have any questions or need assistance with this task." in modal
    Then I see the text "Thank you." in modal
    Then I see the text "The EGMS Team" in modal

  @sprint4 @US-392989 @401794
  Scenario: LWC-UI -SI -SPI -To verify, user should be able to see send invitation icon on contact section.
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on Chevron Button for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I see option "Send Invitation" with icon

  @sprint4 @US-392989 @401784
  Scenario:LWC-SI-SPI-To verify, user should be able to see error message for entered invalid email address.
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Send Invitation" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly see grey colored scroll bar on modal
    When I enter value "test.user" into field "{testData:CcField}" on send email modal
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    Then I see the text "Invalid Email Address." in modal

  @sprint4 @US-392989 @401783 @bug-502064
  Scenario: LWC-SI-SPI-To verify, user should be able to attach different type of files in attachment like pdf, xls, docx, png, jpg, txt etc.
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Send Invitation" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "3" seconds
    When I upload attachment "Attachment.pdf" in Send Email Modal
    When I upload attachment "actionsAtEgrid.png" in Send Email Modal
    When I upload attachment "Award_Field_Values.xlsx" in Send Email Modal
    When I upload attachment "blank.txt" in Send Email Modal
    When I enter value "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" into field "{testData:CcField}" on send email modal
    And I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    Then I see the text "blank.txt" in modal
    Then I see the text "test.user1@example.com;test.user2@example.com;sample.email3@example.org;dummy.account4@example.net;fake.mail5@example.com" in modal

  @sprint4 @US-392989 @399018
  Scenario: LWC-SI -SPI - To verify, recipient should receive an email in their inbox after clicking on send button on send invitation modal.
    Given I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Send Invitation" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    And I pause execution for "3" seconds
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value "{SavedValue:uniqueEmailID}" into field "{testData:CcField}" on send email modal
    When I pause execution for "4" seconds
    And I click "Send" button in modal
    And I wait for "2" seconds
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "200" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Invitation to be a user of EGMS
      """

  @520320 @sprint10_2025 @BrowserBackRedirection @US-514198
  Scenario: LWC : Browser Back Redirection - Admin/PM - Competitive Announcement - To verify when user click on browser back button then should be redirected to the correctly previous page
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    Then I see "---announcement:-:competitiveAnnouncementTableId---" flex table is displayed
    And I click on "View" action for first record of table
    And I click on back arrow
    And I pause execution for "3" seconds
    Then I see "---announcement:-:competitiveAnnouncementTableId---" flex table is displayed

  @520640 @sprint10_2025 @BrowserBackRedirection @US-514198
  Scenario: LWC : Browser Back Redirection - Admin/PM - Directed Announcement - To verify when user click on browser back button then should be redirected to the correctly previous page
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    Then I see "---announcement:-:annoucementTableId---" flex table is displayed
    And I click on "View" action for first record of table
    And I click on back arrow
    And I pause execution for "3" seconds
    Then I see "---announcement:-:annoucementTableId---" flex table is displayed

  @520748 @sprint10_2025 @BrowserBackRedirection @US-514198
  Scenario: LWC : Browser Back Redirection - Admin/PM - Formula Announcement - To verify when user click on browser back button then should be redirected to the correctly previous page
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    Then I see "---announcement:-:formulaAnnouncementTableId---" flex table is displayed
    And I click on "View" action for first record of table
    And I click on back arrow
    And I pause execution for "3" seconds
    Then I see "---announcement:-:formulaAnnouncementTableId---" flex table is displayed

  @520857 @sprint10_2025 @BrowserBackRedirection @US-514198
  Scenario: LWC : Browser Back Redirection - SPI - Converted to Application - To verify when user click on browser back button then should be redirected to the correctly previous page
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "8" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "annEgmsId"
    And I pause execution for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "appEgmsId"
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    Then I see "---applicationIntake:-:convertedToApplicationTableID---" flex table is displayed
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:annEgmsId}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:annEgmsId}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---" without waiting for record
    And I pause execution for "7" seconds
    #Then I see page title "Qualified Announcement View"
    And I click on back arrow
    Then I see "---applicationIntake:-:convertedToApplicationTableID---" flex table is displayed

  @520840 @sprint10_2025 @BrowserBackRedirection @US-514198
  Scenario: LWC : Browser Back Redirection - SPI - Not Yet Qualified Opportunity - To verify when user click on browser back button then should be redirected to the correctly previous page
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    Then I see "---applicationIntake:-:activeOpportunitiesTableId---" flex table is displayed
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    Then I can see top right button "Qualify" in page detail
    And I click on back arrow
    Then I see "---applicationIntake:-:activeOpportunitiesTableId---" flex table is displayed

  @520854 @sprint10_2025 @BrowserBackRedirection @US-514198
  Scenario: LWC : Browser Back Redirection - SPI - Qualified Opportunity - To verify when user click on browser back button then should be redirected to the correctly previous page
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    And I wait for "1" seconds
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Pre-Application}" for title "Announcement Name" inside table "---applicationIntake:-:activeOpportunitiesTableId---"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    And I wait for "5" seconds
    Then I softly see field "Pre-Application Required?" as "Yes"
    Then I softly can see top right button "Qualify" in page detail
    When I click on "Qualify" in the page details
#    Then I softly see that "{SavedValue:Automation Runtime Announcement for Pre-Application}" is in "Qualified" status
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Opportunities" tab
    And I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    Then I see "---applicationIntake:-:qualifiedTableId---" flex table is displayed
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---applicationIntake:-:qualifiedTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement for Pre-Application}" for title "Opportunity Name" inside table "---applicationIntake:-:qualifiedTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    And I pause execution for "10" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I see "---applicationIntake:-:qualifiedTableId---" flex table is displayed

  @522040 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Page Layout - Error Message Scroll - Admin/PM - To verify when user click on Save action then page scroll to the top when showing error messages
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:DateField_StartDate} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see after click on error message "Project Period Start Date" page is scrolled

  @522153 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Page Layout - Error Message Scroll - Admin/PM - To verify when user click on Submit For Approval action then page scroll to the top when showing error messages
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I perform scrolldown page
    And I pause execution for "5" seconds
    Then I softly see after click on error message "Submit For Approval" page is scrolled

  @522194 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Page Layout - Error Message Scroll - Admin/PM - To verify when user click on field name in error message then page scroll to field input box
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:DateField_StartDate} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see after click on error message "Project Period Start Date" page is scrolled

  @522887 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Form Layout - Error Message Scroll - Admin/PM - To verify when user click on field name in error message then page scroll to field input box
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:DateField_StartDate} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see after click on error message "Project Period Start Date" page is scrolled

  @522896 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Form Layout - Error Message Scroll - Admin/PM - To verify when user click on Save action then page scroll to the top when showing error messages
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | coreComponentField    | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | false             | Grantor State Program | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {pagelayout:DateField_StartDate} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I perform scrolldown page
    Then I softly see after click on error message "Save" page is scrolled

  @522800 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Page Layout - Error Message Scroll - SPI - To verify when user click on field name in error message then page scroll to field input box
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "15" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I enter value "" into field "Addressline1__c"
    When I click on "Save" in the page details
    Then I softly see after click on error message "Address line 1" page is scrolled

  @522907 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Form Layout - Error Message Scroll - SPI - To verify when user click on field name in error message then page scroll to field input box
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue   | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | PBD-37625                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "7" seconds
    When I click on "Create Application" in the page details
    And I wait for "8" seconds
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    When I navigate to "Overview" sub tab
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    Then I softly see after click on error message "Name" page is scrolled

  @522908 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario: LWC : Form Layout - Error Message Scroll - SPI - To verify when user click on Save action then page scroll to the top when showing error messages
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue   | coreComponentField       | filterId         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Submit | Standard Assurances Form | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | PBD-37625                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I wait for "3" seconds
    When I click on "Qualify" in the page details
    And I wait for "8" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    When I navigate to "Overview" sub tab
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "7" seconds
    And I perform scrolldown page
    Then I softly see after click on error message "Save" page is scrolled

  @522808 @sprint10_2025 @ErrorMessageScroll @US-521687
  Scenario:LWC : Page Layout - Error Message Scroll - SPI - To verify when user click on Save action then page scroll to the top when showing error messages
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I wait for "3" seconds
    When I click on "Qualify" in the page details
    And I wait for "7" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    When I navigate to "Overview" sub tab
    And I enter value "" into field "Addressline1__c"
    And I perform scrolldown page
    And I pause execution for "5" seconds
    Then I softly see after click on error message "Save" page is scrolled

  @520102 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - PM - Form Preview - To verify that, Table actions should be hidden in preview mode.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    Then I can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    And I click on "Preview" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    Then I softly do not see "New" button in flex table with id "Files"
    Then I softly do not see "Associate" button in flex table with id "Files"
    Then I softly do not see "Add" button in flex table with id "Files"

  @520104 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - PM - Form Preview - To verify that, Layout actions should be hidden in preview mode
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    Then I can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    And I click on "Preview" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---program:-:previewPackageTableId---" without waiting for record
    And I switch to tab number "1"
    Then I see "Validate" button is not displayed
    Then I see "Edit" button is not displayed
    Then I see "Submit For Approval" button is not displayed

  @520105 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - PM - Form Preview - To verify that, Preview actions should be available under Business Forms and on click of that form preview should get display
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    Then I can see row level action button "Preview" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    Then I can see row level action button "Edit" against "Grantor Progress Report Forms" in flex table with id "---program:-:businessFormTableId---"
    When I click on "Preview" icon for "Grantor Progress Report Forms" inside table
    And I select value inside table "---program:-:previewPackageTableId---" is "All"
    Then I softly see total records count "Total Records: 13" in flex table "---program:-:previewPackageTableId---"
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:previewPackageTableId---" panel
    Then I softly see value "Tangible Personal Property Report - SF-428" for title "Form Name" inside table "---program:-:previewPackageTableId---"
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---program:-:previewPackageTableId---"

  @520107 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - PM - Form Preview - To verify that, Preview actions should be available under forms section of Forms and Packages
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:formsPackagesFormsTableId---" panel
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---program:-:formsPackagesFormsTableId---"

  @520108 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - PM - Form Preview - To verify that, Preview actions for forms should be available under packages section of Forms and Packages
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    And I perform quick search for "Grantee Progress Reports" in "---program:-:packagesTableId---" panel
    And I expand nested table containing column value "Grantee Progress Reports"
    Then I can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "PackageFormsPlanning"

  @520110 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - PM - Form Preview - To verify that, user should see download as a PDF action under preview layout menu.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    And I perform quick search for "Tangible Personal Property Report - SF-428" in "---program:-:formsPackagesFormsTableId---" panel
    Then I can see row level action button "Preview" against "Tangible Personal Property Report - SF-428" in flex table with id "---program:-:formsPackagesFormsTableId---"
    And I click on "Preview" icon for "Tangible Personal Property Report - SF-428" inside flex table with id "---program:-:formsPackagesFormsTableId---" without waiting for record
    When I click on "Download as PDF" in the page details
    Then I softly see "Download as PDF" button is displayed

  @520112 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - PM - Form Preview - To verify that, the PDF of the form preview should download when the user selects Download as PDF from the preview layout menu.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Forms and Packages" content inside "Setup" subheader on left panel
    And I perform quick search for "Grantee Progress Reports" in "---program:-:packagesTableId---" panel
    And I expand nested table containing column value "Grantee Progress Reports"
    Then I can see row level action button "Preview" against "Federal Financial Report (SF-425)" in flex table with id "PackageFormsPlanning"
    When I click on "Preview" icon for "Federal Financial Report (SF-425)" inside table
    When I click on "Download as PDF" in the page details
    Then I softly see "Download as PDF" button is displayed

  @520115 @sprint10_2025 @FormPreview @US-514059
  Scenario: LWC - SPI - Form Preview - To verify that, Table actions should be hidden in preview mode.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I wait for "3" seconds
    When I click on "Qualify" in the page details
    And I wait for "8" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "8" seconds
    When I navigate to "Overview" sub tab
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    And I pause execution for "7" seconds
    Then I softly do not see "New" button in flex table with id "Files"
    Then I softly do not see "Associate" button in flex table with id "Files"
    Then I softly do not see "Add" button in flex table with id "Files"

  @509953 @520622 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, when user clicks on View or Preview row level action of file, then that file should open in standard salesforce format
  |LWC - Admin/PM - Files - To verify that, on salesforce standard preview document, should renders full document in scrollable view |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "ScrollableTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View" icon for "ScrollableTesting.pdf" inside table
    And I pause execution for "10" seconds
    Then I see field "Page" inside page block
    Then I see below buttons on standard salesforce format
      | Download           |
      | Share              |
      | Public Link        |
      | Upload New Version |
      | View File Details  |
      | Edit File Details  |
      | Delete             |

  @511182 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario:LWC - Admin/PM - Files - To verify that, if file is uploaded by Internal User then on File Preview page another Internal Users should not be able to Delete document
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    And I click on "View" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    Then I do not see below buttons on standard salesforce format
      | Delete |

  @511185 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, if file is uploaded by Internal User then on File Preview page another Internal Users should not be able to Upload New Version of document.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    And I click on "View" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    Then I do not see below buttons on standard salesforce format
      | Upload New Version |

  @511186 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, if file is uploaded by Internal User then on File Preview page another Internal Users should not be able to Edit File Details. |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    And I click on "View" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    Then I do not see below buttons on standard salesforce format
      | Upload New Version |

  @511188 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, when user clicks on hyperlink under Snapshot History table, then it should open in salesforce standard preview format
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on Menu icon present on top right corner of the page
    And I click on "Take Snapshot" in the page details without processing
    And I refresh the page
    When I navigate to "History" sub tab
    Then I see take snap shot getting saved with "Todays Date"

  @511189 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, salesforce standard preview document opens in same window with standard features View File Details, Delete, Upload New Version, Edit File Details etc.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View" icon for "AttachmentTesting.pdf" inside table
    Then I softly see "Download" button is displayed on standard salesforce format
    Then I softly see "Share" button is displayed on standard salesforce format
    Then I softly see "Public Link" button is displayed on standard salesforce format
    Then I see below buttons on standard salesforce format
      | Download           |
      | Share              |
      | Public Link        |
      | Upload New Version |
      | View File Details  |
      | Edit File Details  |
      | Delete             |

  @511191 @511197 @511199 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario:LWC - Admin/PM - Files - To verify that, the Snapshot should contain all the forms as well i.e. generate full snapshot whenever there are form specific pdfs present.
  |LWC - Admin/PM - Files - To verify that, on Form Validation, snapshot should be generated with the forms|
  |LWC - Admin/PM - Files - To verify that, on click of Take Snapshot, snapshot should be generated with the forms|
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
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I get current URL
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I click on "Collapse" in page detail
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I switch to tab number "1"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "Program Application Form" on page "6" of "govgrants" pdf file
    Then I softly see "Standard Assurances Form" on page "8" of "govgrants" pdf file
    And I close the tab
    And I switch to tab number "1"
    And I close the tab
    And I switch to parent tab
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Draft"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I get current URL
    And I wait for "3" seconds
    And I click on "Download" button for snapshot view
    And I wait for "2" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "Program Application Form" on page "6" of "govgrants" pdf file
    Then I softly see "Standard Assurances Form" on page "8" of "govgrants" pdf file

  @511683 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, if file is uploaded by Admin User then on File Preview page Internal Users should not be able to Delete document
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I click on "Preview" icon for "AttachmentTesting.pdf" inside table
    Then I do not see below buttons on standard salesforce format
      | Delete |

  @511684 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, if file is uploaded by Admin User then on File Preview page Internal Users should not be able to Edit File Details.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I click on "Preview" icon for "AttachmentTesting.pdf" inside table
    Then I do not see below buttons on standard salesforce format
      | Edit File Details |

  @511685 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, if file is uploaded by Admin User then on File Preview page Internal Users should not be able to Upload New Version of document.
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    When I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I navigate to "Files" sub tab
    When I click on "Preview" icon for "AttachmentTesting.pdf" inside table
    Then I do not see below buttons on standard salesforce format
      | View File Details |

  @520619 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, on salesforce standard preview document, image should load with no distortion
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Edit" in page detail
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Preview" icon for "AttachmentTesting.pdf" inside table
    Then I see below buttons on standard salesforce format
      | Download           |
      | Share              |
      | Public Link        |
      | Upload New Version |
      | View File Details  |
      | Edit File Details  |
      | Delete             |

  @511660 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - SPI - Files - To verify that, when user clicks on hyperlink of Snapshot History table, then it should open in salesforce standard preview format
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I close the tab
    And I refresh the page
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I close the tab
    And I refresh the page
    And I get the "EGMS ID"
    And I get current URL
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I switch to tab number "1"
    And I pause execution for "2" seconds
    And I click on "View File Details" button for snapshot view
    And I pause execution for "4" seconds
    Then I see below buttons on standard salesforce format
      | Download           |
      | Upload New Version |
      | Edit File Details  |
      | Delete             |

  @511200 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - Admin/PM - Files - To verify that, on click of Layout action, snapshot should be generated with the forms
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Home" tab
    When I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "SAN DIEGO ELECTRICAL TRAINING TRUST" in "ActiveAccount" panel
    When I click on "Approved Date" column header inside table with id "ActiveAccount"
    And I click on "View" icon for "SAN DIEGO ELECTRICAL TRAINING TRUST" inside table
    Given I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---orgLevelDeskReview:-:deskreviewPanelId---"
    And I enter "Creation" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelDeskReview:-:deskReviewContactsTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI3 Username}" in the table "---orgLevelDeskReview:-:associateContactsId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReviewID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | NA          |
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                     | Desk Review |
      | {SavedValue:PM Username} | Step 1      |
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---orgLevelDeskReview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I wait for "2" seconds
    When I click on "Submit for Approval" in the page details
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Desk Review -In-Progress.pdf" as name
    And I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Desk Review - Notify.pdf" as name
    And I click on "Send to Subrecipient" in the page details
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Desk Review - Send to Subrecipient.pdf" as name

  @511661 @511662 @511666 @511669 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario Outline: LWC - SPI - Files - To verify that, The Snapshot should contain all the forms as well i.e. generate full snapshot whenever there are form specific pdfs present.
  |LWC - SPI - Files - To verify that, snapshot should be generated with the forms, on status value update|
  |LWC - SPI - Files - To verify that, on Form Validation, snapshot should be generated with the forms|
  |LWC - SPI - Files - To verify that, on click of Layout action, snapshot should be generated with the forms|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Application Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
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
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I close the tab
    And I refresh the page
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I close the tab
    And I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "AppContactFlexGrid" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I click on "Take Snapshot" in the page details
    When I click on "Submit Application" in the page details
    And I refresh the page
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I get current URL
    And I click on hyperlink containing value "Snapshot_Application_Submission.pdf"
    And I wait for "3" seconds
    And I switch to tab number "1"
    And I click on "View File Details" button for snapshot view
    And I wait for "2" seconds
    And I click on "Download" button for snapshot view
    And I download the file
    And I wait for "3" seconds
    Then I softly see "Submitted to Grantor" on page "1" of "govgrants" pdf file
    Then I softly see "Program Application Form" on page "6" of "govgrants" pdf file
    Then I softly see "Standard Assurances Form" on page "8" of "govgrants" pdf file

    Examples:
      | Application Name                                         |
      | {SavedValue:Automation Runtime Announcement Application} |

  @511667 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - SPI - Files - To verify that, on click of Take Snapshot, snapshot should be generated with the forms
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I close the tab
    And I refresh the page
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationIntake:-:allFormsTableId---"
    And I switch to tab number "1"
    Given I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Validate" in the page details
    And I close the tab
    And I refresh the page
    And I get the "EGMS ID"
    And I get current URL
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I switch to tab number "1"
    And I pause execution for "2" seconds
    And I click on "View File Details" button for snapshot view
    And I wait for "2" seconds
    And I click on "Download" button for snapshot view
    And I download the file
    And I wait for "3" seconds
    Then I softly see "Program Application Form" on page "6" of "govgrants" pdf file
    Then I softly see "Standard Assurances Form" on page "8" of "govgrants" pdf file

  @511673 @511674 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - SPI - Files - To verify that, if file is uploaded by SPI User then on File Preview page Internal Users should not be able to edit document details
  |LWC - SPI - Files - To verify that, if file is uploaded by SPI User then on File Preview page Internal Users should not be able to Delete document|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I get the "EGMS ID"
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "AttachmentTesting.pdf" of type "General Assurances" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Draft"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I pause execution for "5" seconds
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---applicationReview:-:grantorApplicationFilesTableId---"
    Then I softly cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---applicationReview:-:grantorApplicationFilesTableId---"

  @511675 @520621 @520624 @520629 @sprint8_2025 @FilesViewPreview @US-502146
  Scenario: LWC - SPI - Files - To verify that, when user clicks on View or Preview row level action of file, then that file should open in standard salesforce format
  |LWC - SPI - Files - To verify that, on salesforce standard preview document, image should load with no distortion|
  |LWC - SPI - Files - To verify that, on salesforce standard preview document, should renders full document in scrollable view |
  |LWC - SPI - Files - To verify that, on salesforce standard preview document, file expands to fullscreen without layout issues|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I get the "EGMS ID"
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I pause execution for "5" seconds
    Then I see "Upload" button is disabled at modal under library
    And I upload attachment without random number "ScrollableTesting.pdf" of type "General Assurances" from computer
    And I wait for "5" seconds
    And I click modal button "Close"
    And I refresh the page
    When I navigate to "Forms and Files" sub tab
    When I click on "View" icon for "ScrollableTesting.pdf" inside table
    And I switch to tab number "1"
    And I pause execution for "2" seconds
    And I click on "View File Details" button for snapshot view
    Then I see field "Page" inside page block
    Then I see below buttons on standard salesforce format
      | Upload New Version |
      | Edit File Details  |
      | Delete             |
