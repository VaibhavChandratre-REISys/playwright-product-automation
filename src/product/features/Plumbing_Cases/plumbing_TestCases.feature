@plumbingCases @grantor-regression
Feature: Validate all scenarios for Plumbing Cases

  @545520 @ValidateEXEusercreationofanewFundingSourcefromFinancialtabonceusernavigatetoactiveGranteegrants @Plumbing_P1
  Scenario: Validate EXE user creation of a new Funding Source from Financial tab once user navigate to active Grantee grants
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    Then I softly see value "External" selected as default for the dropdown field "Type__c"
    When I hovering mouse on help text icon inside modal "Funding Source Type"
    Then I softly see with quotes "Select "External" only if Grantee is providing funds to Grantor to carry out grants." shown as help text
    Then I softly see value "{SavedValue:GrantEGMSID}" for the edit mode field "Grant__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I can see top right button "Edit" in page detail
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:fundingSourceID}" for title "EGMS ID" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "External Funding Sources - Draft"
    When I perform quick search for "{SavedValue:fundingSourceID}" in "---grantee_tableId:-:fundingSourceGrantExternalTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I click on "View" icon for "{SavedValue:fundingSourceID}" inside flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:fundingSourceID}" for title "EGMS ID" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"

  @545526 @ValidateAdminuserbelowvalidationonclickofsavebuttonwhenusereditappropriationamountnotfollowtheappropriateconditionwhenFundingAccountisincreatedstate @Plumbing_P1
  Scenario: Validate Admin user below validation on click of save button when user edit appropriation amount & not follow the appropriate condition when Funding Account is in created state
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-DEMO ADMIN user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "4000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Total of appropriation amount cannot be less than the Award Amount to Date on Grant. |

  @545529 @ValidateEXEusercanabletocreateactivateFundingSourceFundingAccountFromactivegrantlayout @Plumbing_P1
  Scenario: Validate EXE user can able to create & activate Funding Source & Funding Account From active grant layout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    Then I softly see value "External" selected as default for the dropdown field "Type__c"
    Then I softly see value "{SavedValue:GrantEGMSID}" for the edit mode field "Grant__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "60000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    Then I softly see value "{SavedValue:fundingSourceID}" for title "EGMS ID" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see value "$60,000.00" for title "Appropriation Amount" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "2" seconds
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click toggle button to select "External Funding Sources - All"
    When I perform quick search for "{SavedValue:fundingSourceID}" in "---grantee_tableId:-:fundingSourceGrantExternalTableId---" panel
    Then I softly see value "$60,000.00" for title "Appropriation Amount" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:fundingSourceID}" inside table "---grantee_tableId:-:fundingSourceGrantExternalTableId---"

  @545532 @ValidatePOusercanabletoseebelowvalidationonupdatedAwardAmounttoDatefieldongranteeGrants @Plumbing_P1
  Scenario: Validate PO user can able to see below validation on updated Award Amount to Date field on grantee Grants
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I wait for "3" seconds
    And I "Approved" of type "Funding Change" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "6000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Total of appropriation amount cannot be less than the Award Amount to Date on Grant. |

  @545539 @ValidatePMusercanabletocreateFundingSourceFundingAccountonclickofFundingSourcelinkfromplanningphase @Plumbing_P1
  Scenario: Validate PM user can able to create Funding Source & Funding Account on click of Funding Source link from planning phase
    When I login to "Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "10000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "StartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "EndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    Then I softly can see row level action button "View" against "Active" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly can see row level action button "Edit" against "Active" in flex table with id "---fundingsource:-:fundingAccountTableId---"

  @545540 @ValidatePOusercanabletocreateFundingSourceFundingAccountonclickofFundingSourcelinkfromplanningphase @Plumbing_P2
  Scenario: Validate PO user can able to create Funding Source & Funding Account on click of Funding Source link from planning phase
    When I login to "Grantor" app as "PO" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I save the field labeled "Start Date" as "SDATE"
    And I save the field labeled "End Date" as "EDATE"
    And I navigate to "Overview" sub tab
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "10000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    When I enter value "{SavedValue:SDATE}" into field "StartDate__c"
    When I enter value "{SavedValue:EDATE}" into field "EndDate__c"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
    Then I see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I click "{SavedValue:FUNDINGSOURCE}" lookup link
    And I navigate to "Overview" sub tab
    Then I softly can see row level action button "View" against "Active" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    Then I softly can see row level action button "Edit" against "Active" in flex table with id "---fundingsource:-:fundingAccountTableId---"

  @545590 @ValidateFOuserFieldsonCreateFundingSourcemodalwhenuserclickonNewbuttonvalidationwhenwekeptrequiredfieldsareblank @Plumbing_P2
  Scenario: Validate FO user Fields on Create Funding Source modal when user click on New button & validation when we kept required fields are blank
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see value "External" selected as default for the dropdown field "Type__c"
    Then I softly see value "{SavedValue:GrantEGMSID}" for the edit mode field "Grant__c"
    And I enter in modal value "--None--" into field "Type__c"
    Then I softly see value "--None--" selected as default for the dropdown field "Type__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required.               |
      | To Save, Funding Source Type is required. |
    When I click modal button "Close"
    And I wait for "1" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"

  @545537 @ValidatePMrecordownercanabletoseeViewEditDeleteactionsacrosscreatedstateofFundingSourceEditactiononFundingAccountrecord @Plumbing_P2
  Scenario: Validate PM record owner can able to see View Edit Delete actions across created state of Funding Source & Edit action on Funding Account record
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Grants" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    Then I softly see value "External" selected as default for the dropdown field "Type__c"
    And I enter in modal value "{SavedValue:GrantEGMSID}" into field "Grant__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I navigate to "Grants" tab
    And I click toggle button to select "External Funding Sources - Draft"
    When I perform quick search for "{SavedValue:fundingSourceID}" in "---grantee_tableId:-:fundingSourceGrantExternalTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I click on "View" icon for "{SavedValue:fundingSourceID}" inside flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "10000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I save the value from row "1" for column name "EGMS ID" as "fundingAccountId" from flex table "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly see value "{SavedValue:fundingAccountId}" for title "EGMS ID" inside table "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"

  @545527 @ValidatePOuserbelowvalidationwhenusereditappropriationamountwhenFundingAccountisinActivestate @Plumbing_P2
  Scenario: Validate PO user below validation when user edit appropriation amount when Funding Account is in Active state
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "10000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I click on "Edit" in the page details
    When I enter value "4000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Total of appropriation amount cannot be less than the Award Amount to Date on Grant. |

  @545517 @ValidateAdminuserNewbuttononFundingSourcesectionunderFinancialtabofGrantlayoutshouldnotvisiblewhenGrantisinDraftstate @Plumbing_P2
  Scenario: Validate Admin user, New button on Funding Source section under Financial tab of Grant layout should not visible when Grant is in Draft state
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-DEMO ADMIN user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE ADMIN" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Financials" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see "Funding Source Type" in flex table header "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see "Appropriation Amount" in flex table header "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see "Created By ID" in flex table header "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:grantExternalSourceTableId---"

  @545522 @ValidateFOuserFieldsonCreateExternalFundingSourcemodalwhenuserclickonNewbuttonvalidationwhenwekeptrequiredfieldsareblank @Plumbing_P2
  Scenario: Validate FO user Fields on Create External Funding Source modal when user click on New button & validation when we kept required fields are blank
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Grants" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingSourceGrantExternalTableId---"
    And I enter in modal value "--None--" into field "Type__c"
    Then I softly see value "--None--" selected as default for the dropdown field "Type__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required.               |
      | To Save, Funding Source Type is required. |

  @545524 @ValidateFOuserFieldsonCreateFundingAccountmodalwhenuserclickonNewbuttonvalidationwhenwekeptrequiredfieldsareblank @Plumbing_P2
  Scenario: Validate FO user Fields on Create Funding Account modal when user click on New button & validation when we kept required fields are blank
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE FO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I wait for "2" seconds
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required.                |
      | To Save, Appropriation Amount is required. |

  @545523 @ValidateEXEusercreationofanewFundingAccountfromdetailpagelayoutofFundingSource @Plumbing_P2
  Scenario: Validate EXE user creation of a new Funding Account from detail page layout of Funding Source
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "10000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Activate" in page detail
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I save the value from row "1" for column name "EGMS ID" as "fundingAccountId" from flex table "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly see value "{SavedValue:fundingAccountId}" for title "EGMS ID" inside table "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I click on "View" icon for "{SavedValue:fundingAccountId}" inside flex table with id "---grantee_tableId:-:fundingaccountTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Deactivate" in page detail
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I save the value from row "1" for column name "EGMS ID" as "fundingAccountId" from flex table "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly see value "{SavedValue:fundingAccountId}" for title "EGMS ID" inside table "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:fundingAccountId}" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
#    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Then I softly see "External Funding Sources" page block displayed
    Then I softly see value "{SavedValue:fundingSourceID}" for title "EGMS ID" inside table "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingSourceID}" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"

  @Bug-PROD-404 @Bug-PROD-47969 @545533 @ValidatePMusercanabletocreateAwardongrantorsidebyusingFundingSourceFundingAccountcreatedatgranteesidecreateReimpaymentrequestonsameawardcheckdollarvaluesonbelowfieldsavailableonFundingAccount @Plumbing_P1
  Scenario: Validate PM user can able to create Award on grantor side by using Funding Source Funding Account created at grantee side  & create Reim payment request on same award & check dollar values on below fields available on Funding Account
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    And I navigate to "Financials" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:grantExternalSourceTableId---"
    And I enter in modal value "Automation Runtime External Source" into field "Title__c"
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "fundingSourceID"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:fundingaccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I enter in modal value "5000" into field "AppropriationBalance__c"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    When I enter value "{SavedValue:PPST}" into field "StartDate__c"
    When I click on "Save" in the page details
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Then I see the header is "Funding Account" in the page details
    Then I softly see field "Pre-Encumbrance" as "$0.00"
    Then I softly see field "Encumbrance" as "$0.00" in "Financials" pageblock
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Total Obligation" as "$0.00"
    Then I softly see field "Available Balance" as "$5,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    Then I see the header is "External Funding Source" in the page details
    Then I softly see field "Pre-Encumbrance" as "$0.00"
    Then I softly see field "Encumbrance" as "$0.00" in "Funding Information" pageblock
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Total Obligation" as "$0.00"
    Then I softly see field "Available Balance" as "$5,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"
    And I save the value from row "1" for column name "EGMS ID" as "fundingAccountId" from flex table "---grantee_tableId:-:fundingaccountTableId---"
    And I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default" for plumbing cases
    When I re-login to "Grantor" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I navigate to "Financials" sub tab
    And I save the value from row "1" for column name "Pre-Encumbrance" as "PreEncumbrance" from flex table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:fundingAccountId}" for title "Funding Account" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:PreEncumbrance}" for title "Pre-Encumbrance" inside table "---announcement:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccountId}"
    And I wait for "2" seconds
    Then I see the header is "Funding Account" in the page details
    Then I softly see field "Pre-Encumbrance" as "$2,000.00"
    And I save the field labeled "Pre-Encumbrance" as "PreEncumbranceFundingAcc"
    Then I softly see value "{SavedValue:PreEncumbrance}" is "Equals to" the value "{SavedValue:PreEncumbranceFundingAcc}"
    Then I softly see field "Encumbrance" as "$0.00" in "Financials" pageblock
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Total Obligation" as "$2,000.00"
    Then I softly see field "Available Balance" as "$3,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    Then I see the header is "External Funding Source" in the page details
    Then I softly see field "Pre-Encumbrance" as "$2,000.00"
    And I save the field labeled "Pre-Encumbrance" as "PreEncumbranceFundingSource"
    Then I softly see value "{SavedValue:PreEncumbrance}" is "Equals to" the value "{SavedValue:PreEncumbranceFundingSource}"
    Then I softly see field "Encumbrance" as "$0.00" in "Funding Information" pageblock
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Total Obligation" as "$2,000.00"
    Then I softly see field "Available Balance" as "$3,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "PLUMBING_CASE"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}" for Plumbing Cases
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" for plumbing cases
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I save the value from row "1" for column name "Encumbrance" as "Encumbrance" from flex table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:fundingAccountId}" for title "Funding Account" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    Then I softly see value "{SavedValue:Encumbrance}" for title "Encumbrance" inside table "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccountId}"
    And I wait for "2" seconds
    Then I see the header is "Funding Account" in the page details
    Then I softly see field "Pre-Encumbrance" as "$0.00"
    Then I softly see field "Encumbrance" as "$2,000.00" in "Financials" pageblock
    And I save the field labeled "Encumbrance" as "EncumbranceFundingAcc"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:EncumbranceFundingAcc}"
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Total Obligation" as "$2,000.00"
    Then I softly see field "Available Balance" as "$3,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    Then I see the header is "External Funding Source" in the page details
    Then I softly see field "Pre-Encumbrance" as "$0.00"
    Then I softly see field "Encumbrance" as "$2,000.00" in "Funding Information" pageblock
    And I save the field labeled "Encumbrance" as "EncumbranceFundingSource"
    Then I softly see value "{SavedValue:Encumbrance}" is "Equals to" the value "{SavedValue:EncumbranceFundingSource}"
    Then I softly see field "Spent" as "$0.00"
    Then I softly see field "Total Obligation" as "$2,000.00"
    Then I softly see field "Available Balance" as "$3,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 500        | 1        | Feet        |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account               | Net Spent This Action |
      | {SavedValue:fundingAccountId} | 500                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name     | Reimbursement |
      | Sarah PM | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    And I pause execution for "2" seconds
    When I click modal button "Close"
    Then I see status in Progress-bar is "Paid" and is "dark blue"
    And I navigate to "Financials" sub tab
    And I save the value from row "1" for column name "Net Spent This Action" as "NetSpentThisAction" from flex table "---paymentRequest:-:fundingAccountTableId---"
    Then I softly see value "{SavedValue:fundingAccountId}" for title "Funding Account" inside table "---paymentRequest:-:fundingAccountTableId---"
    Then I softly see value "{SavedValue:NetSpentThisAction}" for title "Net Spent This Action" inside table "---paymentRequest:-:fundingAccountTableId---"
    And I click on hyperlink containing value "{SavedValue:fundingAccountId}"
    And I wait for "2" seconds
    Then I see the header is "Funding Account" in the page details
    Then I softly see field "Pre-Encumbrance" as "$0.00"
    Then I softly see field "Encumbrance" as "$1,500.00" in "Financials" pageblock
    And I save the field labeled "Spent" as "SpentFundingAcc"
    Then I softly see value "{SavedValue:NetSpentThisAction}" is "Equals to" the value "{SavedValue:SpentFundingAcc}"
    Then I softly see field "Spent" as "$500.00"
    Then I softly see field "Total Obligation" as "$2,000.00"
    Then I softly see field "Available Balance" as "$3,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"
    And I click on hyperlink containing value "{SavedValue:fundingSourceID}"
    And I wait for "2" seconds
    Then I see the header is "External Funding Source" in the page details
    Then I softly see field "Pre-Encumbrance" as "$0.00"
    Then I softly see field "Encumbrance" as "$1,500.00" in "Funding Information" pageblock
    And I save the field labeled "Spent" as "SpentFundingSource"
    Then I softly see value "{SavedValue:NetSpentThisAction}" is "Equals to" the value "{SavedValue:SpentFundingSource}"
    Then I softly see field "Spent" as "$500.00"
    Then I softly see field "Total Obligation" as "$2,000.00"
    Then I softly see field "Available Balance" as "$3,000.00"
    Then I softly see field "Appropriation Amount" as "$5,000.00"