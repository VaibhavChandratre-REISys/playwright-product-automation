@DisableSortOrder @Sprint-07-2025 @US-489910 @Sprint-2025 @JuneRelease
Feature:Data Table Enhanced - Disable Sort Order Scenarios
Business Need: to ensure that the Disable Sort Order of our web pages meets the needs of different user roles: admin, internal users, and external users.

  ##################### Disable Sort Order - User Story - 489910 - Sprint-7-2025 #########

  ################ Data Table Enhanced - Phase Level ##################

  @504861
  Scenario Outline: 3.0-Data Table Enhanced-Admin/PM-To verify that, for Picklist,Multi-select,URL,Email,Checkbox datatype fields,when"Disable sort Order"config is unchecked,then after clicking on the table column header,arrow should get displayed on the column header
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | TypesOfAssistance__c,WebsiteAddress__c,Email_Test__c,CFDA_Data__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                                              |
      | Flex Grid:General     | Default Page Size   | 10                                                                                             | Programs           | Name                      |                                              |
      | Flex Table List       | Disable sort order  | false                                                                                          | Programs           | Name                      | {SavedValue:Picklist_FunderType}             |
      | Flex Table List       | Disable sort order  | false                                                                                          | Programs           | Name                      | {SavedValue:MultiPicklist_TypesOfAssistance} |
      | Flex Table List       | Disable sort order  | false                                                                                          | Programs           | Name                      | {SavedValue:URL_WebsiteAddress}              |
      | Flex Table List       | Disable sort order  | false                                                                                          | Programs           | Name                      | {SavedValue:Email_Email_Test}                |
      | Flex Table List       | Disable sort order  | false                                                                                          | Programs           | Name                      | {SavedValue:CheckBox_CFDA_Data}              |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I pause execution for "4" seconds
    When I navigate to "Planning" tab
    #picklist
    And I click on column name "(Obsolate)Funder Type" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "(Obsolate)Funder Type" with "Ascending" order
    And I refresh the page
    Then I softly see column name "(Obsolate)Funder Type" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "(Obsolate)Funder Type" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "(Obsolate)Funder Type" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I pause execution for "4" seconds
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "(Obsolate)Funder Type" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "(Obsolate)Funder Type" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "(Obsolate)Funder Type" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "(Obsolate)Funder Type"
    #checkbox
    And I click on column name "X_CFDA Data" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "X_CFDA Data" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_CFDA Data" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "X_CFDA Data" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "X_CFDA Data" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "X_CFDA Data" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "X_CFDA Data" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_CFDA Data" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "CFDA Data"
    #Multiselect Picklist
    And I click on column name "Types Of Assistance" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Types Of Assistance" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Types Of Assistance" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Types Of Assistance" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Types Of Assistance" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Types Of Assistance" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Types Of Assistance" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Types Of Assistance" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Types Of Assistance"
    #Email
    And I click on column name "Email Test" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Email Test" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Email Test" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Email Test" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Email Test" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Email Test" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Email Test" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Email Test" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Email Test"
    #URL
    And I click on column name "Website Address" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Website Address" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Website Address" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Website Address" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Website Address" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Website Address" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Website Address" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Website Address" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Website Address"

    Examples:
      | User |
      | PM   |

  @504864
  Scenario Outline: 3.0- Data Table Enhanced-Admin/PM-To verify that, for Text, Text Area, Long Text Area data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                 | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Authorization__c,ProjectGoals__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                            |
      | Flex Grid:General     | Default Page Size   | 10                                                            | Programs           | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I pause execution for "4" seconds
    When I navigate to "Planning" tab
    #Text/Standard
    And I click on column name "EGMS ID" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I refresh the page
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "EGMS ID" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "EGMS ID" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "EGMS ID"
    #Text Area
    And I click on column name "Authorization" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Authorization" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Authorization" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Authorization" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Authorization" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Authorization" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Authorization" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Authorization" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Authorization"
    #Long Text Area
    And I click on column name "X_Project Goals" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "X_Project Goals" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Project Goals" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "X_Project Goals" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "X_Project Goals" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "X_Project Goals" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "X_Project Goals" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Project Goals" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_Project Goals"

    Examples:
      | User |
      | PM   |

  @504865
  Scenario Outline: 3.0- Data Table Enhanced-Admin/PM-To verify that, for Standard,Lookup,Reference,Formul datatype fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
      #standard field is covered in above scenario
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | PrimaryFunderType__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                            |
      | Flex Grid:General     | Default Page Size   | 10                                                | Programs           | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "PEGMSID"
    When I navigate to "Planning" tab
      #Lookup-field
    And I click on column name "Created By ID" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Created By ID" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Created By ID" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Created By ID" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Created By ID" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Created By ID" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Created By ID" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Created By ID" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Created By ID"
    #Formula-Field
    And I click on column name "Primary Funder Type" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Primary Funder Type" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Primary Funder Type" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Primary Funder Type" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Primary Funder Type" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Primary Funder Type" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Primary Funder Type" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Primary Funder Type" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Primary Funder Type"

    Examples:
      | User |
      | PM   |

  @504879
  Scenario Outline: 3.0- Data Table Enhanced- Admin/PM- To verify that, for Date, Date & Time, Time, Phonedata type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue |
      | Flex Table:General    | Display Field Names | Date_And_Time__c,Time__c,Phone_Number__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                            |
      | Flex Grid:General     | Default Page Size   | 10                                                                    | Programs           | Name                      |                            |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I pause execution for "4" seconds
    When I navigate to "Planning" tab
      #Date-field
    And I click on column name "X_Start Date" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "X_Start Date" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Start Date" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "X_Start Date" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "X_Start Date" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "X_Start Date" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "X_Start Date" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Start Date" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_Start Date"
    #Date And Time-Field
    And I click on column name "Date And Time" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Date And Time" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Date And Time" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Date And Time" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Date And Time" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Date And Time"
    #Time-Field
    And I click on column name "Time" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Time" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Time" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Time" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Time" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Time" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Time"
      #Phone-Field
    And I click on column name "Phone Number" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Phone Number" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Phone Number" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Phone Number" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Phone Number" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Phone Number" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Phone Number" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Phone Number" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Phone Number"

    Examples:
      | User |
      | PM   |

  @504888
  Scenario Outline: 3.0- Data Table Enhanced-Admin/PM-To verify that, for Numeric(Number,Currency,Percent) datatype fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | NumberOfApprovalSteps__c,Percent__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                                              |
      | Flex Grid:General     | Default Page Size   | 10                                                               | Programs           | Name                      |                                              |
      | Flex Table List       | Disable sort order  | false                                                            | Programs           | Name                      | {SavedValue:Number_NumberOfApprovalSteps__c} |
      | Flex Table List       | Disable sort order  | false                                                            | Programs           | Name                      | {SavedValue:Percent_Percent__c}              |
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I pause execution for "5" seconds
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "{program:programsTableId}"
    When I enter in modal "ProgramCreation_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save and Continue" in the page details
    And I pause execution for "6" seconds
    When I enter "ProgramEdition_v" values from "Program_Field_Values_LWC_org.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "6" seconds
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "PEGMSID"
    And I pause execution for "4" seconds
    When I navigate to "Planning" tab
    And I pause execution for "3" seconds
      #Number-field
    And I click on column name "X_Number of Approval Steps" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_Number of Approval Steps"
    #Currency-Field
    And I click on column name "X_Funded Amount" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "X_Funded Amount" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Funded Amount" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "X_Funded Amount" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "X_Funded Amount" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "X_Funded Amount" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "X_Funded Amount" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Funded Amount" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_Funded Amount"
    #Percent-Field
    And I click on column name "Percent" for sorting of table "---program:-:programsTableId---"
    Then I softly see column name "Percent" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Percent" with "Ascending" order
    And I select value inside table "---program:-:programsTableId---" is "5"
    Then I softly see column name "Percent" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---program:-:programsTableId---"
    Then I softly see column name "Percent" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    And I enter advance filter values inside id "---program:-:programsTableId---" for LWC
      | Program Name | contains | Testing |
    Then I softly see column name "Percent" with "Ascending" order
    And I click on advance filter of table id "---program:-:programsTableId---" for LWC
    When I perform quick search for "{SavedValue:PEGMSID}" in "---program:-:programsTableId---" panel
    Then I softly see column name "Percent" with "Ascending" order
    When I click on "View" icon for "{SavedValue:PEGMSID}" inside flex table with id "---program:-:programsTableId---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Percent" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Percent"

    Examples:
      | User |
      | PM   |

  @504880
  Scenario Outline: 3.0- Data Table Enhanced- Admin/PM- To verify that, for Date, Date & Time, Time, Phone data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                         | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue         |
      | Flex Table:General    | Display Field Names | Date_And_Time__c,Time__c,Phone_Number__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                                    |
      | Flex Grid:General     | Default Page Size   | 10                                                                    | Programs           | Name                      |                                    |
      | Flex Table List       | Disable sort order  | true                                                                  | Programs           | Name                      | {SavedValue:DateAndTimeField}      |
      | Flex Table List       | Disable sort order  | true                                                                  | Programs           | Name                      | {SavedValue:Time__c}               |
      | Flex Table List       | Disable sort order  | true                                                                  | Programs           | Name                      | {SavedValue:Field_Phone_Number__c} |
      | Flex Table List       | Disable sort order  | true                                                                  | Programs           | Name                      | {SavedValue:StartDate__c}          |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    And I pause execution for "4" seconds
    #Date-field
    And I click on column name "X_Start Date" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see column name "X_Start Date" with "Ascending" order
    #Date And Time-Field
    And I click on column name "Date And Time" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see column name "Date And Time" with "Ascending" order
    #Time-Field
    And I click on column name "Time" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see column name "Time" with "Ascending" order
    #Phone-Field
    And I click on column name "Phone Number" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see column name "Phone Number" with "Ascending" order

    Examples:
      | User |
      | PM   |

  @504884
  Scenario Outline: 3.0- Data Table Enhanced- Admin/PM- To verify that, for Text, Text Area, Long Text Area, Rich Text Area data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                    |
      | Flex Table:General    | Display Field Names | Authorization__c,ProjectGoals__c,Test_Description__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                                               |
      | Flex Grid:General     | Default Page Size   | 10                                                                                | Programs           | Name                      |                                               |
      | Flex Table List       | Disable sort order  | true                                                                              | Programs           | Name                      | {SavedValue:Text_EGMSID}                      |
      | Flex Table List       | Disable sort order  | true                                                                              | Programs           | Name                      | {SavedValue:TextArea_Authorization}           |
      | Flex Table List       | Disable sort order  | true                                                                              | Programs           | Name                      | {SavedValue:LongTextArea_ProjectGoalsTable}        |
      | Flex Table List       | Disable sort order  | true                                                                              | Programs           | Name                      | {SavedValue:RichTextArea_Test_Description__c} |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    #Text/Standard
    And I click on column name "EGMS ID" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "EGMS ID"
      #Text Area
    And I click on column name "Authorization" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Authorization"
    #Long Text Area
    And I click on column name "X_Project Goals" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_Project Goals"
    #Rich Text Area
    And I click on column name "Test_Description" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Test_Description"

    Examples:
      | User |
      | PM   |

  @504887
  Scenario Outline: 3.0- Data Table Enhanced- Admin/PM- To verify that, for Numeric (Number, Currency, Percent) data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                    | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | NumberOfApprovalSteps__c,Percent__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                                              |
      | Flex Grid:General     | Default Page Size   | 10                                                               | Programs           | Name                      |                                              |
      | Flex Table List       | Disable sort order  | true                                                             | Programs           | Name                      | {SavedValue:Number_NumberOfApprovalSteps__c} |
      | Flex Table List       | Disable sort order  | true                                                             | Programs           | Name                      | {SavedValue:Percent_Percent__c}              |
      | Flex Table List       | Disable sort order  | true                                                             | Programs           | Name                      | {SavedValue:Currency_FundedAmount__c}        |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
      #Number-field
    And I click on column name "X_Number of Approval Steps" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_Number of Approval Steps"
    #Currency-Field
    And I click on column name "X_Funded Amount" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_Funded Amount"
    #Percent-Field
    And I click on column name "Percent" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Percent"

    Examples:
      | User |
      | PM   |

  @504862
  Scenario Outline: 3.0- Data Table Enhanced-SPI- To verify that, for Standard,Lookup,Reference,Formula data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Flex Table:General    | Display Field Names | ProgramName__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                            |
      | Flex Grid:General     | Default Page Size   | 10                                              | RecipientApplications | Name                      |                                                            |
      | Flex Table List       | Disable sort order  | false                                           | RecipientApplications | Name                      | {SavedValue:Lookup_OwnerId}                                |
      | Flex Table List       | Disable sort order  | false                                           | RecipientApplications | Name                      | {SavedValue:Formula_ProgramName__c}                        |
      | Flex Table List       | Disable sort order  | false                                           | RecipientApplications | Name                      | {SavedValue:Reference_Announcement__r.AnnouncementName__c} |
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
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I pause execution for "3" seconds
    And I navigate to "Applications" tab
    And I pause execution for "5" seconds
      #Lookup-field
    And I click on column name "Owner" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Owner" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Owner" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Owner" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Owner" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | Owner | equals to | Automation SPI3 |
    Then I softly see column name "Owner" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Owner" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Owner" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Owner"
    #Formula-Field
    And I click on column name "X_Program ID" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Program ID" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Program ID" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "X_Program ID" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Program ID" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | X_Program ID | contains | PG-TAO modified-2896 |
    Then I softly see column name "X_Program ID" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "X_Program ID" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Program ID" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Program ID"
     #Reference-Field
    And I click on column name "Funding Opportunity Title" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Funding Opportunity Title" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Funding Opportunity Title" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Funding Opportunity Title" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Funding Opportunity Title" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Funding Opportunity Title" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Funding Opportunity Title" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Funding Opportunity Title" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Funding Opportunity Title"

    Examples:
      | User |
      | SPI3 |

  @504863
  Scenario Outline: 3.0- Data Table Enhanced-SPI- To verify that, for Numeric (Number, Currency, Percent) data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                              | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Flex Table:General    | Display Field Names | NumberOfApprovalSteps__c,RequiredMatch__c,AwardCeiling__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                 |
      | Flex Grid:General     | Default Page Size   | 10                                                                                         | RecipientApplications | Name                      |                                                 |
      | Flex Table List       | Disable sort order  | false                                                                                      | RecipientApplications | Name                      | {SavedValue:NumberSPI_NumberOfApprovalSteps__c} |
      | Flex Table List       | Disable sort order  | false                                                                                      | RecipientApplications | Name                      | {SavedValue:CurrencySPI_AwardCeiling__c}        |
      | Flex Table List       | Disable sort order  | false                                                                                      | RecipientApplications | Name                      | {SavedValue:Percent_RequiredMatch__c}           |
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
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I pause execution for "5" seconds
    And I navigate to "Applications" tab
      #Number-field
    And I click on column name "X_Number of Approval Steps" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Number of Approval Steps" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Number of Approval Steps"
    #Currency-Field
    And I click on column name "Award Ceiling" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Award Ceiling" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Award Ceiling" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Award Ceiling" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Award Ceiling" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Award Ceiling" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Award Ceiling" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Award Ceiling" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Award Ceiling"
    #Percent-Field
    And I click on column name "Required Match Percentage." for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Required Match Percentage." with "Ascending" order
    And I refresh the page
    Then I softly see column name "Required Match Percentage." with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Required Match Percentage." with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Required Match Percentage." with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Required Match Percentage." with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Required Match Percentage." with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Required Match Percentage." with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Required Match Percentage."

    Examples:
      | User |
      | SPI3 |

  @504860
  Scenario Outline: 3.0-Data Table Enhanced-SPI-To verify that, for Picklist,Multi-select Picklist,URL,Email,Checkbox datatype fields,when"Disable sort Order"config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:5 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | ReviewInitiated__c,MultiSelectPickListTest__c,AuthorizedRepresentativeEmail__c,URL__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 10                                                                                                                     | RecipientApplications | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | false                                                                                                                  | RecipientApplications | Name                      | {SavedValue:Picklist-Status__c}                     |
      | Flex Table List       | Disable sort order  | false                                                                                                                  | RecipientApplications | Name                      | {SavedValue:Checkbox_ReviewInitiated__c}            |
      | Flex Table List       | Disable sort order  | false                                                                                                                  | RecipientApplications | Name                      | {SavedValue:MultiSelect_MultiSelectPickListTest__c} |
      | Flex Table List       | Disable sort order  | false                                                                                                                  | RecipientApplications | Name                      | {SavedValue:Email_AuthorizedRepresentativeEmail__c} |
      | Flex Table List       | Disable sort order  | false                                                                                                                  | RecipientApplications | Name                      | {SavedValue:URL-URL__c}                             |
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
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I pause execution for "5" seconds
    And I navigate to "Applications" tab
    #picklist
    And I click on column name "Status" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Status" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Status" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Status" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Status" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Status" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Status" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Status" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Status"
    #checkbox
    And I click on column name "X_Review Initiated" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Review Initiated" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Review Initiated" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "X_Review Initiated" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Review Initiated" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "X_Review Initiated" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "X_Review Initiated" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Review Initiated" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Review Initiated"
    #Multiselect Picklist
    And I click on column name "MultiSelectPickListTest" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "MultiSelectPickListTest" with "Ascending" order
    And I refresh the page
    Then I softly see column name "MultiSelectPickListTest" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "MultiSelectPickListTest" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "MultiSelectPickListTest" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "MultiSelectPickListTest" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "MultiSelectPickListTest" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "MultiSelectPickListTest" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "MultiSelectPickListTest"
    #Email
    And I click on column name "Authorized Representative Email" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Authorized Representative Email" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Authorized Representative Email" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Authorized Representative Email" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Authorized Representative Email" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Authorized Representative Email" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Authorized Representative Email" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Authorized Representative Email" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Authorized Representative Email"
    #URL
    And I click on column name "URL" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "URL" with "Ascending" order
    And I refresh the page
    Then I softly see column name "URL" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "URL" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "URL" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "URL" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "URL" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "URL" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "URL"

    Examples:
      | User |
      | SPI3 |

  @504873
  Scenario Outline: 3.0- Data Table Enhanced- SPI - To verify that, for Text,TextArea,Long/RichTextArea data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | ContingenciesJustification__c,Acknowledgement__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 10                                                                                | RecipientApplications | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | false                                                                             | RecipientApplications | Name                      | {SavedValue:TextSPI_EGMSID}                         |
      | Flex Table List       | Disable sort order  | false                                                                             | RecipientApplications | Name                      | {SavedValue:TextArea_ContingenciesJustification__c} |
      | Flex Table List       | Disable sort order  | false                                                                             | RecipientApplications | Name                      | {SavedValue:LongTextArea_Acknowledgement__c}        |
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
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I pause execution for "5" seconds
    When I navigate to "Applications" tab
    #Text/Standard
    And I click on column name "EGMS ID" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I refresh the page
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I wait for "3" seconds
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "EGMS ID" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "EGMS ID" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "4" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "EGMS ID" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "EGMS ID"
    #Text Area
    And I click on column name "Contingencies Justification" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Contingencies Justification" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Contingencies Justification" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Contingencies Justification" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Contingencies Justification" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Contingencies Justification" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Contingencies Justification" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "4" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Contingencies Justification" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Contingencies Justification"
    #Long Text Area
    And I click on column name "X_Acknowledgement" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Acknowledgement" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Acknowledgement" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "X_Acknowledgement" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "X_Acknowledgement" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "X_Acknowledgement" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "X_Acknowledgement" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "4" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Acknowledgement" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Acknowledgement"

    Examples:
      | User |
      | SPI3 |

  @504874
  Scenario Outline: 3.0- Data Table Enhanced- SPI - To verify that, for Date, Date & Time, Time, Phone data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                             | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | Time__c,AuthorizedRepresentativePhone__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 10                                                                        | RecipientApplications | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | false                                                                     | RecipientApplications | Name                      | {SavedValue:Date_ApplicationDueDate__c}             |
      | Flex Table List       | Disable sort order  | false                                                                     | RecipientApplications | Name                      | {SavedValue:DateAndTime_SubmittedOn__c}             |
      | Flex Table List       | Disable sort order  | false                                                                     | RecipientApplications | Name                      | {SavedValue:Time_Time__c}                           |
      | Flex Table List       | Disable sort order  | false                                                                     | RecipientApplications | Name                      | {SavedValue:Phone_AuthorizedRepresentativePhone__c} |
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
    And I save the field labeled "EGMS ID" as "AEGMSID"
    And I pause execution for "5" seconds
    When I navigate to "Applications" tab
      #Date-field
    And I click on column name "Application Due Date" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Application Due Date" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Application Due Date" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Application Due Date" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Application Due Date" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Application Due Date" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Application Due Date" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "4" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Application Due Date" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Application Due Date" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Application Due Date" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Application Due Dat"
    #Date And Time-Field
    And I click on column name "Submitted On" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Submitted On" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Submitted On" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Submitted On" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Submitted On" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Submitted On" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Submitted On" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "4" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Submitted On" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Submitted On"
    #Time-Field
    And I click on column name "Time" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Time" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Time" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Time" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Time" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Time" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Time"
      #Phone-Field
    And I click on column name "Authorized Representative Phone" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Authorized Representative Phone" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Authorized Representative Phone" with "Ascending" order
    And I select value inside table "---applicationIntake:-:recipientApplications---" is "5"
    Then I softly see column name "Authorized Representative Phone" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---applicationIntake:-:recipientApplications---"
    Then I softly see column name "Authorized Representative Phone" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:recipientApplications---" for LWC
      | EGMS ID | contains | {SavedValue:AEGMSID} |
    Then I softly see column name "Authorized Representative Phone" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:recipientApplications---" for LWC
    When I perform quick search for "{SavedValue:AEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    Then I softly see column name "Authorized Representative Phone" with "Ascending" order
    When I click on "View" icon for "{SavedValue:AEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I pause execution for "4" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Authorized Representative Phone" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Authorized Representative Phone"

    Examples:
      | User |
      | SPI3 |

  @504876
  Scenario Outline: 3.0- Data Table Enhanced- Admin/PM- To verify that, for Standard,Lookup,Reference,Formula data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                     | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue             |
      | Flex Table:General    | Display Field Names | PrimaryFunderType__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                                        |
      | Flex Table List       | Disable sort order  | true                                              | Programs           | Name                      | {SavedValue:Lookup_CreatedBy}          |
      | Flex Table List       | Disable sort order  | true                                              | Programs           | Name                      | {SavedValue:Formula_PrimaryFunderType} |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    #Lookup-field
    And I click on column name "Created By ID" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Created By ID"
    #Formula-Field
    And I click on column name "Primary Funder Type" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Primary Funder Type"

    Examples:
      | User |
      | PM   |

  @504877
  Scenario Outline:3.0- Data Table Enhanced- Admin/PM- To verify that, for Picklist,Multi-select Picklist,URL,Email,Checkbox data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ProgramTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                           | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | TypesOfAssistance__c,WebsiteAddress__c,Email_Test__c,CFDA_Data__c,{SavedValue:ProgramTableDFN} | Programs           | Name                      |                                              |
      | Flex Grid:General     | Default Page Size   | 10                                                                                             | Programs           | Name                      |                                              |
      | Flex Table List       | Disable sort order  | true                                                                                           | Programs           | Name                      | {SavedValue:Picklist_FunderType}             |
      | Flex Table List       | Disable sort order  | true                                                                                           | Programs           | Name                      | {SavedValue:MultiPicklist_TypesOfAssistance} |
      | Flex Table List       | Disable sort order  | true                                                                                           | Programs           | Name                      | {SavedValue:URL_WebsiteAddress}              |
      | Flex Table List       | Disable sort order  | true                                                                                           | Programs           | Name                      | {SavedValue:Email_Email_Test}                |
      | Flex Table List       | Disable sort order  | true                                                                                           | Programs           | Name                      | {SavedValue:CheckBox_CFDA_Data}              |
    Given I login to "As a Grantor" app as "<User>" user
    When I navigate to "Planning" tab
    #picklist
    And I click on column name "(Obsolate)Funder Type" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "(Obsolate)Funder Type"
    #checkbox
    And I click on column name "X_CFDA Data" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "X_CFDA Data"
    #Multiselect Picklist
    And I click on column name "Types Of Assistance" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Types Of Assistance"
    #Email
    And I click on column name "Email Test" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Email Test"
    #URL
    And I click on column name "Website Address" for sorting of table "---program:-:programsTableId---"
    Then I softly do not see arrowIcon for column name "Website Address"

    Examples:
      | User |
      | PM   |

  @504867
  Scenario Outline: 3.0- Data Table Enhanced- SPI- To verify that, for Text,TextArea,Long/RichTextArea data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                     | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | ContingenciesJustification__c,Acknowledgement__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 10                                                                                | RecipientApplications | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | true                                                                              | RecipientApplications | Name                      | {SavedValue:TextSPI_EGMSID}                         |
      | Flex Table List       | Disable sort order  | true                                                                              | RecipientApplications | Name                      | {SavedValue:TextArea_ContingenciesJustification__c} |
      | Flex Table List       | Disable sort order  | true                                                                              | RecipientApplications | Name                      | {SavedValue:LongTextArea_Acknowledgement__c}        |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    When I navigate to "Applications" tab
    #Text/Standard
    And I click on column name "EGMS ID" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "EGMS ID"
    #Text Area
    And I click on column name "Contingencies Justification" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Contingencies Justification"
    #Long Text Area
    And I click on column name "X_Acknowledgement" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Acknowledgement"

    Examples:
      | User |
      | SPI3 |

  @504869
  Scenario Outline: 3.0- Data Table Enhanced- SPI- To verify that, for Standard,Lookup,Reference,Formula data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                                 |
      | Flex Table:General    | Display Field Names | ProgramName__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                            |
      | Flex Grid:General     | Default Page Size   | 10                                              | RecipientApplications | Name                      |                                                            |
      | Flex Table List       | Disable sort order  | true                                            | RecipientApplications | Name                      | {SavedValue:Lookup_OwnerId}                                |
      | Flex Table List       | Disable sort order  | true                                            | RecipientApplications | Name                      | {SavedValue:Formula_ProgramName__c}                        |
      | Flex Table List       | Disable sort order  | true                                            | RecipientApplications | Name                      | {SavedValue:Reference_Announcement__r.AnnouncementName__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Applications" tab
      #Lookup-field
    And I click on column name "Owner" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Owner"
      #Formula-Field
    And I click on column name "X_Program ID" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Program ID"
      #Reference-Field
    And I click on column name "Funding Opportunity Title" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Funding Opportunity Title"

    Examples:
      | User |
      | SPI3 |

  @504870
  Scenario Outline: 3.0- Data Table Enhanced- SPI- To verify that, for Picklist, Multi-select Picklist, URL, Email, Checkbox data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:5 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                                          | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | ReviewInitiated__c,MultiSelectPickListTest__c,AuthorizedRepresentativeEmail__c,URL__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 10                                                                                                                     | RecipientApplications | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | true                                                                                                                   | RecipientApplications | Name                      | {SavedValue:Picklist-Status__c}                     |
      | Flex Table List       | Disable sort order  | true                                                                                                                   | RecipientApplications | Name                      | {SavedValue:Checkbox_ReviewInitiated__c}            |
      | Flex Table List       | Disable sort order  | true                                                                                                                   | RecipientApplications | Name                      | {SavedValue:MultiSelect_MultiSelectPickListTest__c} |
      | Flex Table List       | Disable sort order  | true                                                                                                                   | RecipientApplications | Name                      | {SavedValue:Email_AuthorizedRepresentativeEmail__c} |
      | Flex Table List       | Disable sort order  | true                                                                                                                   | RecipientApplications | Name                      | {SavedValue:URL-URL__c}                             |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Applications" tab
      #picklist
    And I click on column name "Status" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Status"
      #checkbox
    And I click on column name "X_Review Initiated" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Review Initiated"
      #Multiselect Picklist
    And I click on column name "MultiSelectPickListTest" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "MultiSelectPickListTest"
      #Email
    And I click on column name "Authorized Representative Email" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Authorized Representative Email"
      #URL
    And I click on column name "URL" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "URL"

    Examples:
      | User |
      | SPI3 |

  @504871
  Scenario Outline: 3.0- Data Table Enhanced- SPI- To verify that, for Numeric (Number, Currency, Percent) data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                              | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                      |
      | Flex Table:General    | Display Field Names | NumberOfApprovalSteps__c,RequiredMatch__c,AwardCeiling__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                 |
      | Flex Grid:General     | Default Page Size   | 10                                                                                         | RecipientApplications | Name                      |                                                 |
      | Flex Table List       | Disable sort order  | true                                                                                       | RecipientApplications | Name                      | {SavedValue:NumberSPI_NumberOfApprovalSteps__c} |
      | Flex Table List       | Disable sort order  | true                                                                                       | RecipientApplications | Name                      | {SavedValue:CurrencySPI_AwardCeiling__c}        |
      | Flex Table List       | Disable sort order  | true                                                                                       | RecipientApplications | Name                      | {SavedValue:Percent_RequiredMatch__c}           |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Applications" tab
      #Number-field
    And I click on column name "X_Number of Approval Steps" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "X_Number of Approval Steps"
    #Currency-Field
    And I click on column name "Award Ceiling" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Award Ceiling"
    #Percent-Field
    And I click on column name "Required Match Percentage." for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Required Match Percentage."

    Examples:
      | User |
      | SPI3 |

  @504872
  Scenario Outline: 3.0- Data Table Enhanced- SPI- To verify that, for Date, Date & Time, Time, Phone data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue                | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ApplicationTableDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 10                               | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                            | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                   | coreComponentField    | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | ApplicationDueDate__c,Time__c,AuthorizedRepresentativePhone__c,{SavedValue:ApplicationTableDFN} | RecipientApplications | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 10                                                                                              | RecipientApplications | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | true                                                                                            | RecipientApplications | Name                      | {SavedValue:Date_ApplicationDueDate__c}             |
      | Flex Table List       | Disable sort order  | true                                                                                            | RecipientApplications | Name                      | {SavedValue:DateAndTime_SubmittedOn__c}             |
      | Flex Table List       | Disable sort order  | true                                                                                            | RecipientApplications | Name                      | {SavedValue:Time_Time__c}                           |
      | Flex Table List       | Disable sort order  | true                                                                                            | RecipientApplications | Name                      | {SavedValue:Phone_AuthorizedRepresentativePhone__c} |
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    When I navigate to "Applications" tab
      #Date-field
    And I click on column name "Application Due Date" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Application Due Date"
       #Date And Time-Field
    And I click on column name "Submitted On" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Submitted On"
    #Time-Field
    And I click on column name "Time" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Time"
       #Phone-Field
    And I click on column name "Authorized Representative Phone" for sorting of table "---applicationIntake:-:recipientApplications---"
    Then I softly do not see arrowIcon for column name "Authorized Representative Phone"

    Examples:
      | User |
      | SPI3 |

    ##################### Flex Grid - Review Step Table #############################
  @504891
  Scenario Outline: 3.0-FlexGrid Enhanced -Admin/PM-To verify that, for Picklist,Multi-select,URL,Email,Checkbox datatype fields,when"Disable sort Order"config is unchecked,then after clicking on the table column header,arrow should get displayed on the column header
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:5 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table:General    | Display Field Names | LinkPicklist__c,MultiSelect_Picklist__c,URL__c,Email__c,Template__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                      |
      | Flex Grid:General     | Default Page Size   | 5                                                                                              | ProgramReviewStepTemplates | Name                      |                                      |
      | Flex Table List       | Disable sort order  | false                                                                                          | ProgramReviewStepTemplates | Name                      | {SavedValue:LinkPicklist__c}         |
      | Flex Table List       | Disable sort order  | false                                                                                          | ProgramReviewStepTemplates | Name                      | {SavedValue:MultiSelect_Picklist__c} |
      | Flex Table List       | Disable sort order  | false                                                                                          | ProgramReviewStepTemplates | Name                      | {SavedValue:URL_URL__c}              |
      | Flex Table List       | Disable sort order  | false                                                                                          | ProgramReviewStepTemplates | Name                      | {SavedValue:Email_Email__c}          |
      | Flex Table List       | Disable sort order  | false                                                                                          | ProgramReviewStepTemplates | Name                      | {SavedValue:Checkbox_Template__c}    |
    Given I login to "As a Grantor" app as "<User>" user
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
    When I navigate to "Setup" sub tab
    And I pause execution for "5" seconds
    When I enter the following values into flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" by clicking "New" :
      | Step Order | Description   | Step Name      | Step Weight (%) |
      | 4          | Test          | Review Testing | 0               |
      | 5          | Data Table    | Check          | 0               |
      | 6          | Picklist Data | Automation     | 0               |
      | 7          | Random Data   | Automation     | 0               |
    #picklist
    And I click on column name "LinkPicklist" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "LinkPicklist" with "Ascending" order
    And I refresh the page
    Then I softly see column name "LinkPicklist" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "5"
    Then I softly see column name "LinkPicklist" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "LinkPicklist" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "LinkPicklist" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "LinkPicklist" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "LinkPicklist" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "LinkPicklist"
    #checkbox
    And I click on column name "B_Template" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "B_Template" with "Ascending" order
    And I refresh the page
    Then I softly see column name "B_Template" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "5"
    Then I softly see column name "B_Template" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "B_Template" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "B_Template" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "B_Template" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "B_Template" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "B_Template"
    #Multiselect Picklist
    And I click on column name "MultiSelect Picklist" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "MultiSelect Picklist" with "Ascending" order
    And I refresh the page
    Then I softly see column name "MultiSelect Picklist" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "5"
    Then I softly see column name "MultiSelect Picklist" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "MultiSelect Picklist" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "MultiSelect Picklist" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "MultiSelect Picklist" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "MultiSelect Picklist" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "MultiSelect Picklist"
    #Email
    And I click on column name "Email" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Email" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Email" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "5"
    Then I softly see column name "Email" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Email" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Email" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Email" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Email" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Email"
    #URL
    And I click on column name "URL" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "URL" with "Ascending" order
    And I refresh the page
    Then I softly see column name "URL" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "5"
    Then I softly see column name "URL" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "URL" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "URL" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "URL" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "URL" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "URL"

    Examples:
      | User |
      | PM   |

  @504898
  Scenario Outline: 3.0- FlexGrid Enhanced- Admin/PM- To verify that, for Picklist,Multi-select Picklist,URL,Email,Checkbox data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                                  | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue           |
      | Flex Table:General    | Display Field Names | LinkPicklist__c,MultiSelect_Picklist__c,URL__c,Email__c,Template__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                      |
      | Flex Grid:General     | Default Page Size   | 5                                                                                              | ProgramReviewStepTemplates | Name                      |                                      |
      | Flex Table List       | Disable sort order  | true                                                                                           | ProgramReviewStepTemplates | Name                      | {SavedValue:LinkPicklist__c}         |
      | Flex Table List       | Disable sort order  | true                                                                                           | ProgramReviewStepTemplates | Name                      | {SavedValue:MultiSelect_Picklist__c} |
      | Flex Table List       | Disable sort order  | true                                                                                           | ProgramReviewStepTemplates | Name                      | {SavedValue:URL_URL__c}              |
      | Flex Table List       | Disable sort order  | true                                                                                           | ProgramReviewStepTemplates | Name                      | {SavedValue:Email_Email__c}          |
      | Flex Table List       | Disable sort order  | true                                                                                           | ProgramReviewStepTemplates | Name                      | {SavedValue:Checkbox_Template__c}    |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{SavedValue:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{SavedValue:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
      #picklist
    And I click on column name "LinkPicklist" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "LinkPicklist"
      #checkbox
    And I click on column name "B_Template" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "B_Template"
      #Multiselect Picklist
    And I click on column name "MultiSelect Picklist" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "MultiSelect Picklist"
      #Email
    And I click on column name "Email" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Email"
      #URL
    And I click on column name "URL" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "URL"

    Examples:
      | User |
      | PM   |

  @504892
  Scenario Outline: 3.0- FlexGrid Enhanced-Admin/PM-To verify that, for Text, Text Area, Long Text Area data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                              | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Flex Table:General    | Display Field Names | AutTestName__c,Justification__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                            |
      | Flex Grid:General     | Default Page Size   | 5                                                          | ProgramReviewStepTemplates | Name                      |                                            |
      | Flex Table List       | Disable sort order  | false                                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Text_Name}                     |
      | Flex Table List       | Disable sort order  | false                                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:TextArea_AutTestName__c}       |
      | Flex Table List       | Disable sort order  | false                                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:LongTextArea_Justification__c} |
    Given I login to "As a Grantor" app as "<User>" user
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
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" by clicking "New" :
      | Step Order | Description   | Step Name      | Step Weight (%) |
      | 4          | Test          | Review Testing | 0               |
      | 5          | Data Table    | Check          | 0               |
      | 6          | Picklist Data | Automation     | 0               |
      | 7          | Random Data   | Automation     | 0               |
    #Text/Standard
    And I click on column name "Step Name" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Step Name" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Step Name" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Step Name" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "5"
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Step Name" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Step Name" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Step Name" with "Ascending" order
    And I navigate to "Planning" tab
    And I pause execution for "4" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Step Name" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Step Name"
    #TextArea
    And I click on column name "AutTestName" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "AutTestName" with "Ascending" order
    And I refresh the page
    Then I softly see column name "AutTestName" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "AutTestName" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "5"
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "AutTestName" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "AutTestName" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "AutTestName" with "Ascending" order
    And I navigate to "Planning" tab
    And I pause execution for "6" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "AutTestName" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "AutTestName"
    #LongTextArea
    And I click on column name "Justification" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Justification" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Justification" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Justification" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Justification" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Justification" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Justification" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Justification" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Justification"

    Examples:
      | User |
      | PM   |

  @504895
  Scenario Outline: 3.0- FlexGrid Enhanced- Admin/PM- To verify that, for Text/Standard, Text Area, Long Text Area, Rich Text Area data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                              | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue                 |
      | Flex Table:General    | Display Field Names | AutTestName__c,Justification__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                            |
      | Flex Grid:General     | Default Page Size   | 5                                                          | ProgramReviewStepTemplates | Name                      |                                            |
      | Flex Table List       | Disable sort order  | true                                                       | ProgramReviewStepTemplates | Name                      | {SavedValue:Text_Name}                     |
      | Flex Table List       | Disable sort order  | true                                                       | ProgramReviewStepTemplates | Name                      | {SavedValue:TextArea_AutTestName__c}       |
      | Flex Table List       | Disable sort order  | true                                                       | ProgramReviewStepTemplates | Name                      | {SavedValue:LongTextArea_Justification__c} |
      | Flex Table List       | Disable sort order  | true                                                       | ProgramReviewStepTemplates | Name                      | {SavedValue:RichTextArea_Description__c}   |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{SavedValue:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{SavedValue:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
      #Text/Standard
    Then I softly do not see column "Step Name" is clickable in table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
      #TexArea
    Then I softly do not see column "AutTestName" is clickable in table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
      #LongTextArea
    Then I softly do not see column "Justification" is clickable in table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
      #RichTextArea
    Then I softly do not see column "Description" is clickable in table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"

    Examples:
      | User |
      | PM   |

  @504893
  Scenario Outline: 3.0- FlexGrid Enhanced-Admin/PM-To verify that, for Lookup,Reference,Formul datatype fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
    #  | Flex Table List       | Disable sort order  | false                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                             | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General    | Display Field Names | Organization__c,ProgramCode__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                     |
      | Flex Grid:General     | Default Page Size   | 5                                                         | ProgramReviewStepTemplates | Name                      |                                     |
      | Flex Table List       | Disable sort order  | true                                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Lookup_Organization__c} |
      | Flex Table List       | Disable sort order  | true                                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Formula_ProgramCode__c} |
     # | Flex Table List       | Disable sort order  | false                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:} |
    Given I login to "As a Grantor" app as "<User>" user
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
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" by clicking "New" :
      | Step Order | Description   | Step Name      | Step Weight (%) |
      | 4          | Test          | Review Testing | 0               |
      | 5          | Data Table    | Check          | 0               |
      | 6          | Picklist Data | Automation     | 0               |
      | 7          | Random Data   | Automation     | 0               |
    #Lookup
    And I click on column name "X_Agency" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "X_Agency" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Agency" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "X_Agency" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "X_Agency" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "X_Agency" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "X_Agency" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Agency" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "X_Agency"
    #Formula
    And I click on column name "X_Program Code" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "X_Program Code" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_Program Code" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "X_Program Code" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "X_Program Code" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "X_Program Code" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "X_Program Code" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_Program Code" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "X_Program Code"

    Examples:
      | User |
      | PM   |

  @504897
  Scenario Outline:3.0- FlexGrid Enhanced- Admin/PM- To verify that, for Standard,Lookup,Reference,Formula data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
    #  | Flex Table List       | Disable sort order  | false                    | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                             | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General    | Display Field Names | Organization__c,ProgramCode__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                     |
      | Flex Grid:General     | Default Page Size   | 5                                                         | ProgramReviewStepTemplates | Name                      |                                     |
      | Flex Table List       | Disable sort order  | true                                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Lookup_Organization__c} |
      | Flex Table List       | Disable sort order  | true                                                      | ProgramReviewStepTemplates | Name                      | {SavedValue:Formula_ProgramCode__c} |
     # | Flex Table List       | Disable sort order  | false                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:} |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{SavedValue:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{SavedValue:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
      #Lookup
    And I click on column name "X_Agency" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "X_Agency"
      #Formula
    And I click on column name "X_Program Code" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "X_Program Code"

    Examples:
      | User |
      | PM   |

  @504894
  Scenario Outline: 3.0- FlexGrid Enhanced-Admin/PM-To verify that, for Numeric(Number,Currency,Percent) datatype fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                          | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | Currency__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                |
      | Flex Grid:General     | Default Page Size   | 5                                      | ProgramReviewStepTemplates | Name                      |                                |
      | Flex Table List       | Disable sort order  | false                                  | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c}     |
      | Flex Table List       | Disable sort order  | false                                  | ProgramReviewStepTemplates | Name                      | {SavedValue:Currency__c}       |
      | Flex Table List       | Disable sort order  | false                                  | ProgramReviewStepTemplates | Name                      | {SavedValue:Percent_Weight__c} |
    Given I login to "As a Grantor" app as "<User>" user
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
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" by clicking "New" :
      | Step Order | Description   | Step Name      | Step Weight (%) |
      | 4          | Test          | Review Testing | 0               |
      | 5          | Data Table    | Check          | 0               |
      | 6          | Picklist Data | Automation     | 0               |
      | 7          | Random Data   | Automation     | 0               |
    #Number
    And I click on column name "Step Order" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Step Order" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Step Order" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Step Order" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Step Order" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Step Order" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Step Order" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Step Number" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Step Number"
    #Currency
    And I click on column name "Currency" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Currency" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Currency" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Currency" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Currency" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Currency" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Currency" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Currency" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "RSParentCurrencyTest"
     #Percent
    And I click on column name "Step Weight (%)" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Step Weight (%)" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Step Weight (%)" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Step Weight (%)" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Step Weight (%)" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Step Weight (%)" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Step Weight (%)" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Step Weight (%)" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Step Weight (%)"

    Examples:
      | User |
      | PM   |

  @504899
  Scenario Outline: 3.0- FlexGrid Enhanced- Admin/PM- To verify that, for Numeric (Number, Currency, Percent) data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                        | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue     |
      | Flex Table:General    | Display Field Names | StepNumber__c,Currency__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                                |
      | Flex Grid:General     | Default Page Size   | 5                                                    | ProgramReviewStepTemplates | Name                      |                                |
      | Flex Table List       | Disable sort order  | true                                                 | ProgramReviewStepTemplates | Name                      | {SavedValue:StepNumber__c}     |
      | Flex Table List       | Disable sort order  | true                                                 | ProgramReviewStepTemplates | Name                      | {SavedValue:Currency__c}       |
      | Flex Table List       | Disable sort order  | true                                                 | ProgramReviewStepTemplates | Name                      | {SavedValue:Percent_Weight__c} |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{SavedValue:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{SavedValue:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    #Number
    And I click on column name "RSDecimalNumber" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Step Number"
    #Currency
    And I click on column name "RSParentCurrencyTest" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Currency"
    #Percent
    And I click on column name "Step Weight (%)" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Step Weight (%)"

    Examples:
      | User |
      | PM   |

  @504900
  Scenario Outline: 3.0- FlexGrid Enhanced- Admin/PM- To verify that, for Date, Date & Time, Time, Phonedata type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Flex Table:General    | Display Field Names | EndDate__c,Date_And_Time__c,Time__c,Phone__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                               |
      | Flex Grid:General     | Default Page Size   | 5                                                                       | ProgramReviewStepTemplates | Name                      |                               |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_EndDate__c}  |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_And_Time__c} |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:RSTime__c}          |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:Phone__c}         |
    Given I login to "As a Grantor" app as "<User>" user
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
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" by clicking "New" :
      | Step Order | Description   | Step Name      | Step Weight (%) |
      | 1          | Test          | Review Testing | 20              |
      | 2          | Data Table    | Check          | 30              |
      | 3          | Picklist Data | Automation     | 40              |
      | 4          | Random Data   | Automation     | 10              |
    #Date
    And I click on column name "X_End Date" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "X_End Date" with "Ascending" order
    And I refresh the page
    Then I softly see column name "X_End Date" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "X_End Date" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "X_End Date" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "X_End Date" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "X_End Date" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "X_End Date" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "X_End Date"
    #DateAndTime
    And I click on column name "Date And Time" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Date And Time" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Date And Time" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Date And Time" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Date And Time" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Date And Time"
     #Time
    And I click on column name "Time" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Time" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Time" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Time" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Time" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Time" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Time"
      #Phone
    And I click on column name "Phone" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Phone" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Phone" with "Ascending" order
    And I click on page navigation arrow "Next" for table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly see column name "Phone" with "Ascending" order
    And I select value inside table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" is "10"
    Then I softly see column name "Phone" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    And I enter advance filter values inside id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
      | Step Name | contains | Review |
    Then I softly see column name "Phone" with "Ascending" order
    And I click on advance filter of table id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" for LWC
    When I perform quick search for "SME Review" in "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---" panel
    Then I softly see column name "Phone" with "Ascending" order
    And I navigate to "Planning" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Phone" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Phone"

    Examples:
      | User |
      | PM   |

  @504901
  Scenario Outline: 3.0- FlexGrid Enhanced- Admin/PM- To verify that, for Date, Date & Time, Time, Phone data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue          | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:ReviewStepDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                          | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                      | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                           | coreComponentField         | coreCOmponentSubFieldName | coreComponentSubFieldValue    |
      | Flex Table:General    | Display Field Names | EndDate__c,Date_And_Time__c,Time__c,Phone__c,{SavedValue:ReviewStepDFN} | ProgramReviewStepTemplates | Name                      |                               |
      | Flex Grid:General     | Default Page Size   | 5                                                                       | ProgramReviewStepTemplates | Name                      |                               |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_EndDate__c}  |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:Date_And_Time__c} |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:RSTime__c}          |
      | Flex Table List       | Disable sort order  | true                                                                    | ProgramReviewStepTemplates | Name                      | {SavedValue:Phone__c}         |
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    And I click toggle button to select "Internal Programs - Active"
    When I perform quick search for "{SavedValue:ProgramRecord}" in "{program:programsTableId}" panel
    When I click on "View" icon for "{SavedValue:ProgramRecord}" inside table
    And I pause execution for "5" seconds
    When I navigate to "Setup" sub tab
    #Date
    And I click on column name "X_End Date" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "X_End Date"
    #DateAndTime
    And I click on column name "Date And Time" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Date And Time"
    #Time
    And I click on column name "Time" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Time"
    #Phone
    And I click on column name "Phone" for sorting of table "---lwcprogram:-:ProgramReviewStepTemplatesTablesID---"
    Then I softly do not see arrowIcon for column name "Phone"

    Examples:
      | User |
      | PM   |

  @504902
  Scenario Outline: 3.0-FlexGrid Enhanced-SPI-To verify that, for Picklist,Multi-select Picklist,URL,Email,Checkbox datatype fields,when"Disable sort Order"config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                        | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table:General    | Display Field Names | Status__c,Multi_Picklist__c,URL__c,Email__c,Modified__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                         |
      | Flex Grid:General     | Default Page Size   | 5                                                                                    | EnhanceAppGrantorBudgetPeriods | Name                      |                                         |
      | Flex Table List       | Disable sort order  | false                                                                                | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:PicklistSPI_Status__c}      |
      | Flex Table List       | Disable sort order  | false                                                                                | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:MultiSPI_Multi_Picklist__c} |
      | Flex Table List       | Disable sort order  | false                                                                                | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:URLSPI_URL__c}              |
      | Flex Table List       | Disable sort order  | false                                                                                | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:EmailSPI_Email__c}          |
      | Flex Table List       | Disable sort order  | false                                                                                | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CheckBoxSPI_Modified__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Picklist
    And I click on column name "Status" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Status" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Status" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Status" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Status" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Status" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Status"
    #Multi Picklist
    And I click on column name "Multi Picklist" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Multi Picklist" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Multi Picklist" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Multi Picklist" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Multi Picklist" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Multi Picklist" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Multi Picklist"
  #URL
    And I click on column name "URL" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "URL" with "Ascending" order
    And I refresh the page
    Then I softly see column name "URL" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "URL" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "URL" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "URL" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "URL"
 #Email
    And I click on column name "Email" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Email" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Email" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Email" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Email" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Email" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Email"
     #Checkbox
    And I click on column name "Modified" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Modified" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Modified" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Modified" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Modified" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Modified" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Modified"

    Examples:
      | User |
      | SPI3 |

  @504909
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- To verify that, for Picklist, Multi-select Picklist, URL, Email, Checkbox data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:6 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                        | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue              |
      | Flex Table:General    | Display Field Names | Status__c,Multi_Picklist__c,URL__c,Email__c,Modified__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                         |
      | Flex Grid:General     | Default Page Size   | 5                                                                                    | EnhanceAppGrantorBudgetPeriods | Name                      |                                         |
      | Flex Table List       | Disable sort order  | true                                                                                 | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:PicklistSPI_Status__c}      |
      | Flex Table List       | Disable sort order  | true                                                                                 | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:MultiSPI_Multi_Picklist__c} |
      | Flex Table List       | Disable sort order  | true                                                                                 | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:URLSPI_URL__c}              |
      | Flex Table List       | Disable sort order  | true                                                                                 | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:EmailSPI_Email__c}          |
      | Flex Table List       | Disable sort order  | true                                                                                 | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CheckBoxSPI_Modified__c}    |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Picklist
    And I click on column name "Status" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Status"
      #Multi Picklist
    And I click on column name "Multi Picklist" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Multi Picklist"
      #URL
    And I click on column name "URL" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "URL"
      #Email
    And I click on column name "Email" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Email"
      #Checkbox
    And I click on column name "Modified" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Modified"

    Examples:
      | User |
      | SPI3 |

  @504904
  Scenario Outline: 3.0- FlexGrid Enhanced-SPI- To verify that, for Standard,Lookup,Reference,Formula data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                  | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | Award__r.AwardedAmount__c,OwnerID,BudgetPeriod__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 5                                                                              | EnhanceAppGrantorBudgetPeriods | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | false                                                                          | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:LookupSPI_Owner}                        |
      | Flex Table List       | Disable sort order  | false                                                                          | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ReferenceSPI_Award__r.AwardedAmount__c} |
      | Flex Table List       | Disable sort order  | false                                                                          | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:FormulaSPI_BudgetPeriod__c}             |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Lookup/Standard
    And I click on column name "Owner ID" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Owner ID" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Owner ID" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Owner ID" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Owner ID" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Owner ID" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Owner ID"
    #Reference
    And I click on column name "Awarded Amount" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Awarded Amount" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Awarded Amount" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Awarded Amount" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Awarded Amount" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Awarded Amount" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Awarded Amount"
    #Formula
    And I click on column name "Budget Period" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Budget Period" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Budget Period" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Budget Period" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Budget Period" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Budget Period" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Budget Period"

    Examples:
      | User |
      | SPI3 |

  @504908
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- To verify that, for Standard,Lookup,Reference,Formula data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                  | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue                          |
      | Flex Table:General    | Display Field Names | Award__r.AwardedAmount__c,OwnerID,BudgetPeriod__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                                     |
      | Flex Grid:General     | Default Page Size   | 5                                                                              | EnhanceAppGrantorBudgetPeriods | Name                      |                                                     |
      | Flex Table List       | Disable sort order  | true                                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:LookupSPI_Owner}                        |
      | Flex Table List       | Disable sort order  | true                                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:ReferenceSPI_Award__r.AwardedAmount__c} |
      | Flex Table List       | Disable sort order  | true                                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:FormulaSPI_BudgetPeriod__c}             |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Lookup/Standard
    And I click on column name "Owner ID" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Owner ID"
      #Reference
    And I click on column name "Awarded Amount" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Awarded Amount"
      #Formula
    And I click on column name "Budget Period" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Budget Period"

    Examples:
      | User |
      | SPI3 |

  @504905
  Scenario Outline: 3.0- FlexGrid Enhanced-SPI- To verify that, for Numeric (Number, Currency, Percent) data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                   | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | ParentTestNumber__c,FeeFundRequested__c,Percent__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                              |
      | Flex Grid:General     | Default Page Size   | 5                                                                               | EnhanceAppGrantorBudgetPeriods | Name                      |                                              |
      | Flex Table List       | Disable sort order  | false                                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:NumberSPI_ParentTestNumber__c}   |
      | Flex Table List       | Disable sort order  | false                                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CurrencySPI_FeeFundRequested__c} |
      | Flex Table List       | Disable sort order  | false                                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:PercentSPI_Percent__c}           |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Number
    And I click on column name "ParentTestNumber" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "ParentTestNumber" with "Ascending" order
    And I refresh the page
    Then I softly see column name "ParentTestNumber" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "ParentTestNumber" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "ParentTestNumber" with "Ascending" order
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "ParentTestNumber" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "ParentTestNumber"
    #Currency
    And I click on column name "Fee Fund Requested" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Fee Fund Requested" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Fee Fund Requested" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Fee Fund Requested" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Fee Fund Requested" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Fee Fund Requested" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Fee Fund Requested"
    #Percent
    And I click on column name "Percent" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Percent" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Percent" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Percent" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Percent" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Percent" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Percent"

    Examples:
      | User |
      | SPI3 |

  @504911
  Scenario Outline: 3.0-FlexGrid Enhanced- SPI- To verify that, for Numeric (Number, Currency, Percent) data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                                   | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue                   |
      | Flex Table:General    | Display Field Names | ParentTestNumber__c,FeeFundRequested__c,Percent__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                              |
      | Flex Grid:General     | Default Page Size   | 5                                                                               | EnhanceAppGrantorBudgetPeriods | Name                      |                                              |
      | Flex Table List       | Disable sort order  | true                                                                            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:NumberSPI_ParentTestNumber__c}   |
      | Flex Table List       | Disable sort order  | true                                                                            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:CurrencySPI_FeeFundRequested__c} |
      | Flex Table List       | Disable sort order  | true                                                                            | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:PercentSPI_Percent__c}           |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Number
    And I click on column name "ParentTestNumber" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "ParentTestNumber"
    #Currency
    And I click on column name "Fee Fund Requested" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Fee Fund Requested"
    #Percent
    And I click on column name "Percent" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Percent"

    Examples:
      | User |
      | SPI3 |

  @504913
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI - To verify that, for Text,TextArea,Long/RichTextArea data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General    | Display Field Names | Notes__c,Long_Text_Area__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                     |
      | Flex Grid:General     | Default Page Size   | 5                                                       | EnhanceAppGrantorBudgetPeriods | Name                      |                                     |
      | Flex Table List       | Disable sort order  | false                                                   | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:TextSPI_SupportYear__c} |
      | Flex Table List       | Disable sort order  | false                                                   | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:TextAreaSPI_Notes__c}   |
      | Flex Table List       | Disable sort order  | false                                                   | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Long_Text_Area__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Text
    And I click on column name "Support Year" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Support Year" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Support Year" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Support Year" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Support Year" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Support Year" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Support Year"
    #TextArea
    And I click on column name "Notes" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Notes" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Notes" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Notes" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Notes" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Notes" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Notes"
    #LongTextArea
    And I click on column name "Long Text Area" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Long Text Area" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Long Text Area" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Long Text Area" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Long Text Area" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Long Text Area" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Long Text Area"

    Examples:
      | User |
      | SPI3 |

  @504906
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- To verify that, for Text,TextArea,Long/RichTextArea data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                           | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue          |
      | Flex Table:General    | Display Field Names | Notes__c,Long_Text_Area__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                     |
      | Flex Grid:General     | Default Page Size   | 5                                                       | EnhanceAppGrantorBudgetPeriods | Name                      |                                     |
      | Flex Table List       | Disable sort order  | true                                                    | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:TextSPI_SupportYear__c} |
      | Flex Table List       | Disable sort order  | true                                                    | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:TextAreaSPI_Notes__c}   |
      | Flex Table List       | Disable sort order  | true                                                    | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Long_Text_Area__c}  |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Text
    And I click on column name "Support Year" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Support Year"
    #TextArea
    And I click on column name "Notes" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Notes"
    #LongTextArea
    And I click on column name "Long Text Area" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Long Text Area"

    Examples:
      | User |
      | SPI3 |

  @504914
  Scenario Outline:3.0- FlexGrid Enhanced- SPI - To verify that, for Date, Date & Time, Time, Phone data type fields, when "Disable sort Order" config is unchecked, then after clicking on the table column header, arrow should get displayed on the column header of table
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table:General    | Display Field Names | Date_And_Time__c,Time__c,Phone__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                       |
      | Flex Grid:General     | Default Page Size   | 5                                                              | EnhanceAppGrantorBudgetPeriods | Name                      |                                       |
      | Flex Table List       | Disable sort order  | false                                                          | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:DateSPI_BudgetEndDate__c} |
      | Flex Table List       | Disable sort order  | false                                                          | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:Date_And_Time_SPI__c}     |
      | Flex Table List       | Disable sort order  | false                                                          | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Time__c}              |
      | Flex Table List       | Disable sort order  | false                                                          | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Phone__c}             |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Date
    And I click on column name "End Date" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "End Date" with "Ascending" order
    And I refresh the page
    Then I softly see column name "End Date" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "End Date" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "End Date" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "End Date" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "End Date"
    #DateAndTime
    And I click on column name "Date And Time" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Date And Time" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Date And Time" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Date And Time" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Date And Time" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Date And Time"
    #Time
    And I click on column name "Time" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Time" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Time" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Time" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Time" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Time"
    #Phone
    And I click on column name "Phone" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see column name "Phone" with "Ascending" order
    And I refresh the page
    Then I softly see column name "Phone" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    And I enter advance filter values inside id "---applicationIntake:-:budgetPeriodTableId---" for LWC
      | Budget Period # | contains | BP01 |
    Then I softly see column name "Phone" with "Ascending" order
    And I click on advance filter of table id "---applicationIntake:-:budgetPeriodTableId---" for LWC
    When I perform quick search for "BP01" in "---applicationIntake:-:budgetPeriodTableId---" panel
    Then I softly see column name "Phone" with "Ascending" order
    And I navigate to "Applications" tab
    And I click on back arrow
    And I pause execution for "5" seconds
    Then I softly see column name "Phone" with "Ascending" order
    When I click on button "resetIcon" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Phone"

    Examples:
      | User |
      | SPI3 |

  @504912
  Scenario Outline: 3.0- FlexGrid Enhanced- SPI- To verify that, for Date, Date & Time, Time, Phone data type fields, when "Disable sort Order" config is checked, then the table column header should not be clickable
    Given I have "default" configuration as below:
      | configurationCategory | fieldName           | fieldOrignalValue            | filterId         |
      | Flex Table            | Display Field Names | {SavedValue:BudgetPeriodDFN} | ApiGeneratedId:0 |
      | Flex Grid             | Default Page Size   | 5                            | ApiGeneratedId:1 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:2 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:3 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:4 |
      | Flex Table List       | Disable sort order  | false                        | ApiGeneratedId:5 |
    Given I setup test configuration as below:
      | configurationCategory | fieldName           | fieldNewValue                                                  | coreComponentField             | coreCOmponentSubFieldName | coreComponentSubFieldValue            |
      | Flex Table:General    | Display Field Names | Date_And_Time__c,Time__c,Phone__c,{SavedValue:BudgetPeriodDFN} | EnhanceAppGrantorBudgetPeriods | Name                      |                                       |
      | Flex Grid:General     | Default Page Size   | 5                                                              | EnhanceAppGrantorBudgetPeriods | Name                      |                                       |
      | Flex Table List       | Disable sort order  | true                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:DateSPI_BudgetEndDate__c} |
      | Flex Table List       | Disable sort order  | true                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:Date_And_Time_SPI__c}     |
      | Flex Table List       | Disable sort order  | true                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Time__c}              |
      | Flex Table List       | Disable sort order  | true                                                           | EnhanceAppGrantorBudgetPeriods | Name                      | {SavedValue:SPI_Phone__c}             |
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I pause execution for "6" seconds
    When I click on "Qualify" in the page details
    And I pause execution for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #Date
    And I click on column name "End Date" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "End Date"
    #DateAndTime
    And I click on column name "Date And Time" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Date And Time"
    #Time
    And I click on column name "Time" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Time"
    #Phone
    And I click on column name "Phone" for sorting of table "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see arrowIcon for column name "Phone"

    Examples:
      | User |
      | SPI3 |
