@Sprint-2026 @SprintWise2026
Feature: Layout - Support to hide layout page blocks and fields on basis of child record value (Table records).
Business Need: In this user story framework will provide support to hide page blocks and fields on layout based on child record value.
1.@US-549836
2.@US-535590
3.@US-552223
4.@US-539849
5.@US-551588
6.@US-547787
7.@US-541037
8.@US-551586
9.@US-551599
10.@US-551587
11.@US-545077

  @550464 @550471_1 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that TAB should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                          | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN}                                           | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValuePMuser                 | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldGreaterThanEqualValuePMuser | Grantor State Program           | Name                      | {SavedValue:HistoryTabIdOnProgram}  |
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
    Then I softly see "Messages" subtab is present in page details
    Then I softly see "History" subtab is present in page details
    And I refresh the page
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary |
      | {SavedValue:PM Username} | 1000       |
    And I refresh the page
    Then I softly do not see "Messages" subtab is present in page details
    Then I softly do not see "History" subtab is present in page details

  @550471_2 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that TAB should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},URL__c                           | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValueUrlEqualTo    | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValueUrlNotEqualTo | Grantor State Program           | Name                      | {SavedValue:HistoryTabIdOnProgram}  |
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
    Then I softly see "Messages" subtab is present in page details
    Then I softly see "History" subtab is present in page details
    And I refresh the page
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly do not see "Messages" subtab is present in page details
    Then I softly see "History" subtab is present in page details

  @550470 @550472 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that TAB should be hide/unhide dynamically using "inverse True".
  |LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN}                                  | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValuePMuserInverse | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
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
    Then I softly do not see "Messages" subtab is present in page details
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary |
      | {SavedValue:PM Username} | 1000       |
    And I refresh the page
    Then I softly see "Messages" subtab is present in page details

  @550472_2 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                     | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},URL__c                               | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValueUrlEqualToInverse | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
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
    Then I softly do not see "Messages" subtab is present in page details
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly see "Messages" subtab is present in page details

  @550473 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c,ContactEmail__c | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabEqualPhoneNumber                     | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabEqualContactEmail                    | Grantor State Program           | Name                      | {SavedValue:HistoryTabIdOnProgram}  |
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
    Then I softly see "Messages" subtab is present in page details
    Then I softly see "History" subtab is present in page details
    And I refresh the page
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number | Contact Email          |
      | {SavedValue:PM Username} | 8888888888   | automation@yopmail.com |
    And I refresh the page
    Then I softly do not see "Messages" subtab is present in page details
    Then I softly do not see "History" subtab is present in page details

  @550474 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all Data Types using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},Phone_Number__c,ContactEmail__c | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabEqualPhoneNumberInverse              | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabEqualContactEmailInverse             | Grantor State Program           | Name                      | {SavedValue:HistoryTabIdOnProgram}  |
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
    Then I softly do not see "Messages" subtab is present in page details
    Then I softly do not see "History" subtab is present in page details
    And I refresh the page
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Phone Number | Contact Email          |
      | {SavedValue:PM Username} | 8888888888   | automation@yopmail.com |
    And I refresh the page
    Then I softly see "Messages" subtab is present in page details
    Then I softly see "History" subtab is present in page details

  @552392 @552393 @US-535590
  Scenario Outline: LWC : Table : Admin : Custom Lookup Modal : To verify 'View All' hyperlink should be display at the bottom of the table of custom lookup field table
  |LWC : Table : PM : Custom Lookup Modal : To verify 'View All' hyperlink should be display at the bottom of the table of custom lookup field table|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see link "View All" inside Page block

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552395 @552397 @552394 @552396 @US-535590
  Scenario Outline: LWC : Table : PM : Custom Lookup Modal : To verify 'View All' hyperlink should be clickable at the bottom of the table of custom lookup field table
  |LWC : Table : PM : Custom Lookup Modal : To verify when user click on 'View All' hyperlink then modal should be open|
  |LWC : Table : Admin : Custom Lookup Modal : To verify 'View All' hyperlink should be clickable at the bottom of the table of custom lookup field table|
  |LWC : Table : Admin : Custom Lookup Modal : To verify when user click on 'View All' hyperlink then modal should be open|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
   #552397
    Then I softly see "Select Record" opens in overLay window

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552403 @552577 @552576 @552402 @US-535590
  Scenario Outline: LWC : Table : PM : Custom Lookup Modal : To verify Page size, Pagination, Total records count should be available on custom lookup modal
  |LWC : Table : PM : Custom Lookup Modal : To verify header should be available on custom lookup modal|
  |LWC : Table : Admin : Custom Lookup Modal : To verify header should be available on custom lookup modal|
  |LWC : Table : Admin : Custom Lookup Modal : To verify Page size, Pagination, Total records count should be available on custom lookup modal|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I see "lookupTable" table contains "Page 1 of"
    Then I see "lookupTable" table contains "Entries"
    Then I see "lookupTable" table contains "Total Records:"
    Then I softly see Advance Filter box is displayed inside table id "lookupTable" in flex table
    Then I see "Search" is displayed on table id "lookupTable"
    Then I softly see "Select Record" opens in overLay window
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552574 @552565 @552404 @552405 @US-535590
  Scenario Outline: LWC : Table : PM : Custom Lookup Modal : To verify 'Select' action should be visible and working in the actions column
  |LWC : Table : Admin : Custom Lookup Modal : To verify 'Select' action should be visible and working in the actions column |
  |LWC : Table : Admin : Custom Lookup Modal : To verify Advance filter and Quick search should be available on custom lookup modal|
  |LWC : Table : PM : Custom Lookup Modal : To verify Advance filter and Quick search should be available on custom lookup modal|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see "Select Record" opens in overLay window
    Then I softly see Advance Filter box is displayed inside table id "lookupTable" in flex table
    Then I see "Search" is displayed on table id "lookupTable"
    When I perform quick search for "Automation EXE" in "lookupTable" panel
    Then I see value "Select" for title "Actions" against the value "Automation EXE" inside table "lookupTable"
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552563 @552548 @US-535590
  Scenario Outline: LWC : Table : PM : Custom Lookup Modal : To verify reset functionality should be worked on custom lookup modal table
  |LWC : Table : Admin : Custom Lookup Modal : To verify reset functionality should be worked on custom lookup modal table|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see "Select Record" opens in overLay window
    When I perform quick search for "Automation PM1" in "lookupTable" panel
    Then I see table contains "Showing 1 to 1 of 1 records" inside table id "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 1"
    When I click on button "resetIcon" in flex table with id "lookupTable"
    Then I see table contains "Showing 1 to 5" inside table id "lookupTable"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552547 @552546 @US-535590
  Scenario Outline: LWC : Table : PM : Custom Lookup Modal : To verify sorting should be worked on custom lookup modal columns
  |LWC : Table : Admin : Custom Lookup Modal : To verify sorting should be worked on custom lookup modal columns|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see "Select Record" opens in overLay window
    Then I softly see sorting label as "Records are sorted by Last Modified Date descending order" inside "lookupTable" table

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552540 @552447 @US-535590
  Scenario Outline: LWC : Table : PM : Custom Lookup Modal : To verify Quick Search should be worked on custom lookup modal
  |LWC : Table : Admin : Custom Lookup Modal : To verify Quick Search should be worked on custom lookup modal|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see "Select Record" opens in overLay window
    When I perform quick search for "Automation PM1" in "lookupTable" panel
    Then I see table contains "Showing 1 to 1 of 1 records" inside table id "lookupTable"
    When I click on button "resetIcon" in flex table with id "lookupTable"
    Then I see table contains "Showing 1 to 5" inside table id "lookupTable"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552445 @552446 @US-535590
  Scenario Outline: LWC : Table : Admin : Custom Lookup Modal : To verify Advance filter should be worked on custom lookup modal
  |LWC : Table : PM : Custom Lookup Modal : To verify Advance filter should be worked on custom lookup modal|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see "Select Record" opens in overLay window
    And I click on advance filter of table id "lookupTable" for LWC
    And I enter advance filter values inside id "lookupTable" for LWC
      | Full Name | contains | Automation PM1 |
    Then I see "lookupTable" table contains "Total Records: 1"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @552226 @US-552223
  Scenario:LWC - Support to display complete table in lookup - Table - PM - To verify that, table under lookup field should display properly when clicking row level edit action
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Program__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On Lookup field with api name "Program__r.Name" flextable with id "---program:-:contactsTableId---"
    Then I softly see link "View All" inside Page block

  @552227 @552229 @552230 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - PM - To verify that, all data of table under lookup field should display properly when horizontal scrollbar scrolling
  |LWC - Support to display complete table in lookup - Table - PM - To verify that, optimize table layout under lookup field so that columns are displayed clearly and efficiently within the available space.|
  |LWC - Support to display complete table in lookup - Table - PM - To verify that, table under the lookup field should be fully visible|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Program__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On Lookup field with api name "Program__r.Name" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | EGMS ID              |
      | Assistance Listing # |
      | Program Title        |
      | B_Agency             |
    Then I softly see link "View All" inside Page block

  @552232 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - PM - To verify that, selected value is populated correctly in the lookup field.
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name          | Program |
      | Automation PM | Step 1  |
    Then I see value "Step 1" for title "Program" against the value "Automation PM" inside table "---program:-:approverTableId---"

  @552233 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - PM - To verify that, if no records exist, shows “No records found” message.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Program__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On Lookup field with api name "Program__r.Name" flextable with id "---program:-:contactsTableId---"
    Then I see "lookup-dropdown" table contains "Results"

  @552234 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - PM - To verify that, lookup selection when user cancels without selecting value
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},Program__c,BudgetPeriod__c | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Program__c,BudgetPeriod__c | DataTableEnhanceProgramContacts |                           |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click on top right button "Save" in flex table with id "---program:-:contactsTableId---"
    Then I softly see value "" for title "Budget Period" inside table "---program:-:contactsTableId---"

  @552235 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - PM - To verify that, behavior when lookup field is disabled or read-only
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Cell JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},Program__c,BudgetPeriod__c | DataTableEnhanceProgramContacts |                           |                              |
      | Flex Table List       | Read Only Cell JSON | govgrants_config:HideColumnJsonBaseSalaryINProfilePM    | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    Then I softly see field inside table "BudgetPeriod__c" not in edit mode

  @552247 @US-552223
  Scenario:LWC - Support to display complete table in lookup - Grid - PM - To verify that, all data of table under lookup field should display properly when horizontal scrollbar scrolling
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ContactTableDFN},BudgetPeriod__c | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Cell JSON |                                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | {SavedValue:ContactTableDFN},BudgetPeriod__c | DataTableEnhanceProgramContacts |                           |                              |
      | Flex Table List       | Read Only Cell JSON |                                              | DataTableEnhanceProgramContacts | Name                      | {SavedValue:BudgetPeriod__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:PM Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I click on "Edit" icon for "{SavedValue:PM Username}" inside flex table with id "---program:-:contactsTableId---" without waiting for record
    And I click On Lookup field with api name "BudgetPeriod__r.Name" flextable with id "---program:-:contactsTableId---"
    Then I softly see lookup table header displayed as below
      | Budget Period # |
      | Support Year    |
      | Start Date      |
      | End Date        |
      | Status          |


  @552238 @552239 @552240 @US-552223
  Scenario:LWC - Support to display complete table in lookup - Table - SPI - To verify that, table under the lookup field should be properly aligned
  |LWC - Support to display complete table in lookup - Table - SPI - To verify that, table under the lookup field should be fully visible|
  |LWC - Support to display complete table in lookup - Table - SPI - To verify that, table under lookup field should display properly when clicking row level edit action|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                        | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                            | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | QualifiedAnnouncementsExternal |                           |                                    |
      | Flex Table List       | Read Only Column JSON |                                          | QualifiedAnnouncementsExternal | Name                      | {SavedValue:FundingOpportunity__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "FundingOpportunity__r.Name" flextable with id "---preApplication:-:qualifiedOpprtunitesTableId---"
    Then I softly see lookup table header displayed as below
      | EGMS ID               |
      | B_Announcement Number |
      | Announcement Name     |
      | Account Name          |

  @552241 @552242 @552244 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - SPI - To verify that, selected value is populated correctly in the lookup field.
  |LWC - Support to display complete table in lookup - Table - SPI - To verify that,optimize table layout under lookup field so that columns are displayed clearly and efficiently within the available space.|
  |LWC - Support to display complete table in lookup - Table - SPI - To verify that, if no records exist, shows “No records found” message.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                        | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                            | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | QualifiedAnnouncementsExternal |                           |                                    |
      | Flex Table List       | Read Only Column JSON |                                          | QualifiedAnnouncementsExternal | Name                      | {SavedValue:FundingOpportunity__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "FundingOpportunity__r.Name" flextable with id "---preApplication:-:qualifiedOpprtunitesTableId---"
    Then I softly see lookup table header displayed as below
      | EGMS ID               |
      | B_Announcement Number |
      | Announcement Name     |
      | Account Name          |
    Then I see "lookup-dropdown" table contains "Results"

  @552246 @552266 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - SPI - To verify that, behavior when lookup field is disabled or read-only
  |LWC - Support to display complete table in lookup - Grid - SPI - To verify that, behavior when lookup field is disabled or read-only|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue | filterId         |
      | Flex Table List       | Read Only Column JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                 | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table List       | Read Only Column JSON | govgrants_config:QuilifyPageHideForSPIProfile | QualifiedAnnouncementsExternal | Name                      | {SavedValue:FundingOpportunity__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click on "Edit" action for first record of table
    Then I softly see field inside table "FundingOpportunity__c" not in edit mode

  @552411 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - SPI - To verify that, bottom of the table "Top (no. of records) Records" text and "View All" link should be display
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                        | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                            | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | QualifiedAnnouncementsExternal |                           |                                    |
      | Flex Table List       | Read Only Column JSON |                                          | QualifiedAnnouncementsExternal | Name                      | {SavedValue:FundingOpportunity__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "FundingOpportunity__r.Name" flextable with id "---preApplication:-:qualifiedOpprtunitesTableId---"
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block

  @552248 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Grid - PM - To verify that, behavior when lookup field is disabled or read-only
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                   | filterId         |
      | Flex Table            | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                                                     | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table:General    | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c,Announcement__c | ProgramReviewStepTemplates |                           |                                         |
      | Flex Table List       | Read Only Column JSON | govgrants_config:ProfileInPMStepReview                                              | ProgramReviewStepTemplates | Name                      | {SavedValue:ReviewStepsAnnouncement__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    Then I softly do not see fields "Announcement__c" is in edit mode

  @552250 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Grid - PM - To verify that, if no records exist, shows “No records found” message.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                   | filterId         |
      | Flex Table            | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                                                     | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table:General    | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c,Announcement__c | ProgramReviewStepTemplates |                           |                                         |
      | Flex Table List       | Read Only Column JSON |                                                                                     | ProgramReviewStepTemplates | Name                      | {SavedValue:ReviewStepsAnnouncement__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click On Lookup field with api name "Announcement__r.Name" flextable with id "---program:-:reviewStepTableId---"
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block

  @552252 @552253 @552254 @552255 @552412 @552414 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Grid - PM - To verify that, optimize table layout under lookup field so that columns are displayed clearly and efficiently within the available space.
  |LWC - Support to display complete table in lookup - Grid - PM - To verify that, selected value is populated correctly in the lookup field.|
  |LWC - Support to display complete table in lookup - Grid - PM - To verify that, table under lookup field should display properly when clicking row level edit action|
  |LWC - Support to display complete table in lookup - Grid - PM - To verify that, table under the lookup field should be fully visible|
  |LWC - Support to display complete table in lookup - Table - PM - To verify that, bottom of the table "Top (no. of records) Records" text and "View All" link should be display|
  |LWC - Support to display complete table in lookup - Grid - PM - To verify that, bottom of the table "Top (no. of records) Records" text and "View All" link should be display|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                   | filterId         |
      | Flex Table            | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                                                     | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table:General    | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c,Announcement__c | ProgramReviewStepTemplates |                           |                                         |
      | Flex Table List       | Read Only Column JSON |                                                                                     | ProgramReviewStepTemplates | Name                      | {SavedValue:ReviewStepsAnnouncement__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "Pre-Screen Review" inside flex table with id "---program:-:reviewStepTableId---" without waiting for record
    And I click On Lookup field with api name "Announcement__r.Name" flextable with id "---program:-:reviewStepTableId---"
    Then I softly see lookup table header displayed as below
      | EGMS ID               |
      | B_Announcement Number |
      | Announcement Name     |
      | Account Name          |
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block


  @552259 @552260 @552261 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Grid - SPI - To verify that, table under the lookup field should be fully visible
  |LWC - Support to display complete table in lookup - Grid - SPI - To verify that, table under lookup field should display properly when clicking row level edit action|
  |LWC - Support to display complete table in lookup - Grid - SPI - To verify that, selected value is populated correctly in the lookup field.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                        | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                            | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | QualifiedAnnouncementsExternal |                           |                                    |
      | Flex Table List       | Read Only Column JSON |                                          | QualifiedAnnouncementsExternal | Name                      | {SavedValue:FundingOpportunity__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "FundingOpportunity__r.Name" flextable with id "---preApplication:-:qualifiedOpprtunitesTableId---"
    Then I softly see lookup table header displayed as below
      | EGMS ID               |
      | B_Announcement Number |
      | Announcement Name     |
      | Account Name          |

  @552264 @552413 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Grid - SPI - To verify that, if no records exist, shows “No records found” message.
  |LWC - Support to display complete table in lookup - Grid - SPI - To verify that, bottom of the table "Top (no. of records) Records" text and "View All" link should be display|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                        | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                            | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | QualifiedAnnouncementsExternal |                           |                                    |
      | Flex Table List       | Read Only Column JSON |                                          | QualifiedAnnouncementsExternal | Name                      | {SavedValue:FundingOpportunity__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "FundingOpportunity__r.Name" flextable with id "---preApplication:-:qualifiedOpprtunitesTableId---"
    Then I see "lookup-dropdown" table contains "Top"
    Then I see "lookup-dropdown" table contains "Results"
    Then I softly see link "View All" inside Page block

  @552234 @552251 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - PM - To verify that, lookup selection when user cancels without selecting value
  |LWC - Support to display complete table in lookup - Grid - PM - To verify that, lookup selection when user cancels without selecting value|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                                                   | filterId         |
      | Flex Table            | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                                                     | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                                                                       | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table:General    | Display Field Names   | Id,StepNumber__c,Description__c,Name,Weight__c,CountReviewPanels__c,Announcement__c | ProgramReviewStepTemplates |                           |                                         |
      | Flex Table List       | Read Only Column JSON |                                                                                     | ProgramReviewStepTemplates | Name                      | {SavedValue:ReviewStepsAnnouncement__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Setup" sub tab
    Then I softly see value "" for title "Announcement" inside table "---program:-:reviewStepTableId---"

  @552243 @552263 @US-552223
  Scenario: LWC - Support to display complete table in lookup - Table - SPI - To verify that, lookup selection when user cancels without selecting value
  |LWC - Support to display complete table in lookup - Grid - SPI - To verify that, lookup selection when user cancels without selecting value|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName             | fieldOrignalValue                        | filterId         |
      | Flex Table            | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | ApiGeneratedId:0 |
      | Flex Table List       | Read Only Column JSON |                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName             | fieldNewValue                            | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names   | {SavedValue:OpportunitiesQualifyied.dfn} | QualifiedAnnouncementsExternal |                           |                                    |
      | Flex Table List       | Read Only Column JSON |                                          | QualifiedAnnouncementsExternal | Name                      | {SavedValue:FundingOpportunity__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I click on "Edit" action for first record of table
    And I click On Lookup field with api name "FundingOpportunity__r.Name" flextable with id "---preApplication:-:qualifiedOpprtunitesTableId---"
    And I click on top right button "Save" in flex table with id "---preApplication:-:qualifiedOpprtunitesTableId---"
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

  @547906 @547907 @US-552223 @547908 @bug-552802
  Scenario: LWC - AS - PM -To Verify that, on each user action, an auto snapshot is captured and becomes visible in the Snapshot History Table with Template name, according to the configuration in the Detail Layout Initializer JSON.
  |"LWC - AS - PM -To Verify that, on user action, an auto snapshot is captured with Template name according to the configuration in the Detail Layout Initializer JSON. ({ ""type"": ""ApexClass"", ""value"": ""ApplicationEditCtrl"" },   { ""type"": ""PageTem|
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    When I "Approve" in the approval decision
    And I click on "Activate" in the page details
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SObject Auto Snapshot Automation Activated" as name

  @547910 @US-539849 @547919
  Scenario: LWC - AS - PM -To verify that, if SObject Auto Snapshots is not present, then the Auto Snapshot should not be generated.
  |LWC - AS - PM - To verify that, even if SObject Layout Config is not created, the Auto Snapshot should still be generated with Template name.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                            | fieldOrignalValue                      | filterId         |
      | Page Layout Action    | History Snapshot-Action PDF Filename | Internal Program - submit for approval | ApiGeneratedId:0 |
      | Page Layout Action    | History Snapshot-Action Enable?      | true                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                            | fieldNewValue                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | History Snapshot-Action PDF Filename | Internal Program - submit for approval | Grantor State Program | Name                      | Submit For Approval        |
      | Page Layout Action    | History Snapshot-Action Enable?      | true                                   | Grantor State Program | Name                      | Submit For Approval        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Internal Program - submit for approval" as name

  @547911 @US-539849
  Scenario: LWC - AS - PM -To verify that, if SObject Auto Snapshots is not Active, then the Auto Snapshot should not be generated.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                            | fieldOrignalValue                      | filterId         |
      | Page Layout Action    | History Snapshot-Action PDF Filename | Internal Program - submit for approval | ApiGeneratedId:0 |
      | Page Layout Action    | History Snapshot-Action Enable?      | true                                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                            | fieldNewValue                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | History Snapshot-Action PDF Filename | Internal Program - submit for approval | Grantor State Program | Name                      | Submit For Approval        |
      | Page Layout Action    | History Snapshot-Action Enable?      | false                                  | Grantor State Program | Name                      | Submit For Approval        |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly do not see snapshot with name containing "Internal Program - submit for approval" as name

  @547909 @US-539849 @Config:SObject_Program__c_and_remove_DetailLayoutInitializer
  Scenario: "LWC - AS - PM -To verify that, if the Detail Layout Initializer JSON is not present in the SObject Information section, the layout should display an error message: “Oops...! Something went wrong, please contact the administrator.”"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details :
      | Field DetailLayoutInitializer has no value and URL does not have page template name |

  @547922 @547924 @US-539849
  Scenario: LWC - AS - SPI -To Verify that, on each user action, an auto snapshot is captured and becomes visible in the Snapshot History Table with Template name, according to the configuration in the Detail Layout Initializer JSON.
  |"LWC - AS - SPI -To Verify that, on user action, an auto snapshot is captured with Template name according to the configuration in the Detail Layout Initializer JSON. ({ ""type"": ""ApexClass"", ""value"": ""ApplicationEditCtrl"" },   { ""type"": ""PageTe|
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SObject Auto Snapshot Qualify" as name

  @547929 @US-539849
  Scenario: "LWC - AS - SPI -To verify that, if the Detail Layout Initializer JSON is not present in the SObject Information section, the layout should display an error message: “Oops...! Something went wrong, please contact the administrator.”"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    Then I softly see the following messages in the page details :
      | Field DetailLayoutInitializer has no value and URL does not have page template name |

  @547931 @547933 @US-539849
  Scenario: LWC - AS - SPI -To verify that, if SObject Auto Snapshots is not present, then the Auto Snapshot should not be generated.
  |LWC - AS - SPI -To verify that, if SObject Auto Snapshots is not Active, then the Auto Snapshot should not be generated.|
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
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I get current URL
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I click on "Edit" in the split screen page details
    And I pause execution for "10" seconds
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "3" seconds
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
    And I pause execution for "10" seconds
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "3" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I refresh the page
    And I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SObject Auto Snapshot_Application_Submission" as name

  @547937 @US-539849
  Scenario: LWC - AS - SPI - To verify that, even if SObject Layout Config is not created, the Auto Snapshot should still be generated with Template name.
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
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    And I refresh the page
    And I navigate to "History" sub tab
    And I get current URL
    Then I softly see snapshot with name containing "Snapshot_Pre-Application_Submission.pdf" as name

  @552509 @552510 @552526 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, lookup field options update automatically when a dependent picklist value changes in the same row, without requiring a page refresh.
  |LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, if the user selects any picklist value, User lookup records should be filtered based on that selection value of picklist.|
  |LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, if the user selects any picklist value, User lookup records should be filtered based on that selection value of picklist.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation PO1" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation FO1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"


  @552511 @552512 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, lookup records are filtered based on selected picklist value in Table
  |LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, lookup list updates when picklist value changes|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameNotEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    When I perform quick search for "Automation PO1" in "lookupTable" panel
    Then I see "lookupTable" table contains "No Records Found"
    When I perform quick search for "Automation FO1" in "lookupTable" panel
    Then I see "lookupTable" table contains "No Records Found"
    When I click on button "resetIcon" in flex table with id "lookupTable"
    When I perform quick search for "Automation PM" in "lookupTable" panel
    Then I softly see value "Automation PM" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation PM1" for title "Full Name" inside table "lookupTable"

  @552513 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, lookup field clears existing value when picklist value changes
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 3" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation FD1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 1"

  @552514 @US-551588 @552515
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, lookup filtering works for newly added row
  |LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, lookup filtering works when editing existing row|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameNotEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 3" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    When I perform quick search for "Automation FD1" in "lookupTable" panel
    Then I see "lookupTable" table contains "No Records Found"
    When I click on button "resetIcon" in flex table with id "lookupTable"
    When I perform quick search for "Automation PM" in "lookupTable" panel
    Then I softly see value "Automation PM" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation PM1" for title "Full Name" inside table "lookupTable"

  @552517 @552527 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, lookup dropdown behavior when no picklist value is selected
  |LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, lookup dropdown behavior when no picklist value is selected|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON |               | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    When I perform quick search for "Automation PO" in "lookupTable" panel
    Then I softly see value "Automation PO" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation PO1" for title "Full Name" inside table "lookupTable"
    When I click on button "resetIcon" in flex table with id "lookupTable"
    When I perform quick search for "Automation PM" in "lookupTable" panel
    Then I softly see value "Automation PM" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation PM1" for title "Full Name" inside table "lookupTable"
    When I perform quick search for "Automation FD" in "lookupTable" panel
    Then I softly see value "Automation FD" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation FD1" for title "Full Name" inside table "lookupTable"
    When I perform quick search for "Automation EXE" in "lookupTable" panel
    Then I softly see value "Automation EXE" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation EXE1" for title "Full Name" inside table "lookupTable"

  @552519 @552524 @US-551588
  Scenario:LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, filtering when picklist is cleared
  |LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, filtering when picklist is cleared|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON |               | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    When I perform quick search for "Automation PO" in "lookupTable" panel
    Then I softly see value "Automation PO" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation PO1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"
    When I click on button "resetIcon" in flex table with id "lookupTable"
    When I perform quick search for "Automation PM" in "lookupTable" panel
    Then I softly see value "Automation PM" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation PM1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"
    When I perform quick search for "Automation FD" in "lookupTable" panel
    Then I softly see value "Automation FD" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation FD1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"
    When I perform quick search for "Automation EXE" in "lookupTable" panel
    Then I softly see value "Automation EXE" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation EXE1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"

  @552520 @552525 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, filtering works after page refresh
  |LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, filtering works after page refresh|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation PO1" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation FO1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"

  @552521 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - PM - To verify that, filtering across multiple rows simultaneously
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Program | Name           |
      | Step 4  | Automation PO1 |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Program | Name           |
      | Step 4  | Automation FO1 |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Program | Name           |
      | Step 4  | Automation PO1 |
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation PO1" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation FO1" for title "Full Name" inside table "lookupTable"

  @552523 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, filtering across multiple rows simultaneously
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 3" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation FD1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 1"
    When I click modal button "Close"
    And I refresh the page
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation PO1" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation FO1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"

  @552528 @US-551588
  Scenario:LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, lookup field clears existing value when picklist value changes
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 3" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation FD1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 1"
    When I click modal button "Close"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see value "Automation PO1" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation FO1" for title "Full Name" inside table "lookupTable"
    Then I see "lookupTable" table contains "Total Records: 2"

  @552530 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, lookup filtering works for newly added row
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameNotEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 3" in field "ProgramRole__c"
    And I click On View All Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    When I perform quick search for "Automation FD1" in "lookupTable" panel
    Then I see "lookupTable" table contains "No Records Found"
    When I click on button "resetIcon" in flex table with id "lookupTable"
    When I perform quick search for "Automation PM" in "lookupTable" panel
    Then I softly see value "Automation PM" for title "Full Name" inside table "lookupTable"
    Then I softly see value "Automation PM1" for title "Full Name" inside table "lookupTable"

  @552531 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, lookup filtering works when editing existing row
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Program | Name           |
      | Step 4  | Automation PO1 |
    And I click on "Edit" icon for "Automation PO1" inside flex table with id "---program:-:approverTableId---" without waiting for record
    And I click on remove for lookup from field "Name__r.Name"
    And I select dropdown value "Step 3" in field "ProgramRole__c"
    And I click On Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation FD1 |

  @552532 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Grid - PM - To verify that, lookup list updates when picklist value changes
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                           | coreComponentField                             | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:NameEqualToProgramRole | ProgramRolesAndResponsibilitiesInternalProgram | Name                      | {SavedValue:ProgramRole__c} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    And I click on top right button "New" in flex table with id "---program:-:approverTableId---"
    And I select dropdown value "Step 4" in field "ProgramRole__c"
    And I click On Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PO1 |
      | Automation FO1 |
    And I select dropdown value "Step 3" in field "ProgramRole__c"
    And I click On Lookup field with api name "Name__r.Name" flextable with id "---program:-:approverTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation FD1 |


  @552535 @552559 @US-551588
  Scenario:LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, filtering across multiple rows simultaneously
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, filtering across multiple rows simultaneously|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:ContactEqualToProjectRole | PreAppContact      | Name                      | {SavedValue:AutoSnapShotProjectRole__c} |
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
    And I click on top right button "Associate" in flex table with id "---preApplication:-:preAppContactTableId---"
    When I click "Add" after selection of "Automation SPA" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "Automation SPA" inside flex table with id "---preApplication:-:preAppContactTableId---"
    And I select dropdown value "--None--" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    And I click on "Edit" icon for "Automation SPA" inside flex table with id "---preApplication:-:preAppContactTableId---"
    And I select dropdown value "Ebiz POC" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |
    And I select dropdown value "Fiscal Contact" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---preApplication:-:preAppContactTableId---"
    And I select dropdown value "Ebiz POC" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |
    And I select dropdown value "Fiscal Contact" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |

  @552536 @552558 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, filtering when picklist is cleared
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, filtering when picklist is cleared|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:ContactEqualToProjectRole | PreAppContact      | Name                      | {SavedValue:AutoSnapShotProjectRole__c} |
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
    And I select dropdown value "Ebiz POC" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |

  @552537 @552544 @552545 @552549 @552550 @552557 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, filtering works after page refresh
  |LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, lookup list updates when picklist value changes|
  |LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, lookup records are filtered based on selected picklist value in Table|
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, lookup records are filtered based on selected picklist value in Table|
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, lookup list updates when picklist value changes|
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, filtering works after page refresh|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:ContactEqualToProjectRole | PreAppContact      | Name                      | {SavedValue:AutoSnapShotProjectRole__c} |
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
    And I select dropdown value "--None--" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly do not see lookup or picklist records displayed as below
      | Automation PM   |
      | Automation SPI3 |
    And I refresh the page
    And I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---preApplication:-:preAppContactTableId---"
    And I select dropdown value "Ebiz POC" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |
    And I select dropdown value "Fiscal Contact" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |

  @552538 @552541 @552542 @552543 @552551 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, if the user selects any picklist value, User lookup records should be filtered based on that selection value of picklist.
  |LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, lookup field clears existing value when picklist value changes|
  |LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, lookup field options update automatically when a dependent picklist value changes in the same row, without requiring a page refresh.|
  |LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, lookup filtering works when editing existing row|
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, lookup filtering works when editing existing row|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:ContactNotEqualToProjectRole | PreAppContact      | Name                      | {SavedValue:AutoSnapShotProjectRole__c} |
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
    And I select dropdown value "Ebiz POC" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |
    Then I softly do not see lookup or picklist records displayed as below
      | Automation SPI3 |
    And I select dropdown value "Fiscal Contact" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |
    Then I softly do not see lookup or picklist records displayed as below
      | Automation PM |
    And I select dropdown value "--None--" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM   |
      | Automation SPI3 |

  @552539 @552555 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Table - SPI - To verify that, lookup dropdown behavior when no picklist value is selected
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, lookup dropdown behavior when no picklist value is selected|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:ContactEqualToProjectRole | PreAppContact      | Name                      | {SavedValue:AutoSnapShotProjectRole__c} |
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
    And I select dropdown value "--None--" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM   |
      | Automation SPI3 |
      | Automation FD1  |
      | Automation FO   |
      | Automation FO1  |

  @552552 @US-551588
  Scenario: LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, lookup filtering works for newly added row
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                              | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:ContactEqualToProjectRole | PreAppContact      | Name                      | {SavedValue:AutoSnapShotProjectRole__c} |
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
    And I click on top right button "Associate" in flex table with id "---preApplication:-:preAppContactTableId---"
    When I click "Add" after selection of "Automation SPA" in the table "---preApplication:-:associatePreAppContactsTableId---"
    When I click modal button "Close"
    And I click on "Edit" icon for "Automation SPA" inside flex table with id "---preApplication:-:preAppContactTableId---"
    And I select dropdown value "--None--" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM   |
      | Automation SPI3 |
    And I refresh the page
    And I click on "Edit" icon for "Automation SPA" inside flex table with id "---preApplication:-:preAppContactTableId---"
    And I select dropdown value "Ebiz POC" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |
    And I select dropdown value "Fiscal Contact" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |

  @552553 @552554 @552556 @US-551588
  Scenario:LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, lookup field options update automatically when a dependent picklist value changes in the same row, without requiring a page refresh.
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, lookup field clears existing value when picklist value changes|
  |LWC - Support to filter lookup records based on selected picklist - Grid - SPI - To verify that, if the user selects any picklist value, User lookup records should be filtered based on that selection value of picklist.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                  | fieldOrignalValue | coreComponentField | filterId         |
      | Flex Table List       | Dynamic Lookup Filter JSON |                   |                    | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                  | fieldNewValue                                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table List       | Dynamic Lookup Filter JSON | govgrants_config:ContactNotEqualToProjectRole | PreAppContact      | Name                      | {SavedValue:AutoSnapShotProjectRole__c} |
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
    And I select dropdown value "Ebiz POC" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly do not see lookup or picklist records displayed as below
      | Automation PM |
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |
    And I select dropdown value "Fiscal Contact" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly do not see lookup or picklist records displayed as below
      | Automation SPI3 |
    Then I softly see lookup or picklist records displayed as below
      | Automation PM |
    And I select dropdown value "--None--" in field "ProjectRole__c"
    And I click On Lookup field with api name "Contact__r.Name" flextable with id "---preApplication:-:preAppContactTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM   |
      | Automation SPI3 |

  @552641 @US-547787
  Scenario: LWC : Record Type Picklist Table/Grid : PM : To verify the values should be display as per selected for the default Record Type in the picklist field
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                                                        | filterId         |
      | Flex Table            | Display Field Names | Name,ProgramName__c,RecordType.Name,Type__c,Account__c,FunderType__c,FundedAmount__c,StartDate__c,Status__c,LastModifiedById,CreatedById | ApiGeneratedId:0 |
      | Flex Table List       | Default Value       |                                                                                                                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | Name,ProgramName__c,RecordType.Name,Type__c,Account__c,FunderType__c,FundedAmount__c,StartDate__c,Status__c,LastModifiedById,CreatedById | Programs           |                           |                              |
      | Flex Table List       | Default Value       | External Program                                                                                                                         | Programs           | Name                      | {SavedValue:RecordType.Name} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New Automation" in flex table with id "---program:-:programsTableId---"
    And I click on picklist "Type__c" in flex table with id "---program:-:programsTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Block Grants     |
      | Earmark Grants   |
      | Emergency Grants |
      | Formula Grants   |
      | Project Grants   |
      | Other            |
    Then I softly do not see lookup or picklist records displayed as below
      | Block Grants     |
      | Earmark Grants   |
      | Emergency Grants |
      | Formula Grants   |
      | Project Grants   |
      | Research Grants  |
      | Other            |

  @552640 @552642 @552645 @US-547787
  Scenario:LWC : Record Type Picklist Table/Grid : Admin : To verify the values should be display as per selected for the default Record Type in the picklist field
  |LWC : Record Type Picklist Table/Grid : Admin : To verify the values should not be display of another Record Type for the selected record type in the picklist field|
  |LWC : Record Type Picklist Table/Grid : PM : To verify the values should not be display of another Record Type for the selected record type in the picklist field|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                                                        | filterId         |
      | Flex Table            | Display Field Names | Name,ProgramName__c,RecordType.Name,Type__c,Account__c,FunderType__c,FundedAmount__c,StartDate__c,Status__c,LastModifiedById,CreatedById | ApiGeneratedId:0 |
      | Flex Table List       | Default Value       |                                                                                                                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | Name,ProgramName__c,RecordType.Name,Type__c,Account__c,FunderType__c,FundedAmount__c,StartDate__c,Status__c,LastModifiedById,CreatedById | Programs           |                           |                              |
      | Flex Table List       | Default Value       |                                                                                                                                          | Programs           | Name                      | {SavedValue:RecordType.Name} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I perform quick search for "Created" in "---program:-:programsTableId---" panel
    And I click on "Edit" icon for "Created" inside flex table with id "---program:-:programsTableId---" without waiting for record
    And I click on picklist "Type__c" in flex table with id "---program:-:programsTableId---"
    Then I softly see lookup or picklist records displayed as below
      | Block Grants     |
      | Earmark Grants   |
      | Emergency Grants |
      | Formula Grants   |
      | Project Grants   |
      | Research Grants  |
    Then I softly do not see lookup or picklist records displayed as below
      | Block Grants     |
      | Earmark Grants   |
      | Emergency Grants |
      | Formula Grants   |
      | Project Grants   |
      | Research Grants  |
      | Other            |

  @552649 @552650 @US-547787
  Scenario:LWC : Record Type Picklist Table/Grid : Admin : To verify the all picklist values of all record types should be available in the advance filter values
  |LWC : Record Type Picklist Table/Grid : PM : To verify the all picklist values of all record types should be available in the advance filter values|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                                                                                                                        | filterId         |
      | Flex Table            | Display Field Names | Name,ProgramName__c,RecordType.Name,Type__c,Account__c,FunderType__c,FundedAmount__c,StartDate__c,Status__c,LastModifiedById,CreatedById | ApiGeneratedId:0 |
      | Flex Table List       | Default Value       |                                                                                                                                          | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                                            | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue   |
      | Flex Table:General    | Display Field Names | Name,ProgramName__c,RecordType.Name,Type__c,Account__c,FunderType__c,FundedAmount__c,StartDate__c,Status__c,LastModifiedById,CreatedById | Programs           |                           |                              |
      | Flex Table List       | Default Value       | Internal Program                                                                                                                         | Programs           | Name                      | {SavedValue:RecordType.Name} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Type | equals to | Project Grants |
    Then I softly see value "Project Grants" for title "Type" inside table "---program:-:programsTableId---"
    When I click on button "Clear" in flex table with id "---program:-:programsTableId---"
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Type | equals to | Earmark Grants |
    Then I softly see value "Earmark Grants" for title "Type" inside table "---program:-:programsTableId---"

  @548733 @548754 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that lookup field behavior when I set it required to save from the config.
  |LWC: Field: Page Layout: PM: To verify that lookup field behavior when I set it required to save from the config.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Grantor State Program | Name                      | {SavedValue:LookupField_PrimaryFundingOrganization} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Primary Funding Organization" inside page block
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Primary Funding Organization is required to save. Enter it in the Information section on the Overview tab. |
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548734 @548755 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that lookup field behavior when I set it required to submit from the config.
  |LWC: Field: Page Layout: PM: To verify that lookup field behavior when I set it required to submit from the config.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue       | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                     | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                     | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                     | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Submit | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    And I click on "Submit For Approval" in the page details
    And I pause execution for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Authorized Signatory is required to submit. Enter it in the Information section on the Overview tab. |
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548722 @548750 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that lookup field functionality with partial search and save.
  |LWC: Field: Page Layout: PM: To verify that lookup field functionality with partial search and save.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation P" inside loookup from field "AuthorizedSignatory__c"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM  |
      | Automation PM1 |
      | Automation PO  |
      | Automation PO1 |

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548723 @548751 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that the lookup field values are correctly exported.
  |LWC: Field: Page Layout: PM: To verify that the lookup field values are correctly exported.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Download as PDF" in the page details
    And I wait for "8" seconds
    And I download the file
    Then I softly see "Test Automation Organization" on page "1" of "govgrants" pdf file

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548670 @548736 @US-541037
  Scenario Outline: LWC: Field: Page layout: Admin: To verify that user can be able to see lookup field in page layout.
  |LWC: Field: Page Layout: PM: To verify that user can be able to see lookup field in page layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    Then I softly do not see remove x icon for lookup field "AuthorizedSignatory__c"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548673 @548739 @US-541037
  Scenario Outline: LWC: Field: Page layout: Admin: To verify that when I click lookup field value then it should be redirected to respective field page.
  |LWC: Field: Page Layout: PM: To verify that when I click lookup field vale then it should be redirected to respective field page.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click "Test Automation Organization" lookup link
    Then I softly see field "Status" as "Active"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548674 @548740 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished..
  |LWC: Field: Page Layout: PM: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    Then I softly do not see remove x icon for lookup field "PrimaryFundingOrganization__c"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548671 @548737 @US-541037
  Scenario Outline: LWC: Field: Page layout: Admin: To verify that when I edit page and click lookup field then a table will load with a record matching with lookup criteria field.
  |LWC: Field: Page Layout: PM: To verify that when I edit page and click lookup field then a table will load with a record matching with lookup criteria field.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter value "Automation" inside loookup from field "AuthorizedSignatory__c"
    Then I softly see lookup or picklist records displayed as below
      | Automation PM   |
      | Automation PM1  |
      | Automation PO   |
      | Automation PO1  |
      | Automation EXE  |
      | Automation EXE1 |

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548675 @548741 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that When I enter a value in the lookup field  but does not select it from the table then a validation error will be thrown.
  |LWC: Field: Page Layout: PM: To verify that When I enter a value in the lookup field  but does not select it from the table then a validation error will be thrown.”|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I enter value "Test Automation" inside loookup from field "PrimaryFundingOrganization__c"
    And I wait for "2" seconds
    When I enter value "PG" into field "Abbreviation__c"
    Then I softly see the following messages in the page details contains:
      | Please select a value. |

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548705 @548742 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.
  |LWC: Field: Page Layout: PM: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Test Automation Organization" in field "PrimaryFundingOrganization__c"
    Then I softly cannot see the following messages in the page details contains:
      | Please select a value. |

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548672 @548738 @US-541037
  Scenario Outline: LWC: Field: Page layout: Admin: To verify that when I select lookup field table value and save then value should be stored under field in link format.
  |LWC: Field: Page Layout: PM: To verify that when I select lookup field table value and save then value should be stored under field in link format.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I select dropdown value "Test Automation Organization" in field "PrimaryFundingOrganization__c"
    And I click on "Save" in the page details
    Then I softly see link "Test Automation Organization" inside Page block

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548731 @548752 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that when the hide condition is met then the lookup field is hidden.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | govgrants_config:HideForProfilePMforPBD | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I cannot see field "Authorized Signatory" inside page block

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548732 @548753 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that when the read only condition is met then the lookup field is read-only.
  |LWC: Field: Page Layout: PM: To verify that when the read only condition is met then the lookup field is read-only.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue                           | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false                                   | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                                         | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        | govgrants_config:HideForProfilePMforPBD | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly see field "Authorized Signatory" inside page block
    Then I softly see field inside table "AuthorizedSignatory__c" not in edit mode

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548721 @548743 @US-541037
  Scenario Outline: LWC: Field: Page Layout: Admin: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.
  |LWC: Field: Page Layout: PM: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Grantor State Program | Name                      | {SavedValue:AuthorizedSignatory__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I enter value "" inside loookup from field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    Then I softly see field "Authorized Signatory" as ""

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548782 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that lookup field behavior when I set it required to save from the config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    Then I softly see field "Primary Funding Organization" inside page block
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Primary Funding Organization is required to save. Enter it in the Information section. |
    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548778 @548770 @548792 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that lookup field functionality with partial search and save.
  |LWC: Field: Modal: Admin: To verify that user can be able to see lookup field in page layout.|
  |LWC: Field: Modal: PM: To verify that lookup field functionality with partial search and save.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    Then I softly see field "Primary Funding Organization" inside page block
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I enter value "Test Automation" inside loookup from field "PrimaryFundingOrganization__c"
    Then I softly see lookup or picklist records displayed as below
      | Test Automation Organization |
    And I select dropdown value "Test Automation Organization" in field "PrimaryFundingOrganization__c"
    And I click modal button "Save and Continue"
    Then I softly see field "Status" as "Created"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548773 @548772 @548786 @US-541037
  Scenario:LWC: Field: Modal: Admin: To verify that when I click lookup field vale then it should be redirected to respective field page.
  |LWC: Field: Modal: Admin: To verify that when I select lookup field table value and save then value should be stored under field in link format.|
  |LWC: Field: Modal: PM: To verify that when I select lookup field table value and save then value should be stored under field in link format.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Contact    | Name                      | {SavedValue:Invited_By__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I select dropdown value "Automation PM" in field "Invited_By__c"
    When I click modal button "Save"
    Then I softly see link "Automation PM" inside Page block

  @548774 @548788 @US-541037
  Scenario Outline:LWC: Field: Modal: Admin: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.
  |LWC: Field: Modal: PM: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    Then I softly see remove x icon for lookup field "PrimaryFundingOrganization__c"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    Then I softly do not see remove x icon for lookup field "PrimaryFundingOrganization__c"

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548771 @548785 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that when I edit page and click lookup field then a table will load with a record matching with lookup criteria field.
  |LWC: Field: Modal: PM: To verify that when I edit page and click lookup field then a table will load with a record matching with lookup criteria field.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "Primary Funding Organization" inside page block
    And I enter value "Internal" inside loookup from field "PrimaryFundingOrganization__c"
    Then I softly see lookup or picklist records displayed as below
      | Department of Product        |
      | Test Automation Organization |
      | Department of Product        |
      | Department of Health         |

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548776 @548790 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.
  |LWC: Field: Modal: PM: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Label                       | false             | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I softly cannot see the following messages in the page details contains:
      | To save, Primary Funding Organization is required in the Information section. |

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548775 @548789 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that When I enter a value in the lookup field but does not select it from the table then a validation error will be thrown.
  |LWC: Field: Modal: PM: To verify that When I enter a value in the lookup field but does not select it from the table then a validation error will be thrown.|
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click on remove for lookup from field "PrimaryFundingOrganization__c"
    And I enter value "Test Automation" inside loookup from field "PrimaryFundingOrganization__c"
    And I wait for "2" seconds
    When I enter value "PG" into field "Abbreviation__c"
    Then I softly see the following messages in the page details contains:
      | Please select a value. |

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548780 @548794 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that when the hide condition is met then the lookup field is hidden
  |LWC: Field: Modal: PM: To verify that when the hide condition is met then the lookup field is hidden|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                           | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideForProfilePMforPBD | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I cannot see field "Primary Funding Organization" inside page block

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548781 @548795 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that when the read only condition is met then the lookup field is read-only.
  |LWC: Field: Modal: PM: To verify that when the read only condition is met then the lookup field is read-only.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                           | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                               |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                         | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:HideForProfilePMforPBD | Grantor State Program Create | Name                      | {SavedValue:ModalLookupField_PrimaryFundingOrganization} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see field "Primary Funding Organization" inside page block
    Then I softly see field inside table "PrimaryFundingOrganization__c" not in edit mode

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548777 @548784 @548791 @US-541037
  Scenario Outline: LWC: Field: Modal: Admin: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.
  |LWC: Field: Modal: PM: To verify that user can be able to see lookup field in page layout.|
  |LWC: Field: Modal: PM: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue               |
      | Page Block Config:Page Block Rule Detail | Is Active                 | false         | Grantor State Program Create | Name                      | {SavedValue:modalAuthorizedSignatory__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |               | Grantor State Program        | Name                      | {SavedValue:AuthorizedSignatory__c}      |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Grantor State Program        | Name                      | {SavedValue:AuthorizedSignatory__c}      |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I enter value "" inside loookup from field "AuthorizedSignatory__c"
    And I click on "Save" in the page details
    Then I softly see field "Authorized Signatory" as ""

    Examples:
      | Users |
      | PM    |
#      | Admin |

  @548787 @US-541037
  Scenario: LWC: Field: Modal: PM: To verify that when I click lookup field vale then it should be redirected to respective field page.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active | true              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active | true          | Grantor Contact    | Name                      | {SavedValue:Invited_By__c} |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    And I enter "Edition" values from "SubrecipientContact_Field_Values.xlsx"
    And I select dropdown value "Automation PM" in field "Invited_By__c"
    When I click modal button "Save"
    Then I softly see link "Automation PM" inside Page block

  @548810 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that lookup field behavior when I set it required to save from the config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
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
      | Program Approver is required. |

  @548806 @548798 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that lookup field functionality with partial search and save.
  |LWC: Field: Modal: SPI: To verify that user can be able to see lookup field in page layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
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
    Then I softly see field "X_Program Approver" inside page block
    And I enter value "Automation S" inside loookup from field "ProgramApprover__c"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |
      | Automation SME  |
      | Automation SA   |
      | Automation SPA  |

  @548807 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that the lookup field values are correctly exported.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "X_Program Approver" as "Automation SPI3"
    And I click on "Download as PDF" in the page details
    And I wait for "8" seconds
    And I download the file
    Then I softly see "X_Program Approver" on page "1" of "govgrants" pdf file

  @548801 @548759 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that when I click lookup field vale then it should be redirected to respective field page.
  |LWC: Field: Page Layout: SPI: To verify that when I click lookup field vale then it should be redirected to respective field page.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "X_Program Approver" as "Automation SPI3"
    And I click "Automation SPI3" lookup link
    Then I softly see field "First Name" as "Automation"

  @548802 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    Then I softly see remove x icon for lookup field "ProgramApprover__c"
    And I click on remove for lookup from field "ProgramApprover__c"
    Then I softly do not see remove x icon for lookup field "ProgramApprover__c"

  @548804 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue     | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                | Required for Save | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
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
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    When I click modal button "Save and Continue"
    Then I softly cannot see the following messages in the page details contains:
      | To save, X_Program Approver is required. |

  @548803 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that When I enter a value in the lookup field but does not select it from the table then a validation error will be thrown.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override             |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior                |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
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
    And I enter value "Automation SP" inside loookup from field "ProgramApprover__c"
    And I wait for "2" seconds
    When I enter value "Automation Runtime Announcement for Pre-App" into field "Title__c"
    Then I softly see the following messages in the page details contains:
      | Please select a value. |

  @548800 @548758 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that when I select lookup field table value and save then value should be stored under field in link format.
  |LWC: Field: Page Layout: SPI: To verify that when I select lookup field table value and save then value should be stored under field in link format.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see field "X_Program Approver" as "Automation SPI3"
    Then I softly see link "Automation SPI3" inside Page block

  @548808 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that when the hide condition is met then the lookup field is hidden
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                    | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideExpressionJsonForProfileSPIonPreApplication | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
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
    Then I softly cannot see field "X_Program Approver" inside page block

  @548809 @US-541037
  Scenario: LWC: Field: Modal: SPI: To verify that when the read only condition is met then the lookup field is read-only.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                    | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:HideExpressionJsonForProfileSPIonPreApplication | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
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
    Then I softly see field "X_Program Approver" inside page block
    Then I softly see field inside table "ProgramApprover__c" not in edit mode

  @548768 @US-541037
  Scenario: LWC: Field: Page Layout: SPI: To verify that lookup field behavior when I set it required to save from the config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
      | X Program Approver is required to save. Enter it in the Applicant Information section on the Overview tab. |

  @548764 @US-541037
  Scenario: LWC: Field: Page Layout: SPI: To verify that lookup field functionality with partial search and save.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c} |
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
    When I navigate to "Overview" sub tab
    And I enter value "Automation S" inside loookup from field "ProgramApprover__c"
    Then I softly see lookup or picklist records displayed as below
      | Automation SPI3 |
      | Automation SME  |
      | Automation SA   |
      | Automation SPA  |

  @548765 @548756 @US-541037
  Scenario: LWC: Field: Page Layout: SPI: To verify that the lookup field values are correctly exported.
  |LWC: Field: Page Layout: SPI: To verify that user can be able to see lookup field in page layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    Then I softly see field "X_Program Approver" inside page block
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Download as PDF" in the page details
    And I wait for "8" seconds
    And I download the file
    Then I softly see "X_Program Approver" on page "1" of "govgrants" pdf file

  @548760 @US-541037
  Scenario:LWC: Field: Page Layout: SPI: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    Then I softly see field "X_Program Approver" inside page block
    When I click modal button "Save and Continue"
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    Then I softly see remove x icon for lookup field "ProgramApprover__c"
    And I click on remove for lookup from field "ProgramApprover__c"
    Then I softly do not see remove x icon for lookup field "ProgramApprover__c"

  @548762 @US-541037
  Scenario: LWC: Field: Page Layout: SPI: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    Then I softly see field "X_Program Approver" inside page block
    When I click modal button "Save and Continue"
    And I select dropdown value "Automation SPI3" in field "ProgramApprover__c"
    When I enter value "PG" into field "ProjectAbstract__c"
    Then I softly cannot see the following messages in the page details contains:
      | Please select a value. |

  @548761 @US-541037
  Scenario: LWC: Field: Page Layout: SPI: To verify that When I enter a value in the lookup field but does not select it from the table then a validation error will be thrown.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |               | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |               | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    And I enter value "Automation SP" inside loookup from field "ProgramApprover__c"
    When I enter value "PG" into field "ProjectAbstract__c"
    Then I softly see the following messages in the page details contains:
      | Please select a value. |

  @548766 @US-541037
  Scenario: LWC: Field: Page Layout: SPI: To verify that when the hide condition is met then the lookup field is hidden.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                    | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                                                  | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                             | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HideExpressionJsonForProfileSPIonPreApplication | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    Then I softly cannot see field "X_Program Approver" inside page block

  @548767 @US-541037
  Scenario:LWC: Field: Page Layout: SPI: To verify that when the read only condition is met then the lookup field is read-only.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                                                    | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                                                  | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                                             | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                                                  | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:HideExpressionJsonForProfileSPIonPreApplication | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
    Then I softly see field "X_Program Approver" inside page block
    Then I softly see field inside table "ProgramApprover__c" not in edit mode

  @548763 @US-541037
  Scenario: LWC: Field: Page Layout: SPI: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:4 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true          | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |               | Create Grantor Preapplication | Name                      | {SavedValue:PreApplicationProgramApprover__c} |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true          | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |               | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |               | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |               | Recipient Pre-Application     | Name                      | {SavedValue:layoutProgramApprover__c}         |
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
      | To save, X_Program Approver is required in the Overview tab under the Applicant Information section. |

  @548825 @548812 @548840 @548827 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that lookup field behavior when I set it required to save from the config.
  |LWC: Field: Form : Admin: To verify that user can be able to see lookup field in page layout.|
  |LWC: Field: Form: PM: To verify that lookup field behavior when I set it required to save from the config.|
  |LWC: Field: Form: PM: To verify that user can be able to see lookup field in page layout.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I select dropdown value "Federal Financial Report" in field "ConfigForm__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on remove for lookup from field "ConfigForm__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Config: Form is required to save. Enter it in the Overall section. |

    Examples:
      | Users |
      | EXE   |

  @548821 @548836 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that lookup field functionality with partial search and save.
  |LWC: Field: Form: PM: To verify that lookup field functionality with partial search and save.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I enter value "Federal Financial Report" inside loookup from field "ConfigForm__c"
    Then I softly see lookup or picklist records displayed as below
      | Federal Financial Report- SF-425              |
      | Federal Financial Report Attachment - SF-425A |
      | SF 425 - Federal Financial Report             |

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548822 @548837 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that the lookup field values are correctly exported.
  |LWC: Field: Form: PM: To verify that the lookup field values are correctly exported.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Layout                              | Hide Pdf Download | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Layout:General                      | Hide Pdf Download | false         | General Review Form | Name                      |                               |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I click on remove for lookup from field "ConfigForm__c"
    And I select dropdown value "Program Specific Application form" in field "ConfigForm__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Download as PDF" in the page details
    And I wait for "8" seconds
    And I download the file
    Then I softly see "Program Specific Application form" on page "1" of "govgrants" pdf file

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548816 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that when I click lookup field vale then it should be redirected to respective field page.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Layout                              | Hide Pdf Download | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Layout:General                      | Hide Pdf Download | false         | General Review Form | Name                      |                               |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I click on remove for lookup from field "ConfigForm__c"
    And I select dropdown value "Program Specific Application form" in field "ConfigForm__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click "Program Specific Application form" lookup link
    Then I see "GNT__PageTemplate__c" in current url

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548817 @548831 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.
  |LWC: Field: Form: PM: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Layout                              | Hide Pdf Download | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Layout:General                      | Hide Pdf Download | false         | General Review Form | Name                      |                               |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I select dropdown value "Program Specific Application form" in field "ConfigForm__c"
    Then I softly see remove x icon for lookup field "ConfigForm__c"
    And I click on remove for lookup from field "ConfigForm__c"
    Then I softly do not see remove x icon for lookup field "ConfigForm__c"

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548819 @548820 @548834 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.
  |LWC: Field: Form: Admin: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.|
  |LWC: Field: Form: PM: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I select dropdown value "Program Specific Application form" in field "ConfigForm__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on remove for lookup from field "ConfigForm__c"
    And I click on "Save" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | To save, Config: Form is required in the Details tab under the Overall section. |

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548818 @548832 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that When I enter a value in the lookup field but does not select it from the table then a validation error will be thrown.”
  |LWC: Field: Form: PM: To verify that When I enter a value in the lookup field but does not select it from the table then a validation error will be thrown.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I enter value "Program Specific Application" inside loookup from field "ConfigForm__c"
    When I enter value "organization have current written program policies and procedures" into field "SvProgramFormQ1__c"
    Then I softly see the following messages in the page details contains:
      | Please select a value. |

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548815 @548829 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that when I select lookup field table value and save then value should be stored under field in link format.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                   | ApiGeneratedId:1 |
      | Page Layout                              | Hide Pdf Download | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active         | true          | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior |               | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Layout:General                      | Hide Pdf Download | false         | General Review Form | Name                      |                               |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    And I click on remove for lookup from field "ConfigForm__c"
    And I select dropdown value "Program Specific Application form" in field "ConfigForm__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see link "Program Specific Application form" inside Page block

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548823 @548838 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that when the hide condition is met then the lookup field is hidden
  |LWC: Field: Form: PM: To verify that when the hide condition is met then the lookup field is hidden|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                       | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior    |                                            | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:HEJHideActionProfileINEXE | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly cannot see field "Config: Form" inside page block

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548824 @548839 @US-541037
  Scenario Outline: LWC: Field: Form: Admin: To verify that when the read only condition is met then the lookup field is read-only.
  |LWC: Field: Form: Pm: To verify that when the read only condition is met then the lookup field is read-only.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                   | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                              | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                       | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                            | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                            | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:HEJHideActionProfileINEXE | General Review Form | Name                      | {SavedValue:EXEConfigForm__c} |
    When I login to "As a Grantor" app as "<Users>" user
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I perform quick search for "Permanent General Review Form For EXE" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Permanent General Review Form For EXE" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I pause execution for "7" seconds
    And I navigate to "Reports and Outcomes" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    Then I softly see field "Config: Form" inside page block
    Then I softly see field inside table "ConfigForm__c" not in edit mode

    Examples:
      | Users |
      | EXE   |
#      | Admin |

  @548854 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that lookup field behavior when I set it required to save from the config.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName         | fieldOrignalValue  coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active         | true                                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior |                                       | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName         | fieldNewValue     | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active         | true              | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior | Required for Save | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
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
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To save, Contact is required in the STANDARD ASSURANCES section. |

  @548850 @548842 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that lookup field functionality with partial search and save.
  |LWC: Field: Form: SPI: To verify that user can be able to see lookup field in page layout.|
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

  @548851 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that the lookup field values are correctly exported.
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
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I select dropdown value "Automation SPI3" in field "Contact__c"
    When I click on "Save" in the page details
    And I click on "Download as PDF" in the page details
    And I wait for "8" seconds
    And I download the file
    Then I softly see "Automation SPI3" on page "2" of "govgrants" pdf file

  @548845 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that when I click lookup field vale then it should be redirected to respective field page.
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
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I select dropdown value "Automation SPI3" in field "Contact__c"
    When I click on "Save" in the page details
    And I click "Automation SPI3" lookup link
    Then I softly see field "Type" as "Recipient"

  @548846 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that When I click on cross icon at the end of lookup field and save then value under lookup field should be vanished.
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
    Then I softly see field "Contact" inside page block
    And I select dropdown value "Automation SPI3" in field "Contact__c"
    And I pause execution for "5" seconds
    Then I softly see remove x icon for lookup field "Contact__c"
    And I pause execution for "5" seconds
    And I click on remove for lookup from field "Contact__c"
    And I pause execution for "5" seconds
    Then I softly do not see remove x icon for lookup field "Contact__c"

  @548848 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that when I enter a value in the lookup field and select it from the table then system should not show any validation error.
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
    And I select dropdown value "Automation SPI3" in field "Contact__c"
    Then I softly cannot see the following messages in the page details contains:
      | Please select a value. |


  @548847 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that When I enter a value in the lookup field but does not select it from the table then a validation error will be thrown.
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
    And I enter value "Automation SP" inside loookup from field "Contact__c"
    And I wait for "2" seconds
    When I enter value "Application SPI3" into field "AppplicationSubmitted__c"
    Then I softly see the following messages in the page details contains:
      | Please select a value. |

  @548844 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that when I select lookup field table value and save then value should be stored under field in link format.
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
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I select dropdown value "Automation SPI3" in field "Contact__c"
    When I click on "Save" in the page details
    Then I softly see link "Automation SPI3" inside Page block

  @548852 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that when the hide condition is met then the lookup field is hidden
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue  coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                       | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                       | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                   | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      | govgrants_config:HEForFieldsProfileSPI | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
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
    Then I softly cannot see field "Contact" inside page block

  @548853 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that when the read only condition is met then the lookup field is read-only.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                 | fieldOrignalValue  coreComponentField | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                  | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                       | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                       | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON |                                       | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                 | fieldNewValue                          | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Block Config:Page Block Rule Detail | Is Active                 | true                                   | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Required Behavior         |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON      |                                        | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON | govgrants_config:HEForFieldsProfileSPI | Standard Assurances Form | Name                      | {SavedValue:SAFContact__c} |
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
    Then I softly see field "Contact" inside page block
    Then I softly see field inside table "Contact__c" not in edit mode

  @548849 @US-541037
  Scenario: LWC: Field: Form: SPI: To verify that, when user click on lookup field and without searching save then blank lookup field should be saved.
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
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Contact" as ""

  @551892 @551891 @US-551586
  Scenario: LWC - Action Column Position - PM - Parent table of Grid - To verify that action column should be display to the left side of table
  |LWC - Action Column Position - PM - Child table of Grid - To verify that action column should be display to the left side of table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramReviewStepTemplates      | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramReviewStepPanelTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly see the Actions column in table "---program:-:reviewStepTableId---" displayed to the "left" of the "Description__c" column
    Then I see the Actions column in table "---program:-:reviewStepTableId---" displayed to the "left" of the "Description__c" column
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see the Actions column in table "---program:-:reviewFormPanelId---" displayed to the "left" of the "Weight__c" column
    Then I see the Actions column in table "---program:-:reviewFormPanelId---" displayed to the "left" of the "Weight__c" column
    Then I softly see the Actions column in table "---program:-:reviewFormPanelId---" displayed to the "right" of the "Weight__c" column

  @551834 @551835 @US-551586
  Scenario: LWC - Action Column Position - PM - Parent table of Grid - To verify that action column should be display to the right side of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Right         | ProgramReviewStepTemplates      | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Right         | ProgramReviewStepPanelTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly see the Actions column in table "---program:-:reviewStepTableId---" displayed to the "right" of the "Description__c" column
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see the Actions column in table "---program:-:reviewFormPanelId---" displayed to the "right" of the "Weight__c" column

  @551839 @551840 @US-551586
  Scenario: LWC - Action Column Position - PM - Parent table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table
  |LWC - Action Column Position - PM - Child table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                                                   | filterId         |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:DefaultHideLogicOnEditActionParentTableReviewSteps | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:DefaultHideLogicOnEditActionParentTableReviewForms | ApiGeneratedId:1 |
      | Flex Table:General    | Record Selection Column Position | Left                                                                | ApiGeneratedId:2 |
      | Flex Table:General    | Record Selection Column Position | Left                                                                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue                                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:ProfileInPMStepReview                        | ProgramReviewStepTemplates      | Name                      | Edit                       |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:HideLogicEditButtonHideReviewFormsChildTable | ProgramReviewStepPanelTemplates | Name                      | Edit                       |
      | Flex Table:General    | Record Selection Column Position | Right                                                         | ProgramReviewStepTemplates      | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Right                                                         | ProgramReviewStepPanelTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly see the Actions column in table "---program:-:reviewStepTableId---" displayed to the "right" of the "Description__c" column
    Then I cannot see row level action button "Edit" against "Pre-Screen Review" in flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see the Actions column in table "---program:-:reviewFormPanelId---" displayed to the "right" of the "Weight__c" column
    Then I cannot see row level action button "Edit" against "Pre-Screen" in flex table with id "---program:-:reviewFormPanelId---"

  @551896 @551897 @US-551586
  Scenario: LWC - Action Column Position - PM - Parent table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table
  |LWC - Action Column Position - PM - Child table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                                                   | filterId         |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:DefaultHideLogicOnEditActionParentTableReviewSteps | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:DefaultHideLogicOnEditActionParentTableReviewForms | ApiGeneratedId:1 |
      | Flex Table:General    | Record Selection Column Position | Left                                                                | ApiGeneratedId:2 |
      | Flex Table:General    | Record Selection Column Position | Left                                                                | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue                                                 | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:ProfileInPMStepReview                        | ProgramReviewStepTemplates      | Name                      | Edit                       |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:HideLogicEditButtonHideReviewFormsChildTable | ProgramReviewStepPanelTemplates | Name                      | Edit                       |
      | Flex Table:General    | Record Selection Column Position | Left                                                          | ProgramReviewStepTemplates      | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Left                                                          | ProgramReviewStepPanelTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly see the Actions column in table "---program:-:reviewStepTableId---" displayed to the "left" of the "Description__c" column
    Then I cannot see row level action button "Edit" against "Pre-Screen Review" in flex table with id "---program:-:reviewStepTableId---"
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see the Actions column in table "---program:-:reviewFormPanelId---" displayed to the "left" of the "Weight__c" column
    Then I cannot see row level action button "Edit" against "Pre-Screen" in flex table with id "---program:-:reviewFormPanelId---"

  @551946 @551947 @US-551586
  Scenario: LWC - Action Column Position - PM - Parent table of Grid - To verify that after selecting None option from "Record Selection Column Position" config then that action should be displays on right side of the table
  |LWC - Action Column Position - PM - Child table of Grid - To verify that after selecting None option from "Record Selection Column Position" config then that action should be displays on right side of the table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | --None--      | ProgramReviewStepTemplates      | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | --None--      | ProgramReviewStepPanelTemplates | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    Then I softly see the Actions column in table "---program:-:reviewStepTableId---" displayed to the "right" of the "Description__c" column
    And I expand nested table containing column value "Pre-Screen Review"
    Then I softly see the Actions column in table "---program:-:reviewFormPanelId---" displayed to the "right" of the "Weight__c" column

  @551910 @551909 @US-551586
  Scenario: LWC - Action Column Position - PM - Child table of Grid on Modal - To verify that action column should be display to the left side of table
  |LWC - Action Column Position - PM - Parent table of Grid on Modal - To verify that action column should be display to the left side of table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:1 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:2 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramReviewStepTemplates          | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramReviewStepPanelTemplates     | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramRelatedReviewPanelCategories | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramRelatedReviewPanelQuestions  | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I wait for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    Then I softly see the Actions column in table "---program:-:programReviewPanel---" displayed to the "left" of the "Weight__c" column
    And I expand nested table containing column value "Eligibility"
    Then I softly see the Actions column in table "---program:-:programReviewPanelQuestionsTableId---" displayed to the "left" of the "Question__c" column

  @551851 @551852 @551853 @US-551586
  Scenario: LWC - Action Column Position - PM - Data Table Enhanced on Modal - To verify that action column should be display to the right side of table
  |LWC - Action Column Position - PM - Parent table of Grid on Modal - To verify that action column should be display to the right side of table|
  |LWC - Action Column Position - PM - Child table of Grid on Modal - To verify that action column should be display to the right side of table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:1 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:2 |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField                  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramReviewStepTemplates          | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Left          | ProgramReviewStepPanelTemplates     | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Right         | ProgramRelatedReviewPanelCategories | Name                      |                            |
      | Flex Table:General    | Record Selection Column Position | Right         | ProgramRelatedReviewPanelQuestions  | Name                      |                            |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    And I wait for "5" seconds
    And I expand nested table containing column value "Pre-Screen Review"
    And I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---program:-:reviewFormPanelId---" without waiting for record
    Then I softly see the Actions column in table "---program:-:programReviewPanel---" displayed to the "right" of the "Weight__c" column
    And I expand nested table containing column value "Eligibility"
    Then I softly see the Actions column in table "---program:-:programReviewPanelQuestionsTableId---" displayed to the "right" of the "Question__c" column

  @551944 @US-551586
  Scenario: LWC - Action Column Position - PM - Data Table Enahnced - To verify that after selecting None option from "Record Selection Column Position" config then that action should be displays on right side of the table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | --None--      | GrantorServiceAreas | Name                      |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "2" seconds
    Then I see the Actions column in table "---focusarea:-:focusAreaTableId---" displayed to the "rightonphasetable" of the "Title__c" column

  @551888 @551890 @US-551586
  Scenario: LWC - Action Column Position - PM - Data Table Enhanced - To verify that action column should be display to the left side of table
  |LWC - Action Column Position - PM - Phase level Data Table Enhanced - To verify that action column should be display to the left side of table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | GrantorServiceAreas | Name                      |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "2" seconds
    Then I see the Actions column in table "---focusarea:-:focusAreaTableId---" displayed to the "leftonphasetable" of the "Title__c" column

  @551832 @551833 @US-551586
  Scenario: LWC - Action Column Position - PM - Data Table Enhanced - To verify that action column should be display to the right side of table
  |LWC - Action Column Position - PM - Phase level Data Table Enhanced - To verify that action column should be display to the right side of table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Right         | GrantorServiceAreas | Name                      |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "2" seconds
    Then I see the Actions column in table "---focusarea:-:focusAreaTableId---" displayed to the "rightonphasetable" of the "Title__c" column

  @551837 @551838 @551895 @US-551586
  Scenario: LWC - Action Column Position - PM - Data Table Enhanced - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table
  |LWC - Action Column Position - PM - Phase level Data Table Enhanced - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
  |LWC - Action Column Position - PM - Phase level Data Table Enhanced - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON             |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue                        | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left                                 | GrantorServiceAreas | Name                      |                            |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:FocusAreaActionHide | GrantorServiceAreas | Name                      | View                       |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "2" seconds
    And I perform quick search for "Automation Permanent Focus Area" in "---focusarea:-:focusAreaTableId---" panel
    Then I softly see the Actions column in table "---focusarea:-:focusAreaTableId---" displayed to the "leftonphasetable" of the "Title__c" column
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---focusarea:-:focusAreaTableId---"

  @551945 @551860 @US-551586
  Scenario: LWC - Action Column Position - PM - Phase level Data Table Enhanced - To verify that after selecting None option from "Record Selection Column Position" config then that action should be displays on right side of the table
  |LWC - Action Column Position - SPI - Phase level Data Table Enhanced - To verify that action column should be display to the right side of table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | --None--      | GrantorServiceAreas | Name                      |                            |
    Given I login to "As a Grantor" app as "PM" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I pause execution for "2" seconds
    Then I see the Actions column in table "---focusarea:-:focusAreaTableId---" displayed to the "rightonphasetable" of the "Title__c" column

  @551916 @551917 @US-551586
  Scenario: LWC - Action Column Position - SPI - Data Table Enhanced - To verify that action column should be display to the left side of table
  |LWC - Action Column Position - SPI - Phase level Data Table Enhanced - To verify that action column should be display to the left side of table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | AllCloseouts       | Name                      |                            |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Closeout" tab
    Then I see the Actions column in table "---closeout:-:CloseoutTableId---" displayed to the "leftonphasetable" of the "Type__c" column

  @551859 @US-551586
  Scenario: LWC - Action Column Position - SPI - Data Table Enhanced - To verify that action column should be display to the right side of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Right         | AllCloseouts       | Name                      |                            |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Closeout" tab
    Then I see the Actions column in table "---closeout:-:CloseoutTableId---" displayed to the "rightonphasetable" of the "Type__c" column

  @551864 @551922 @551865 @551923 @US-551586
  Scenario: LWC - Action Column Position - SPI - Data Table Enhanced - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table
  |LWC - Action Column Position - SPI - Data Table Enhanced - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
  |LWC - Action Column Position - SPI - Phase level Data Table Enhanced - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
  |LWC - Action Column Position - SPI - Phase level Data Table Enhanced - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Right         | AllCloseouts       | Name                      |                            |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Closeout" tab
    Then I see the Actions column in table "---closeout:-:CloseoutTableId---" displayed to the "rightonphasetable" of the "Type__c" column
    #standard hide logic already present for edit action
    Then I cannot see row level action button "Edit" against "Completed" in flex table with id "---focusarea:-:focusAreaTableId---"

  @551920 @US-551586
  Scenario:LWC - Action Column Position - SPI - Child table of Grid - To verify that action column should be display to the left side of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | EnhanceAppBudCateGrantorFlexTable | Name                      |                            |
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
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I see the Actions column in table "---applicationIntake:-:BudgetCategoriesTableId---" displayed to the "left" of the "CashMatch__c" column

  @551862 @US-551586
  Scenario: LWC - Action Column Position - SPI - Child table of Grid - To verify that action column should be display to the right side of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Right         | EnhanceAppBudCateGrantorFlexTable | Name                      |                            |
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
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I see the Actions column in table "---applicationIntake:-:BudgetCategoriesTableId---" displayed to the "right" of the "CashMatch__c" column

  @551867 @551925 @US-551586
  Scenario: LWC - Action Column Position - SPI - Child table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table
  |LWC - Action Column Position - SPI - Child table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | EnhanceAppBudCateGrantorFlexTable | Name                      |                            |
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
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I see the Actions column in table "---applicationIntake:-:BudgetCategoriesTableId---" displayed to the "left" of the "CashMatch__c" column
    #standard hide logic already present for edit action
    Then I cannot see row level action button "Add Line Item Details" against "Construction" in flex table with id "---applicationIntake:-:BudgetCategoriesTableId---"

  @551919 @US-551586
  Scenario:LWC - Action Column Position - SPI - Parent table of Grid - To verify that action column should be display to the left side of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left          | FocusAreaApp       | Name                      |                            |
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
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I see the Actions column in table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" displayed to the "left" of the "BudgetedAmountTotal__c" column

  @551861 @US-551586
  Scenario: LWC - Action Column Position - SPI - Parent table of Grid - To verify that action column should be display to the right side of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left              | ApiGeneratedId:0 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Right         | FocusAreaApp       | Name                      |                            |
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
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I see the Actions column in table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" displayed to the "right" of the "BudgetedAmountTotal__c" column

  @551866 @551924 @US-551586
  Scenario: LWC - Action Column Position - SPI - Parent table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table
  |LWC - Action Column Position - SPI - Parent table of Grid - To verify that after hiding the action and applying "Record Selection Column Position" config then that action should not be display on table|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                        | fieldOrignalValue                                         | filterId         |
      | Flex Table:General    | Record Selection Column Position | Left                                                      | ApiGeneratedId:0 |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:BudgetSummarybyFocusAreaDefaultHideLogic | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                        | fieldNewValue                                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Record Selection Column Position | Left                                                              | FocusAreaApp       | Name                      |                            |
      | Flex Table Action     | Hide Expression JSON             | govgrants_config:BudgetSummarybyFocusAreaRemoveFocusAreaHideLogic | FocusAreaApp       | Name                      | Remove Focus Area          |
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
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    Then I softly see the Actions column in table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" displayed to the "left" of the "BudgetedAmountTotal__c" column
    Then I cannot see row level action button "Remove Focus Area" against "Automation Permanent Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @552831 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - E Table- Row Action - To verify that functionality of  all action availble on confirm modal.(e.g cancel/OK/Cross icon)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Are you sure you want to Edit? | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Confirmation Message Rich |                                | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Show Confirmation Box     | true                           | DataTableEnhanceProgramContacts | Name                      | Edit                       |
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---"
    Then I softly see confirmation box with message "Are you sure you want to Edit?" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552832 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - E Table- Row Action - To verify that When show confirmation box config is set as false then on clicking row level edit action confirmation message should not display.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Are you sure you want to Edit? | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Confirmation Message Rich |                                | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Show Confirmation Box     | false                          | DataTableEnhanceProgramContacts | Name                      | Edit                       |
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without process
    Then I softly do not see confirmation box with message "Are you sure you want to Edit?" is displayed

  @552825 @552829 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - E Table- Row Action - To verify that When user click on row level edit action then confirmation message will be shown as formatted. (e.g. basic Text formatting).
  |LWC - Support of Rich Text area for Confirmation message - PM - E Table- Row Action - To verify that When user click on row level edit action then long confirmation message will be shown as formatted. (e.g. support of 32K char).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                  | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Are you sure you want to Edit? | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Confirmation Message Rich | {SavedValue:LTA32768}          | DataTableEnhanceProgramContacts | Name                      | Edit                       |
      | Flex Table Action     | Show Confirmation Box     | true                           | DataTableEnhanceProgramContacts | Name                      | Edit                       |
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
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I click modal button "Close"
    When I click on "Edit" icon for "{SavedValue:EXE Username}" inside flex table with id "---program:-:contactsTableId---" without process
    Then I softly do not see confirmation box with message "{SavedValue:LTA32768}" is displayed

  @552818 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - E Table- Top Action - To verify that functionality of  all action availble on confirm modal.(e.g cancel/OK/Cross icon)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Are you sure to create new contact | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Confirmation Message Rich |                                    | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Show Confirmation Box     | true                               | DataTableEnhanceProgramContacts | Name                      | New                        |
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
    And I click on top right button "New" in flex table without processing having id "---program:-:contactsTableId---"
    Then I softly see confirmation box with message "Are you sure to create new contact" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552817 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - E Table- Top Action - To verify that support of submit warning message rich over submit warning message and submit warning warning message long.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Are you sure to create new contact | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Confirmation Message Rich | Override Confirmation Message Rich | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Show Confirmation Box     | true                               | DataTableEnhanceProgramContacts | Name                      | New                        |
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
    And I click on top right button "New" in flex table without processing having id "---program:-:contactsTableId---"
    Then I softly see confirmation box with message "Override Confirmation Message Rich" is displayed
    Then I softly do not see confirmation box with message "Are you sure to create new contact" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552819 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - E Table- Top Action - To verify that When show confirmation box config is set as false then on clicking row level edit action confirmation message should not display.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Are you sure to create new contact | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Confirmation Message Rich | Override Confirmation Message Rich | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Show Confirmation Box     | false                              | DataTableEnhanceProgramContacts | Name                      | New                        |
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
    And I click on top right button "New" in flex table without processing having id "---program:-:contactsTableId---"
    Then I softly do not see confirmation box with message "Override Confirmation Message Rich" is displayed
    Then I softly do not see confirmation box with message "Are you sure to create new contact" is displayed
    Then I see "Create Contact" opens in overLay window

  @552812 @552816 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - E Table- Top Action - To verify that When user click on top level new action then confirmation message will be shown as formatted. (e.g. basic Text E Table- Top Actionatting).
  |LWC - Support of Rich Text area for Confirmation message - PM - E Table- Top Action - To verify that When user click on top level new action then long confirmation message will be shown as formatted. (e.g. support of 32K char).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue         | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      |                       | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Confirmation Message Rich | {SavedValue:LTA32768} | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Show Confirmation Box     | true                  | DataTableEnhanceProgramContacts | Name                      | New                        |
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
    And I click on top right button "New" in flex table without processing having id "---program:-:contactsTableId---"
    Then I softly see confirmation box with message "{SavedValue:LTA32768}" is displayed

  @552694 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - Form - To verify that functionality of  all action availble on confirm modal.(e.g cancel/OK/Cross icon)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Are you sure to create new contact | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Confirmation Message Rich |                                    | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Show Confirmation Box     | true                               | DataTableEnhanceProgramContacts | Name                      | New                        |
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
    And I click on top right button "New" in flex table without processing having id "---program:-:contactsTableId---"
    Then I softly see confirmation box with message "Are you sure to create new contact" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      |               | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Confirmation Message Rich |               | DataTableEnhanceProgramContacts | Name                      | New                        |
      | Flex Table Action     | Show Confirmation Box     | false         | DataTableEnhanceProgramContacts | Name                      | New                        |

  @552501 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - Layout - To verify that functionality of  all action available on confirm modal.(e.g cancel/OK/Cross icon)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich | Edit              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                              | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      | Automation Submit Warning Message | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich |                                   | Grantor State Program | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "Automation Submit Warning Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552491 @552478 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - Layout - To verify that support of submit warning message rich over submit warning message and submit warning warning message long.
  |LWC - Support of Rich Text area for Confirmation message - PM - Layout - To verify that When user click on edit action then confirmation message will be shown as formatted. (e.g. basic Text Formatting).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich | Edit              | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      | Test Submit Warning Message            | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich | Automation Submit Warning Message Rich | Grantor State Program | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "Automation Submit Warning Message Rich" is displayed
    Then I softly do not see confirmation box with message "Test Submit Warning Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552487 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - Layout - To verify that When user click on edit action then long confirmation message will be shown as formatted. (e.g. support of 32K char).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue         | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                  | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      |                       | Grantor State Program | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich | {SavedValue:LTA32768} | Grantor State Program | Name                      | Test Button                |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "{SavedValue:LTA32768}" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552856 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Row Action - To verify that functionality of  all action availble on confirm modal.(e.g cancel/OK/Cross icon)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Automation Confirmation Message | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Confirmation Message Rich |                                 | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Show Confirmation Box     | true                            | AdditionalUser     | Name                      | View                       |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly see confirmation box with message "Automation Confirmation Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552855  @552850 @552843 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Row Action - To verify that support of submit warning message rich over submit warning message and submit warning warning message long.
  |LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Row Action - To verify that When user click on row level edit grand child action then confirmation message will be shown as formatted. (e.g. basic Text formatting).|
  |LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Top Action - To verify that support of submit warning message rich over submit warning message and submit warning warning message long.|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue                        | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      | Automation Confirmation Message      | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Confirmation Message Rich | Automation Confirmation Message Rich | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Show Confirmation Box     | true                                 | AdditionalUser     | Name                      | View                       |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly see confirmation box with message "Automation Confirmation Message Rich" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552857 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Row Action - To verify that When show confirmation box config is set as false then on clicking row level edit grand child action confirmation message should not display.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      |               | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Confirmation Message Rich |               | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Show Confirmation Box     | false         | AdditionalUser     | Name                      | View                       |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly do not see confirmation box with message "Automation Confirmation Message Rich" is displayed
    Then I softly see "View Contact" opens in overLay window

  @552854 @552844 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Row Action - To verify that When user click on row level edit grand child action then long confirmation message will be shown as formatted. (e.g. support of 32K char).
  |LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Top Action - To verify that functionality of  all action availble on confirm modal.(e.g cancel/OK/Cross icon)|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      |                       | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Confirmation Message Rich | {SavedValue:LTA32768} | AdditionalUser     | Name                      | View                       |
      | Flex Table Action     | Show Confirmation Box     | true                  | AdditionalUser     | Name                      | View                       |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    When I click on "View" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly see confirmation box with message "{SavedValue:LTA32768}" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552845 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Top Action - To verify that When show confirmation box config is set as false then on clicking row level edit action confirmation message should not display.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue   | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      |                 | AdditionalUser     | Name                      | Edit                       |
      | Flex Table Action     | Confirmation Message Rich | Automation Test | AdditionalUser     | Name                      | Edit                       |
      | Flex Table Action     | Show Confirmation Box     | true            | AdditionalUser     | Name                      | Edit                       |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Primary" inside flex table with id "---home:-:userContactsTableId---"
    Then I softly do not see confirmation box with message "Automation Test" is displayed
    Then I softly see "Edit Contact" opens in overLay window

  @552842 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - E Table- Top Action - To verify that When user click on top level new grand child action then long confirmation message will be shown as formatted. (e.g. support of 32K char).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                 | fieldOrignalValue | filterId         |
      | Flex Table Action     | Confirmation Message      |                   | ApiGeneratedId:0 |
      | Flex Table Action     | Confirmation Message Rich |                   | ApiGeneratedId:1 |
      | Flex Table Action     | Show Confirmation Box     | false             | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                 | fieldNewValue         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table Action     | Confirmation Message      |                       | AdditionalUser     | Name                      | New                        |
      | Flex Table Action     | Confirmation Message Rich | {SavedValue:LTA32768} | AdditionalUser     | Name                      | New                        |
      | Flex Table Action     | Show Confirmation Box     | true                  | AdditionalUser     | Name                      | New                        |
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    Then I softly see confirmation box with message "{SavedValue:LTA32768}" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup


  @552573 @552568 @552572 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - Layout - To verify that support of submit warning message rich over submit warning message and submit warning warning message long.
  |LWC - Support of Rich Text area for Confirmation message - SPI - Layout - To verify that When user click on edit action then confirmation message will be shown as formatted. (e.g. basic Text Formatting).|
  |LWC - Support of Rich Text area for Confirmation message - SPI - Layout - To verify that When user click on edit action then long confirmation message will be shown as formatted. (e.g. support of 32K char).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | Recipient Pre-Application | Name                      | Edit                       |
      | Page Layout Action    | Submit Warning Message      | Automation Test Submit Warning Message | Recipient Pre-Application | Name                      | Edit                       |
      | Page Layout Action    | Submit Warning Message Rich | {SavedValue:LTA32768}                  | Recipient Pre-Application | Name                      | Edit                       |
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
    And I click on "Edit" in the page details without processing
    Then I softly see confirmation box with message "{SavedValue:LTA32768}" is displayed
    Then I softly do not see confirmation box with message "Automation Test Submit Warning Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552575 @US-551599
  Scenario:LWC - Support of Rich Text area for Confirmation message - SPI - Layout - To verify that functionality of  all action availble on confirm modal.(e.g cancel/OK/Cross icon)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | Recipient Pre-Application | Name                      | Edit                       |
      | Page Layout Action    | Submit Warning Message      | Automation Test Submit Warning Message | Recipient Pre-Application | Name                      | Edit                       |
      | Page Layout Action    | Submit Warning Message Rich |                                        | Recipient Pre-Application | Name                      | Edit                       |
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
    And I click on "Edit" in the page details without processing
    Then I softly see confirmation box with message "Automation Test Submit Warning Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552699 @552703 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - Form - To verify that When user click on edit action then confirmation message will be shown as formatted. (e.g. basic Text Formatting).
  |LWC - Support of Rich Text area for Confirmation message - SPI - Form - To verify that When user click on edit action then long confirmation message will be shown as formatted. (e.g. support of 32K char).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      | Automation Test Submit Warning Message | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich | {SavedValue:LTA32768}                  | Program Specific Application form | Name                      | Test Button                |
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
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "{SavedValue:LTA32768}" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552705 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - Form - To verify that functionality of  all action availble on confirm modal.(e.g cancel/OK/Cross icon)
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      | Automation Test Submit Warning Message | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich |                                        | Program Specific Application form | Name                      | Test Button                |
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
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "Automation Test Submit Warning Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552704 @552699 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - SPI - Form - To verify that support of submit warning message rich over submit warning message and submit warning warning message long.
  |LWC - Support of Rich Text area for Confirmation message - SPI - Form - To verify that When user click on edit action then confirmation message will be shown as formatted. (e.g. basic Text Formatting).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField                | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      | Automation Test Submit Warning Message | Program Specific Application form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich | Automation Submit Warning Message Rich | Program Specific Application form | Name                      | Test Button                |
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
    And I click on "View" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "Automation Submit Warning Message Rich" is displayed
    Then I softly do not see confirmation box with message "Automation Test Submit Warning Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552692 @US-551599
  Scenario:LWC - Support of Rich Text area for Confirmation message - PM - Form - To verify that When user click on Send Invitation Layout action then long confirmation message will be shown as formatted. (e.g. support of 32K char).
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      | Automation Test Submit Warning Message | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich | {SavedValue:LTA32768}                  | General Review Form | Name                      | Test Button                |
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
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "{SavedValue:LTA32768}" is displayed
    Then I softly do not see confirmation box with message "Automation Submit Warning Message Rich" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true          | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      |               | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich |               | General Review Form | Name                      | Test Button                |

  @552693 @552688 @US-551599
  Scenario: LWC - Support of Rich Text area for Confirmation message - PM - Form - To verify that support of submit warning message rich over submit warning message and submit warning warning message long.
  |LWC - Support of Rich Text area for Confirmation message - PM - Form - To verify that When user click on Send Invitation Layout action then confirmation message will be shown as formatted. (e.g. basic Text Formatting).|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName                   | fieldOrignalValue | filterId         |
      | Page Layout Action    | Is Active                   | true              | ApiGeneratedId:0 |
      | Page Layout Action    | Submit Warning Message      |                   | ApiGeneratedId:1 |
      | Page Layout Action    | Submit Warning Message Rich |                   | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName                   | fieldNewValue                          | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Page Layout Action    | Is Active                   | true                                   | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message      | Automation Test Submit Warning Message | General Review Form | Name                      | Test Button                |
      | Page Layout Action    | Submit Warning Message Rich | Automation Submit Warning Message Rich | General Review Form | Name                      | Test Button                |
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
    And I get current URL
    When I click on "View" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I click on "Test Button" in the page details without processing
    Then I softly see confirmation box with message "Automation Submit Warning Message Rich" is displayed
    Then I softly do not see confirmation box with message "Automation Test Submit Warning Message" is displayed
    Then I see "Cancel" button is displayed on alert popup
    Then I see "Continue" button is displayed on alert popup

  @552007 @552009 @552001 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Layout - To verify that after selecting long text value, it should display properly without overlapping text.
  |LWC - Show long picklist value in picklist window - PM - Layout - To verify that behavior display when long value has no space|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program | Name                      | {SavedValue:MultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program | Name                      | {SavedValue:MultiSelectPicklistLongValue} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    And I click on "Save" in the page details
    Then I see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"
    Then I see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"

  @552008 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Layout - To verify that long values with special characters should display correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program | Name                      | {SavedValue:MultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program | Name                      | {SavedValue:MultiSelectPicklistLongValue} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    And I click on "Save" in the page details
    Then I see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"
    Then I see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"

  @552003 @552017 @552012 @552015 @552005 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Layout - To verify that long values wrap correctly inside picklist window
  |LWC - Show long picklist value in picklist window - PM - Layout - To verify that longer picklist value should display completely without being cutoff in picklist window.|
  |LWC - Show long picklist value in picklist window - PM - Layout - To verify that max picklist value length displays correctly|
  |LWC - Show long picklist value in picklist window - PM - Layout - To verify that picklist width remains consistent for long text picklist value|
  |LWC - Show long picklist value in picklist window - PM - Layout - To verify that selection of long values works properly|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program | Name                      | {SavedValue:MultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program | Name                      | {SavedValue:MultiSelectPicklistLongValue} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    And I click on "Save" in the page details
    Then I see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"

  @552038 @552037 @552041 @552042 @552045 @552047 @552049 @552050 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Forms - To verify that behavior display when long value has no space
  |LWC - Show long picklist value in picklist window - PM - Forms- To verify that after selecting long text value, it should display properly without overlapping text.|
  |LWC - Show long picklist value in picklist window - PM - Forms- To verify that if picklist value exceeds the available horizontal space, then system should show horizontal scrollbar to see complete text.|
  |LWC - Show long picklist value in picklist window - PM - Forms- To verify that long picklist values are fully visible in picklist window|
  |LWC - Show long picklist value in picklist window - PM - Forms- To verify that long values wrap correctly inside picklist window|
  |LWC - Show long picklist value in picklist window - PM - Forms- To verify that max picklist value length displays correctly|
  |LWC - Show long picklist value in picklist window - PM - Forms- To verify that picklist width remains consistent for long text picklist value|
  |LWC - Show long picklist value in picklist window - PM - Forms- To verify that selection of long values works properly|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | General Review Form | Name                      | {SavedValue:EXEMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | General Review Form | Name                      | {SavedValue:EXEMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552044 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Forms- To verify that long values with special characters should display correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | General Review Form | Name                      | {SavedValue:EXEMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | General Review Form | Name                      | {SavedValue:EXEMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"

  @552056 @552060 @552061 @552064 @552065 @552067 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Forms - To verify that behavior display when long value has no space
  |LWC - Show long picklist value in picklist window - SPI - Forms- To verify that long picklist values are fully visible in picklist window|
  |LWC - Show long picklist value in picklist window - SPI - Forms- To verify that long text does not overflow outside dropdown boundary|
  |LWC - Show long picklist value in picklist window - SPI - Forms- To verify that longer picklist value should display completely without being cutoff in picklist window.|
  |LWC - Show long picklist value in picklist window - SPI - Forms- To verify that max picklist value length displays correctly|
  |LWC - Show long picklist value in picklist window - SPI - Forms- To verify that picklist width remains consistent for long text picklist value|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552062 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Forms- To verify that long values with special characters should display correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"

  @552068 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Forms- To verify that selection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552034 @552030 @552029 @552027 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Layout - To verify that behavior display when long value has no space
  |LWC - Show long picklist value in picklist window - SPI - Layout - To verify that long picklist values are fully visible in picklist window|
  |LWC - Show long picklist value in picklist window - SPI - Layout - To verify that long text does not overflow outside dropdown boundary|
  |LWC - Show long picklist value in picklist window - SPI - Layout - To verify that long values wrap correctly inside picklist window|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
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
    When I navigate to "Overview" sub tab
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552028 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Layout - To verify that long values with special characters should display correctly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
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
    When I navigate to "Overview" sub tab
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"

  @552025 @552023 @552022 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Layout - To verify that max picklist value length displays correctly
  |LWC - Show long picklist value in picklist window - SPI - Layout - To verify that picklist width remains consistent for long text picklist value|
  |LWC - Show long picklist value in picklist window - SPI - Layout - To verify that selection of long values works properly|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
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
    When I navigate to "Overview" sub tab
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552073 @552078 @552083 @552084 @552085 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Modal - To verify that behavior display when long value has no space
  |LWC - Show long picklist value in picklist window - PM - Modal - To verify that long picklist values are fully visible in picklist window|
  |LWC - Show long picklist value in picklist window - PM - Modal - To verify that max picklist value length displays correctly|
  |LWC - Show long picklist value in picklist window - PM - Modal - To verify that picklist values should remain readable and aligned correctly when user scrolls through a long picklist.|
  |LWC - Show long picklist value in picklist window - PM - Modal - To verify that picklist width remains consistent for long text picklist value|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552080 @552080 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Modal - To verify that long values with special characters should display correctly
  | LWC - Show long picklist value in picklist window - PM - Modal - To verify that long values with special characters should display correctly|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"

  @552086 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Modal - To verify that selection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"

  @552106 @552120 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI  - Modal - To verify that tooltip appears when hovering over long values
  |LWC - Show long picklist value in picklist window - SPI - Modal - To verify that after selecting long text value, it should display properly without overlapping text.|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"

  @552118 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Modal - To verify that behavior when picklist contains blank/empty value
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "" under list "MultiSelect Picklist Long Value"

  @552115 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Modal - To verify that long picklist values are fully visible in picklist window
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"

  @552113 @552110 @552109 @552108 @552107 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Modal - To verify that long values with special characters should display correctly
  |LWC - Show long picklist value in picklist window - SPI - Modal - To verify that max picklist value length displays correctly|
  |LWC - Show long picklist value in picklist window - SPI - Modal - To verify that picklist values should remain readable and aligned correctly when user scrolls through a long picklist.|
  |LWC - Show long picklist value in picklist window - SPI - Modal - To verify that picklist width remains consistent for long text picklist value|
  |LWC - Show long picklist value in picklist window - SPI - Modal - To verify that selection of long values works properly|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
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
    When I enter "MultiSelect Picklist Long Value" values from "MultiSelectPicklist.xlsx"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"

  @552076 @US-551587
  Scenario:LWC - Show long picklist value in picklist window - PM - Modal - To verify that deselection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program        | Name                      | {SavedValue:MultiSelectPicklistLongValue}                   |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program        | Name                      | {SavedValue:MultiSelectPicklistLongValue}                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I select "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" multiselect value from "MultiSelect_Picklist__c"
    When I select "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I deselect "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "AutoTestScenarioFlow1" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552006 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Layout - To verify that deselection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField           | coreCOmponentSubFieldName | coreComponentSubFieldValue                                  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program Create | Name                      | {SavedValue:CreateProgramModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Grantor State Program        | Name                      | {SavedValue:MultiSelectPicklistLongValue}                   |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Grantor State Program        | Name                      | {SavedValue:MultiSelectPicklistLongValue}                   |
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I select "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" multiselect value from "MultiSelect_Picklist__c"
    When I select "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I deselect "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    And I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "AutoTestScenarioFlow1" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552032 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Layout - To verify that deselection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                    |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue} |
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
    When I navigate to "Overview" sub tab
    When I select "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" multiselect value from "MultiSelect_Picklist__c"
    When I select "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I deselect "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    And I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "AutoTestScenarioFlow1" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552117 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Modal - To verify that deselection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField            | coreCOmponentSubFieldName | coreComponentSubFieldValue                                         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Create Grantor Preapplication | Name                      | {SavedValue:CreatePreApplicationModalMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue}      |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Recipient Pre-Application     | Name                      | {SavedValue:CreatePreApplicationMultiSelectPicklistLongValue}      |
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
    When I select "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" multiselect value from "MultiSelect_Picklist__c"
    When I select "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I deselect "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "AutoTestScenarioFlow1" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552040 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - PM - Forms- To verify that deselection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true              | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField  | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | General Review Form | Name                      | {SavedValue:EXEMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | General Review Form | Name                      | {SavedValue:EXEMultiSelectPicklistLongValue} |
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
    When I select "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" multiselect value from "MultiSelect_Picklist__c"
    When I select "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I deselect "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "AutoTestScenarioFlow1" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @552058 @US-551587
  Scenario: LWC - Show long picklist value in picklist window - SPI - Forms- To verify that deselection of long values works properly
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | false             | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Field Label Override |                   | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue | coreComponentField       | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Page Block Config:Page Block Rule Detail | Is Active            | true          | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
      | Page Block Config:Page Block Rule Detail | Field Label Override |               | Standard Assurances Form | Name                      | {SavedValue:SAFMultiSelectPicklistLongValue} |
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
    When I select "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" multiselect value from "MultiSelect_Picklist__c"
    When I select "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I deselect "AutoTestScenarioFlow1" multiselect value from "MultiSelect_Picklist__c"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpecialChars}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "AutoTestScenarioFlow1" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withSpace}" under list "MultiSelect Picklist Long Value"
    Then I softly do not see multipicklist field "MultiSelect_Picklist__c" contains value "{SavedValue:MultiSelectPicklistLongValue255withNoSpace}" under list "MultiSelect Picklist Long Value"

  @548162 @US-545077 @goto_CustomSettings_Config_Key_Value_Store_and_enable_PreventURLHacking
  Scenario: Classic : Admin : URL hacking feature : To verify user can not be able to edit record through modifying view url
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "programEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:programEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:programEGMSID}" in global search with id "Programs"
    Then I softly see the following messages in the page details contains:
      | You don't have sufficient access to edit this record |

  @548200 @US-545077 @goto_CustomSettings_Config_Key_Value_Store_and_disabled_PreventURLHacking
  Scenario: LWC : Admin : URL hacking feature : To verify user can be able to edit record from table if user search record from global search when PreventURLHacking  custom setting is disabled
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "programEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:programEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:programEGMSID}" in global search with id "Programs"
    Then I softly cannot see the following messages in the page details contains:
      | You don't have sufficient access to edit this record |

  @548201 @US-545077 @goto_CustomSettings_Config_Key_Value_Store_and_disabled_PreventURLHacking
  Scenario:LWC : PM : URL hacking feature : To verify user can be able to edit record from table if user search record from global search when PreventURLHacking  custom setting is disabled
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
    And I save the field labeled "EGMS ID" as "programEGMSID"
    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:programEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:programEGMSID}" in global search with id "Programs"
    Then I softly cannot see the following messages in the page details contains:
      | You don't have sufficient access to edit this record |

  @551970 @US-545077 @goto_CustomSettings_Config_Key_Value_Store_and_enable_PreventURLHacking
  Scenario: LWC : Admin : URL hacking feature : To verify user can not be able to edit record from table if user search record from global search without PreventURLHacking custom setting if Edit action is hidden on layout
    When I login to "As a Grantor" app as "ADMIN1" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "programEGMSID"
    When I re-login to "As a Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:programEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:programEGMSID}" in global search with id "Programs"
    Then I softly see the following messages in the page details contains:
      | You don't have sufficient access to edit this record |

  @548164 @551971 @US-545077 @goto_CustomSettings_Config_Key_Value_Store_and_enable_PreventURLHacking
  Scenario: LWC : PM : URL hacking feature : To verify user can not be able to edit record from table if user search record from global search when PreventURLHacking  custom setting is enabled
  |LWC : PM : URL hacking feature : To verify user can not be able to edit record from table if user search record from global search without PreventURLHacking custom setting if Edit action is hidden on layout|
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
    And I save the field labeled "EGMS ID" as "programEGMSID"
    When I navigate to "Overview" sub tab
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:programEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:programEGMSID}" in global search with id "Programs"
    Then I softly see the following messages in the page details contains:
      | You don't have sufficient access to edit this record |

  @548199 @551972 @US-545077 @goto_CustomSettings_Config_Key_Value_Store_and_enable_PreventURLHacking
  Scenario: LWC : SPI : URL hacking feature : To verify user can not be able to edit record from table if user search record from global search when PreventURLHacking  custom setting is enabled
  |LWC : SPI : URL hacking feature : To verify user can not be able to edit record from table if user search record from global search without PreventURLHacking custom setting if Edit action is hidden on layout|
#    Given I have "default" configuration as below:
#      | configurationCategory | fieldName            | fieldOrignalValue                                                            | filterId         |
#      | Page Layout Action    | Hide Expression JSON | {govgrants_config:CreateApplication_Edit_BUtton_Default_HIdeExperessionJson} | ApiGeneratedId:0 |
#    Given I setup test configuration as below:
#      | configurationCategory | fieldName            | fieldNewValue                                             | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
#      | Page Layout Action    | Hide Expression JSON | {govgrants_config:HideForProfileSPIPostCreateApplication} | Recipient ApplicationView | Name                      | Edit                       |
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
    Then I softly see the following messages in the page details contains:
      | You don't have sufficient access to edit this record |

  @548202 @US-545077 @goto_CustomSettings_Config_Key_Value_Store_and_disabled_PreventURLHacking
  Scenario:LWC : SPI : URL hacking feature : To verify user can be able to edit record from table if user search record from global search when PreventURLHacking  custom setting is disabled
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
    Then I softly cannot see the following messages in the page details contains:
      | You don't have sufficient access to edit this record |

  @550472 @550472_3 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},URL__c                          | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValueUrlINInverse | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
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
    Then I softly do not see "Messages" subtab is present in page details
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly see "Messages" subtab is present in page details

  @550472 @550472_4 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                   | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},URL__c                             | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValueUrlNotINInverse | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
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
    Then I softly see "Messages" subtab is present in page details
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly do not see "Messages" subtab is present in page details

  @550472 @550472_5 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                      | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},URL__c                                | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValueUrlContainsInverse | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
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
    Then I softly do not see "Messages" subtab is present in page details
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly see "Messages" subtab is present in page details

  @550472 @550472_5 @US-549836
  Scenario: LWC : Layout : TAB : Admin : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General                  | Display Field Names  | {SavedValue:ContactTableDFN},URL__c                                 | DataTableEnhanceProgramContacts |                           |                                     |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | govgrants_config:HideTabOnDynamicTableFieldValueUrlNOTEQUALSInverse | Grantor State Program           | Name                      | {SavedValue:MessagesTabIdOnProgram} |
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
    Then I softly see "Messages" subtab is present in page details
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly do not see "Messages" subtab is present in page details

  @550475 @550475_1 @550475_2 @US-549836 @550478
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly do not see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                 |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValueUrlContainsInverse |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValueUrlINInverse       |

  @550475 @550475_3 @US-549836 @550477
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly do not see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                         |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValueUrlEqualTo |

  @550475 @550475_4 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly do not see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL            |
      | {SavedValue:PM Username} | www.google.com |
    And I refresh the page
    Then I softly see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                            |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValueUrlNotEqualTo |

  @550475 @550475_4 @US-549836 @550478
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly do not see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary |
      | {SavedValue:PM Username} | 1000       |
    And I refresh the page
    Then I softly see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                            |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValuePMuserInverse |

  @550475 @550475_4 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary |
      | {SavedValue:PM Username} | 1000       |
    And I refresh the page
    Then I softly do not see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                     |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValuePMuser |

  @550475 @550475_4 @550475_5 @550475_6 @550477 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary        |
      | {SavedValue:PM Username} | <BaseSalaryValue> |
    And I refresh the page
    Then I softly do not see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                     | BaseSalaryValue |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldGreaterThanEqualValuePMuser | 2222            |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldLessThanEqualValuePMuser    | 33              |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldLessThanValuePMuser         | 33              |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldGreaterThanValuePMuser      | 55555           |

  @550476 @US-549836 @550478
  Scenario Outline:LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically using "inverse True".
  |LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly do not see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary        |
      | {SavedValue:PM Username} | <BaseSalaryValue> |
    And I refresh the page
    Then I softly see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                               | BaseSalaryValue |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldGreaterThanEqualValuePMuserInversTrue | 2222            |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldLessThanEqualValuePMuserInversTrue    | 33              |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldLessThanValuePMuserInversTrue         | 33              |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldGreaterThanValuePMuserInversTrue      | 55555           |

  @550475 @550475_10 @550477 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL         |
      | {SavedValue:PM Username} | <URLValues> |
    And I refresh the page
    Then I softly do not see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                     | URLValues      |
      | PM    | govgrants_config:HideDynamicFieldURLIn | www.google.com |

  @550476 @US-549836 @550478
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that Page Block should be hide/unhide dynamically using "inverse True".
  |LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                       | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:ContactTableDFN},URL__c | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly do not see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | URL         |
      | {SavedValue:PM Username} | <URLValues> |
    And I refresh the page
    Then I softly see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                               | URLValues      |
      | PM    | govgrants_config:HideDynamicFieldURLInInversTrue | www.google.com |

  @550479 @550479_1 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>       | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly do not see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                         | HeaderTitle         | ColumnValue     | contactTableDisplayValue                          |
      #number datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__c    | Number Of Personnel | 1000            | {SavedValue:ContactTableDFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextAreaFieldText_Area__c          | Text Area           | google          | {SavedValue:ContactTableDFN},Text_Area__c         |
      #Text - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextFieldAgencyLogin__c            | Agency Login        | google          | {SavedValue:ContactTableDFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__c | Long Text Area      | google          | {SavedValue:ContactTableDFN},Long_Text_Area__c    |
      #Rich Text Area datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisRichTextAreaFieldRich_Text_Area__c | Rich Text Area      | google          | {SavedValue:ContactTableDFN},Rich_Text_Area__c    |
      #Email datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisEmailFieldContactEmail__c          | Contact Email       | rei@yopmail.com | {SavedValue:ContactTableDFN},ContactEmail__c      |
      #Phone datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPhoneFieldPhone_Number__c          | Phone Number        | 8888888888      | {SavedValue:ContactTableDFN},Phone_Number__c      |
      #Percent datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPercentageFieldPercentage__c       | Percentage          | 1000            | {SavedValue:ContactTableDFN},Percentage__c        |
      #Formula datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisFormulaFieldContactType__c         | BaseSalary          | 5555            | {SavedValue:ContactTableDFN},ContactType__c       |


  @550479 @550479_2 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>       | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly do not see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                   | HeaderTitle    | ColumnValue | contactTableDisplayValue                     |
      #Date datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisDate__cFieldDate__c          | Date           | 5/6/2026    | {SavedValue:ContactTableDFN},Date__c         |
      #Checkbox datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisCheckboxFieldIsKeyContact__c | Is Key Contact | checked     | {SavedValue:ContactTableDFN},IsKeyContact__c |
      #Picklist datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPicklistFieldProjectRole__c  | Project Role   | Ebiz POC    | {SavedValue:ContactTableDFN}                 |

  @550480 @550480_1 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all Data Types using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>       | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly do not see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly see "Program Specific Settings" page block displayed
    Examples:
      | Users | HideExpressionJSON                                                                    | HeaderTitle         | ColumnValue     | contactTableDisplayValue                          |
      #number datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__cInversTrue     | Number Of Personnel | 1000            | {SavedValue:ContactTableDFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextAreaFieldNumberOfText_Area__cInverseTrue  | Text Area           | google          | {SavedValue:ContactTableDFN},Text_Area__c         |
      #Text - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextFieldAgencyLogin__cInverseTrue            | Agency Login        | google          | {SavedValue:ContactTableDFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__cInverseTrue | Long Text Area      | google          | {SavedValue:ContactTableDFN},Long_Text_Area__c    |
      #Rich Text Area datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisRichTextAreaFieldRich_Text_Area__cInverseTrue | Rich Text Area      | google          | {SavedValue:ContactTableDFN},Long_Text_Area__c    |
      #Email datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisEmailFieldContactEmail__cInverseTrue          | Contact Email       | rei@yopmail.com | {SavedValue:ContactTableDFN},ContactEmail__c      |
      #Phone datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPhoneFieldPhone_Number__cInverseTrue          | Phone Number        | 8888888888      | {SavedValue:ContactTableDFN},Phone_Number__c      |
          #Percent datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPercentageFieldPercentage__cInverseTrue       | Percentage          | 1000            | {SavedValue:ContactTableDFN},Percentage__c        |
      #Formula datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisFormulaFieldContactType__cInverseTrue         | BaseSalary          | 5555            | {SavedValue:ContactTableDFN},ContactType__c       |

  @550480 @550480_2 @US-549836
  Scenario Outline: LWC : Layout : Page Block : Admin : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all Data Types using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:ContactTableDFN} | ApiGeneratedId:0 |
      | Page Block            | Hide Expression JSON |                              | ApiGeneratedId:1 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                            |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>       | Grantor State Program           | Name                      | PB-11275                   |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly do not see "Program Specific Settings" page block displayed
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly see "Program Specific Settings" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                              | HeaderTitle    | ColumnValue | contactTableDisplayValue                     |
      #Date datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisDate__cFieldDate__cInverseTrue          | Date           | 5/6/2026    | {SavedValue:ContactTableDFN},Date__c         |
      #Checkbox datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisCheckboxFieldIsKeyContact__cInverseTrue | Is Key Contact | checked     | {SavedValue:ContactTableDFN},IsKeyContact__c |
      #Picklist datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPicklistFieldProjectRole__cInverseTrue  | Project Role   | Ebiz POC    | {SavedValue:ContactTableDFN}                 |

  @550481 @US-549836
  Scenario Outline: LWC : Layout : Page Block Detail : Admin : To verify that Page Block Detail should be hide/unhide dynamically if the object field value is updated.
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                         | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Flex Table:General                       | Display Field Names              | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <HideExpressionJSON>       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see field "X_Funded Amount" inside page block
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly cannot see field "X_Funded Amount" inside page block

    Examples:
      | Users | HideExpressionJSON                                                      | HeaderTitle         | ColumnValue | contactTableDisplayValue                          |
      | PM    | govgrants_config:HideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__c | Number Of Personnel | 1000        | {SavedValue:ContactTableDFN},NumberOfPersonnel__c |

  @550482 @US-549836
  Scenario Outline:LWC : Layout : Page Block Detail : Admin : To verify that Page Block Detail should be hide/unhide dynamically using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                         | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                              | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Flex Table:General                       | Display Field Names              | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <HideExpressionJSON>       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly cannot see field "X_Funded Amount" inside page block
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly see field "X_Funded Amount" inside page block
    Examples:
      | Users | HideExpressionJSON                                                                | HeaderTitle         | ColumnValue | contactTableDisplayValue                          |
      | PM    | govgrants_config:HideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__cInversTrue | Number Of Personnel | 1000        | {SavedValue:ContactTableDFN},NumberOfPersonnel__c |

  @550485 @US-549836
  Scenario Outline: LWC : Layout : Page Block Detail : Admin : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                         | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Flex Table:General                       | Display Field Names              | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <HideExpressionJSON>       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see field "X_Funded Amount" inside page block
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly cannot see field "X_Funded Amount" inside page block

    Examples:
      | Users | HideExpressionJSON                                                         | HeaderTitle         | ColumnValue     | contactTableDisplayValue                          |
      #number datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__c    | Number Of Personnel | 1000            | {SavedValue:ContactTableDFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextAreaFieldText_Area__c          | Text Area           | google          | {SavedValue:ContactTableDFN},Text_Area__c         |
      #Text - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextFieldAgencyLogin__c            | Agency Login        | google          | {SavedValue:ContactTableDFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__c | Long Text Area      | google          | {SavedValue:ContactTableDFN},Long_Text_Area__c    |
      #Rich Text Area datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisRichTextAreaFieldRich_Text_Area__c | Rich Text Area      | google          | {SavedValue:ContactTableDFN},Rich_Text_Area__c    |
      #Email datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisEmailFieldContactEmail__c          | Contact Email       | rei@yopmail.com | {SavedValue:ContactTableDFN},ContactEmail__c      |
      #Phone datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPhoneFieldPhone_Number__c          | Phone Number        | 8888888888      | {SavedValue:ContactTableDFN},Phone_Number__c      |
      #Percent datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPercentageFieldPercentage__c       | Percentage          | 1000            | {SavedValue:ContactTableDFN},Percentage__c        |
      #Formula datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisFormulaFieldContactType__c         | BaseSalary          | 5555            | {SavedValue:ContactTableDFN},ContactType__c       |

  @550485 @US-549836
  Scenario Outline: LWC : Layout : Page Block Detail : Admin : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                         | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Flex Table:General                       | Display Field Names              | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <HideExpressionJSON>       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly see field "X_Funded Amount" inside page block
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly cannot see field "X_Funded Amount" inside page block


    Examples:
      | Users | HideExpressionJSON                                                   | HeaderTitle    | ColumnValue | contactTableDisplayValue                     |
      #Date datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisDate__cFieldDate__c          | Date           | 5/6/2026    | {SavedValue:ContactTableDFN},Date__c         |
      #Checkbox datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisCheckboxFieldIsKeyContact__c | Is Key Contact | checked     | {SavedValue:ContactTableDFN},IsKeyContact__c |
      #Picklist datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPicklistFieldProjectRole__c  | Project Role   | Ebiz POC    | {SavedValue:ContactTableDFN}                 |

  @550486 @US-549836
  Scenario Outline: LWC : Layout : Page Block Detail : Admin : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                         | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Flex Table:General                       | Display Field Names              | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <HideExpressionJSON>       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly cannot see field "X_Funded Amount" inside page block
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly see field "X_Funded Amount" inside page block

    Examples:
      | Users | HideExpressionJSON                                                              | HeaderTitle    | ColumnValue | contactTableDisplayValue                     |
      #Date datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisDate__cFieldDate__cInverseTrue          | Date           | 5/6/2026    | {SavedValue:ContactTableDFN},Date__c         |
      #Checkbox datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisCheckboxFieldIsKeyContact__cInverseTrue | Is Key Contact | checked     | {SavedValue:ContactTableDFN},IsKeyContact__c |
      #Picklist datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPicklistFieldProjectRole__cInverseTrue  | Project Role   | Ebiz POC    | {SavedValue:ContactTableDFN}                 |

  @550486 @US-549836 @wip
  Scenario Outline: LWC : Layout : Page Block Detail : Admin : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                         | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Flex Table:General                       | Display Field Names              | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <HideExpressionJSON>       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly cannot see field "X_Funded Amount" inside page block
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | <HeaderTitle> |
      | {SavedValue:PM Username} | <ColumnValue> |
    And I refresh the page
    Then I softly see field "X_Funded Amount" inside page block

    Examples:
      | Users | HideExpressionJSON                                                                    | HeaderTitle         | ColumnValue     | contactTableDisplayValue                          |
      #number datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__cInversTrue     | Number Of Personnel | 1000            | {SavedValue:ContactTableDFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextAreaFieldNumberOfText_Area__cInverseTrue  | Text Area           | google          | {SavedValue:ContactTableDFN},Text_Area__c         |
      #Text - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisTextFieldAgencyLogin__cInverseTrue            | Agency Login        | google          | {SavedValue:ContactTableDFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__cInverseTrue | Long Text Area      | google          | {SavedValue:ContactTableDFN},Long_Text_Area__c    |
      #Rich Text Area datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisRichTextAreaFieldRich_Text_Area__cInverseTrue | Rich Text Area      | google          | {SavedValue:ContactTableDFN},Long_Text_Area__c    |
      #Email datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisEmailFieldContactEmail__cInverseTrue          | Contact Email       | rei@yopmail.com | {SavedValue:ContactTableDFN},ContactEmail__c      |
      #Phone datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPhoneFieldPhone_Number__cInverseTrue          | Phone Number        | 8888888888      | {SavedValue:ContactTableDFN},Phone_Number__c      |
          #Percent datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisPercentageFieldPercentage__cInverseTrue       | Percentage          | 1000            | {SavedValue:ContactTableDFN},Percentage__c        |
      #Formula datatype
      | PM    | govgrants_config:HideDynamicFieldOnBasisFormulaFieldContactType__cInverseTrue         | BaseSalary          | 5555            | {SavedValue:ContactTableDFN},ContactType__c       |

  @550483 @550484 @US-549836
  Scenario Outline: LWC : Layout : Page Block Detail : Admin : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all operators
  |LWC : Layout : Page Block Detail : Admin : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all operators using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName                        | fieldOrignalValue            | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                         | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names              | {SavedValue:ContactTableDFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             |                              | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                              | ApiGeneratedId:3 |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                              | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName                        | fieldNewValue              | coreComponentField              | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Page Block Config:Page Block Rule Detail | Is Active                        | true                       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Flex Table:General                       | Display Field Names              | <contactTableDisplayValue> | DataTableEnhanceProgramContacts |                           |                                         |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON             | <HideExpressionJSON>       | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Field Label Override (Rich Text) |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
      | Page Block Config:Page Block Rule Detail | Read Only Expression JSON        |                            | Grantor State Program           | Name                      | {SavedValue:CurrencyField_FundedAmount} |
    When I login to "As a Grantor" app as "<Users>" user
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
    Then I softly cannot see field "X_Funded Amount" inside page block
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | BaseSalary        | URL        |
      | {SavedValue:PM Username} | <BaseSalaryValue> | <URLValue> |
    And I refresh the page
    Then I softly see field "X_Funded Amount" inside page block

    Examples:
      | Users | HideExpressionJSON                                                               | contactTableDisplayValue            | BaseSalaryValue | URLValue       |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldGreaterThanEqualValuePMuserInversTrue | {SavedValue:ContactTableDFN},URL__c | 2222            |                |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldLessThanEqualValuePMuserInversTrue    | {SavedValue:ContactTableDFN},URL__c | 33              |                |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldLessThanValuePMuserInversTrue         | {SavedValue:ContactTableDFN},URL__c | 33              |                |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldGreaterThanValuePMuserInversTrue      | {SavedValue:ContactTableDFN},URL__c | 555             |                |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValueUrlContainsInverse               | {SavedValue:ContactTableDFN},URL__c |                 | www.google.com |
      | PM    | govgrants_config:HideTabOnDynamicTableFieldValueUrlINInverse                     | {SavedValue:ContactTableDFN},URL__c |                 | www.google.com |

  @550532 @US-549836
  Scenario Outline: LWC : Layout : Page Block : SPI : To verify that Page Block should be hide/unhide dynamically if the object field value is updated.
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c | ApiGeneratedId:0 |
      | Page Block            | Is Active            | false                                                   | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                                                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c | PreAppContact             |                           |                            |
      | Page Block:Page Block Detail | Is Active            | true                                                    | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                                    | Recipient Pre-Application | Name                      | PB-12006                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly see "Formula Grants Data" page block displayed
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary |
      | {SavedValue:SPI3 Username} | 1000       |
    And I refresh the page
    Then I softly do not see "Formula Grants Data" page block displayed

    Examples:
      | Users | HideExpressionJSON                                       |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3user |


  @550533 @US-549836
  Scenario Outline: LWC : Layout : Page Block : SPI : To verify that Page Block should be hide/unhide dynamically using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c | ApiGeneratedId:0 |
      | Page Block            | Is Active            | false                                                   | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                                                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                           | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c | PreAppContact             |                           |                            |
      | Page Block:Page Block Detail | Is Active            | true                                                    | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                                    | Recipient Pre-Application | Name                      | PB-12006                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly do not see "Formula Grants Data" page block displayed
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary |
      | {SavedValue:SPI3 Username} | 1000       |
    And I refresh the page
    Then I softly see "Formula Grants Data" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                  |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userInverseTrue |

  @550534 @US-549836
  Scenario Outline:LWC : Layout : Page Block : SPI : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                                       | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c | ApiGeneratedId:0 |
      | Page Block            | Is Active            | false                                                   | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                                                         | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c,URL__c | PreAppContact             |                           |                            |
      | Page Block:Page Block Detail | Is Active            | true                                                           | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                                           | Recipient Pre-Application | Name                      | PB-12006                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly see "Formula Grants Data" page block displayed
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary        |
      | {SavedValue:SPI3 Username} | <BaseSalaryValue> |
    And I refresh the page
    Then I softly do not see "Formula Grants Data" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                        | BaseSalaryValue | URL            |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanEquals | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanEquals    | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3user                  | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThan          | 555             |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThan       | 5555            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userIn                |                 | www.google.com |

  @550535 @US-549836
  Scenario Outline: LWC : Layout : Page Block : SPI : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Block            | Is Active            | false                                     | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c,URL__c | PreAppContact             |                           |                            |
      | Page Block:Page Block Detail | Is Active            | true                                                           | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>                                           | Recipient Pre-Application | Name                      | PB-12006                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly do not see "Formula Grants Data" page block displayed
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary        | URL        |
      | {SavedValue:SPI3 Username} | <BaseSalaryValue> | <URLValue> |
    And I refresh the page
    Then I softly see "Formula Grants Data" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                                   | BaseSalaryValue | URLValue       |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanEqualsInverseTrue | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanEqualsInverseTrue    | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userInverseTrue                  | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanInverseTrue          | 555             |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanInverseTrue       | 5555            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userInInverseTrue                |                 | www.google.com |

  @550536 @US-549836
  Scenario: LWC : Layout : Page Block : SPI : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Block            | Is Active            | false                                     | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                                           | ApiGeneratedId:2 |
      | Page Block            | Hide Expression JSON |                                           | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue                                                             | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},Phone_Number__c,ContactEmail__c | PreAppContact             |                           |                            |
      | Page Block:Page Block Detail | Is Active            | true                                                                      | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HideOnTheBasisOfPhoneNumberDataType                      | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | govgrants_config:HideOnTheBasisOfEmailDataType                            | Recipient Pre-Application | Name                      | PB-12005                   |
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
    Then I softly see "Formula Grants Data" page block displayed
    Then I softly see "System Information" page block displayed
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Phone Number | Contact Email          |
      | {SavedValue:SPI3 Username} | 8888888888   | automation@yopmail.com |
    And I refresh the page
    Then I softly do not see "Formula Grants Data" page block displayed
    Then I softly do not see "System Information" page block displayed

  @550536_1 @US-549836
  Scenario Outline: LWC : Layout : Page Block : SPI : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all Data Types
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Block            | Is Active            | true                                      | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | <contactTableDisplayValue> | PreAppContact             |                           |                            |
      | Page Block:Page Block Detail | Is Active            | true                       | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>       | Recipient Pre-Application | Name                      | PB-12006                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly see "Formula Grants Data" page block displayed
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | <HeaderTitle> |
      | {SavedValue:SPI3 Username} | <ColumnValue> |
    And I refresh the page
    Then I softly do not see "Formula Grants Data" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                            | HeaderTitle         | ColumnValue     | contactTableDisplayValue                                       |
      #number datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__c    | Number Of Personnel | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextAreaFieldText_Area__c          | Text Area           | google          | {SavedValue:PreAppContactTableForSPI.DFN},Text_Area__c         |
      #Text - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextFieldAgencyLogin__c            | Agency Login        | google          | {SavedValue:PreAppContactTableForSPI.DFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__c | Long Text Area      | google          | {SavedValue:PreAppContactTableForSPI.DFN},Long_Text_Area__c    |
      #Rich Text Area datatype
      | SPI3  | govgrants_config:HideDynamicFieldOnBasisRichTextAreaFieldRich_Text_Area__c    | Rich Text Area      | google          | {SavedValue:PreAppContactTableForSPI.DFN},Rich_Text_Area__c    |
      #Email datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisEmailFieldContactEmail__c          | Contact Email       | rei@yopmail.com | {SavedValue:PreAppContactTableForSPI.DFN},ContactEmail__c      |
      #Phone datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPhoneFieldPhone_Number__c          | Phone Number        | 8888888888      | {SavedValue:PreAppContactTableForSPI.DFN},Phone_Number__c      |
      #Percent datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPercentageFieldPercentage__c       | Percentage          | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},Percentage__c        |
      #Formula datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisFormulaFieldContactType__c         | BaseSalary          | 5555            | {SavedValue:PreAppContactTableForSPI.DFN},ContactType__c       |

  @550537 @US-549836
  Scenario Outline: LWC : Layout : Page Block : SPI : To verify that the user should be able to hide Page Block on the basis of child object field value by using hide expression json with all Data Types using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Block            | Is Active            | true                                      | ApiGeneratedId:1 |
      | Page Block            | Hide Expression JSON |                                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory        | fieldName            | fieldNewValue              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General           | Display Field Names  | <contactTableDisplayValue> | PreAppContact             |                           |                            |
      | Page Block:Page Block Detail | Is Active            | true                       | Recipient Pre-Application | Name                      | PB-12006                   |
      | Page Block:Page Block Detail | Hide Expression JSON | <HideExpressionJSON>       | Recipient Pre-Application | Name                      | PB-12006                   |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly do not see "Formula Grants Data" page block displayed
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | <HeaderTitle> |
      | {SavedValue:SPI3 Username} | <ColumnValue> |
    And I refresh the page
    Then I softly see "Formula Grants Data" page block displayed

    Examples:
      | Users | HideExpressionJSON                                                                       | HeaderTitle         | ColumnValue     | contactTableDisplayValue                                       |
      #number datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__cInversTrue     | Number Of Personnel | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextAreaFieldNumberOfText_Area__cInverseTrue  | Text Area           | google          | {SavedValue:PreAppContactTableForSPI.DFN},Text_Area__c         |
      #Text - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextFieldAgencyLogin__cInverseTrue            | Agency Login        | google          | {SavedValue:PreAppContactTableForSPI.DFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__cInverseTrue | Long Text Area      | google          | {SavedValue:PreAppContactTableForSPI.DFN},Long_Text_Area__c    |
      #Email datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisEmailFieldContactEmail__cInverseTrue          | Contact Email       | rei@yopmail.com | {SavedValue:PreAppContactTableForSPI.DFN},ContactEmail__c      |
      #Phone datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPhoneFieldPhone_Number__cInverseTrue          | Phone Number        | 8888888888      | {SavedValue:PreAppContactTableForSPI.DFN},Phone_Number__c      |
      #Percent datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPercentageFieldPercentage__cInverseTrue       | Percentage          | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},Percentage__c        |
      #Formula datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisFormulaFieldContactType__cInverseTrue         | BaseSalary          | 5555            | {SavedValue:PreAppContactTableForSPI.DFN},ContactType__c       |

  @550538 @550551 @550538_1 @550551_1 @US-549836
  Scenario: LWC : Layout : Page Block Detail : SPI : To verify that Page Block Detail should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : Page Block Detail : SPI : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                         | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:0  |
      | Flex Table                               | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Flex Table:General                       | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},NumberOfPersonnel__c,Text_Area__c,AgencyLogin__c,Long_Text_Area__c,Rich_Text_Area__c | PreAppContact             |                           |                                                                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__c                                                     | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisTextAreaFieldText_Area__c                                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisTextFieldAgencyLogin__c                                                             | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__c                                                  | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
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
    And I click on "Collapse" in page detail
    Then I softly see field "Indirect Budget Categories" inside page block
    Then I softly see field "X_Provided By 1" inside page block
    Then I softly see field "X_Provided By 2" inside page block
    Then I softly see field "X_Provided By 3" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Number Of Personnel | Text Area | Agency Login | Long Text Area | Rich Text Area |
      | {SavedValue:SPI3 Username} | 1000                | google    | google       | google         | google         |
    And I refresh the page
    Then I softly cannot see field "Indirect Budget Categories" inside page block
    Then I softly cannot see field "X_Provided By 1" inside page block
    Then I softly cannot see field "X_Provided By 2" inside page block
    Then I softly cannot see field "X_Provided By 3" inside page block

  @550538 @550551 @550538_2 @550551_2 @US-549836
  Scenario: LWC : Layout : Page Block Detail : SPI : To verify that Page Block Detail should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : Page Block Detail : SPI : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                         | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:0  |
      | Flex Table                               | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Flex Table:General                       | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},ContactEmail__c,Phone_Number__c,Percentage__c,ContactType__c | PreAppContact             |                           |                                                                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisEmailFieldContactEmail__c                                   | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisPhoneFieldPhone_Number__c                                   | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisPercentageFieldPercentage__c                                | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisFormulaFieldContactType__c                                  | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
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
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Contact Email   | Phone Number | Percentage | BaseSalary |
      | {SavedValue:SPI3 Username} | rei@yopmail.com | 8888888888   | 1000       | 5555       |
    And I refresh the page
    Then I softly cannot see field "Indirect Budget Categories" inside page block
    Then I softly cannot see field "X_Provided By 1" inside page block
    Then I softly cannot see field "X_Provided By 2" inside page block
    Then I softly cannot see field "X_Provided By 3" inside page block

  @550539 @550553 @US-549836
  Scenario: LWC : Layout : Page Block Detail : SPI : To verify that Page Block Detail should be hide/unhide dynamically using "inverse True".
  |LWC : Layout : Page Block Detail : SPI : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                         | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:0  |
      | Flex Table                               | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Flex Table:General                       | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},NumberOfPersonnel__c,Text_Area__c,AgencyLogin__c,Long_Text_Area__c,Rich_Text_Area__c | PreAppContact             |                           |                                                                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                                           | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__cInversTrue                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisTextAreaFieldNumberOfText_Area__cInverseTrue                                        | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisTextFieldAgencyLogin__cInverseTrue                                                  | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__cInverseTrue                                       | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
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
    And I click on "Collapse" in page detail
    Then I softly cannot see field "Indirect Budget Categories" inside page block
    Then I softly cannot see field "X_Provided By 1" inside page block
    Then I softly cannot see field "X_Provided By 2" inside page block
    Then I softly cannot see field "X_Provided By 3" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Number Of Personnel | Text Area | Agency Login | Long Text Area | Rich Text Area |
      | {SavedValue:SPI3 Username} | 1000                | google    | google       | google         | google         |
    And I refresh the page
    Then I softly see field "Indirect Budget Categories" inside page block
    Then I softly see field "X_Provided By 1" inside page block
    Then I softly see field "X_Provided By 2" inside page block
    Then I softly see field "X_Provided By 3" inside page block


  @550539_1 @550553_1 @US-549836
  Scenario: LWC : Layout : Page Block Detail : SPI : To verify that Page Block Detail should be hide/unhide dynamically using "inverse True".
  |LWC : Layout : Page Block Detail : SPI : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all Data Types using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                         | filterId          |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:0  |
      | Flex Table                               | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:1  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:2  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:3  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:4  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:5  |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:6  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:7  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:8  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:9  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:10 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                                                          | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Flex Table:General                       | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},ContactEmail__c,Phone_Number__c,Percentage__c,ContactType__c | PreAppContact             |                           |                                                                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                                                                   | Recipient Pre-Application | Name                      | {SavedValue:layoutProgramApprover__c}                                  |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisEmailFieldContactEmail__cInverseTrue                        | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisPhoneFieldPhone_Number__cInverseTrue                        | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisPercentageFieldPercentage__cInverseTrue                     | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy2__c}                                            |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | govgrants_config:SPIHideDynamicFieldOnBasisFormulaFieldContactType__cInverseTrue                       | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy3__c}                                            |
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
    And I click on "Collapse" in page detail
    Then I softly cannot see field "Indirect Budget Categories" inside page block
    Then I softly cannot see field "X_Provided By 1" inside page block
    Then I softly cannot see field "X_Provided By 2" inside page block
    Then I softly cannot see field "X_Provided By 3" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Contact Email   | Phone Number | Percentage | BaseSalary |
      | {SavedValue:SPI3 Username} | rei@yopmail.com | 8888888888   | 1000       | 5555       |
    And I refresh the page
    Then I softly see field "Indirect Budget Categories" inside page block
    Then I softly see field "X_Provided By 1" inside page block
    Then I softly see field "X_Provided By 2" inside page block
    Then I softly see field "X_Provided By 3" inside page block

  @550540 @US-549836
  Scenario Outline: LWC : Layout : Page Block Detail : SPI : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all operators
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Flex Table:General                       | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c,URL__c | PreAppContact             |                           |                                                                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <HideExpressionJSON>                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly see field "X_Provided By 1" inside page block
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary        | URL        |
      | {SavedValue:SPI3 Username} | <BaseSalaryValue> | <URLValue> |
    And I refresh the page
    Then I softly cannot see field "X_Provided By 1" inside page block

    Examples:
      | Users | HideExpressionJSON                                                        | BaseSalaryValue | URLValue       |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanEquals | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanEquals    | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3user                  | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThan          | 555             |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThan       | 5555            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userIn                |                 | www.google.com |

  @550541 @US-549836
  Scenario Outline: LWC : Layout : Page Block Detail : SPI : To verify that the user should be able to hide Page Block Detail on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory                    | fieldName            | fieldOrignalValue                         | filterId         |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:0 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:0 |
      | Flex Table                               | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:1 |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                      | ApiGeneratedId:2 |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON |                                           | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory                    | fieldName            | fieldNewValue                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue                                             |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Flex Table:General                       | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c,URL__c | PreAppContact             |                           |                                                                        |
      | Page Block Config:Page Block Rule Detail | Is Active            | true                                                           | Recipient Pre-Application | Name                      | {SavedValue:CreatePreApplicationPageLayoutINDIRECTBudgetCategories__c} |
      | Page Block Config:Page Block Rule Detail | Hide Expression JSON | <HideExpressionJSON>                                           | Recipient Pre-Application | Name                      | {SavedValue:ProvidedBy1__c}                                            |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly cannot see field "X_Provided By 1" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary        | URL        |
      | {SavedValue:SPI3 Username} | <BaseSalaryValue> | <URLValue> |
    And I refresh the page
    Then I softly see field "X_Provided By 1" inside page block

    Examples:
      | Users | HideExpressionJSON                                                                   | BaseSalaryValue | URLValue       |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanEqualsInverseTrue | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanEqualsInverseTrue    | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userInverseTrue                  | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanInverseTrue          | 555             |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanInverseTrue       | 5555            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userInInverseTrue                |                 | www.google.com |

  @550524 @550529 @US-549836
  Scenario Outline: LWC : Layout : TAB : SPI : To verify that TAB should be hide/unhide dynamically if the object field value is updated.
  |LWC : Layout : TAB : SPI : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all Data Types|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false                                     | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table:General                  | Display Field Names  | <contactTableDisplayValue> | PreAppContact             |                           |                             |
      | Page Tabs Config:Page Layout Action | Is Active            | true                       | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | <HideExpressionJSON>       | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly see "Attachments" subtab is present in page details
    And I click on "Collapse" in page detail
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | <HeaderTitle> |
      | {SavedValue:SPI3 Username} | <ColumnValue> |
    And I refresh the page
    Then I softly do not see "Attachments" subtab is present in page details

    Examples:
      | Users | HideExpressionJSON                                                            | HeaderTitle         | ColumnValue     | contactTableDisplayValue                                       |
      #number datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__c    | Number Of Personnel | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextAreaFieldText_Area__c          | Text Area           | google          | {SavedValue:PreAppContactTableForSPI.DFN},Text_Area__c         |
      #Text - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextFieldAgencyLogin__c            | Agency Login        | google          | {SavedValue:PreAppContactTableForSPI.DFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__c | Long Text Area      | google          | {SavedValue:PreAppContactTableForSPI.DFN},Long_Text_Area__c    |
      #Rich Text Area datatype
      | SPI3  | govgrants_config:HideDynamicFieldOnBasisRichTextAreaFieldRich_Text_Area__c    | Rich Text Area      | google          | {SavedValue:PreAppContactTableForSPI.DFN},Rich_Text_Area__c    |
      #Email datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisEmailFieldContactEmail__c          | Contact Email       | rei@yopmail.com | {SavedValue:PreAppContactTableForSPI.DFN},ContactEmail__c      |
      #Phone datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPhoneFieldPhone_Number__c          | Phone Number        | 8888888888      | {SavedValue:PreAppContactTableForSPI.DFN},Phone_Number__c      |
      #Percent datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPercentageFieldPercentage__c       | Percentage          | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},Percentage__c        |
      #Formula datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisFormulaFieldContactType__c         | BaseSalary          | 5555            | {SavedValue:PreAppContactTableForSPI.DFN},ContactType__c       |

  @550525 @550530 @US-549836
  Scenario Outline: LWC : Layout : TAB : SPI : To verify that TAB should be hide/unhide dynamically using "inverse True".
  |LWC : Layout : TAB : SPI : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all Data Types using "inverse True".|
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false                                     | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue              | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table:General                  | Display Field Names  | <contactTableDisplayValue> | PreAppContact             |                           |                             |
      | Page Tabs Config:Page Layout Action | Is Active            | true                       | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | <HideExpressionJSON>       | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly do not see "Attachments" subtab is present in page details
    And I navigate to "Overview" sub tab
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | <HeaderTitle> |
      | {SavedValue:SPI3 Username} | <ColumnValue> |
    And I refresh the page
    Then I softly see "Attachments" subtab is present in page details

    Examples:
      | Users | HideExpressionJSON                                                                       | HeaderTitle         | ColumnValue     | contactTableDisplayValue                                       |
      #number datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisNumberFieldNumberOfPersonnel__cInversTrue     | Number Of Personnel | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},NumberOfPersonnel__c |
      #Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextAreaFieldNumberOfText_Area__cInverseTrue  | Text Area           | google          | {SavedValue:PreAppContactTableForSPI.DFN},Text_Area__c         |
      #Text - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisTextFieldAgencyLogin__cInverseTrue            | Agency Login        | google          | {SavedValue:PreAppContactTableForSPI.DFN},AgencyLogin__c       |
      #Long Text Area - datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisLongTextAreaFieldLong_Text_Area__cInverseTrue | Long Text Area      | google          | {SavedValue:PreAppContactTableForSPI.DFN},Long_Text_Area__c    |
      #Rich Text Area datatype
      | SPI3  | govgrants_config:HideDynamicFieldOnBasisRichTextAreaFieldRich_Text_Area__cInverseTrue    | Rich Text Area      | google          | {SavedValue:PreAppContactTableForSPI.DFN},Rich_Text_Area__c    |
      #Email datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisEmailFieldContactEmail__cInverseTrue          | Contact Email       | rei@yopmail.com | {SavedValue:PreAppContactTableForSPI.DFN},ContactEmail__c      |
      #Phone datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPhoneFieldPhone_Number__cInverseTrue          | Phone Number        | 8888888888      | {SavedValue:PreAppContactTableForSPI.DFN},Phone_Number__c      |
      #Percent datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisPercentageFieldPercentage__cInverseTrue       | Percentage          | 1000            | {SavedValue:PreAppContactTableForSPI.DFN},Percentage__c        |
      #Formula datatype
      | SPI3  | govgrants_config:SPIHideDynamicFieldOnBasisFormulaFieldContactType__cInverseTrue         | BaseSalary          | 5555            | {SavedValue:PreAppContactTableForSPI.DFN},ContactType__c       |

  @550527 @US-549836
  Scenario Outline: LWC : Layout : TAB : SPI : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false                                     | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                    | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table:General                  | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},URL__c | PreAppContact             |                           |                             |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                             | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | <HideExpressionJSON>                             | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly see "Attachments" subtab is present in page details
    And I click on "Collapse" in page detail
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary        | URL        |
      | {SavedValue:SPI3 Username} | <BaseSalaryValue> | <URLValue> |
    And I refresh the page
    Then I softly do not see "Attachments" subtab is present in page details

    Examples:
      | Users | HideExpressionJSON                                                        | BaseSalaryValue | URLValue       |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanEquals | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanEquals    | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3user                  | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThan          | 555             |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThan       | 5555            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userIn                |                 | www.google.com |

  @550528 @US-549836
  Scenario Outline: LWC : Layout : TAB : SPI : To verify that the user should be able to hide TAB on the basis of child object field value by using hide expression json with all operators using "inverse True".
    Given I have "default" configuration as below:
      | configurationCategory | fieldName            | fieldOrignalValue                         | filterId         |
      | Flex Table            | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN} | ApiGeneratedId:0 |
      | Page Tabs Config      | Is Active            | false                                     | ApiGeneratedId:1 |
      | Page Tabs Config      | Hide Expression JSON |                                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory               | fieldName            | fieldNewValue                                                  | coreComponentField        | coreCOmponentSubFieldName | coreComponentSubFieldValue  |
      | Flex Table:General                  | Display Field Names  | {SavedValue:PreAppContactTableForSPI.DFN},BaseSalary__c,URL__c | PreAppContact             |                           |                             |
      | Page Tabs Config:Page Layout Action | Is Active            | true                                                           | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
      | Page Tabs Config:Page Layout Action | Hide Expression JSON | <HideExpressionJSON>                                           | Recipient Pre-Application | Name                      | {SavedValue:AttachmentsTab} |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "<Users>" user
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
    Then I softly do not see "Attachments" subtab is present in page details
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | BaseSalary        | URL        |
      | {SavedValue:SPI3 Username} | <BaseSalaryValue> | <URLValue> |
    And I refresh the page
    Then I softly see "Attachments" subtab is present in page details

    Examples:
      | Users | HideExpressionJSON                                                                   | BaseSalaryValue | URLValue       |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanEqualsInverseTrue | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanEqualsInverseTrue    | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userInverseTrue                  | 1000            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userLessThanInverseTrue          | 555             |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userGreaterThanInverseTrue       | 5555            |                |
      | SPI3  | govgrants_config:HideTabOnDynamicTableFieldValueSPI3userInInverseTrue                |                 | www.google.com |

