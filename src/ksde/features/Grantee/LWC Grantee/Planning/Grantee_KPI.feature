@GranteeKPI
Feature: Validate all scenarios for KPI

  @455419 @KPIVerifyFDusershouldseefooternavigatorafteropentheKPI
  Scenario Outline:KPI_ Verify PM user should see footer navigator after open the KPI
    When I login to "As a Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{grantee_testData:AutomationPermanentKPI}" in "---grantee_tableId:-:KPITable---" panel
    And I click on "View" icon for "{grantee_testData:AutomationPermanentKPI}" inside flex table with id "---grantee_tableId:-:KPITable---" without waiting for record
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Strategic Plans" inside "Setup" is displayed
    Then I see "Key Performance Indicators (KPI)" inside "Setup" is displayed
    Then I see "Focus Areas" inside "Setup" is displayed
    Then I see "External" inside "Programs" is displayed
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{grantee_testData:AutomationPermanentKPI}" in "---grantee_tableId:-:KPITable---" panel
    Then I see "Strategic Plans" inside "Setup" is displayed
    Then I see "Key Performance Indicators (KPI)" inside "Setup" is displayed
    Then I see "Focus Areas" inside "Setup" is displayed
    Examples:
      | User        |
      | GRANTEE PM  |

  @455420 @455421 @KPIVerifyFDusershouldseefooternavigatorafteropentheKPI
  Scenario Outline:KPI_ Verify EXE user should see footer navigator after open the KPI
    When I login to "As a Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{grantee_testData:AutomationPermanentKPI}" in "---grantee_tableId:-:KPITable---" panel
    And I click on "View" icon for "{grantee_testData:AutomationPermanentKPI}" inside flex table with id "---grantee_tableId:-:KPITable---" without waiting for record
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Strategic Plans" inside "Setup" is displayed
    Then I see "Key Performance Indicators (KPI)" inside "Setup" is displayed
    Then I see "Focus Areas" inside "Setup" is displayed
    Then I see "External" inside "Programs" is displayed
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{grantee_testData:AutomationPermanentKPI}" in "---grantee_tableId:-:KPITable---" panel
    Then I see "Strategic Plans" inside "Setup" is displayed
    Then I see "Key Performance Indicators (KPI)" inside "Setup" is displayed
    Then I see "Focus Areas" inside "Setup" is displayed
    Examples:
      | User        |
      | GRANTEE EXE |

  @455421 @KPIVerifyFDusershouldseefooternavigatorafteropentheKPI
  Scenario Outline:KPI_ Verify FD user should see footer navigator after open the KPI
    When I login to "As a Grantee" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{grantee_testData:AutomationPermanentKPI}" in "---grantee_tableId:-:KPITable---" panel
    And I click on "View" icon for "{grantee_testData:AutomationPermanentKPI}" inside flex table with id "---grantee_tableId:-:KPITable---" without waiting for record
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Strategic Plans" inside "Setup" is displayed
    Then I see "Key Performance Indicators (KPI)" inside "Setup" is displayed
    Then I see "Focus Areas" inside "Setup" is displayed
    Then I see "External" inside "Programs" is displayed
    And I wait for "5" seconds
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{grantee_testData:AutomationPermanentKPI}" in "---grantee_tableId:-:KPITable---" panel
    Then I see "Strategic Plans" inside "Setup" is displayed
    Then I see "Key Performance Indicators (KPI)" inside "Setup" is displayed
    Then I see "Focus Areas" inside "Setup" is displayed
    Examples:
      | User        |
      | GRANTEE FD  |

  @477639 @ValidatePOusershoulonlyviewaccessforKPI @P2_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate PO user should only view access for KPI
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:KPITable---"
    And I perform quick search for "{SavedValue:KPIEGMSID}" in "---grantee_tableId:-:KPITable---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Activate" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:KPIEGMSID}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Internal Organization" as "Department of Product"
    And I save the field labeled "Domain" as "Domain"
    And I save the field labeled "Title" as "KPITitle"
    And I save the field labeled "Measure" as "Measure"
    And I save the field labeled "Unit of Measurement" as "UnitofMeasurement"
    And I save the field labeled "Indicator" as "Indicator"
    Then I softly see field "Domain" as "{SavedValue:Domain}"
    Then I softly see field "Title" as "{SavedValue:KPITitle}"
    Then I softly see field "Measure" as "{SavedValue:Measure}"
    Then I softly see field "Unit of Measurement" as "{SavedValue:UnitofMeasurement}"
    Then I softly see field "Indicator" as "{SavedValue:Indicator}"
    When I navigate to "Related Log" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Awards" page block displayed
    Then I softly see "No Records Found" inside flex table with id "Goals"
    Then I softly see "No Records Found" inside flex table with id "KPIsGranteeRelatedAwards"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:KPIFilesTableId---"
    Then I see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "New" :
      | Title             | Description      |
      | Notes Record Test | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record Test" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record Test" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<EmailId>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "History" sub tab
    Then I softly see "No Records Found" inside snapshot history
    Examples:
      | userType   | EmailId                     |
      | GRANTEE PO | govgrantsuat@yopmail.com    |

  @477642 @ValidatePOusershoulonlyviewaccessforKPI @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Validate FO user should only view access for KPI
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:KPITable---"
    And I perform quick search for "{SavedValue:KPIEGMSID}" in "---grantee_tableId:-:KPITable---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Activate" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:KPIEGMSID}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Internal Organization" as "Department of Product"
    And I save the field labeled "Domain" as "Domain"
    And I save the field labeled "Title" as "KPITitle"
    And I save the field labeled "Measure" as "Measure"
    And I save the field labeled "Unit of Measurement" as "UnitofMeasurement"
    And I save the field labeled "Indicator" as "Indicator"
    Then I softly see field "Domain" as "{SavedValue:Domain}"
    Then I softly see field "Title" as "{SavedValue:KPITitle}"
    Then I softly see field "Measure" as "{SavedValue:Measure}"
    Then I softly see field "Unit of Measurement" as "{SavedValue:UnitofMeasurement}"
    Then I softly see field "Indicator" as "{SavedValue:Indicator}"
    When I navigate to "Related Log" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Awards" page block displayed
    Then I softly see "No Records Found" inside flex table with id "Goals"
    Then I softly see "No Records Found" inside flex table with id "KPIsGranteeRelatedAwards"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:KPIFilesTableId---"
    Then I see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "New" :
      | Title             | Description      |
      | Notes Record Test | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record Test" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record Test" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<EmailId>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "History" sub tab
    Then I softly see "No Records Found" inside snapshot history
    Examples:
      | userType   | EmailId                     |
      | GRANTEE FO | david.fo@yopmail.com        |

  @477643 @ValidatePOusershoulonlyviewaccessforKPI @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate FD user should only view access for KPI
    When I login to "As a Grantee" app as "GRANTEE EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:KPITable---"
    And I perform quick search for "{SavedValue:KPIEGMSID}" in "---grantee_tableId:-:KPITable---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Activate" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I see the sub-header is "{SavedValue:Automation Runtime KPI}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:KPIEGMSID}"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly see field "Internal Organization" as "Department of Product"
    And I save the field labeled "Domain" as "Domain"
    And I save the field labeled "Title" as "KPITitle"
    And I save the field labeled "Measure" as "Measure"
    And I save the field labeled "Unit of Measurement" as "UnitofMeasurement"
    And I save the field labeled "Indicator" as "Indicator"
    Then I softly see field "Domain" as "{SavedValue:Domain}"
    Then I softly see field "Title" as "{SavedValue:KPITitle}"
    Then I softly see field "Measure" as "{SavedValue:Measure}"
    Then I softly see field "Unit of Measurement" as "{SavedValue:UnitofMeasurement}"
    Then I softly see field "Indicator" as "{SavedValue:Indicator}"
    When I navigate to "Related Log" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Awards" page block displayed
    Then I softly see "No Records Found" inside flex table with id "Goals"
    Then I softly see "No Records Found" inside flex table with id "KPIsGranteeRelatedAwards"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:KPIFilesTableId---"
    Then I see "AttachmentTesting.pdf" has been added in "KPI Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:KPIFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:KPINotesTableId---" by clicking "New" :
      | Title             | Description      |
      | Notes Record Test | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:KPINotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record Test" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record Test" in flex table with id "---grantee_tableId:-:KPINotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "4" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<EmailId>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    And I navigate to "History" sub tab
    Then I softly see "No Records Found" inside snapshot history
    Examples:
      | userType   | EmailId                     |
      | GRANTEE FD | danielle.garcia@yopmail.com |

  @477629 @ValidatePMusershouldabletoseevalidationmessagesforrequiredtosavefiledonKPI @P2_Grantee @EXE_Grantee @GRegression2
  Scenario Outline: Validate EXE user should able to see validation messages for required to save filed on KPI
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required.                |
      | To Save, Domain is required.               |
      | To Save, Measure is required.              |
      | To Save, Unit of Measurement is required.  |
      | To Save, Indicator is required.            |
    And I wait for "2" seconds
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I clear the value from field "Description__c"
    When I clear the value from field "Title__c"
    When I enter value "--None--" into field "Unit__c"
    When I enter value "--None--" into field "Orientation__c"
    When I enter value "--None--" into field "Domain__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Domain is required in the Overview tab under the Overview section.              |
      | To Save, Title is required in the Overview tab under the Overview section.               |
      | To Save, Measure is required in the Overview tab under the Overview section.             |
      | To Save, Unit of Measurement is required in the Overview tab under the Overview section. |
      | To Save, Indicator is required in the Overview tab under the Overview section.           |

    Examples:
      | userType      |
      | GRANTEE EXE   |

  @477630 @ValidatePMusershouldabletoseevalidationmessagesforrequiredtosavefiledonKPI @P2_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate ADMIN user should able to see validation messages for required to save filed on KPI
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:KPITable---"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required.                |
      | To Save, Domain is required.               |
      | To Save, Measure is required.              |
      | To Save, Unit of Measurement is required.  |
      | To Save, Indicator is required.            |
    And I wait for "2" seconds
    And I enter "Grantee_Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I clear the value from field "Description__c"
    When I clear the value from field "Title__c"
    When I enter value "--None--" into field "Unit__c"
    When I enter value "--None--" into field "Orientation__c"
    When I enter value "--None--" into field "Domain__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Domain is required in the Overview tab under the Overview section.              |
      | To Save, Title is required in the Overview tab under the Overview section.               |
      | To Save, Measure is required in the Overview tab under the Overview section.             |
      | To Save, Unit of Measurement is required in the Overview tab under the Overview section. |
      | To Save, Indicator is required in the Overview tab under the Overview section.           |

    Examples:
      | userType      |
      | GRANTEE ADMIN |