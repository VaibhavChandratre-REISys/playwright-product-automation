@AprilReleaseUserStory1 @RecentUS @Sprint-2026 @TestUserStories @SprintWise2026_1

Feature: Layout - Support to hide layout page blocks and fields on basis of child record value (Table records).
Business Need: In this user story framework will provide support to hide page blocks and fields on layout based on child record value.
1.@US-526909
2.@US-FW-602
3.@US-FW-893
4.@US-FW-897
5.@US-FW-24086
6.@US-FW-24466
7.@US-FW-29966

  @534887 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    Then I softly see lookup table header displayed as below
      | Organization Name |
      | EIN               |
      | Organization Type |
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
      | SYSTEM                       |
      | Department of Product        |
    Then I softly see link "View All" inside Page block
    Then I see "lookup-dropdown" table contains "Results"

  @534888 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Department of Health" in field "PrimaryFundingOrganization__c"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "Primary Funding Organization" as "Department of Health"

  @534886 @534884 @534883 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field.
  |LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Department of Health" in field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    Then I softly see the lookup field "PrimaryFundingOrganization__c" shows the last selected result "Test Automation Organization"
    Then I softly do not see remove x icon for lookup field "PrimaryFundingOrganization__c"
    Then I softly see Undo icon for lookup field "PrimaryFundingOrganization__c"
    And I click on undo for lookup from field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"

  @534885 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Test Automation Organization" in field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    Then I softly see the lookup field "PrimaryFundingOrganization__c" shows the last selected result "Test Automation Organization"
    Then I softly do not see remove x icon for lookup field "PrimaryFundingOrganization__c"
    Then I softly see Undo icon for lookup field "PrimaryFundingOrganization__c"
    And I click on undo for lookup from field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on "Save" in the page details
    Then I softly see field "Primary Funding Organization" as "Test Automation Organization"
    And I click on "Edit" in the page details
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Department of Product" in field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    And I click on "Save" in the page details
    Then I softly see field "Primary Funding Organization" as "Department of Product"

  @534902 @US-526909 @534925
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Test Automation Organization" in field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
      | SYSTEM                       |
      | Department of Product        |

  @534903 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression Fields           |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression Fields           |               | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get current URL
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I select dropdown value "Automation PM" in field "ProgramApprover__c"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "X_Program Approver" as "Automation PM"

  @534904 @534905 @534906 @534907 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field.
  |LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Page Layout - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |               | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I select dropdown value "Automation PM" in field "ProgramApprover__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "ProgramApprover__c"
    And I click on remove for lookup from field "ProgramApprover__c"
    #534906
    Then I softly see Undo icon for lookup field "ProgramApprover__c"
    And I click on undo for lookup from field "ProgramApprover__c"
    #534905
    Then I softly see the lookup field "ProgramApprover__c" shows the last selected result "Automation PM"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    #534904 #534907
    Then I softly see field "X_Program Approver" as "Automation PM"

  @534889 @US-526909
  Scenario:LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | emailLookup   | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |               | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |               | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I click on lookup field "Authorization__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | AdditionalUserDeclinedInvitation |
      | AdditionalUserEmail              |
      | AdditionalUserRegistered         |
      | Amendment Request Approval       |
      | Amendment Request Approved       |
      | Amendment Request Approved by PO |
      | Amendment Request Assignment     |

  @534890 @534891 @534892 @534894 @534895 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | emailLookup   | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |               | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |               | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I select dropdown value "AdditionalUserEmail" in field "Authorization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "Authorization__c"
    And I click on remove for lookup from field "Authorization__c"
    Then I softly see Undo icon for lookup field "Authorization__c"
    #534891 #534892
    Then I softly see the lookup field "Authorization__c" shows the last selected result "AdditionalUserEmail"
    #534894
    Then I softly see Undo icon for lookup field "Authorization__c"
    And I click on undo for lookup from field "Authorization__c"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    #534895
    Then I softly see field "Authorization" as "AdditionalUserEmail"

  @534908 @534909 @534910 @534911 @534912 @534913 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list|
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search email template lookup field - Page Layout - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | emailLookup   | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |               | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |               | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I select dropdown value "AdditionalUserEmail" in field "HistoryReason__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "HistoryReason__c"
    And I click on remove for lookup from field "HistoryReason__c"
    Then I softly see Undo icon for lookup field "HistoryReason__c"
    #534910 #534911
    Then I softly see the lookup field "HistoryReason__c" shows the last selected result "AdditionalUserEmail"
    #534912
    Then I softly see Undo icon for lookup field "HistoryReason__c"
    And I click on undo for lookup from field "HistoryReason__c"
    When I click on "Save" in the page details
    #534909 #534913
    Then I softly see field "X_History Reason" as "AdditionalUserEmail"

  @534896 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | ReportLookup  | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |               | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |               | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I click on lookup field "Authorization__c" search icon
    #534896
    Then I softly see lookup or picklist records displayed as below
      | Active Announcements Report        |
      | Active Focus Areas of Organization |
      | Active Grant Summary by Agency     |
      | Active Programs of Organization    |
      | Active Programs Report             |
      | Amendment In Progress Report       |
      | Amendment Request In Progress      |
      | Amendment Tracking                 |
      | Announcement by Program            |
      | Announcement with KPI              |

  @534897 @534898 @534899 @534900 @534901 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I select dropdown value "Active Programs of Organization" in field "Authorization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "Authorization__c"
    And I click on remove for lookup from field "Authorization__c"
    #534900
    Then I softly see Undo icon for lookup field "Authorization__c"
    #534898 #534899
    Then I softly see the lookup field "Authorization__c" shows the last selected result "Active Programs of Organization"
    Then I softly see Undo icon for lookup field "Authorization__c"
    And I click on undo for lookup from field "Authorization__c"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    #534901
    Then I softly see field "Authorization" as "Active Programs of Organization"

  @534914 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | ReportLookup  | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |               | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |               | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I click on lookup field "HistoryReason__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Active Funding accounts   |
      | Application Status        |
      | Closeout by subtype       |
      | Closeouts by Status       |
      | Current FY Grant Spending |
      | Grants by Status          |
      | My Applications           |
      | My Open Applications      |
      | Not yet Qualified leads   |

  @534915 @534916 @534917 @534918 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                    | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                    | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active                    | true          | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config | ReportLookup  | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON         |               | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON    |               | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c} |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    And I select dropdown value "Application Status" in field "HistoryReason__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "HistoryReason__c"
    And I click on remove for lookup from field "HistoryReason__c"
    Then I softly see Undo icon for lookup field "HistoryReason__c"
    #534917 #534916
    Then I softly see the lookup field "HistoryReason__c" shows the last selected result "Application Status"
    #534918
    Then I softly see Undo icon for lookup field "HistoryReason__c"
    And I click on undo for lookup from field "HistoryReason__c"
    When I click on "Save" in the page details
    #534915 #
    Then I softly see field "X_History Reason" as "Application Status"


  @534964 @US-526909
  Scenario:LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "{SavedValue:PermanentGeneralReviewFormForEXE}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:PermanentGeneralReviewFormForEXE}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I click on lookup field "ConfigForm__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | PSR: Program Progress Reports Grantee    |
      | PSR: Program Progress Reports Form       |
      | Program Specific Application form        |
      | NGOGrantorProgram                        |
      | AmendmentBudgetCategoryTemplateGrantee   |
      | GranteeAwardBudgetCategoryTemplate       |
      | Bulk Email Record                        |
      | Bulk Email Modal                         |
      | ApplicationBudgetCategoryTemplateGrantee |

  @534965 @534963 @534961 @534960 @534962 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
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
    And I pause execution for "3" seconds
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I select dropdown value "Program Specific Application form" in field "ConfigForm__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "ConfigForm__c"
    And I click on remove for lookup from field "ConfigForm__c"
    #534960
    Then I softly see Undo icon for lookup field "ConfigForm__c"
    #534963 #534961
    Then I softly see the lookup field "ConfigForm__c" shows the last selected result "Program Specific Application form"
    And I click on undo for lookup from field "ConfigForm__c"
    And I enter "Form Fields" values from "DetskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    #534965 #534962
    Then I softly see field "Config: Form" as "Program Specific Application form"

  @534988 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | General Review Form       | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | General Review Form       | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | General Review Form       | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | General Review Form       | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | General Review Form       | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Recipient Pre-Application | Name                      | {SavedValue:SvFinancialFormQ25__c} |
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
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I click on lookup field "SvFinancialFormQ25__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Active Announcements Report        |
      | Active Focus Areas of Organization |
      | Active Grant Summary by Agency     |
      | Active Programs of Organization    |
      | Active Programs Report             |
      | Amendment In Progress Report       |
      | Amendment Request In Progress      |
      | Amendment Tracking                 |
      | Announcement by Program            |
      | Announcement with KPI              |
      | Announcements by Funding Account   |

  @534989 @534987 @534985 @534984 @534986 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
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
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I select dropdown value "Active Announcements Report" in field "SvFinancialFormQ25__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "SvFinancialFormQ25__c"
    And I click on remove for lookup from field "SvFinancialFormQ25__c"
    #534984
    Then I softly see Undo icon for lookup field "SvFinancialFormQ25__c"
    # #534987
    Then I softly see the lookup field "SvFinancialFormQ25__c" shows the last selected result "Active Announcements Report"
    And I click on undo for lookup from field "SvFinancialFormQ25__c"
    And I enter "Form Fields" values from "DetskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    #534985 #534986
    Then I softly see field "SvFinancialFormQ25" as "Active Announcements Report"

  @534976 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
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
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I click on lookup field "SvFinancialFormQ25__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | AdditionalUserDeclinedInvitation |
      | AdditionalUserEmail              |
      | AdditionalUserRegistered         |
      | Amendment Request Approval       |
      | Amendment Request Approved       |
      | Amendment Request Approved by PO |
      | Amendment Request Assignment     |

  @534977 @534975 @534973 @534972 @534974 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | General Review Form | Name                      | {SavedValue:SvFinancialFormQ25__c} |
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
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I select dropdown value "AdditionalUserEmail" in field "SvFinancialFormQ25__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "SvFinancialFormQ25__c"
    And I click on remove for lookup from field "SvFinancialFormQ25__c"
    #534972
    Then I softly see Undo icon for lookup field "SvFinancialFormQ25__c"
    #534975 #534974
    Then I softly see the lookup field "SvFinancialFormQ25__c" shows the last selected result "AdditionalUserEmail"
    And I click on undo for lookup from field "SvFinancialFormQ25__c"
    And I enter "Form Fields" values from "DetskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    #534977 #534973
    Then I softly see field "SvFinancialFormQ25" as "AdditionalUserEmail"

  @534970 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see remove x icon for lookup field "PageTemplateConfig__c"
    And I click on remove for lookup from field "PageTemplateConfig__c"
    And I click on lookup field "PageTemplateConfig__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | PSR: Program Progress Reports Grantee  |
      | PSR: Program Progress Reports Form     |
      | Program Specific Application form      |
      | NGOGrantorProgram                      |
      | AmendmentBudgetCategoryTemplateGrantee |

  @534970 @534971 @534969 @534967 @534966 @534968 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list|
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search custom lookup field - Form Layout - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    Then I softly see remove x icon for lookup field "PageTemplateConfig__c"
    And I select dropdown value "PSR: Program Progress Reports Form" in field "PageTemplateConfig__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PageTemplateConfig__c"
    And I click on remove for lookup from field "PageTemplateConfig__c"
    Then I softly see Undo icon for lookup field "PageTemplateConfig__c"
    Then I softly see the lookup field "PageTemplateConfig__c" shows the last selected result "PSR: Program Progress Reports Form"
    And I click on undo for lookup from field "PageTemplateConfig__c"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see field "Page Template Config" as "PSR: Program Progress Reports Form"

  @534994 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I click on lookup field "CFDATitle__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Active Funding accounts   |
      | Application Status        |
      | Closeout by subtype       |
      | Closeouts by Status       |
      | Current FY Grant Spending |
      | Grants by Status          |
      | My Applications           |
      | My Open Applications      |

  @534995 @534993 @534991 @534990 @534992 @US-526909
  Scenario:LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Form Layout - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I select dropdown value "Active Funding accounts" in field "CFDATitle__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "CFDATitle__c"
    And I click on remove for lookup from field "CFDATitle__c"
    #534990
    Then I softly see Undo icon for lookup field "CFDATitle__c"
    # #
    Then I softly see the lookup field "CFDATitle__c" shows the last selected result "Active Funding accounts"
    And I click on undo for lookup from field "CFDATitle__c"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    #534993 #534992
    Then I softly see field "CFDA Title" as "Active Funding accounts"

  @534974 @534982 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected
  |LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I get current URL
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I click on lookup field "CFDATitle__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | AdditionalUserDeclinedInvitation |
      | AdditionalUserEmail              |
      | AdditionalUserRegistered         |
      | Amendment Request Approval       |
      | Amendment Request Approved       |

  @534983 @534981 @534979 @534978 @534980 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search email template lookup field - Form Layout - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I select dropdown value "AdditionalUserDeclinedInvitation" in field "CFDATitle__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "CFDATitle__c"
    And I click on remove for lookup from field "CFDATitle__c"
    #534978
    Then I softly see Undo icon for lookup field "CFDATitle__c"
    Then I softly see the lookup field "CFDATitle__c" shows the last selected result "AdditionalUserDeclinedInvitation"
    And I click on undo for lookup from field "CFDATitle__c"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    #534981 #534980
    Then I softly see field "CFDA Title" as "AdditionalUserDeclinedInvitation"

  @534940 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click on lookup field "AssistanceType__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | AdditionalUserDeclinedInvitation |
      | AdditionalUserEmail              |
      | AdditionalUserRegistered         |
      | Amendment Request Approval       |
      | Amendment Request Approved       |
      | Amendment Request Approved by PO |
      | Amendment Request Assignment     |

  @534941 @534939 @534936 @534935 @534937 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search email template lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Modal - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Modal - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search email template lookup field - Modal - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor State Program        | Name                      | {SavedValue:pagelayoutAssistanceType__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "5" seconds
    And I select dropdown value "AdditionalUserEmail" in field "AssistanceType__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "AssistanceType__c"
    And I click on remove for lookup from field "AssistanceType__c"
    Then I softly see Undo icon for lookup field "AssistanceType__c"
    Then I softly see the lookup field "AssistanceType__c" shows the last selected result "AdditionalUserEmail"
    #534935
    Then I softly see Undo icon for lookup field "AssistanceType__c"
    And I click on undo for lookup from field "AssistanceType__c"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    #534939 #534936
    Then I softly see field "Assistance Type" as "AdditionalUserEmail"

  @534952 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click on lookup field "AssistanceType__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Active Announcements Report        |
      | Active Focus Areas of Organization |
      | Active Grant Summary by Agency     |
      | Active Programs of Organization    |
      | Active Programs Report             |

  @534953 @534951 @534949 @534950 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor State Program        | Name                      | {SavedValue:pagelayoutAssistanceType__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I pause execution for "5" seconds
    And I select dropdown value "Active Announcements Report" in field "AssistanceType__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "AssistanceType__c"
    And I click on remove for lookup from field "AssistanceType__c"
    Then I softly see Undo icon for lookup field "AssistanceType__c"
    Then I softly see the lookup field "AssistanceType__c" shows the last selected result "Active Announcements Report"
    #534935
    Then I softly see Undo icon for lookup field "AssistanceType__c"
    And I click on undo for lookup from field "AssistanceType__c"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    #534951 #534949 #534950
    Then I softly see field "Assistance Type" as "Active Announcements Report"

  @534958 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                                       |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Recipient ApplicationView  | Name                      | {SavedValue:postCreateApplication_ContingenciesJustification__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click on lookup field "ContingenciesJustification__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Active Funding accounts   |
      | Application Status        |
      | Closeout by subtype       |
      | Closeouts by Status       |
      | Current FY Grant Spending |
      | Grants by Status          |
      | My Applications           |

  @534959 @534957 @534955 @534954 @534956 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Modal - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                                       |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Recipient ApplicationView  | Name                      | {SavedValue:postCreateApplication_ContingenciesJustification__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | ReportLookup  | Recipient ApplicationView  | Name                      | {SavedValue:postCreateApplication_ContingenciesJustification__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I select dropdown value "Active Funding accounts" in field "ContingenciesJustification__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "ContingenciesJustification__c"
    And I click on remove for lookup from field "ContingenciesJustification__c"
    Then I softly see Undo icon for lookup field "ContingenciesJustification__c"
    Then I softly see the lookup field "ContingenciesJustification__c" shows the last selected result "Active Funding accounts"
    Then I softly see Undo icon for lookup field "ContingenciesJustification__c"
    And I click on undo for lookup from field "ContingenciesJustification__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Contingencies Justification" as "Active Funding accounts"

  @534926 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Test Automation Organization" in field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
      | SYSTEM                       |
      | Department of Product        |
    And I click on undo for lookup from field "PrimaryFundingOrganization__c"
    And I click on "Save" in the page details
    Then I softly see field "Primary Funding Organization" as "Test Automation Organization"

  @534924 @534921 @534920 @534923 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Modal - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
      | SYSTEM                       |
      | Department of Product        |
    And I click on undo for lookup from field "PrimaryFundingOrganization__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Test Automation Organization" in field "PrimaryFundingOrganization__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
      | SYSTEM                       |
      | Department of Product        |
    Then I softly see Undo icon for lookup field "PrimaryFundingOrganization__c"
    And I click on undo for lookup from field "PrimaryFundingOrganization__c"
    And I click on "Save" in the page details
    Then I softly see field "Primary Funding Organization" as "Test Automation Organization"


  @534933 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Modal - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Recipient ApplicationView  | Name                      | {SavedValue:AOR_Contact__c}                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click on lookup field "AOR_Contact__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | Automation FO   |
      | Automation FD   |
      | Automation PO   |
      | Automation EXE  |
      | Automation EXE1 |

  @534934 @534932 @534929 @534928 @534930 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - Modal - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search custom lookup field - Modal - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor Application Create | Name                      | {SavedValue:ModalCustoLookup_AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Recipient ApplicationView  | Name                      | {SavedValue:AOR_Contact__c}                  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I select dropdown value "Automation FO" in field "AOR_Contact__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "AOR_Contact__c"
    And I click on remove for lookup from field "AOR_Contact__c"
    And I wait for "3" seconds
    Then I softly see Undo icon for lookup field "AOR_Contact__c"
    And I click on undo for lookup from field "AOR_Contact__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on remove for lookup from field "AOR_Contact__c"
    And I wait for "3" seconds
    Then I softly see Undo icon for lookup field "AOR_Contact__c"
    And I click on undo for lookup from field "AOR_Contact__c"
    When I click on "Save" in the page details
    Then I softly see field "AOR Contact" as "Automation FO"


  @534946 @US-526909
  Scenario:LWC - Provision of Undo and show last search history in search email template lookup field - Modal - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                                       |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Recipient ApplicationView  | Name                      | {SavedValue:postCreateApplication_ContingenciesJustification__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click on lookup field "ContingenciesJustification__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | AdditionalUserDeclinedInvitation |
      | AdditionalUserEmail              |
      | AdditionalUserRegistered         |
      | Amendment Request Approval       |
      | Amendment Request Approved       |

  @534947 @534945 @534943 @534942 @534944 @534919 @US-526909
  Scenario: LWC - Provision of Undo and show last search history in search email template lookup field - Modal - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search email template lookup field - Modal - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Modal - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field. |
  |LWC - Provision of Undo and show last search history in search email template lookup field - Modal - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search standard report lookup field - Page Layout - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | false             | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     |                   | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                                       |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |               | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | Grantor Application Create | Name                      | {SavedValue:ModalTextArea_ContingenciesJustification__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Recipient ApplicationView  | Name                      | {SavedValue:postCreateApplication_ContingenciesJustification__c} |
      | Page Block Config:Page Block Rule Detail | Alternative Rendering Config     | emailLookup   | Recipient ApplicationView  | Name                      | {SavedValue:postCreateApplication_ContingenciesJustification__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I select dropdown value "AdditionalUserDeclinedInvitation" in field "ContingenciesJustification__c"
    And I wait for "3" seconds
    Then I softly see remove x icon for lookup field "ContingenciesJustification__c"
    And I click on remove for lookup from field "ContingenciesJustification__c"
    And I wait for "3" seconds
    Then I softly see Undo icon for lookup field "ContingenciesJustification__c"
    And I click on undo for lookup from field "ContingenciesJustification__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on remove for lookup from field "ContingenciesJustification__c"
    And I wait for "3" seconds
    Then I softly see Undo icon for lookup field "ContingenciesJustification__c"
    And I click on undo for lookup from field "ContingenciesJustification__c"
    When I click on "Save" in the page details
    Then I softly see field "Contingencies Justification" as "AdditionalUserDeclinedInvitation"

  @FW-609 @US-FW-602
  Scenario: TC - LWC – Table (PM) – To Verify that after clicking the close icon, the error message becomes invisible.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Phone_Number__c | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Required Fields     | Phone_Number__c                              | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     |
      | {SavedValue:PM Username} |
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-603 @US-FW-602
  Scenario: TC - LWC – Table (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Phone_Number__c,URL__c,Date__c,Date_And_Time__c,City__c,Test_Multipicklist__c,Percentage__c,State__c,BudgetPeriod__c | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:ContactTableDFN},Phone_Number__c,URL__c,Date__c,Date_And_Time__c,City__c,Test_Multipicklist__c,Percentage__c,State__c,BudgetPeriod__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     |
      | {SavedValue:PM Username} |
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-610 @US-FW-602
  Scenario: TC - LWC – Table (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Label Override is Apply.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId          |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0  |
      | Flex Table            | Required Fields      |                              | ApiGeneratedId:1  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:2  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:3  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:4  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:5  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:6  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:7  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:8  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:9  |
      | Flex Table List       | Field Label Override |                              | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c,URL__c,Date__c,Date_And_Time__c,City__c,Test_Multipicklist__c,Percentage__c,State__c,BudgetPeriod__c | DataTableEnhanceProgramContacts |                           |                                         |
      | Flex Table:General    | Required Fields      | Phone_Number__c,URL__c,Date__c,Date_And_Time__c,City__c,Test_Multipicklist__c,Percentage__c,State__c,BudgetPeriod__c                              | DataTableEnhanceProgramContacts |                           |                                         |
      | Flex Table List       | Field Label Override | FLO Phone Number                                                                                                                                  | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Phone_Number__c}            |
      | Flex Table List       | Field Label Override | FLO Phone Number                                                                                                                                  | DataTableEnhanceProgramContacts | Name                      | {SavedValue:URL__c}                     |
      | Flex Table List       | Field Label Override | FLO Date                                                                                                                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Date__c}                    |
      | Flex Table List       | Field Label Override | FLO City                                                                                                                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:City__c}                    |
      | Flex Table List       | Field Label Override | FLO Test Multiselect Picklist                                                                                                                     | DataTableEnhanceProgramContacts | Name                      | {SavedValue:ContactPM-Date_And_Time__c} |
      | Flex Table List       | Field Label Override | FLO Percentage                                                                                                                                    | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Test_Multipicklist__c}      |
      | Flex Table List       | Field Label Override | FLO State                                                                                                                                         | DataTableEnhanceProgramContacts | Name                      | {SavedValue:Percentage__c}              |
      | Flex Table List       | Field Label Override | FLO budget preriod                                                                                                                                | DataTableEnhanceProgramContacts | Name                      | {SavedValue:State__c_FormulaText_PM}    |
      | Flex Table List       | Field Label Override | FLO Test                                                                                                                                          | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c}            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     |
      | {SavedValue:PM Username} |
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-613 @US-FW-602
  Scenario: TC - LWC – Table (SPI) – To Verify that after clicking the close icon, the error message becomes invisible.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                                           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:PreAppContactTableForSPI.DFN},Phone_Number__c,URL__c,Date__c,Date_And_Time__c,City__c,Test_Multipicklist__c,Percentage__c,State__c,BudgetPeriod__c | PreAppContact      |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:PreAppContactTableForSPI.DFN},Phone_Number__c,URL__c,Date__c,Date_And_Time__c,City__c,Test_Multipicklist__c,Percentage__c,State__c,BudgetPeriod__c | PreAppContact      |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I get current URL
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |


  @FW-612 @US-FW-602
  Scenario: TC - LWC – Table (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                                           | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                                                                                                                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:PreAppContactTableForSPI.DFN},AcademicMonths__c,AgencyLogin__c,AmendmentRequest__c,Announcement__c,Application__c,Award__c,CalendarMonths__c,City__c,ContactEmail__c,Date__c,Date_And_Time__c,ForeignOrganizationEmployee__c,Notify__c | PreAppContact      |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:PreAppContactTableForSPI.DFN},AcademicMonths__c,AgencyLogin__c,AmendmentRequest__c,Announcement__c,Application__c,Award__c,CalendarMonths__c,City__c,ContactEmail__c,Date__c,Date_And_Time__c,ForeignOrganizationEmployee__c,Notify__c | PreAppContact      |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-614 @US-FW-602
  Scenario: TC - LWC – Table (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields      |                                           | ApiGeneratedId:1 |
      | Flex Table List       | Field Label Override |                                           | ApiGeneratedId:2 |
      | Flex Table List       | Field Label Override |                                           | ApiGeneratedId:3 |
      | Flex Table List       | Field Label Override |                                           | ApiGeneratedId:4 |
      | Flex Table List       | Field Label Override |                                           | ApiGeneratedId:5 |
      | Flex Table List       | Field Label Override |                                           | ApiGeneratedId:6 |
      | Flex Table List       | Field Label Override |                                           | ApiGeneratedId:7 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                                                                                                                                                                                                      | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                  |
      | Flex Table:General    | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},AcademicMonths__c,AgencyLogin__c,AmendmentRequest__c,Application__c,Award__c,CalendarMonths__c,City__c,ContactEmail__c,Date__c,Date_And_Time__c,ForeignOrganizationEmployee__c,Notify__c | PreAppContact      |                           |                                             |
      | Flex Table:General    | Required Fields      | {SavedValue:PreAppContactTableForSPI.DFN},AcademicMonths__c,AgencyLogin__c,AmendmentRequest__c,Application__c,Award__c,CalendarMonths__c,City__c,ContactEmail__c,Date__c,Date_And_Time__c,ForeignOrganizationEmployee__c,Notify__c | PreAppContact      |                           |                                             |
      | Flex Table List       | Field Label Override | FLO Test                                                                                                                                                                                                                           | PreAppContact      | Name                      | {SavedValue:AcademicMonths__c}              |
      | Flex Table List       | Field Label Override | FLO Test                                                                                                                                                                                                                           | PreAppContact      | Name                      | {SavedValue:AgencyLogin__c}                 |
      | Flex Table List       | Field Label Override | FLO Test                                                                                                                                                                                                                           | PreAppContact      | Name                      | {SavedValue:AmendmentRequest__c}            |
      | Flex Table List       | Field Label Override | FLO Test                                                                                                                                                                                                                           | PreAppContact      | Name                      | {SavedValue:SPIApplication__c}              |
      | Flex Table List       | Field Label Override | FLO Test                                                                                                                                                                                                                           | PreAppContact      | Name                      | {SavedValue:CalendarMonths__c}              |
      | Flex Table List       | Field Label Override | FLO Test                                                                                                                                                                                                                           | PreAppContact      | Name                      | {SavedValue:ForeignOrganizationEmployee__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    And I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-618 @US-FW-602
  Scenario: TC - LWC – FORMS (PM) – To Ver ify ‘Required to Save’ validation error message Should displayed for all data types.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-619 @US-FW-602
  Scenario: TC - LWC – FORMS (PM) – To Verify that after clicking the close icon, the error message becomes invisible.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue        |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Hide Label        | false             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}   |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |


  @FW-622 @US-FW-602
  Scenario: TC - LWC – FORMS (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField  | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | General Review Form | ApiGeneratedId:39 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXESalary__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXECheckListItem1__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXESalary__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXECheckListItem1__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @revertAllGeneralReviewFormRequiredBehavior
  Scenario: revertAllGeneralReviewFormRequiredBehavior
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXESalary__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXECheckListItem1__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXESalary__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXECheckListItem1__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |

  @FW-622 @US-FW-602
  Scenario: TC - LWC – FORMS (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:39 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:40 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:41 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:42 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:43 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:44 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:45 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:46 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:47 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:48 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:49 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:50 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:51 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:52 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:53 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:54 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:55 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:56 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:57 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:58 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:59 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXESalary__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXECheckListItem1__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXESalary__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXECheckListItem1__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO1              | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO2              | General Review Form | Name                      | {SavedValue:EXEUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO3              | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO4              | General Review Form | Name                      | {SavedValue:EXECitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO5              | General Review Form | Name                      | {SavedValue:EXEAcknowledgement1__c}        |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO6              | General Review Form | Name                      | {SavedValue:EXEConfigForm__c}              |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO7              | General Review Form | Name                      | {SavedValue:EXEWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO8              | General Review Form | Name                      | {SavedValue:EXESiteVisit__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO9              | General Review Form | Name                      | {SavedValue:EXEQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO10             | General Review Form | Name                      | {SavedValue:EXEFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO11             | General Review Form | Name                      | {SavedValue:EXESmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO12             | General Review Form | Name                      | {SavedValue:EXEEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO13             | General Review Form | Name                      | {SavedValue:EXELocationState__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO14             | General Review Form | Name                      | {SavedValue:EXELastName__c}                |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO15             | General Review Form | Name                      | {SavedValue:EXEProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO16             | General Review Form | Name                      | {SavedValue:EXEFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO17             | General Review Form | Name                      | {SavedValue:EXESalary__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO18             | General Review Form | Name                      | {SavedValue:EXEDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO19             | General Review Form | Name                      | {SavedValue:EXECheckListItem1__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO20             | General Review Form | Name                      | {SavedValue:EXEFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO21             | General Review Form | Name                      | {SavedValue:EXEBase_Salary__c}             |
    Given I activated standalone subaward "Automation Runtime General Review Form" with properties "default" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default" of type "Competitive"
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime General Review Form}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:grantsTableId---"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime General Review Form}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
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
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |


  @FW-623 @FW-625 @US-FW-602
  Scenario: TC - LWC – FORMS (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – FORMS (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:40 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:41 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:42 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:43 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:44 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:45 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:46 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:47 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:48 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:49 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:50 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:51 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:52 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:53 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:54 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:40 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFEmail__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFSmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFFirstName__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c}                 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFSmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO1              | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO2              | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}                |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO3              | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO4              | Standard Assurances Form | Name                      | {SavedValue:SAFCitizenship__c}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO5              | Standard Assurances Form | Name                      | {SavedValue:SAFQuestion1__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO6              | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c}                 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO7              | Standard Assurances Form | Name                      | {SavedValue:SAFPageTemplateConfig__c}      |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO8              | Standard Assurances Form | Name                      | {SavedValue:SAFFundingOpportunityTitle__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO9              | Standard Assurances Form | Name                      | {SavedValue:SAFAcknowledgement__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO10             | Standard Assurances Form | Name                      | {SavedValue:SAFBase_Salary__c}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO11             | Standard Assurances Form | Name                      | {SavedValue:SAFUser2FaxNumber__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO12             | Standard Assurances Form | Name                      | {SavedValue:SAFWebsite__c}                 |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO13             | Standard Assurances Form | Name                      | {SavedValue:SAFDisability_Status__c}       |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO14             | Standard Assurances Form | Name                      | {SavedValue:SAFSmallBusiness__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO15             | Standard Assurances Form | Name                      | {SavedValue:SAFFederalShare__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO16             | Standard Assurances Form | Name                      | {SavedValue:SAFPhone__c}                   |
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
    Then I cannot see field label "Federal Share" inside page block
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-624 @US-FW-602
  Scenario: TC - LWC – FORMS (SPI) – To Verify that after clicking the close icon, the error message becomes invisible.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField  | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | General Review Form | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | General Review Form | ApiGeneratedId:5 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:6 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:7 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | General Review Form | ApiGeneratedId:8 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c}       |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | Name                      | {SavedValue:SAFCFDATitle__c}       |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | Name                      | {SavedValue:SAFLastName__c}        |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Standard Assurances Form | Name                      | {SavedValue:SAFProjectAbstract__c} |
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
    Then I cannot see field label "Federal Share" inside page block
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |

  @FW-626  @FW-627 @US-FW-602
  Scenario: TC - LWC – Modal (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Modal (PM) – To Verify that after clicking the close icon, the error message becomes invisible.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField           | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Grantor State Program Create | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program Create | ApiGeneratedId:31 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}                                   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}                             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}                                |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}                          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}                         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}                               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}                         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}                      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:modalAuthorizedSignatory__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}                                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}                              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}                         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}                            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}                           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}                                   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}                             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}                                |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}                          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}                               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}                      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:modalAuthorizedSignatory__c}                    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}                                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}                              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}                            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}                           |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To save, Audits is required in the Information section.                          |
      | To save, CheckboxType is required in the Information section.                    |
      | To save, RadioType is required in the Information section.                       |
      | To save, Phone Number is required in the Information section.                    |
      | To save, Percent is required in the Information section.                         |
      | To save, Types Of Assistance is required in the Information section.             |
      | To save, Authorized Signatory is required in the Information section.            |
      | To save, Published Date is required in the Information section.                  |
      | To save, Test Description is required in the Information section.                |
      | To save, Assistance Type is required in the Information section.                 |
      | To save, MultiSelect Picklist Long Value is required in the Information section. |
      | To save, Time is required in the Information section.                            |
      | To save, Date And Time is required in the Information section.                   |
      | To save, Email Test is required in the Information section.                      |
      | To save, Website Address is required in the Information section.                 |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | Required field(s) missing:                  |
      | Please complete all field(s) marked in red. |


  @FW-628 @US-FW-602
  Scenario:TC - LWC – Modal (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | coreComponentField           | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | Grantor State Program Create | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | Grantor State Program Create | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:39 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:40 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:41 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:42 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:43 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program Create | ApiGeneratedId:44 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}                                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}                                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}                          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}                               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}                      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:modalAuthorizedSignatory__c}                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}                                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}                              |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}                           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}                                   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}                             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}                                |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}                          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}                               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}                      |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:modalAuthorizedSignatory__c}                    |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}                                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}                              |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}                            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}                           |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO1              | Grantor State Program Create | Name                      | {SavedValue:Modal_Audits}                                   |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO2              | Grantor State Program Create | Name                      | {SavedValue:Modal_CheckboxType}                             |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO3              | Grantor State Program Create | Name                      | {SavedValue:Modal_RadioType}                                |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO4              | Grantor State Program Create | Name                      | {SavedValue:Modal_Phone_Number__c}                          |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO5              | Grantor State Program Create | Name                      | {SavedValue:Modal_TypeOfAssistance}                         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO6              | Grantor State Program Create | Name                      | {SavedValue:Modal_Percent__c}                               |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO7              | Grantor State Program Create | Name                      | {SavedValue:Modal_PublishedDate__c}                         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO8              | Grantor State Program Create | Name                      | {SavedValue:Modal_Test_Description__c}                      |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO9              | Grantor State Program Create | Name                      | {SavedValue:modalAuthorizedSignatory__c}                    |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO10             | Grantor State Program Create | Name                      | {SavedValue:Modal_Time__c}                                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO11             | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO12             | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c}                              |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO13             | Grantor State Program Create | Name                      | {SavedValue:Modal_Date_And_Time__c}                         |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO14             | Grantor State Program Create | Name                      | {SavedValue:Modal_Email_Test__c}                            |
      | Page Block Config:Page Block Rule Detail | Field Label Override | FLO15             | Grantor State Program Create | Name                      | {SavedValue:Modal_WebsiteAddress}                           |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To save, Program Name is required in the Information section.                        |
      | To save, Type is required in the Information section.                                |
      | To save, FLO1 is required in the Information section.                                |
      | To save, Primary Funding Organization is required in the Information section.        |
      | To save, FLO2 is required in the Information section.                                |
      | To save, FLO3 is required in the Information section.                                |
      | To save, FLO4 is required in the Information section.                                |
      | To save, FLO6 is required in the Information section.                                |
      | To save, FLO5 is required in the Information section.                                |
      | To save, FLO9 is required in the Information section.                                |
      | To save, FLO7 is required in the Information section.                                |
      | To save, FLO8 is required in the Information section.                                |
      | To save, FLO12 is required in the Information section.                               |
      | To save, FLO11 is required in the Information section.                               |
      | To save, FLO10 is required in the Information section.                               |
      | To save, FLO13 is required in the Information section.                               |
      | To save, FLO14 is required in the Information section.                               |
      | To save, FLO15 is required in the Information section.                               |
      | To save, Focus Areas Required? is required in the Program Specific Settings section. |
      | To save, Objectives Required? is required in the Program Specific Settings section.  |

  @FW-629 @FW-630 @US-FW-602
  Scenario: TC - LWC – Modal (PM) – To Verify that the field name in the error message is displayed in blue and is clickable.
  |TC - LWC – Modal (PM) – To Verify that Clicking the field name in the error message redirects to the respective field, highlights it in red and displays the message ‘This field is required to save.’|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click modal button "Save and Continue"
    Then I softly see link "Program Name" inside Page block
    Then I softly see link "Type" inside Page block
    Then I softly see link "Primary Funding Organization" inside Page block
    Then I softly see link "Focus Areas Required?" inside Page block
    Then I softly see link "Objectives Required?" inside Page block


  @FW-639 @FW-640 @FW-641
  Scenario: TC - LWC – Modal (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Modal (SPI) – To Verify that after clicking the close icon, the error message becomes invisible.|
  |TC - LWC – Modal (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField            | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:19 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalCheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c}                      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:ProjectDirectorContact__c}                             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:EmailRef2__c}                                          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:IfYesprovidetheamount__c}                              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:MOEIndicator__c}                                       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:PhoneNumberRef1__c}                                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:ProvidedDate__c}                                       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalCheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c}                      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:ProjectDirectorContact__c}                             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:EmailRef2__c}                                          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:IfYesprovidetheamount__c}                              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:MOEIndicator__c}                                       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:PhoneNumberRef1__c}                                    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:ProvidedDate__c}                                       |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To save, CheckboxType is required.                    |
      | To save, Indirect Budget Categories is required.      |
      | To save, X_Program Approver is required.              |
      | To save, Project Director is required.                |
      | To save, MultiSelect Picklist Long Value is required. |
      | To save, Email is required.                           |
      | To save, If Yes, provide the amount is required.      |
      | To save, MOEIndicator is required.                    |
      | To save, Phone Number is required.                    |
      | To save, X_Provided Date is required.                 |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | To save, CheckboxType is required. |


  @FW-642 @FW-643 @US-FW-602
  Scenario:TC - LWC – Modal (SPI) – To Verify that the field name in the error message is displayed in blue and is clickable.
  |TC - LWC – Modal (SPI) – To Verify that Clicking the field name in the error message redirects to the respective field, highlights it in red and displays the message ‘This field is required to save
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField            | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Create Grantor Preapplication | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | ApiGeneratedId:19 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalCheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c}                      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:ProjectDirectorContact__c}                             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:EmailRef2__c}                                          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:IfYesprovidetheamount__c}                              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:MOEIndicator__c}                                       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:PhoneNumberRef1__c}                                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:ProvidedDate__c}                                       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalINDIRECTBudgetCategories__c}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalCheckboxType__c}              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c}                      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:ProjectDirectorContact__c}                             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:EmailRef2__c}                                          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:IfYesprovidetheamount__c}                              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:MOEIndicator__c}                                       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:PhoneNumberRef1__c}                                    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:ProvidedDate__c}                                       |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    Then I softly see link "CheckboxType" inside Page block
    Then I softly see link "Indirect Budget Categories" inside Page block
    Then I softly see link "X_Program Approver" inside Page block
    Then I softly see link "Project Director" inside Page block

  @FW-647 @FW-673 @US-FW-602
  Scenario: TC - LWC – Layout (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Layout (PM) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField    | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Grantor State Program | ApiGeneratedId:29 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Authorization is required in the Overview tab under the Information section.               |
      | To save, Published Date is required in the Overview tab under the Information section.              |
      | To save, X_Project Goals is required in the Overview tab under the Information section.             |
      | To save, Email Test is required in the Overview tab under the Information section.                  |
      | To save, Phone Number is required in the Overview tab under the Information section.                |
      | To save, Percent is required in the Overview tab under the Information section.                     |
      | To save, FLO Rich Text X_CFDA Data is required in the Overview tab under the Information section.   |
      | To save, X_Funded Amount is required in the Overview tab under the Information section.             |
      | To save, Time is required in the Overview tab under the Information section.                        |
      | To save, FLO Rich Text Date And Time is required in the Overview tab under the Information section. |
      | To save, Website Address is required in the Overview tab under the Information section.             |
      | To save, Authorized Signatory is required in the Overview tab under the Information section.        |

  @FW-671 @US-FW-602
  Scenario: TC - LWC – Layout (PM) – To Verify that after clicking the close icon, the error message becomes invisible.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField    | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:39 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:40 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:41 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:42 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:43 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:44 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:45 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:46 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:47 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:48 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:49 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:50 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:51 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:52 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:53 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:54 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:55 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:56 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:57 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:58 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:59 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | To save, Authorization is required in the Overview tab under the Information section.               |
      | To save, Published Date is required in the Overview tab under the Information section.              |
      | To save, X_Project Goals is required in the Overview tab under the Information section.             |
      | To save, Email Test is required in the Overview tab under the Information section.                  |
      | To save, Phone Number is required in the Overview tab under the Information section.                |
      | To save, Percent is required in the Overview tab under the Information section.                     |
      | To save, FLO Rich Text X_CFDA Data is required in the Overview tab under the Information section.   |
      | To save, X_Funded Amount is required in the Overview tab under the Information section.             |
      | To save, Time is required in the Overview tab under the Information section.                        |
      | To save, FLO Rich Text Date And Time is required in the Overview tab under the Information section. |
      | To save, Website Address is required in the Overview tab under the Information section.             |
      | To save, Authorized Signatory is required in the Overview tab under the Information section.        |


  @FW-674 @US-FW-602
  Scenario: TC - LWC – Layout (PM) – To Verify that the field name in the error message is displayed in blue and is clickable.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField    | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:39 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:40 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:41 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:42 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:43 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:44 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:45 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:46 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:47 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:48 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:49 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:50 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:51 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:52 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:53 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:54 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:55 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:56 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:57 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:58 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:59 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    Then I softly see link "Authorization" inside Page block
    Then I softly see link "Published Date" inside Page block
    Then I softly see link "X_Project Goals" inside Page block
    Then I softly see link "Email Test" inside Page block
    Then I softly see link "Phone Number" inside Page block
    Then I softly see link "Percent" inside Page block
    Then I softly see link "X_CFDA Data" inside Page block
    Then I softly see link "X_Funded Amount" inside Page block
    Then I softly see link "Time" inside Page block
    Then I softly see link "Date And Time" inside Page block
    Then I softly see link "Website Address" inside Page block
    Then I softly see link "Authorized Signatory" inside Page block
    And I click on error message x close button
    Then I softly do not see link "Authorization" inside Page block

  @FW-685 @FW-687 @FW-697 @US-FW-602
  Scenario: TC - LWC – Layout (PM) – To Verify that Clicking the field name in the error message redirects to the respective field, highlights it in red and displays the message ‘This field is required to save.’.
  |TC - LWC – Layout (PM) – To Verify that after clicking the close icon, the error message becomes invisible.|
  |TC - LWC – Layout (PM) – To Verify that the field name in the error message is displayed in blue.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField    | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:39 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:40 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:41 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:42 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:43 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:44 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:45 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:46 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:47 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:48 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:49 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:50 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:51 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:52 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:53 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:54 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:55 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:56 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:57 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:58 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:59 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "15" seconds
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Authorization is required to save. Enter it in the Information section on the Overview tab.        |
      | Phone Number is required to save. Enter it in the Information section on the Overview tab.         |
      | Published Date is required to save. Enter it in the Information section on the Overview tab.       |
      | X_Project Goals is required to save. Enter it in the Information section on the Overview tab.      |
      | Email Test is required to save. Enter it in the Information section on the Overview tab.           |
      | Percent is required to save. Enter it in the Information section on the Overview tab.              |
      | X_CFDA Data is required to save. Enter it in the Information section on the Overview tab.          |
      | X_Funded Amount is required to save. Enter it in the Information section on the Overview tab.      |
      | Time is required to save. Enter it in the Information section on the Overview tab.                 |
      | Website Address is required to save. Enter it in the Information section on the Overview tab.      |
      | Authorized Signatory is required to save. Enter it in the Information section on the Overview tab. |
    And I click on Required field(s) missing error message close icon
    Then I softly cannot see the following messages in the page details contains:
      | Authorization is required to save. Enter it in the Information section on the Overview tab.               |
      | Phone Number is required to save. Enter it in the Information section on the Overview tab.                |
      | Program Name is required to save. Enter it in the Information section on the Overview tab.                |
      | Published Date is required to save. Enter it in the Information section on the Overview tab.              |
      | X_Project Goals is required to save. Enter it in the Information section on the Overview tab.             |
      | Email Test is required to save. Enter it in the Information section on the Overview tab.                  |
      | Percent is required to save. Enter it in the Information section on the Overview tab.                     |
      | X_CFDA Data is required to save. Enter it in the Information section on the Overview tab.                 |
      | X_Funded Amount is required to save. Enter it in the Information section on the Overview tab.             |
      | Time is required to save. Enter it in the Information section on the Overview tab.                        |
      | FLO Rich Text Date And Time is required to save. Enter it in the Information section on the Overview tab. |
      | Website Address is required to save. Enter it in the Information section on the Overview tab.             |
      | Authorized Signatory is required to save. Enter it in the Information section on the Overview tab.        |

  @FW-686 @FW-690 @US-FW-602
  Scenario: TC - LWC – Layout (PM) – To Verify ‘Required for Submit’ validation error message Should displayed for all data types.
  |TC - LWC – Layout (PM) – To Verify ‘Required to Submit’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | coreComponentField    | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Grantor State Program | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | Grantor State Program | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:39 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:40 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:41 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:42 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:43 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | ApiGeneratedId:44 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:45 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:46 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:47 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:48 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:49 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:50 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:51 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:52 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:53 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:54 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:55 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:56 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:57 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:58 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | ApiGeneratedId:59 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior    | Required for Submit | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                     | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
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
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | To submit, Authorization is required in the Overview tab under the Information section.               |
      | To submit, Published Date is required in the Overview tab under the Information section.              |
      | To submit, X_Project Goals is required in the Overview tab under the Information section.             |
      | To submit, Email Test is required in the Overview tab under the Information section.                  |
      | To submit, Phone Number is required in the Overview tab under the Information section.                |
      | To submit, Percent is required in the Overview tab under the Information section.                     |
      | To submit, Abbreviation is required in the Overview tab under the Information section.                |
      | To submit, X_CFDA Data is required in the Overview tab under the Information section.                 |
      | To submit, X_Funded Amount is required in the Overview tab under the Information section.             |
      | To submit, Time is required in the Overview tab under the Information section.                        |
      | To submit, FLO Rich Text Date And Time is required in the Overview tab under the Information section. |
      | To submit, Website Address is required in the Overview tab under the Information section.             |
      | To submit, Authorized Signatory is required in the Overview tab under the Information section.        |

  @FW-710 @US-FW-602
  Scenario: TC - LWC – Grid (PM) – Parent – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Grid (PM) – Parent – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                 | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.all} | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:ParentFlexTable1.all} | TestAutomationFlexTable1 |                           |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly cannot see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |

  @FW-732 @FW-733
  Scenario: TC - LWC – Grid (PM) – Parent – To Verify that after clicking the close icon, the error message becomes invisible.
  |TC - LWC – Grid (PM) – Parent – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                 | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.all} | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:ParentFlexTable1.all} | TestAutomationFlexTable1 |                           |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |

  @FW-734 @FW-735 @FW-736
  Scenario: TC - LWC – Grid (PM) – Child – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Grid (PM) – Child – To Verify that after clicking the close icon, the error message becomes invisible.|
  |TC - LWC – Grid (PM) – Child – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn} | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                                  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                    | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.all} | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:ChildFlexTable2.all} | TestAutomationFlexTable2 |                           |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable2---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |

  @FW-737  @FW-738 @FW-739 @US-FW-602
  Scenario: TC - LWC – Grid (PM) – Grand Child – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |  TC - LWC – Grid (PM) – Grand Child – To Verify that after clicking the close icon, the error message becomes invisible.|
  |TC - LWC – Grid (PM) – Grand Child – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | ApiGeneratedId:2 |
      | Flex Table            | Required Fields     |                                       | ApiGeneratedId:3 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | ApiGeneratedId:4 |
      | Flex Table            | Required Fields     |                                       | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.all}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Required Fields     |                                       | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.all}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Required Fields     |                                       | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.all} | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:GrandChildFlexTable3.all} | TestAutomationFlexTable3 |                           |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter in modal value "Automation Runtime Focus Area" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I perform quick search for "Permanent Child Record" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    And I expand nested table containing column value "Permanent Child Record"
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |

  @FW-743 @FW-744 @FW-745 @US-FW-602
  Scenario: TC - LWC – Grid (SPI) – Child – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Grid (SPI) – Child – To Verify that after clicking the close icon, the error message becomes invisible.|
  |TC - LWC – Grid (SPI) – Child – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                     | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn}     | ApiGeneratedId:0 |
      | Flex Table            | Required Fields     |                                       | ApiGeneratedId:1 |
      | Flex Table            | Display Field Names | {SavedValue:ChildFlexTable2.dfn}      | ApiGeneratedId:2 |
      | Flex Table            | Required Fields     |                                       | ApiGeneratedId:3 |
      | Flex Table            | Display Field Names | {SavedValue:GrandChildFlexTable3.dfn} | ApiGeneratedId:4 |
      | Flex Table            | Required Fields     |                                       | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                         | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.all}     | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Required Fields     |                                       | TestAutomationFlexTable1 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:ChildFlexTable2.all}      | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Required Fields     |                                       | TestAutomationFlexTable2 |                           |                            |
      | Flex Table:General    | Display Field Names | {SavedValue:GrandChildFlexTable3.all} | TestAutomationFlexTable3 |                           |                            |
      | Flex Table:General    | Required Fields     | {SavedValue:GrandChildFlexTable3.all} | TestAutomationFlexTable3 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "4" seconds
    And I perform quick search for "Permanent Parent Record" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I expand nested table containing column value "Permanent Parent Record"
    And I perform quick search for "Permanent Child Record" in "---flexgrid:-:TestAutomationFlexTable2---" panel
    And I expand nested table containing column value "Permanent Child Record"
    And I click on top right button "New" in flex table with id "---flexgrid:-:TestAutomationFlexTable3---"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | Please complete all field(s) marked in red. |

  @FW-747 @US-FW-602
  Scenario: TC - LWC – Modal (PM) – To Verify ‘Required to Save’ validation error message when single tab and single page block section on Modal Should displayed for all data types.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block                               | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Page Block:Page Block Detail             | Is Active         | false             | Grantor State Program Create | Name                      | PB-12247                       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program Create | Name                      | {SavedValue:AssistanceType__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Required field(s) missing: |
      | Field Label is required.   |

  @FW-748 @US-FW-602
  Scenario: TC - LWC – Layout (PM) – To Verify ‘Required to Save’ validation error message when single tab and single page block section on Modal Should displayed for all data types.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId          |
      | Page Tabs Config                         | Is Active         | true              | ApiGeneratedId:0  |
      | Page Tabs Config                         | Is Active         | true              | ApiGeneratedId:1  |
      | Page Tabs Config                         | Is Active         | true              | ApiGeneratedId:2  |
      | Page Tabs Config                         | Is Active         | true              | ApiGeneratedId:3  |
      | Page Tabs Config                         | Is Active         | true              | ApiGeneratedId:4  |
      | Page Tabs Config                         | Is Active         | true              | ApiGeneratedId:5  |
      | Page Block:Page Block Detail             | Is Active         | true              | ApiGeneratedId:6  |
      | Page Block:Page Block Detail             | Is Active         | true              | ApiGeneratedId:7  |
      | Page Block:Page Block Detail             | Is Active         | true              | ApiGeneratedId:8  |
      | Page Block:Page Block Detail             | Is Active         | true              | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:21 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:22 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:23 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:24 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:25 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:26 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:27 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:28 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:29 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:30 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:31 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:32 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:33 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:34 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:35 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:36 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:37 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:38 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:39 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Tabs Config:Page Layout Action      | Is Active         | false             | Grantor State Program | Name                      | TAB-4205                                 |
      | Page Tabs Config:Page Layout Action      | Is Active         | false             | Grantor State Program | Name                      | TAB-4160                                 |
      | Page Tabs Config:Page Layout Action      | Is Active         | false             | Grantor State Program | Name                      | TAB-4154                                 |
      | Page Tabs Config:Page Layout Action      | Is Active         | false             | Grantor State Program | Name                      | TAB-4155                                 |
      | Page Tabs Config:Page Layout Action      | Is Active         | false             | Grantor State Program | Name                      | TAB-4158                                 |
      | Page Tabs Config:Page Layout Action      | Is Active         | false             | Grantor State Program | Name                      | TAB-4157                                 |
      | Page Block:Page Block Detail             | Is Active         | false             | Grantor State Program | Name                      | PB-11274                                 |
      | Page Block:Page Block Detail             | Is Active         | false             | Grantor State Program | Name                      | PB-11275                                 |
      | Page Block:Page Block Detail             | Is Active         | false             | Grantor State Program | Name                      | PB-11277                                 |
      | Page Block:Page Block Detail             | Is Active         | false             | Grantor State Program | Name                      | PB-11436                                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:TextAreaField_Authorization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:LongTextArea_ProjectGoals}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:CurrencyField_FundedAmount}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PicklistTypeField}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:WebsiteAddress__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:Email_Test__c}               |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Phone_Number__c}          |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:Percent__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Time__c}                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PM_Date_And_Time__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:CheckField_CFDA}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Grantor State Program | Name                      | {SavedValue:PublishedDate__c}            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Field Label is required. |

  @FW-698 @FW-701 @US-FW-602
  Scenario: TC - LWC – Layout (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Layout (SPI) – To Verify that after clicking the close icon, the error message becomes invisible.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression Fields           |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression Fields           |                   | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | X_Program Approver is required in the Overview tab under the Applicant Information section. |
    And I click on error message x close button
    Then I softly cannot see the following messages in the page details contains:
      | X_Program Approver is required in the Overview tab under the Applicant Information section. |

  @FW-702 @US-FW-602
  Scenario: TC - LWC – Layout (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types when Field Lable Override is Apply.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:21 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}                              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}                                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}                                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}                             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}                           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}                       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                                     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}                        |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}                              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}                                 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}                                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}                             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}                           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}                       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                                     |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | MultiSelect Picklist Long Value is required in the Overview tab under the Applicant Information section. |
      | X_Provided By 1 is required in the Overview tab under the Applicant Information section.                 |
      | Pre Application Deadline is required in the Overview tab under the Applicant Information section.        |
      | X_Record Incomplete is required in the Overview tab under the Applicant Information section.             |
      | X_State Program is required in the Overview tab under the Applicant Information section.                 |
      | X_Type Of Application is required in the Overview tab under the Applicant Information section.           |
      | X_Type Of Education Help is required in the Overview tab under the Applicant Information section.        |
      | X_Type Of Education Provided is required in the Overview tab under the Applicant Information section.    |
      | X_Version ID is required in the Overview tab under the Applicant Information section.                    |
      | X_Program Approver is required in the Overview tab under the Applicant Information section.              |

  @FW-703 @FW-704 @FW-705 @FW-706 @US-FW-602
  Scenario: TC - LWC – Layout (SPI) – To Verify that the field name in the error message is displayed in blue and is clickable.
  |TC - LWC – Layout (SPI) – To Verify that Clicking the field name in the error message redirects to the respective field, highlights it in red and displays the message ‘This field is required to save.’.|
  |TC - LWC – Layout (SPI) – To Verify ‘Required for Submit’ validation error message Should displayed for all data types.|
  |TC - LWC – Layout (SPI) – To Verify that after clicking the close icon, the error message becomes invisible.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:21 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}                        |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}                              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}                                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}                                  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}                             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}                           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}                       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                                     |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}                        |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}                              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}                                 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}                                  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}                             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}                           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}                       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                                     |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see link "MultiSelect Picklist Long Value" inside Page block
    Then I softly see link "X_Provided By 1" inside Page block
    Then I softly see link "Pre Application Deadline" inside Page block
    Then I softly see link "X_Record Incomplete" inside Page block
    Then I softly see link "X_State Program" inside Page block
    Then I softly see link "X_Type Of Application" inside Page block
    Then I softly see link "X_Type Of Education Help" inside Page block
    Then I softly see link "X_Type Of Education Provided" inside Page block
    Then I softly see link "X_Version ID" inside Page block
    Then I softly see link "X_Program Approver" inside Page block
    And I click on error message x close button
    Then I softly do not see link "MultiSelect Picklist Long Value" inside Page block

  @FW-894 @FW-920 @US-FW-893
  Scenario: LWC: Table: PM: To Verify that “+" icon with Add text option is displayed for Text Area/Long text area/Rich text area when no data exists in Edit Mode.
  |LWC: Grid: PM: To Verify that “+" icon with Add text option is displayed for Text Area/Long text area/Rich text area when no data exists in Edit Mode.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn},AutTestName__c,Justification__c | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I click on top right button "New" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see "Add text" with "add" icon displayed for field "Description__c" in created record
    Then I softly see "Add text" with "add" icon displayed for field "AutTestName__c" in created record
    Then I softly see "Add text" with "add" icon displayed for field "Justification__c" in created record

  @FW-895 @US-FW-893
  Scenario: LWC: Table: PM: To Verify that clicking “+ Add Text” allows the user to enter text in the Text Area, Long Text Area, and Rich Text Area fields, and that the entered text is visible in View mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn},AutTestName__c,Justification__c | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name       | Description         | AutTestName    | Justification       |
      | 4          | Automation Test | Rich Text Area Test | Text Area Test | Long Text Area Test |
    Then I softly see value "Rich Text Area Test" for title "Description" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Text Area Test" for title "AutTestName" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Long Text Area Test" for title "Justification" inside table "---program:-:reviewStepTableId---"

  @FW-917 @FW-918 @FW-919 @FW-922 @FW-923 @US-FW-893
  Scenario: LWC: Table: PM: To verify that “Edit” option is displayed for Text Area, Long Text Area, and Rich Text Area fields, when data exists in Edit Mode.
  |LWC: Table: PM: To verify that clicking “Edit” allows modification of existing text in Text Area, Long Text Area, and Rich Text Area fields.|
  |LWC: Table: PM: To Verify correct option is displayed based on field content state as if field is empty then +Add text will display and if its already filled then Edit will display.|
  |LWC: Grid: PM: To verify that “Edit” option is displayed for Text Area, Long Text Area, and Rich Text Area fields, when data exists in Edit Mode.|
  |LWC: Grid: PM: To verify that clicking “Edit” allows modification of existing text in Text Area, Long Text Area, and Rich Text Area fields.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn},AutTestName__c,Justification__c | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name       | Description         | AutTestName    | Justification       |
      | 4          | Automation Test | Rich Text Area Test | Text Area Test | Long Text Area Test |
    Then I softly see value "Rich Text Area Test" for title "Description" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Text Area Test" for title "AutTestName" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Long Text Area Test" for title "Justification" inside table "---program:-:reviewStepTableId---"
    When I click on "Edit" icon for "Automation Test" inside flex table with id "---program:-:reviewStepTableId---"
    Then I see "Edit" with "edit" icon displayed for field "Description__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "AutTestName__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "Justification__c" in created record
    And I enter text area value "Modify Rich Text Area Test" inside field value "Description__c"
    And I enter text area value "Modify Text Area Test" inside field value "AutTestName__c"
    And I enter text area value "Modify Long Text Area Test" inside field value "Justification__c"
    And I click on top right button "Save" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see value "Modify Rich Text Area Test" for title "Description" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Modify Text Area Test" for title "AutTestName" inside table "---program:-:reviewStepTableId---"
    Then I softly see value "Modify Long Text Area Test" for title "Justification" inside table "---program:-:reviewStepTableId---"
    And I click on top right button "New" in flex table with id "---program:-:reviewStepTableId---"
    Then I see "Add text" with "add" icon displayed for field "Description__c" in created record
    Then I see "Add text" with "add" icon displayed for field "AutTestName__c" in created record
    Then I see "Add text" with "add" icon displayed for field "Justification__c" in created record

  @FW-921 @US-FW-893
  Scenario: LWC: Grid: PM: To Verify that clicking “+ Add Text” allows the user to enter text in the Text Area, Long Text Area, and Rich Text Area fields, and that the entered text is visible in View mode.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn},AutTestName__c,Justification__c | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I click on top right button "New" in flex table with id "---program:-:reviewStepTableId---"
    And I click on "Description__c" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see "Description" opens in overLay window
    When I click modal button "Cancel"
    And I click on "AutTestName__c" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see "AutTestName" opens in overLay window
    When I click modal button "Cancel"
    And I click on "Justification__c" in flex table with id "---program:-:reviewStepTableId---"
    Then I softly see "Justification" opens in overLay window
    When I click modal button "Cancel"

  @FW-924 @US-FW-893
  Scenario: LWC: Grid: PM: To Verify correct option is displayed based on field content state as if field is empty then +Add text will display and if its already filled then Edit will display.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn},AutTestName__c,Justification__c | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:reviewStepTableId---" by clicking "New" :
      | Step Order | Step Name       | Description         | AutTestName    | Justification       |
      | 4          | Automation Test | Rich Text Area Test | Text Area Test | Long Text Area Test |
    When I click on "Edit" icon for "Automation Test" inside flex table with id "---program:-:reviewStepTableId---"
    Then I see "Edit" with "edit" icon displayed for field "Description__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "AutTestName__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "Justification__c" in created record

  @FW-928 @FW-929 @FW-930 @FW-931 @FW-926 @US-FW-893
  Scenario: LWC: Table: SPI: To Verify that “+" icon with Add text option is displayed for Text Area/Long text area/Rich text area when no data exists in Edit Mode.
  |LWC: Table: SPI: To verify that “Edit” option is displayed for Text Area, Long Text Area, and Rich Text Area fields, when data exists in Edit Mode.|
  |LWC: Table: SPI: To verify that clicking “Edit” allows modification of existing text in Text Area, Long Text Area, and Rich Text Area fields.|
  |LWC: Table: SPI: To verify that clicking “Edit” allows modification of existing text in Text Area, Long Text Area, and Rich Text Area fields.|
  |LWC: Table: SPI: To Verify correct option is displayed based on field content state as if field is empty then +Add text will display and if its already filled then Edit will display.|
  |LWC: Table: SPI: To Verify that clicking “+ Add Text” allows the user to enter text in the Text Area, Long Text Area, and Rich Text Area fields, and that the entered text is visible in View mode.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:PreAppContactTableForSPI.DFN},Text_Area__c,Long_Text_Area__c,Rich_Text_Area__c | PreAppContact      |                           |                            |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---preApplication:-:preAppContactTableId---"
    Then I see "Add text" with "add" icon displayed for field "Text_Area__c" in created record
    Then I see "Add text" with "add" icon displayed for field "Long_Text_Area__c" in created record
    Then I see "Add text" with "add" icon displayed for field "Rich_Text_Area__c" in created record
    And I enter text area value "Text Area Test" inside field value "Text_Area__c"
    And I enter text area value "Long Text Area Test" inside field value "Long_Text_Area__c"
    And I enter text area value "Rich Text Area Test" inside field value "Rich_Text_Area__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:preAppContactTableId---"
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---preApplication:-:preAppContactTableId---"
    Then I see "Edit" with "edit" icon displayed for field "Text_Area__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "Long_Text_Area__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "Rich_Text_Area__c" in created record
    And I enter text area value "Modify Text Area Test" inside field value "Text_Area__c"
    And I enter text area value "Modify Long Text Area Test" inside field value "Long_Text_Area__c"
    And I enter text area value "Modify Rich Text Area Test" inside field value "Rich_Text_Area__c"
    And I click on top right button "Save" in flex table with id "---preApplication:-:preAppContactTableId---"
    Then I softly see value "Modify Text Area Test" for title "Text Area" inside table "---preApplication:-:preAppContactTableId---"
    Then I softly see value "Modify Long Text Area Test" for title "Long Text Area" inside table "---preApplication:-:preAppContactTableId---"
    Then I softly see value "Modify Rich Text Area Test" for title "Rich Text Area" inside table "---preApplication:-:preAppContactTableId---"

  @FW-932 @FW-933 @FW-934 @FW-935 @FW-936 @US-FW-893
  Scenario: LWC: Grid: SPI: To Verify that “+" icon with Add text option is displayed for Text Area/Long text area/Rich text area when no data exists in Edit Mode.
  |LWC: Grid: SPI: To Verify that clicking “+ Add Text” allows the user to enter text in the Text Area, Long Text Area, and Rich Text Area fields, and that the entered text is visible in View mode.|
  |LWC: Grid: SPI: To verify that “Edit” option is displayed for Text Area, Long Text Area, and Rich Text Area fields, when data exists in Edit Mode.|
  |LWC: Grid: SPI: To verify that clicking “Edit” allows modification of existing text in Text Area, Long Text Area, and Rich Text Area fields.|
  |LWC: Grid: SPI:  To verify that clicking “Edit” allows modification of existing text in Text Area, Long Text Area, and Rich Text Area fields.|
  |WC: Grid: SPI: To Verify correct option is displayed based on field content state as if field is empty then +Add text will display and if its already filled then Edit will display.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                 | coreComponentField | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ParentFlexTable1.dfn} |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                   | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ParentFlexTable1.dfn},ParentTextArea__c,ParentRichTextArea__c,ParentLongTextArea__c | TestAutomationFlexTable1 |                           |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "5" seconds
    And I perform quick search for "Test Category 19" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I click on "Edit" icon for "Test Category 19" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I enter text area value "" inside field value "ParentTextArea__c"
    And I enter text area value "" inside field value "ParentLongTextArea__c"
    And I enter text area value "" inside field value "ParentRichTextArea__c"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I click on "Edit" icon for "Test Category 19" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see "Add text" with "add" icon displayed for field "ParentTextArea__c" in created record
    Then I see "Add text" with "add" icon displayed for field "ParentRichTextArea__c" in created record
    Then I see "Add text" with "add" icon displayed for field "ParentLongTextArea__c" in created record
    And I enter text area value "Text Area Test" inside field value "ParentTextArea__c"
    And I enter text area value "Long Text Area Test" inside field value "ParentLongTextArea__c"
    And I enter text area value "Rich Text Area Test" inside field value "ParentRichTextArea__c"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    And I perform quick search for "Test Category 19" in "---flexgrid:-:TestAutomationFlexGrid1---" panel
    And I click on "Edit" icon for "Test Category 19" inside flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I see "Edit" with "edit" icon displayed for field "ParentTextArea__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "ParentLongTextArea__c" in created record
    Then I see "Edit" with "edit" icon displayed for field "ParentRichTextArea__c" in created record
    And I enter text area value "Modify Text Area Test" inside field value "ParentTextArea__c"
    And I enter text area value "Modify Long Text Area Test" inside field value "ParentLongTextArea__c"
    And I enter text area value "Modify Rich Text Area Test" inside field value "ParentRichTextArea__c"
    And I click on top right button "Save" in flex table with id "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Modify Text Area Test" for title "ParentTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Modify Long Text Area Test" for title "ParentLongTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"
    Then I softly see value "Modify Rich Text Area Test" for title "ParentRichTextArea" inside table "---flexgrid:-:TestAutomationFlexGrid1---"

  @535147 @535147 @535116 @535114 @US-509159
  Scenario: LWC: Form: Admin/PM: To verify that option of launching a modal should be present at the end of the lookup suggestions.
  |LWC: Form: Admin/PM: To verify that option of launching a modal should be present at the end of the lookup suggestions.|
  |LWC: Modal: Admin/PM: To verify that when user click on the modal option then the modal carrying the entire data of custom lookup should come up on the screen|
  |LWC: Modal: Admin/PM: To verify that when user search in the lookup by keyword then initially limited number of records should be displayed in the lookup.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    Then I softly see lookup table header displayed as below
      | Organization Name |
      | EIN               |
      | Organization Type |
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
      | SYSTEM                       |
      | Department of Product        |
    Then I softly see link "View All" inside Page block
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block
    Then I click on lookup custom lookup "View All"
    Then I softly see "Primary Funding Organization" opens in overLay window

  @535113 @535115 @US-509159
  Scenario: LWC: Modal: Admin/PM: To verify that when the user enters a keyword in the custom lookup field then a list of suggestion should be displayed beneath it.
  |LWC: Modal: Admin/PM: To verify that option of launching a modal should be present at the end of the lookup suggestions.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    And I enter value "Test Automation Organization" inside loookup from field "PrimaryFundingOrganization__c"
    Then I click on lookup custom lookup "View All"
    Then I see "lookup-dropdown" table contains "1 Results"
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |

  @535142 @535143 @US-509159
  Scenario: LWC: PAGE LAYOUT: Admin/PM: To verify that option of launching a modal should be present at the end of the lookup suggestions.
  |LWC: PAGE LAYOUT: Admin/PM: To verify that when user click on the modal option then the modal carrying the entire data of custom lookup should come up on the screen|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I click on lookup field "PrimaryFundingOrganization__c" search icon
    Then I softly see lookup table header displayed as below
      | Organization Name |
      | EIN               |
      | Organization Type |
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
      | SYSTEM                       |
      | Department of Product        |
    Then I softly see link "View All" inside Page block
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block
    Then I click on lookup custom lookup "View All"
    Then I softly see "Primary Funding Organization" opens in overLay window

  @535140 @535141 @US-509159
  Scenario: LWC: PAGE LAYOUT: Admin/PM: To verify that when the user enter a keyword in the custom lookup field then a list of suggestion should be displayed beneath it.
  |LWC: PAGE LAYOUT: Admin/PM: To verify that when user search in the lookup by keyword then initially limited number of records should be displayed in the lookup.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I enter value "Test Automation Organization" inside loookup from field "PrimaryFundingOrganization__c"
    Then I see "lookup-dropdown" table contains "1 Results"
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |

  @535148 @535146 @US-509159
  Scenario: LWC: Form: Admin/PM: To verify that when user click on the modal option then the modal carrying the entire data of custom lookup should come up on the screen|
  |LWC: Form: Admin/PM: To verify that when user search in the lookup by keyword then initially limited number of records should be displayed in the lookup.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
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
    Then I softly see field "Config: Form" inside page block
    And I click on remove for lookup from field "ConfigForm__c"
    And I click on lookup field "ConfigForm__c" search icon
    Then I softly see lookup or picklist records displayed as below
      | PSR: Program Progress Reports Grantee  |
      | PSR: Program Progress Reports Form     |
      | Program Specific Application form      |
      | NGOGrantorProgram                      |
      | AmendmentBudgetCategoryTemplateGrantee |
      | GranteeAwardBudgetCategoryTemplate     |
    Then I softly see link "View All" inside Page block
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block
    Then I click on lookup custom lookup "View All"
    Then I softly see "Select Record" opens in overLay window

  @535145 @535146 @US-509159
  Scenario: LWC: Form: Admin/PM: To verify that when the user enters a keyword in the custom lookup field then a list of suggestion should be displayed beneath it.
  |LWC: Form: Admin/PM: To verify that when user search in the lookup by keyword then initially limited number of records should be displayed in the lookup.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
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
    Then I softly see field "Config: Form" inside page block
    And I click on remove for lookup from field "ConfigForm__c"
    And I click on lookup field "ConfigForm__c" search icon
    And I enter value "NGOGrantorProgram" inside loookup from field "ConfigForm__c"
    Then I see "lookup-dropdown" table contains "1 Results"
    Then I softly see lookup or picklist records displayed as below
      | NGOGrantorProgram |

  @535152 @535153 @US-509159
  Scenario: LWC: Form: SPI: To verify that option of launching a modal should be present at the end of the lookup suggestions.
  |LWC: Form: SPI: To verify that when user click on the modal option then the modal carrying the entire data of custom lookup should come up on the screen|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue  coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                       | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                       | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true          | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
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
    And I click on lookup field "Contact__c" search icon
    Then I softly see link "View All" inside Page block
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block
    Then I click on lookup custom lookup "View All"
    Then I softly see "Select Record" opens in overLay window
    When I click on button "resetIcon" in flex table with id "lookupTable"
    When I perform quick search for "Automation SPI3" in "lookupTable" panel
    Then I softly see value "Automation SPI3" for title "Full Name" inside table "lookupTable"

  @535150 @535151 @US-509159
  Scenario:LWC: Form: SPI: To verify that when the user enters a keyword in the custom lookup field then a list of suggestion should be displayed beneath it.
  |LWC: Form: SPI: To verify that when user search in the lookup by keyword then initially limited number of records should be displayed in the lookup.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue  coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                       | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                       | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true          | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
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
    And I enter value "Automation S" inside loookup from field "Contact__c"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |
      | Automation SA   |
      | Automation SPA  |

  @FW-898 @FW-899 @FW-901 @FW-902 @FW-904 @FW-958 @US-FW-897
  Scenario Outline: TC - E-Table File Upload - Admin - To verify File upload option should be available in the column of the Table
  |TC - E-Table File Upload - PM - To verify File upload option should be available in the column of the Table|
  |TC - E-Table File Upload - Admin - To verify on clicking file upload option Upload files modal should be open successfully|
  |TC - E-Table File Upload - PM - To verify on clicking file upload option Upload files modal should be open successfully|
  |TC - E-Table File Upload - Admin - To verify on 'Upload files from computer' and 'Upload files from library' options available on the Upload fiels modal|
  |TC - E-Table File Upload - PM - To verify on 'Upload files from computer' and 'Upload files from library' options available on the Upload fiels modal|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                         | filterId         |
      | Flex Table            | Display Field Names | USGovernmentParticipation__c,{SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Enable File Upload  | true                                                      | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                             | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Flex Table:General    | Display Field Names | USGovernmentParticipation__c,{SavedValue:ContactTableDFN} | DataTableEnhanceProgramContacts |                           |                                           |
      | Flex Table List       | Enable File Upload  | true                                                      | DataTableEnhanceProgramContacts | Name                      | {SavedValue:USGovernmentParticipation__c} |
    When I login to "As a Grantor" app as "<User>" user
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    Then I softly see value "Upload Files" for title "US Government Participation" inside table "---program:-:contactsTableId---"
    And I click the "Upload Files" button for the field "USGovernmentParticipation__c" inside the "---program:-:contactsTableId---" table.
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details

    Examples:
      | User  |
      | ADMIN |
      | PM    |

  @FW-900 @FW-903 @FW-959 @US-FW-897
  Scenario: TC - E-Table File Upload - SPI - To verify File upload option should be available in the column of the Table
  |TC - E-Table File Upload - SPI - To verify on clicking file upload option Upload files modal should be open successfully|
  |TC - E-Table File Upload - SPI - To verify on 'Upload files from computer' and 'Upload files from library' options available on the Upload fiels modal|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Enable File Upload  | true                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | USGovernmentParticipation__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                                              |
      | Flex Table List       | Enable File Upload  | true                                                         | AppContact         | Name                      | {SavedValue:SPIUSGovernmentParticipation__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "4" seconds
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    And I click on top right button "Associate" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    When I perform quick search for "{SavedValue:PM Username}" in "---applicationIntake:-:applicationAssociateTableId---" panel
    When I click "Add" after selection of "{SavedValue:PM Username}" in the table "---applicationIntake:-:applicationAssociateTableId---"
    When I click modal button "Close"
    Then I softly see value "Upload Files" for title "US Government Participation" inside table "---applicationIntake:-:applicationContactsTableId---"
    And I click the "Upload Files" button for the field "USGovernmentParticipation__c" inside the "---applicationIntake:-:applicationContactsTableId---" table.
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details

  @US-550778 @FW-22877 @FW-22878 @FW-22881
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field.|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field.|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           |
      | Automation PM1 |
    #FW-22877
    Then I softly see value "Automation PM1" for title "Name" inside table "---program:-:approverTableId---"
    And I click on "Edit" icon for "Automation PM1" inside flex table with id "---program:-:approverTableId---" without waiting for record
    And I click on remove for lookup from field "Name__r.Name"
   #FW-22878
    Then I softly see "Automation PM1" as the last search history value in column "Name__r.Name" inside the flex table with id "---program:-:approverTableId---"

  @US-550778 @FW-22876
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM  |
      | Automation PM1 |
      | Automation FO  |
      | Automation FO1 |

  @US-550778 @FW-22879 @FW-22880
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name           |
      | Automation PM1 |
    And I click on "Edit" icon for "Automation PM1" inside flex table with id "---program:-:approverTableId---" without waiting for record
    And I click on remove for lookup from field "Name__r.Name"
    Then I softly do not see remove x icon for lookup field "Name__r.Name"
    Then I softly see Undo icon for lookup field "Name__r.Name"
    And I click on undo for lookup from field "Name__r.Name"
    And I click on top right button "Save" in flex table with id "---program:-:approverTableId---"
    Then I softly see "Automation PM1" as the last search history value in column "Name__r.Name" inside the flex table with id "---program:-:approverTableId---"

  @US-550778 @FW-22882 @FW-22883 @FW-22884 @FW-22885 @FW-22886 @FW-22887
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - E Table - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field.|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field.|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---preApplication:-:preAppContactTableId---"
    Then I softly see remove x icon for lookup field "Contact__r.Name"
    And I click on remove for lookup from field "Contact__r.Name"
    And I wait for "5" seconds
    Then I softly see "Automation SPI3" as the last search history value in column "Contact__r.Name" inside the flex table with id "---preApplication:-:preAppContactTableId---"
    Then I softly see Undo icon for lookup field "Contact__r.Name"
    And I click on undo for lookup from field "Contact__r.Name"
    And I click on top right button "Save" in flex table with id "---preApplication:-:preAppContactTableId---"
    Then I softly see value "Automation SPI3" for title "Name" inside table "---preApplication:-:preAppContactTableId---"

  @US-550778 @FW-22889
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - SPI - To verify when a user clicks on search lookup field then user can select any items from dropdown list
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Project Role             | Name                       |
      | Project Director/Manager | {SavedValue:SPI3 Username} |
    Then I softly see value "Automation SPI3" for title "Name" inside table "---preApplication:-:preAppContactTableId---"

  @US-550778 @FW-22888 @FW-22890 @FW-22891 @FW-22892 @FW-22893
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - SPI - To verify when a user clicks on search lookup field then dropdown list of items should be display
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - SPI - To verify when a user clicks on search lookup field then user should see last selected result in the field.|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - SPI - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field.|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - SPI - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Grid - SPI - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                  | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetPeriodDFN},PaymentRequest__c | EnhanceAppGrantorBudgetPeriods |                           |                            |
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
      | Budget Period # | Payment Request               |
      | BP01            | {SavedValue:PaymentRequestId} |
    And I wait for "5" seconds
    And I click on "Edit" icon for "BP01" inside flex table with id "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see remove x icon for lookup field "PaymentRequest__r.Name"
    And I click on remove for lookup from field "PaymentRequest__r.Name"
    And I wait for "5" seconds
    Then I softly see "{SavedValue:PaymentRequestId}" as the last search history value in column "PaymentRequest__r.Name" inside the flex table with id "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see Undo icon for lookup field "PaymentRequest__r.Name"
    And I click on undo for lookup from field "PaymentRequest__r.Name"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see value "{SavedValue:PaymentRequestId}" for title "Payment Request" inside table "---applicationReview:-:budgetPeriodTableId---"

  @US-550778 @FW-22870 @FW-22871 @FW-22872 @FW-22873 @FW-22874 @FW-22875
  Scenario: LWC - Provision of Undo and show last search history in search custom lookup field - E Table - Admin/PM - To verify when a user clicks on search lookup field then dropdown list of items should be display
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - Admin/PM - To verify when a user clicks on search lookup field then user can select any items from dropdown list|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - Admin/PM - To verify when a user clicks on search lookup field then user should see last selected result in the field.|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then they should see last selected result in the field.|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - Admin/PM - To verify when a user clicks on the close icon of search lookup field, then Undo action should be display|
  |LWC - Provision of Undo and show last search history in search custom lookup field - E Table - Admin/PM - To verify when a user clicks on undo icon then last selected option should be display and selected|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                   | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN}                        | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON | {govgrants_config:defaultEditActionOnContactsTable} | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName            | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names  | {SavedValue:ContactTableDFN},BudgetPeriod__c | DataTableEnhanceProgramContacts |                           |                            |
      | Flex Table Action     | Hide Expression JSON |                                              | DataTableEnhanceProgramContacts | Name                      | Edit                       |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Budget Period |
      | {SavedValue:PM Username} | BP-103323     |
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see remove x icon for lookup field "BudgetPeriod__r.Name"
    And I click on remove for lookup from field "BudgetPeriod__r.Name"
    And I wait for "5" seconds
    Then I softly see "{SavedValue:PaymentRequestId}" as the last search history value in column "BudgetPeriod__r.Name" inside the flex table with id "---program:-:contactsTableId---"
    Then I softly see Undo icon for lookup field "BudgetPeriod__r.Name"
    And I click on undo for lookup from field "BudgetPeriod__r.Name"
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see value "BP-103323" for title "Budget Period" inside table "---program:-:contactsTableId---"

  @FW-635 @FW-636
  Scenario:TC - LWC – Modal (PM) – To Verify ‘Required for Submit’ validation error message Should displayed for data types.
  |TC - LWC – Modal (PM) – To Verify that after clicking the close icon, the error message becomes invisible.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | PeerReviewGrantor  | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:21 |

    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEmail__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAgency__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAward__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEvaluationStatus__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewJustification__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPhone__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewURL__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewNumber__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewCurrency__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPercentage__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewDate__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEmail__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAgency__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAward__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEvaluationStatus__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewJustification__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPhone__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewURL__c}              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewNumber__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewCurrency__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPercentage__c}       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewDate__c}             |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I click on "Enter Review" icon for "{SavedValue:PM Username}" inside table
    And I wait for "2" seconds
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required.               |
      | Email is required.                |
      | Comments is required.             |
      | Award is required.                |
      | Justification is required.        |
      | PeerReviewCurrency is required.   |
      | PeerReviewDate is required.       |
      | PeerReviewNumber is required.     |
      | PeerReviewPercentage is required. |
      | PeerReviewPhone is required.      |
      | PeerReviewURL is required.        |
    And I click on Required field(s) missing error message close icon
    Then I softly cannot see the following messages in the page details contains:
      | Rating is required.               |
      | Email is required.                |
      | Comments is required.             |
      | Award is required.                |
      | Justification is required.        |
      | PeerReviewCurrency is required.   |
      | PeerReviewDate is required.       |
      | PeerReviewNumber is required.     |
      | PeerReviewPercentage is required. |
      | PeerReviewPhone is required.      |
      | PeerReviewURL is required.        |

  @FW-638
  Scenario: TC - LWC – Modal (PM) – To Verify that the field name in the error message is displayed in blue.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | PeerReviewGrantor  | ApiGeneratedId:21 |

    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEmail__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAgency__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAward__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEvaluationStatus__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewJustification__c}    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPhone__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewURL__c}              |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewNumber__c}           |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewCurrency__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPercentage__c}       |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewDate__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEmail__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAgency__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewAward__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewEvaluationStatus__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewJustification__c}    |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPhone__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewURL__c}              |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewNumber__c}           |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewCurrency__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewPercentage__c}       |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | PeerReviewGrantor  | Name                      | {SavedValue:PeerReviewDate__c}             |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I click on "Enter Review" icon for "{SavedValue:PM Username}" inside table
    And I click modal button "Save"
    And I wait for "5" seconds
    Then I softly see link "Rating" inside Page block
    Then I softly see link "Email" inside Page block
    Then I softly see link "Comments" inside Page block
    Then I softly see link "Award" inside Page block
    Then I softly see link "Justification" inside Page block
    Then I softly see link "PeerReviewCurrency" inside Page block
    Then I softly see link "PeerReviewDate" inside Page block
    Then I softly see link "PeerReviewNumber" inside Page block
    Then I softly see link "PeerReviewPercentage" inside Page block
    Then I softly see link "PeerReviewPhone" inside Page block
    Then I softly see link "PeerReviewURL" inside Page block

  @FW-698 @FW-701_1 @US-FW-602
  Scenario: TC - LWC – Layout (SPI) – To Verify ‘Required to Save’ validation error message Should displayed for all data types.
  |TC - LWC – Layout (SPI) – To Verify that after clicking the close icon, the error message becomes invisible.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField        | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | false             | Recipient Pre-Application | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:21 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:Pre_ApplicationLayoutURL__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:EmailRef1__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}        |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:Pre_ApplicationLayoutURL__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:EmailRef1__c}                |
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
    And I wait for "5" seconds
    When I click modal button "Save and Continue"
    And I wait for "10" seconds
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | X_History Reason is required to save. Enter it in the Applicant Information section on the Overview tab.             |
      | Pre Application Deadline is required to save. Enter it in the Applicant Information section on the Overview tab.     |
      | X_Record Incomplete is required to save. Enter it in the Applicant Information section on the Overview tab.          |
      | X_State Program is required to save. Enter it in the Applicant Information section on the Overview tab.              |
      | X_Type Of Application is required to save. Enter it in the Applicant Information section on the Overview tab.        |
      | X_Type Of Education Help is required to save. Enter it in the Applicant Information section on the Overview tab.     |
      | X_Type Of Education Provided is required to save. Enter it in the Applicant Information section on the Overview tab. |
      | X_Version ID is required to save. Enter it in the Applicant Information section on the Overview tab.                 |
      | Pre-ApplicationLayoutURL is required to save. Enter it in the Applicant Information section on the Overview tab.     |
      | EmailRef1 is required to save. Enter it in the Applicant Information section on the Overview tab.                    |
    And I click on Required field(s) missing error message close icon
    Then I softly cannot see the following messages in the page details contains:
      | X_History Reason is required to save. Enter it in the Applicant Information section on the Overview tab.             |
      | Pre Application Deadline is required to save. Enter it in the Applicant Information section on the Overview tab.     |
      | X_Record Incomplete is required to save. Enter it in the Applicant Information section on the Overview tab.          |
      | X_State Program is required to save. Enter it in the Applicant Information section on the Overview tab.              |
      | X_Type Of Application is required to save. Enter it in the Applicant Information section on the Overview tab.        |
      | X_Type Of Education Help is required to save. Enter it in the Applicant Information section on the Overview tab.     |
      | X_Type Of Education Provided is required to save. Enter it in the Applicant Information section on the Overview tab. |
      | X_Version ID is required to save. Enter it in the Applicant Information section on the Overview tab.                 |
      | Pre-ApplicationLayoutURL is required to save. Enter it in the Applicant Information section on the Overview tab.     |
      | EmailRef1 is required to save. Enter it in the Applicant Information section on the Overview tab.                    |

  @US-FW-602 @FW-708
  Scenario: TC - LWC – Layout (SPI) – To Verify that the field name in the error message is displayed in blue.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | coreComponentField        | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:0  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | ApiGeneratedId:10 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:11 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:12 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:13 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:14 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:15 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:16 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:17 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:18 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:19 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:20 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Recipient Pre-Application | ApiGeneratedId:21 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}   |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}             |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}      |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}  |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:Pre_ApplicationLayoutURL__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application | Name                      | {SavedValue:EmailRef1__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:HistoryReason__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:PreApplicationDeadline__c}   |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RecordIncomplete__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:RequiredMatch__c}            |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:StateProgram__c}             |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfApplication__c}        |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationHelp__c}      |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:TypeOfEducationProvided__c}  |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:VersionID__c}                |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:Pre_ApplicationLayoutURL__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application | Name                      | {SavedValue:EmailRef1__c}                |
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
    And I wait for "10" seconds
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    Then I softly see link "X_History Reason" inside Page block
    Then I softly see link "Pre Application Deadline" inside Page block
    Then I softly see link "X_Record Incomplete" inside Page block
    Then I softly see link "X_State Program" inside Page block
    Then I softly see link "X_Type Of Application" inside Page block
    Then I softly see link "X_Type Of Education Help" inside Page block
    Then I softly see link "X_Type Of Education Provided" inside Page block
    Then I softly see link "X_Version ID" inside Page block
    Then I softly see link "Pre-ApplicationLayoutURL" inside Page block
    Then I softly see link "EmailRef1" inside Page block

  @FW-964 @US-FW-897
  Scenario: TC - E-Table File Upload - SPI - To verify user can attache one or more files from 'Upload files from Computer' section
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Enable File Upload  | true                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table:General    | Display Field Names | OtherProjectRole__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                                       |
      | Flex Table List       | Enable File Upload  | true                                                | AppContact         | Name                      | {SavedValue:OtherProjectRole__c_Text} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "4" seconds
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    Then I softly see value "Upload Files" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    And I click the "Upload Files" button for the field "OtherProjectRole__c" inside the "---applicationIntake:-:applicationContactsTableId---" table.
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details
    And I upload attachment without random number "Attachment.pdf" of type "Artifact" from computer
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Artifact" from computer
    And I upload attachment without random number "KPI_Field_Values.xlsx" of type "Artifact" from computer
    And I click on "Files Uploaded" tab at files library upload modal
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"
    Then I softly see value "KPI_Field_Values.xlsx" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"

  @FW-1398 @US-FW-897
  Scenario: TC - E-Table File Upload - SPI - To verify user can attach differnt types of extensions files (e.g., .pdf, .docx, .jpg, .png, .xls, etc.) in the table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Enable File Upload  | true                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table:General    | Display Field Names | OtherProjectRole__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                                       |
      | Flex Table List       | Enable File Upload  | true                                                | AppContact         | Name                      | {SavedValue:OtherProjectRole__c_Text} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "4" seconds
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    Then I softly see value "Upload Files" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    And I click the "Upload Files" button for the field "OtherProjectRole__c" inside the "---applicationIntake:-:applicationContactsTableId---" table.
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details
    And I upload attachment without random number "Attachment.pdf" of type "Artifact" from computer
    And I upload attachment without random number "KPI_Field_Values.xlsx" of type "Artifact" from computer
    And I upload attachment without random number "actionsAtEgrid.png" of type "Artifact" from computer
    And I upload attachment without random number "DuplicateFile.txt" of type "Artifact" from computer
    And I upload attachment without random number "TC Collab.png" of type "Artifact" from computer
    And I click on "Files Uploaded" tab at files library upload modal
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"
    Then I softly see value "KPI_Field_Values.xlsx" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"
    Then I softly see value "actionsAtEgrid.png" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"
    Then I softly see value "DuplicateFile.txt" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"
    Then I softly see value "TC Collab.png" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"

  @FW-1427 @US-FW-897
  Scenario:TC - E-Table File Upload - SPI - To verify the Delete/Remove icons should be display in front of the uploaded file name
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Enable File Upload  | true                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table:General    | Display Field Names | OtherProjectRole__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                                       |
      | Flex Table List       | Enable File Upload  | true                                                | AppContact         | Name                      | {SavedValue:OtherProjectRole__c_Text} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "4" seconds
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    Then I softly see value "Upload Files" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    And I click the "Upload Files" button for the field "OtherProjectRole__c" inside the "---applicationIntake:-:applicationContactsTableId---" table.
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details
    And I upload attachment without random number "Attachment.pdf" of type "Artifact" from computer
    Then I softly can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---preApplication:-:fileUploadedTableId---"
    Then I softly can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---preApplication:-:fileUploadedTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---preApplication:-:fileUploadedTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---preApplication:-:fileUploadedTableId---"

  @FW-1413 @US-FW-897
  Scenario: TC - E-Table File Upload - SPI - To verify the uploaded files should be securely stored in the backend and correctly linked to corresponding row
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Enable File Upload  | true                            | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                       | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table:General    | Display Field Names | OtherProjectRole__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                                       |
      | Flex Table List       | Enable File Upload  | true                                                | AppContact         | Name                      | {SavedValue:OtherProjectRole__c_Text} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "4" seconds
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I click on "Collapse" in page detail
    Then I softly see value "Upload Files" for title "Other Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    And I click the "Upload Files" button for the field "OtherProjectRole__c" inside the "---applicationIntake:-:applicationContactsTableId---" table.
    Then I softly see "Add File" opens in overLay window
    Then I see "Upload File from Computer" subtab is present in page details
    And I upload attachment without random number "Attachment.pdf" of type "Artifact" from computer
    And I click on "Files Uploaded" tab at files library upload modal
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---preApplication:-:fileUploadedTableId---"

  @US-FW-24086 @FW-24087
  Scenario:TC - Field Level Edit - Admin - To verify user can enable the field level edit functionality by enabeling 'enableInlineEdit' custom metadata
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I hovering mouse on help text icon inside page block detail "Abbreviation"
    Then I softly see the field "Abbreviation__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24088 @FW-24089
  Scenario Outline: TC - Field Level Edit - Admin - To verify user should be able to see the Edit(pencil) icon infront of Field label when hover on field in view layout
  |TC - Field Level Edit - PM - To verify user should be able to see the Edit(pencil) icon infront of Field label when hover on field in view layout|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active      | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly see the field "Audits__c" with the inline edit button displayed as a pencil icon

    Examples:
      | Users |
      | ADMIN |
      | PM    |

  @US-FW-24086 @FW-24096
  Scenario: TC - Field Level Edit - PM - To verify user should not be able to see the Edit(pencil) icon infront of Field label when hover on field in view layout if layout Edit action is hidden
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue       | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true                    | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Internal program Audits | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only      | false                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active      | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only      | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    And I create program records with status "Active" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "15" seconds
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly do not see the field "Audits__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24095
  Scenario:TC - Field Level Edit - Admin - To verify user should not be able to see the Edit(pencil) icon infront of Field label when hover on field in view layout if layout Edit action is hidden
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active      | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    And I perform quick search for "Automation Permanent Internal Program For Admin User" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "Automation Permanent Internal Program For Admin User" inside table
    And I wait for "15" seconds
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly do not see the field "Audits__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24101
  Scenario: TC - Field Level Edit - PM - To verify user should not be able to see the Edit(pencil) icon infront of Field label for Standard/Formula/Read only fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -1                | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                  |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:FormulaField_PrimaryFunderType} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -11              | Grantor State Program | Name                      | {SavedValue:FormulaField_PrimaryFunderType} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -12              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}         |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only For User | Internal         | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c}         |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "15" seconds
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly do not see the field "Audits__c" with the inline edit button displayed as a pencil icon
    And I refresh the page
    And I wait for "5" seconds
    When I hovering mouse on help text icon inside page block detail "Primary Funder Type"
    Then I softly do not see the field "PrimaryFunderType__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24103
  Scenario: TC - Field Level Edit - Admin - To verify user should be able to see the only respective page block should be editable when click on pencil icon of field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click the inline edit button for the "FocusAreaRequired__c" field with field label "Focus Areas Required?"
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly see the field "Audits__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24104
  Scenario:TC - Field Level Edit - PM - To verify user should be able to see the only respective page block should be editable when click on pencil icon of field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "15" seconds
    And I click the inline edit button for the "FocusAreaRequired__c" field with field label "Focus Areas Required?"
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly see the field "Audits__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24110 @FW-24114
  Scenario: TC - Field Level Edit - Admin - To verify user should be able to see the Cancel and Save actions footer below the page
  |TC - Field Level Edit - Admin - To verify that the Save and Cancel action's footer should be sticky on scrolling|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click the inline edit button for the "Audits__c" field with field label "Audits"
    Then I softly see inline edit footer button "Save"
    Then I softly see inline edit footer button "Cancel"

  @US-FW-24086 @FW-24112 @FW-24116
  Scenario: TC - Field Level Edit - PM - To verify user should be able to see the Cancel and Save actions footer below the page
  |TC - Field Level Edit - PM - To verify that the Save and Cancel action's footer should be sticky on scrolling|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "15" seconds
    And I click the inline edit button for the "Audits__c" field with field label "Audits"
    Then I softly see inline edit footer button "Save"
    Then I softly see inline edit footer button "Cancel"

  @US-FW-24086 @FW-24121
  Scenario: TC - Field Level Edit - Admin - To verify that if one page block section is already in edit mode and user clicks on the edit icon of another page block field then both the page blocks should be in edit mode
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
      | Page Block                               | Sort Order         | 0                 | ApiGeneratedId:4 |
      | Page Block                               | Sort Order         | 4                 | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block:Page Block Detail             | Sort Order         | 0                | Grantor State Program | Name                      | {pagelayout:Information_Program}                |
      | Page Block:Page Block Detail             | Sort Order         | 4                | Grantor State Program | Name                      | {pagelayout:ProgramSpecificSettingsPageBlockId} |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click the inline edit button for the "FocusAreaRequired__c" field with field label "Focus Areas Required?"
    Then I softly see fields "FocusAreaRequired__c" is in edit mode
    And I click the inline edit button for the "Abbreviation__c" field with field label "Abbreviation"
    Then I softly see fields "Abbreviation__c" is in edit mode

  @US-FW-24086 @FW-24122
  Scenario: TC - Field Level Edit - PM - To verify that if one page block section is already in edit mode and user clicks on the edit icon of another page block field then both the page blocks should be in edit mode
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
      | Page Block                               | Sort Order         | 0                 | ApiGeneratedId:4 |
      | Page Block                               | Sort Order         | 4                 | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block:Page Block Detail             | Sort Order         | 0                | Grantor State Program | Name                      | {pagelayout:Information_Program}                |
      | Page Block:Page Block Detail             | Sort Order         | 4                | Grantor State Program | Name                      | {pagelayout:ProgramSpecificSettingsPageBlockId} |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "FocusAreaRequired__c" field with field label "Focus Areas Required?"
    Then I softly see fields "FocusAreaRequired__c" is in edit mode
    And I click the inline edit button for the "Abbreviation__c" field with field label "Abbreviation"
    Then I softly see fields "Abbreviation__c" is in edit mode

  @US-FW-24086 @FW-24124
  Scenario: TC - Field Level Edit - Admin - To verify user should be able to see the custom or standard validation messages for invalid data in fields (e.g. Email, Phone)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
      | Page Block                               | Sort Order         | 0                 | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active          | true            | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Email | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                 | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -11             | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block:Page Block Detail             | Sort Order         | 0               | Grantor State Program | Name                      | {pagelayout:Information_Program} |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "Email_Test__c" field with field label "Email Test"
    And I enter value "InvalidEmailAddressTest" into field "Email_Test__c"
    Then I softly see inline edit footer button "Save"
    And I click on inline edit footer button "Save"
    Then I softly see the following messages in the page details contains:
      | Email Test: invalid email address: InvalidEmailAddressTest |

  @US-FW-24086 @FW-24125
  Scenario: TC - Field Level Edit - PM - To verify user should be able to see the error messages for required to save fields if no data added in required fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active          | true            | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Email | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                 | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -12             | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "ProgramName__c" field with field label "Program Name"
    And I enter value "" into field "ProgramName__c"
    And I click on inline edit footer button "Save"
    Then I softly see the following messages in the page details contains:
      | Program Name is required to save. Enter it in the Information section on the Overview tab. |

  @US-FW-24086 @FW-24127
  Scenario: TC - Field Level Edit - Admin - To verify that if 2 page blocks edited by field level edit then both the page blocks should be Saved or cancelled together using the footer Save and Cancel actions
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
      | Page Block                               | Sort Order         | 0                 | ApiGeneratedId:4 |
      | Page Block                               | Sort Order         | 4                 | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:TextField_Abbreviation}             |
      | Page Block:Page Block Detail             | Sort Order         | 0                | Grantor State Program | Name                      | {pagelayout:Information_Program}                |
      | Page Block:Page Block Detail             | Sort Order         | 4                | Grantor State Program | Name                      | {pagelayout:ProgramSpecificSettingsPageBlockId} |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "ApplicationProcedures__c" field with field label "Application Procedures"
    And I enter value "Test" into field "ApplicationProcedures__c"
    And I click the inline edit button for the "BeneficiaryEligibility__c" field with field label "Beneficiary Eligibility"
    And I enter value "Test" into field "BeneficiaryEligibility__c"
    And I click on inline edit footer button "Save"
    Then I softly see field "Application Procedures" as "Test"
    Then I softly see field "Beneficiary Eligibility" as "Test"

  @US-FW-24086 @FW-24128
  Scenario: TC - Field Level Edit - PM - To verify that if 2 page blocks edited by field level edit then both the page blocks should be Saved or cancelled together using the footer Save and Cancel actions
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:3 |
      | Page Block                               | Sort Order     | 5                 | ApiGeneratedId:4 |
      | Page Block                               | Sort Order     | 5                 | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active      | true             | Grantor State Program | Name                      | {SavedValue:ApplicationProcedures__c}  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits | Grantor State Program | Name                      | {SavedValue:BeneficiaryEligibility__c} |
      | Page Block Config:Page Block Rule Detail | Is Active      | true             | Grantor State Program | Name                      | {SavedValue:ApplicationProcedures__c}  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits | Grantor State Program | Name                      | {SavedValue:BeneficiaryEligibility__c} |
      | Page Block:Page Block Detail             | Sort Order     | -1               | Grantor State Program | Name                      | {SavedValue:AutomationPageBlock1}      |
      | Page Block:Page Block Detail             | Sort Order     | -1               | Grantor State Program | Name                      | {SavedValue:AutomationPageBlock2}      |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "ApplicationProcedures__c" field with field label "Application Procedures"
    And I enter value "Test" into field "ApplicationProcedures__c"
    And I click the inline edit button for the "BeneficiaryEligibility__c" field with field label "Beneficiary Eligibility"
    And I enter value "Test" into field "BeneficiaryEligibility__c"

  @US-FW-24086 @FW-24130 @FW-24131
  Scenario: TC - Field Level Edit - PM - To verify when user click on footer Save action then a toast message should be displayed with the text: "Record Saved Successfully"
  |TC - Field Level Edit - Admin - To verify when user click on footer Save action then a toast message should be displayed with the text: "Record Saved Successfully"|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:3 |
      | Page Block                               | Sort Order     | 5                 | ApiGeneratedId:4 |
      | Page Block                               | Sort Order     | 5                 | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active      | true             | Grantor State Program | Name                      | {SavedValue:ApplicationProcedures__c}  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits | Grantor State Program | Name                      | {SavedValue:BeneficiaryEligibility__c} |
      | Page Block Config:Page Block Rule Detail | Is Active      | true             | Grantor State Program | Name                      | {SavedValue:ApplicationProcedures__c}  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits | Grantor State Program | Name                      | {SavedValue:BeneficiaryEligibility__c} |
      | Page Block:Page Block Detail             | Sort Order     | -1               | Grantor State Program | Name                      | {SavedValue:AutomationPageBlock1}      |
      | Page Block:Page Block Detail             | Sort Order     | -1               | Grantor State Program | Name                      | {SavedValue:AutomationPageBlock2}      |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "ApplicationProcedures__c" field with field label "Application Procedures"
    And I enter value "Test" into field "ApplicationProcedures__c"
    And I click on inline edit footer button "Save"
    Then I softly see the following messages in the page details contains:
      | Record saved successfully |

  @US-FW-24086 @FW-24133
  Scenario:TC - Field Level Edit - Modal - Admin - To verify when the user clicks the field level edit icon Save and Cancel buttons should be displayed in the footer at the bottom-right side
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:PM Username}" inside table
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click the inline edit button for the "ReviewComments__c" field with field label "Comments"
    Then I softly see inline edit footer button "Save"
    Then I softly see inline edit footer button "Cancel"

  @US-FW-24086 @FW-24134
  Scenario:TC - Field Level Edit - Modal - PM - To verify when the user clicks the field level edit icon Save and Cancel buttons should be displayed in the footer at the bottom-right side
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I click on "Enter Review" icon for "{SavedValue:PM Username}" inside table
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click the inline edit button for the "ReviewComments__c" field with field label "Comments"
    Then I softly see inline edit footer button "Save"
    Then I softly see inline edit footer button "Cancel"

  @US-FW-24086 @FW-24137
  Scenario: TC - Field Level Edit - PM - To verify when user clicks on layout Edit action then alert popup should be display
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:FO Username}" inside table
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click the inline edit button for the "ReviewComments__c" field with field label "Comments"
    When I click modal button "Edit"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @US-FW-24086 @FW-24136
  Scenario:TC - Field Level Edit - Admin - To verify when user clicks on layout Edit action then alert popup should be display
    And I create program records with status "Draft" using "default-Automation ADMIN user" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:FO Username}" inside table
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click the inline edit button for the "ReviewComments__c" field with field label "Comments"
    When I click modal button "Edit"
    Then I softly see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @US-FW-24086 @FW-24140
  Scenario: TC - Field Level Edit - Admin - To verify when user click on footer's Cancel action then page blocks should be revert in view mode without save any changes
    And I create program records with status "Draft" using "default-Automation ADMIN user" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "{SavedValue:FO Username}" inside table
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:FO Username}" inside table
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click the inline edit button for the "ReviewComments__c" field with field label "Comments"
    When I click modal button "Cancel"
    Then I softly do not see message "You have unsaved changes. Do you want to discard them?" on confirmation box

  @US-FW-24086 @FW-24141
  Scenario: TC - Field Level Edit - PM - To verify when user click on footer's Cancel action then page blocks should be revert in view mode without save any changes
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Audits  | ApiGeneratedId:3 |
      | Page Block                               | Sort Order     | 5                 | ApiGeneratedId:4 |
      | Page Block                               | Sort Order     | 5                 | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Grantor State Program | Name                      | {SavedValue:ApplicationProcedures__c}  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text     | Grantor State Program | Name                      | {SavedValue:BeneficiaryEligibility__c} |
      | Page Block Config:Page Block Rule Detail | Is Active      | true          | Grantor State Program | Name                      | {SavedValue:ApplicationProcedures__c}  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text     | Grantor State Program | Name                      | {SavedValue:BeneficiaryEligibility__c} |
      | Page Block:Page Block Detail             | Sort Order     | -1            | Grantor State Program | Name                      | {SavedValue:AutomationPageBlock1}      |
      | Page Block:Page Block Detail             | Sort Order     | -1            | Grantor State Program | Name                      | {SavedValue:AutomationPageBlock2}      |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "ApplicationProcedures__c" field with field label "Application Procedures"
    And I enter value "Test" into field "ApplicationProcedures__c"
    And I click on inline edit footer button "Cancel"
    Then I softly see field "Application Procedures" as ""

  @US-FW-24086 @FW-24143
  Scenario: TC - Field Level Edit - Modal - Admin - To verify when the user clicks Save or Cancel actions then Close action should become visible on modal
    When I login to "As a Grantor" app as "Admin1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "Record Id" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Enter Review" icon for "{SavedValue:PM Username}" inside table
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click the inline edit button for the "ReviewComments__c" field with field label "Comments"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    Then I softly see inline edit footer button "Close"

  @US-FW-24086 @FW-24144 @FW-24155
  Scenario:TC - Field Level Edit - Modal - PM - To verify when the user clicks Save or Cancel actions then Close action should become visible on modal
  |Master TC - Field Level Edit - To verify that field level edit functionality should supported on Layout, Forms and Modals|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                 | Due Date |
      | Automation PM | Program Reviewer | Automation Test Description | 10       |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I pause execution for "3" seconds
    And I click on "Enter Review" icon for "{SavedValue:PM Username}" inside table
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    When I hovering mouse on help text icon inside page block detail "Comments"
    And I click the inline edit button for the "ReviewComments__c" field with field label "Comments"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    Then I softly see inline edit footer button "Close"

  @US-FW-24086 @FW-24145
  Scenario:TC - Field Level Edit - Admin - To verify user should be able to see unsaved data alert if click on any phase during field level edit
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Audits"
    And I click the inline edit button for the "Audits__c" field with field label "Audits"
    And I navigate to "Grants" tab
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @US-FW-24086 @FW-24146
  Scenario:TC - Field Level Edit - PM - To verify user should be able to see unsaved data alert if click on any phase during field level edit
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Audits"
    And I click the inline edit button for the "Audits__c" field with field label "Audits"
    And I navigate to "Grants" tab
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @US-FW-24086 @FW-24151
  Scenario:TC - Field Level Edit - Admin - To verify user should be able to edit the all datatype fields by field level edit (except Standard/Formula/Read Only)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly see the field "Audits__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24152 @FW-24155
  Scenario:TC - Field Level Edit - PM - To verify user should be able to edit the all datatype fields by field level edit (except Standard/Formula/Read Only)
  |Master TC - Field Level Edit - To verify that field level edit functionality should supported on Layout, Forms and Modals|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue    | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Is Active          | true             | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                  | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -15              | Grantor State Program | Name                      | {SavedValue:programLayoutAudits__c} |
    When I login to "As a Grantor" app as "Admin" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Audits"
    Then I softly see the field "Audits__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24835
  Scenario:TC - Field Level Edit - Admin - To verify user should be able to see the error messages for required to save fields if no data added in required fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active          | true            | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Email | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                 | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -12             | Grantor State Program | Name                      | {SavedValue:ProgramNameField} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "10" seconds
    And I click the inline edit button for the "ProgramName__c" field with field label "Program Name"
    And I enter value "" into field "ProgramName__c"
    And I click on inline edit footer button "Save"
    Then I softly see the following messages in the page details contains:
      | Program Name is required to save. Enter it in the Information section on the Overview tab. |

  @US-FW-24086 @FW-24841
  Scenario:TC - Field Level Edit - PM - To verify user should be able to see the custom or standard validation messages for invalid data in fields (e.g. Email, Phone)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName          | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active          | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Audits  | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Sort Order         | 10                | ApiGeneratedId:3 |
      | Page Block                               | Sort Order         | 0                 | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName          | fieldNewValue   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue       |
      | Page Block Config:Page Block Rule Detail | Is Active          | true            | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block Config:Page Block Rule Detail | Help Text Long     | Help Text Email | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block Config:Page Block Rule Detail | Read Only For User |                 | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block Config:Page Block Rule Detail | Sort Order         | -55             | Grantor State Program | Name                      | {SavedValue:Email_Test__c}       |
      | Page Block:Page Block Detail             | Sort Order         | 0               | Grantor State Program | Name                      | {pagelayout:Information_Program} |
    And I create program records with status "Draft" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "{SavedValue:Automation Runtime Program}" in "---program:-:programsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Program}" inside table
    And I wait for "10" seconds
    And I click the inline edit button for the "Email_Test__c" field with field label "Email Test"
    And I wait for "5" seconds
    And I enter value "InvalidEmailAddressTest" into field "Email_Test__c"
    Then I softly see inline edit footer button "Save"
    And I click on inline edit footer button "Save"
    Then I softly see the following messages in the page details contains:
      | Email Test: invalid email address: InvalidEmailAddressTest |

  @US-FW-24086 @FW-24090
  Scenario:TC - Field Level Edit - SPI - To verify user should be able to see the Edit(pencil) icon infront of Field label when hover on field in view layout
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | AOR Contact    | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "AOR Contact"
    Then I softly see the field "AOR_Contact__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24097
  Scenario:TC - Field Level Edit - SPI - To verify user should not be able to see the Edit(pencil) icon infront of Field label when hover on field in view layout when Edit action is hidden
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | AOR Contact    | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "AOR Contact"
    Then I softly do not see the field "AOR_Contact__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24102 @@FW-24102_1
  Scenario:TC - Field Level Edit - SPI - To verify user should not be able to see the Edit(pencil) icon infront of Field label for Standard/Formula/Read only fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationCreatedOutside__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override | AOR Contact    | Recipient ApplicationView | Name                      | {SavedValue:ApplicationCreatedOutside__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false          | Recipient ApplicationView | Name                      | {SavedValue:ApplicationCreatedOutside__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:ApplicationCreatedOutside__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "X_Application Created Outside the System"
    Then I softly do not see the field "ApplicationCreatedOutside__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24102 @FW-24102_2
  Scenario:TC - Field Level Edit - SPI - To verify user should not be able to see the Edit(pencil) icon infront of Field label for Standard/Formula/Read only fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:EGMSIDName}    |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                | Recipient ApplicationView | Name                      | {SavedValue:EGMSIDName}    |
      | Page Block Config:Page Block Rule Detail | Read Only            | false          | Recipient ApplicationView | Name                      | {SavedValue:EGMSIDName}    |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:EGMSIDName}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "EGMS ID"
    Then I softly do not see the field "Name" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24102 @FW-24102_3
  Scenario:TC - Field Level Edit - SPI - To verify user should not be able to see the Edit(pencil) icon infront of Field label for Standard/Formula/Read only fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue             | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | true                          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "Application Cover Page"
    Then I softly do not see the field "CoverPageDetail__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24105
  Scenario:TC - Field Level Edit - SPI - To verify user should be able to see the only respective page block should be editable when click on pencil icon of field
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue             | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "CoverPageDetail__c" field with field label "Application Cover Page"
    And I pause execution for "5" seconds
    When I "Collapse" page block contaninig value "Information"
    When I hovering mouse on help text icon inside page block detail "State"
    Then I softly see the field "State__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24113 @FW-24117
  Scenario:TC - Field Level Edit - SPI - To verify user should be able to see the Cancel and Save actions footer below the page
  |TC - Field Level Edit - SPI - To verify that the Save and Cancel action's footer should be sticky on scrolling|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "AOR_Contact__c" field with field label "AOR Contact"
    And I pause execution for "3" seconds
    Then I softly see inline edit footer button "Save"
    Then I softly see inline edit footer button "Cancel"

  @US-FW-24086 @FW-24123
  Scenario:TC - Field Level Edit - SPI - To verify that if one page block section is already in edit mode and user clicks on the edit icon of another page block field then both the page blocks should be in edit mode
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue             | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "CoverPageDetail__c" field with field label "Application Cover Page"
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "Application Cover Page"
    Then I softly do not see the field "CoverPageDetail__c" with the inline edit button displayed as a pencil icon
    When I "Collapse" page block contaninig value "Information"
    When I hovering mouse on help text icon inside page block detail "State"
    Then I softly see the field "State__c" with the inline edit button displayed as a pencil icon
    And I click the inline edit button for the "State__c" field with field label "State"
    When I hovering mouse on help text icon inside page block detail "State"
    Then I softly do not see the field "State__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24126
  Scenario:TC - Field Level Edit - SPI - To verify user should be able to see the error messages for required to save fields if no data added in required fields
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue          | filterId         |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Text Area Field | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Automation Text Area Field | Recipient ApplicationView | Name                      | {SavedValue:TextField_City} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    When I "Collapse" page block contaninig value "Information"
    And I click the inline edit button for the "City__c" field with field label "City"
    And I pause execution for "5" seconds
    And I enter value "" into field "City__c"
    And I click on inline edit footer button "Save"
    Then I softly see the following messages in the page details contains:
      | City is required to save. Enter it in the Primary Place of Performance section on the Overview tab. |

  @US-FW-24086 @FW-24129
  Scenario:TC - Field Level Edit - SPI - To verify that if 2 page blocks edited by field level edit then both the page blocks should be Saved or cancelled together using the footer Save and Cancel actions
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue             | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "CoverPageDetail__c" field with field label "Application Cover Page"
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "Application Cover Page"
    Then I softly do not see the field "CoverPageDetail__c" with the inline edit button displayed as a pencil icon
    When I "Collapse" page block contaninig value "Information"
    When I hovering mouse on help text icon inside page block detail "State"
    Then I softly see the field "State__c" with the inline edit button displayed as a pencil icon
    And I click the inline edit button for the "State__c" field with field label "State"
    When I hovering mouse on help text icon inside page block detail "State"
    Then I softly do not see the field "State__c" with the inline edit button displayed as a pencil icon
    And I click on inline edit footer button "Save"
    Then I softly do not see inline edit footer button "Save"
    Then I softly do not see inline edit footer button "Cancel"

  @US-FW-24086 @FW-24132
  Scenario:TC - Field Level Edit - SPI - To verify when user click on footer Save action then a toast message should be displayed with the text: "Record Saved Successfully"
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue             | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                 | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue      |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                          | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                               | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false                         | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long rich text area | Recipient ApplicationView | Name                      | {SavedValue:CoverPageDetail__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "CoverPageDetail__c" field with field label "Application Cover Page"
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "Application Cover Page"
    Then I softly see the field "CoverPageDetail__c" with the inline edit button displayed as a pencil icon
    And I click on inline edit footer button "Save"
    Then I softly see the following messages in the page details contains:
      | Record saved successfully |

  @US-FW-24086 @FW-24138
  Scenario:TC - Field Level Edit - SPI - To verify when user clicks on layout Edit action then alert popup should be display
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "AOR_Contact__c" field with field label "AOR Contact"
    And I pause execution for "3" seconds
    When I click on "Edit" in the page details
    Then I softly see confirmation box with body "You have unsaved changes. Do you want to discard them?" is displayed
    Then I softly see "Cancel" button is displayed on confirmation box
    Then I softly see "Continue" button is displayed on confirmation box

  @US-FW-24086 @FW-24142
  Scenario:TC - Field Level Edit - SPI - To verify when user click on footer's Cancel action then page blocks should be revert in view mode without save any changes
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "AOR_Contact__c" field with field label "AOR Contact"
    And I pause execution for "3" seconds
    And I click on inline edit footer button "Cancel"
    When I hovering mouse on help text icon inside page block detail "AOR Contact"
    Then I softly see the field "AOR_Contact__c" with the inline edit button displayed as a pencil icon

  @US-FW-24086 @FW-24147
  Scenario:TC - Field Level Edit - SPI - To verify user should be able to see unsaved data alert if click on any phase during field level edit
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Read Only            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only            | false          | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long       | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    And I click the inline edit button for the "AOR_Contact__c" field with field label "AOR Contact"
    And I pause execution for "3" seconds
    And I navigate to "Grants" tab
    Then I softly see message "There are unsaved changes." on confirmation box
    Then I softly see message "If you leave this tab, you’ll lose your changes." on confirmation box

  @US-FW-24086 @FW-24153
  Scenario:TC - Field Level Edit - SPI - To verify user should be able to edit the all datatype fields by field level edit (except Standard/Formula/Read Only)
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName      | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long    | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long    | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Is Active      | true              | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long    | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName      | fieldNewValue  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                       |
      | Page Block Config:Page Block Rule Detail | Is Active      | true           | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c}                      |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AOR_Contact__c}                      |
      | Page Block Config:Page Block Rule Detail | Is Active      | true           | Recipient ApplicationView | Name                      | {SavedValue:ApplicationCreatedOutside__c}        |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:ApplicationCreatedOutside__c}        |
      | Page Block Config:Page Block Rule Detail | Is Active      | true           | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
      | Page Block Config:Page Block Rule Detail | Help Text Long | Help Text Long | Recipient ApplicationView | Name                      | {SavedValue:AreAnyStateSpecificFormsAttached__c} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I pause execution for "5" seconds
    When I hovering mouse on help text icon inside page block detail "AOR Contact"
    Then I softly see the field "AOR_Contact__c" with the inline edit button displayed as a pencil icon
    And I refresh the page
    When I hovering mouse on help text icon inside page block detail "X_Application Created Outside the System"
    Then I softly do not see the field "ApplicationCreatedOutside__c" with the inline edit button displayed as a pencil icon
    And I refresh the page
    When I hovering mouse on help text icon inside page block detail "Are any state specific forms attached?"
    Then I softly do not see the field "AreAnyStateSpecificFormsAttached__c" with the inline edit button displayed as a pencil icon

  @US-FW-24466 @FW-24467
  Scenario: LWC-PM-TABLE-To verify Rich Text Area field is displayed in table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see "TestRichText" in flex table header "---program:-:contactsTableId---"

  @US-FW-24466 @FW-24470
  Scenario: LWC-PM-TABLE-To verify character count is displayed while adding data
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText__c" enter "Automation Test" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 22, Characters Left: 131050"

  @US-FW-24466 @FW-24507
  Scenario: LWC-PM-TABLE-To verify user can enter characters less than the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText__c" enter "{SavedValue:char260}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see value "{SavedValue:char260}" for title "TestRichText" inside table "---program:-:contactsTableId---"

  @US-FW-24466 @FW-24508
  Scenario:LWC-PM-TABLE-To verify user can enter exactly the maximum configured character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                    | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see value "{SavedValue:chars493}" for title "TestRichText500Chars" inside table "---program:-:contactsTableId---"

  @US-FW-24466 @FW-24509
  Scenario:LWC-PM-TABLE-To verify validation message when pasted content exceeds the character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                    | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area and save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24510
  Scenario: LWC-PM-TABLE-To verify character counter decreases when characters are deleted
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                    | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char260}" in the Rich Text Area without save
    Then I softly see value "{SavedValue:char260}" for title "TestRichText500Chars" inside table "---program:-:contactsTableId---"
    Then I see character count below the Rich Text Area as "Characters: 278, Characters Left: 222"

  @US-FW-24466 @FW-24511
  Scenario: LWC-PM-TABLE-To verify user can save the record when text is within the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:chars493}" for title "TestRichText" inside table "---program:-:contactsTableId---"

  @US-FW-24466 @FW-24512
  Scenario: LWC-PM-TABLE-To verify validation message content
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                    | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},TestRichText500Chars__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area and save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24513
  Scenario: LWC-PM-Parent Grid-To verify Rich Text Area field is displayed in Parent Grid
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    And I click on top right button "New" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see "Description" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"

  @US-FW-24466 @FW-24514
  Scenario: LWC-PM-Parent Grid-To verify character count is displayed while typing
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    And I click on top right button "New" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see "Description" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on Add Text for field "Description__c" enter "Automation Test" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 22, Characters Left: 32746"

  @US-FW-24466 @FW-24515
  Scenario: LWC-PM-Parent Grid-To verify user can enter characters less than the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    And I click on top right button "New" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see "Description" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on Add Text for field "Description__c" enter "{SavedValue:chars493}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 500, Characters Left: 32268"

  @US-FW-24466 @FW-24516
  Scenario: LWC-PM-Parent Grid-To verify user can enter exactly the maximum configured character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "TestRichText500Chars" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:chars493}" for title "TestRichText500Chars" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @US-FW-24466 @FW-24517
  Scenario: LWC-PM-Parent Grid-To verify validation message when pasted content exceeds the character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "TestRichText500Chars" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area and save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24518
  Scenario: LWC-PM-Parent Grid-To verify character counter decreases when characters are deleted
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                               | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    And I click on top right button "New" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see "Description" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on Add Text for field "Description__c" enter "{SavedValue:char255}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 262, Characters Left: 32506"

  @US-FW-24466 @FW-24519
  Scenario:LWC-PM-Parent Grid-To verify user can save the record when text is within the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "TestRichText500Chars" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:chars493}" for title "TestRichText500Chars" inside table "---flexgrid:-:ProgramReviewStepParentTableId---"

  @US-FW-24466 @FW-24520
  Scenario: LWC-PM-Parent Grid-To verify validation message content
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                           | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepsParentGridTable.dfn} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:ReviewStepsParentGridTable.dfn} | ProgramReviewStepTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    When I navigate to "Setup" sub tab
    Then I softly see "TestRichText500Chars" in flex table header "---flexgrid:-:ProgramReviewStepParentTableId---"
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area and save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24521
  Scenario: LWC-PM-Child Grid-To verify Rich Text Area field is displayed in Grand Child Grid
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    Then I softly see "ChildTestRichText500Chars" in flex table header "---flexgrid:-:ProgramReviewStepChildTableId---"

  @US-FW-24466 @FW-24522
  Scenario:LWC-PM-Child Grid-To verify character count is displayed while typing
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" without waiting for record
    And I click on Add Text for field "ChildTestRichText500Chars__c" enter "{SavedValue:char255}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 262, Characters Left: 238"

  @US-FW-24466 @FW-24523
  Scenario: LWC-PM-Child Grid-To verify user can enter characters less than the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" without waiting for record
    And I click on Add Text for field "ChildTestRichText500Chars__c" enter "{SavedValue:char260}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see value "{SavedValue:char260}" for title "ChildTestRichText500Chars" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"

  @US-FW-24466 @FW-24524
  Scenario: LWC-PM-Child Grid-To verify user can enter exactly the maximum configured character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" without waiting for record
    And I click on Add Text for field "ChildTestRichText500Chars__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:chars493}" for title "ChildTestRichText500Chars" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"

  @US-FW-24466 @FW-24525
  Scenario: LWC-PM-Child Grid-To verify validation message when pasted content exceeds the character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" without waiting for record
    And I click on Add Text for field "ChildTestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area and save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24526
  Scenario: LWC-PM-Child Grid-To verify character counter decreases when characters are deleted
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" without waiting for record
    And I click on Add Text for field "ChildTestRichText500Chars__c" enter "{SavedValue:char255}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 262, Characters Left: 238"

  @US-FW-24466 @FW-24527
  Scenario: LWC-PM-Child Grid-To verify user can save the record when text is within the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" without waiting for record
    And I click on Add Text for field "ChildTestRichText500Chars__c" enter "{SavedValue:char255}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---flexgrid:-:ProgramReviewStepParentTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:char255}" for title "ChildTestRichText500Chars" inside table "---flexgrid:-:ProgramReviewStepChildTableId---"

  @US-FW-24466 @FW-24528
  Scenario: LWC-PM-Child Grid-To verify validation message content
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewFormsChildGridTable.dfn} | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | ChildTestRichText500Chars__c,{SavedValue:ReviewFormsChildGridTable.dfn} | ProgramReviewStepPanelTemplates |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    And I pause execution for "5" seconds
    And I click on "Edit" icon for "Pre-Screen" inside flex table with id "---flexgrid:-:ProgramReviewStepChildTableId---" without waiting for record
    And I click on Add Text for field "ChildTestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area without save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24529
  Scenario:LWC-SPI-TABLE-To verify Rich Text Area field is displayed in table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    And I click on "Collapse" in page detail
    And I pause execution for "2" seconds
    Then I softly see "TestRichText" in flex table header "---applicationIntake:-:applicationContactsTableId---"

  @US-FW-24466 @FW-24530
  Scenario: LWC-SPI-TABLE-To verify character count is displayed while typing
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "2" seconds
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText__c" enter "Automation Test" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 22, Characters Left: 131050"

  @US-FW-24466 @FW-24531
  Scenario: LWC-SPI-TABLE-To verify user can enter characters less than the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "2" seconds
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText__c" enter "Automation Test" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Automation Test" for title "TestRichText" inside table "---applicationIntake:-:applicationContactsTableId---"

  @US-FW-24466 @FW-24532
  Scenario:LWC-SPI-TABLE-To verify user can enter exactly the maximum configured character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "2" seconds
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "{SavedValue:chars493}" for title "TestRichText500Chars" inside table "---applicationIntake:-:applicationContactsTableId---"

  @US-FW-24466 @FW-24533
  Scenario: LWC-SPI-TABLE-To verify validation message when pasted content exceeds the character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "2" seconds
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area and save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24534
  Scenario: LWC-SPI-TABLE-To verify character counter decreases when characters are deleted
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "2" seconds
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char260}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 267, Characters Left: 233"

  @US-FW-24466 @FW-24535
  Scenario: LWC-SPI-TABLE-To verify user can save the record when text is within the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "2" seconds
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---applicationIntake:-:applicationContactsTableId---"
    Then I softly see value "{SavedValue:chars493}" for title "TestRichText500Chars" inside table "---applicationIntake:-:applicationContactsTableId---"

  @US-FW-24466 @FW-24536
  Scenario: LWC-SPI-TABLE-To verify validation message content
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue               | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:SPIContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | TestRichText500Chars__c,{SavedValue:SPIContactTableDFN} | AppContact         |                           |                            |
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
    And I pause execution for "2" seconds
    And I pause execution for "4" seconds
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationIntake:-:applicationContactsTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars500}" in the Rich Text Area without save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24537
  Scenario: LWC-SPI-Child Grid-To verify Rich Text Area field is displayed in Child Grid
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                 | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories} | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"

  @US-FW-24466 @FW-24538
  Scenario:LWC-SPI-Child Grid-To verify character count is displayed while typing
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},TestRichText500Chars__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"
    And I click on "Edit" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char255}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 262, Characters Left: 238"

  @US-FW-24466 @FW-24539
  Scenario: LWC-SPI-Child Grid-To verify user can enter characters less than the configured limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},TestRichText500Chars__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"
    And I click on "Edit" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char255}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 262, Characters Left: 238"

  @US-FW-24466 @FW-24539 @FW-24542
  Scenario: LWC-SPI-Child Grid-To verify user can enter characters less than the configured limit
  |LWC-SPI-Child Grid-To verify character counter decreases when characters are deleted|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},TestRichText500Chars__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"
    And I click on "Edit" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char255}" in the Rich Text Area without save
    Then I see character count below the Rich Text Area as "Characters: 262, Characters Left: 238"

  @US-FW-24466 @FW-24540 @FW-24543
  Scenario: LWC-SPI-Child Grid-To verify user can enter exactly the maximum configured character limit
  |LWC-SPI-Child Grid-To verify user can save the record when text is within the configured limit|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},TestRichText500Chars__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"
    And I click on "Edit" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars493}" in the Rich Text Area and save
    And I click on top right button "Save" in flex table with id "---applicationReview:-:budgetPeriodTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "{SavedValue:chars493}" for title "TestRichText500Chars" inside table "---applicationIntake:-:BudgetCategoriesTableId---"

  @US-FW-24466 @FW-24541
  Scenario: LWC-SPI-Child Grid-To verify validation message when pasted content exceeds the character limit
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},TestRichText500Chars__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"
    And I click on "Edit" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:chars500}" in the Rich Text Area without save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24544
  Scenario: LWC-SPI-Child Grid-To verify validation message content
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},TestRichText500Chars__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"
    And I click on "Edit" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "{SavedValue:char10000forLongTextArea}" in the Rich Text Area without save
    Then I softly see the following messages in the page details contains:
      | You can enter up to 500 characters. The content is too long. |

  @US-FW-24466 @FW-24710
  Scenario: LWC-PM-To Verify that character count should be displayed as 8, since a single space or Letter is treated as 8 characters title.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue             | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetCategories} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                         | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:BudgetCategories},TestRichText500Chars__c | EnhanceAppBudCateGrantorFlexTable |                           |                            |
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
    When I expand nested table containing column value "BP01"
    Then I softly see "TestRichText500Chars" in flex table header "---applicationReview:-:budgetTableId---"
    And I click on "Edit" icon for "Construction" inside flex table with id "---applicationReview:-:budgetTableId---" without waiting for record
    And I click on Add Text for field "TestRichText500Chars__c" enter "" in the Rich Text Area without save
    And I press space key
    Then I see character count below the Rich Text Area as "Characters: 8, Characters Left: 492"

  @FW-29967 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To verify that newly added file is displayed in the Add Files table.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly see value "1" for title "Version Number" inside table "---program:-:GrantorInternalProgramFilesTableId---"

  @FW-29969 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that Upload New Version option is available in the row actions for each file in the Add Files table.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "SendEmailAttachment.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    Then I can see row level action button "Upload New File Version" against "SendEmailAttachment.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @FW-29970 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that user can select Upload New Version and upload a valid file as a new version of an existing file.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see value "2" for title "Version Number" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---program:-:GrantorInternalProgramFilesTableId---"

  @FW-29971 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that the user can update an existing file without creating a new file record.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see value "2" for title "Version Number" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file "ScrollableTesting.pdf" with Reason for Change "Test Automation testing reason"
    Then I softly see value "3" for title "Version Number" inside table "---program:-:GrantorInternalProgramFilesTableId---"
    Then I softly see value "Test Automation testing reason" for title "Reason For Change" inside table "---program:-:GrantorInternalProgramFilesTableId---"

  @FW-29972 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that version history is preserved.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "ScrollableTesting.pdf" with Reason for Change "Test Automation testing reason"
    And I click on "View" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I click on "View File Details" button for snapshot view
    Then I see Version number "Version 2" with Reason for Change "Automation testing reason"
    Then I see Version number "Version 3" with Reason for Change "Test Automation testing reason"

  @FW-29979 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To verify that newly added file is displayed in the Add Files table.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ExternalPreApplicationFiles | Name                      |                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on "Collapse" in page detail
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly see value "1" for title "Version Number" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"

  @FW-29980 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that Upload New Version option is available in the row actions for each file in the Add Files table.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "SendEmailAttachment.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I softly see value "AttachmentTesting.pdf" for title "Title" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly see value "SendEmailAttachment.pdf" for title "Title" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I can see row level action button "Upload New File Version" against "SendEmailAttachment.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"


  @FW-29981 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that user can select Upload New Version and upload a valid file as a new version of an existing file.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see value "2" for title "Version Number" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"

  @FW-29982 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that the user can update an existing file without creating a new file record.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see value "2" for title "Version Number" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "ScrollableTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file "ScrollableTesting.pdf" with Reason for Change "Test Automation testing reason"
    Then I softly see value "3" for title "Version Number" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I softly see value "Test Automation testing reason" for title "Reason For Change" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"

  @FW-29983 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that version history is preserved.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "ScrollableTesting.pdf" with Reason for Change "Test Automation testing reason"
    And I click on "View" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I click on "View File Details" button for snapshot view
    Then I see Version number "Version 2" with Reason for Change "Automation testing reason"
    Then I see Version number "Version 3" with Reason for Change "Test Automation testing reason"

  @FW-29973 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that user can cancel the file upload without modifying the existing file.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    And I click modal button "Cancel upload"

  @FW-29975 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that Upload New Version action based on user permissions.
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I cannot see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @FW-29976 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that entire page refresh after successful file upload.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |

  @FW-29977 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that Refresh the grid after successful file upload.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---program:-:GrantorInternalProgramFilesTableId---"

  @FW-29978 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To Verify that Close modal and refresh grid after successful file upload.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I see Version number "Version 1" with Reason for Change "Automation testing reason"

  @FW-29985 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that Upload New Version action based on user permissions.
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I cannot see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"

  @FW-29986 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that entire page refresh after successful file upload.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |

  @FW-29987 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that Refresh the grid after successful file upload.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"

  @FW-29988 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To Verify that Close modal and refresh grid after successful file upload.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |
    Then I softly see value "Automation testing reason" for title "Reason For Change" inside table "---preApplication:-:ExternalPreApplicationFilesTableId---"
    Then I see Version number "Version 1" with Reason for Change "Automation testing reason"

  @FW-30018 @US-FW-29966
  Scenario: LWC- ADD FILES- PM- To verify that all messages are displayed in the proper format with correct UI alignment.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                        | filterId         |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                            | coreComponentField          | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Title,GNT__Classification__c,GNT__FileExtension__c,Description,CreatedDate,VersionNumber,ReasonForChange | GrantorInternalProgramFiles | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Financial Artifacts" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---program:-:GrantorInternalProgramFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |

  @FW-30019 @US-FW-29966
  Scenario: LWC- ADD FILES- SPI- To verify that all messages are displayed in the proper format with correct UI alignment.
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    And I pause execution for "3" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Pre-Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I wait for "3" seconds
    And I pause execution for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "7" seconds
    And I click modal button "Close"
    Then I can see row level action button "Upload New File Version" against "AttachmentTesting.pdf" in flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---"
    And I click on "Upload New File Version" icon for "AttachmentTesting.pdf" inside flex table with id "---preApplication:-:ExternalPreApplicationFilesTableId---" without waiting for record
    And I upload a new version of the file without random number "SendEmailAttachment.pdf" with Reason for Change "Automation testing reason"
    Then I softly see the following messages in the page details contains:
      | New file version uploaded successfully for "AttachmentTesting.pdf". |