@GranteeGrantsAwards @GranteeGrantsAwardsPDF
Feature: Validate all scenarios for Grants & Awards for PDF

  @443801 @ValidateGrantwithEXEProfileabletocreatedirectgrantandseealltabsandsection @snapExecution1 @P1_Grantee @EXE_Grantee @Po_Grantee @ADMIN_Grantee @GRegression1
  Scenario Outline: Validate Grant with EXE Profile able to create direct grant and see all tabs and section
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly see "Create Grant" opens in overLay window
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Grant Title is required.               |
      | To Save, Grant Abbreviation is required.        |
      | To Save, Grant Number is required.              |
      | To Save, Project Period Start Date is required. |
      | To Save, Project Period End Date is required.   |
      | To Save, Budget Type is required.               |
      | To Save, Total Anticipated Amount is required.  |
      | To Save, Grant Type is required.                |
      | To Save, Funding Organization is required.      |
      | To Save, Allow Indirect Costs? is required.     |
      | To Save, Match is Required? is required.        |
    And I enter "Grantee_Grant_Setting_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see the header is "Grant" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, UEI Number is required in the Overview tab under the General Information section. |
    And I navigate to "Overview" sub tab
    When I enter value "<UEI>" into field "DUNS__c"
    When I click on "Cancel" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to cancel?" is displayed
    When I click modal button "OK"
    Then I can see top right button "Edit" in page detail
    Then I softly see field "UEI Number" as ""
    And I click on "Edit" in the page details
    And I navigate to "Overview" sub tab
    When I enter value "<UEI>" into field "DUNS__c"
    And I click on "Save" in the page details
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" inside page block
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see field "Internal Organization" inside page block
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see field "Created by" inside page block
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    And I save the field labeled "Last Modified by" as "LastModifiedby"
    Then I softly see field "Last Modified by" inside page block
    Then I softly see link "{SavedValue:LastModifiedby}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:Createdby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Awards" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    And I click on "Download as PDF" in the page details
    And I wait for "8" seconds
    And I download the file
    Then I softly see "{SavedValue:GrantEGMSID}" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "Take Snapshot" in the page details
    And I wait for "8" seconds
    And I refresh the page
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "{SavedValue:GrantEGMSID}" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "Close" button for view files page
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Budgeted Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Non-Cash Match" inside page block
    Then I softly cannot see field "Budgeted Leverage" inside page block
    Then I softly cannot see field "Total Anticipated Program Income" inside page block
    Then I softly cannot see field "Total Program Income Expenditure" inside page block
    And I navigate to "Awards" sub tab
    Then I can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I can see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I cannot see row level action button "Delete" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly do not see "Other Leverage" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---grantee_tableId:-:awardLineItemsTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "{SavedValue:GrantEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsTable---"
    Then I can see row level action button "View" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I can see row level action button "Edit" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I cannot see row level action button "Delete" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"

    Examples:
      | userType    | UEI          |
      | GRANTEE EXE | 123456789123 |

  @443790 @ValidateGrantWithPMProfileAfterclickonGrantphaseredirecttoGrantListviewpage @GRegression1
  Scenario: Validate Grant With PM Profile After click on Grant phase redirect to Grant List view page
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see toggle option "Grants - All" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Draft" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Active" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Rejected" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - Closed" inside flex table id "---grantee_tableId:-:GrantsTable---"
    Then I softly see toggle option "Grants - My Records" inside flex table id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - All"
    When I click on parallel lines menu bar with data target value "Grants - All"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Grants - All"
    And I wait for "7" seconds
    And I download the file
    Then I softly see "Grants - All" on page "1" of "govgrants" pdf file
    And I close the tab
    When I click on parallel lines menu bar with data target value "Grants - All"
    And I select "Refresh" from parallel lines dropdown of "Grants - All"
    Then I see table is refreshing
    And I click toggle button to select "Grants - Draft"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Active" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Rejected"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Terminated" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:GrantsTable---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I click toggle button to select "Grants - My Records"
    When I perform quick search for "Closed" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly do not see value "Closed/Completed" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Active" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Terminated" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:GrantsTable---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:GrantsTable---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:GrantsTable---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly see "Create Grant" opens in overLay window
    When I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Grant Title is required.               |
      | To Save, Grant Abbreviation is required.        |
      | To Save, Grant Number is required.              |
      | To Save, Project Period Start Date is required. |
      | To Save, Project Period End Date is required.   |
      | To Save, Budget Type is required.               |
      | To Save, Total Anticipated Amount is required.  |
      | To Save, Grant Type is required.                |
      | To Save, Funding Organization is required.      |
      | To Save, Allow Indirect Costs? is required.     |
      | To Save, Match is Required? is required.        |
    And I enter "Grantee_Grant_Setting_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    Then I see the header is "Grant" in the page details


  @443802 @ValidateGrantwithnonownerabletoseeonlyviewaction @snapExecution1 @P3_Grantee @PM_Grantee @GRegression1
  Scenario: Validate Grant with non owner able to see only view action
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I enter "Grantee_Grant_Setting_No" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I enter value "123456789123" into field "DUNS__c"
    And I click on "Save" in the page details
    And I navigate to "Files" sub tab
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "New" :
      | Title                 | Description      |
      | Notes Record EXE User | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record EXE User" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record EXE User" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record EXE User" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    Then I softly can see row level action button "View" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:GrantEGMSID}" in flex table with id "---grantee_tableId:-:GrantsTable---"
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    And I click on "Download as PDF" in the page details
    And I wait for "7" seconds
    And I download the file
    Then I softly see "Draft" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    When I navigate to "History" sub tab
    And I click on hyperlink containing value "SnapShot on"
    And I click on "Download" button for snapshot view
    And I wait for "3" seconds
    And I download the file
    And I wait for "3" seconds
    Then I softly see "Draft" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on "Close" button for view files page
    And I navigate to "Awards" sub tab
    Then I softly cannot see row level action button "Edit" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly can see row level action button "View" against "Created" in flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:grantAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "New" :
      | Title                | Description      |
      | Notes Record PM User | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record PM User" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record PM User" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record PM User" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly see value "Notes Record EXE User" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record EXE User" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record EXE User" in flex table with id "---grantee_tableId:-:grantNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:grantNotesTableId---" by clicking "Edit" :
      | Created By | Title                           | Description      |
      | Sarah PM   | Notes Record PM Automation User | Automation Notes |
    Then I softly see value "Notes Record PM Automation User" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    When I click on "Delete" icon for "Notes Record PM Automation User" inside flex table with id "---grantee_tableId:-:grantNotesTableId---"
    Then I softly do not see value "Notes Record PM User" for title "Title" inside table "---grantee_tableId:-:grantNotesTableId---"
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "sarah.pm.ggmergeqa2@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"

  @443816 @ValidateAwardWithPMProfileAfterclickonAwardphaseListviewpage @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate Award With PM Profile After click on Award phase List view page
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    Then I softly see toggle option "Awards - All" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Draft" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Active" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Rejected" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - Closed" inside flex table id "---grantee_tableId:-:awardTableId---"
    Then I softly see toggle option "Awards - My Records" inside flex table id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    When I perform quick search for "created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Amended" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Pending Closeout" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I wait for "1" seconds
    And I click on page navigation arrow "---grantee_tableId:-:awardTableId---" for table id "Next"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I wait for "1" seconds
    Then I softly see top right button "Advance Filter" inside flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - All"
    When I click on parallel lines menu bar with data target value "Awards - All"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
#    Commented below steps duw to bug-472991 it's known issue FW team working on it
#    And I select "Download as PDF" from parallel lines dropdown of "Awards - All"
#    And I wait for "7" seconds
#    And I download the file
#    Then I softly see "Awards - All" on page "1" of "govgrants" pdf file
#    And I close the tab
#    When I click on parallel lines menu bar with data target value "Awards - All"
#    And I select "Refresh" from parallel lines dropdown of "Awards - All"
#    Then I see table is refreshing
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Draft"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Active"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Activated" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Rejected"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - Closed"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Closed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Activated" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Closed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Amended" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Pending Closeout" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:awardTableId---" panel
    And I wait for "2" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:awardTableId---"
    When I perform quick search for "{SavedValue:EGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:awardTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardTableId---"
    Then I softly see "Award Title" in flex table header "---grantee_tableId:-:awardTableId---"
    Then I softly see "Grant Award Number" in flex table header "---grantee_tableId:-:awardTableId---"
    Then I softly see "Version Number" in flex table header "---grantee_tableId:-:awardTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:awardTableId---"
    Then I softly see "Award Amount To Date" in flex table header "---grantee_tableId:-:awardTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:awardTableId---"

  @443832 @AwardVerifywithPMprofileMonitioringTabofAwardPagelayout @Gregression2 @PM_Grantee @P2_Grantee
  Scenario: Award with PM profile Monitioring Tab of Award Page layout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I navigate to "Monitoring" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see "Special Conditions" page block displayed
    And I navigate to "Monitoring" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on "Remove" icon for "Automation Permanent Objective" inside flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on "Remove" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on parallel lines menu bar with data target value "Special Conditions"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Download as PDF" from parallel lines dropdown of "Special Conditions"
    And I download the file
    And I wait for "4" seconds
    Then I see "Special Conditions" on page "1" of "govgrants" pdf file

  @443856 @ValidateAwardsplconWithEXEAwardlistviewpageInawardspecialconditionmodulewhichisvisibleinmonitoringphase @GRegression1 @GranteeTBE
  Scenario: Validate Award spl con With EXE Award list view page In award special condition module which is visible in monitoring phase with special conditions
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Awards Special Conditions" content inside "Monitoring" subheader on left panel
    Then I softly see "Awards" page block displayed
    When I click on parallel lines menu bar with data target value "Awards"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Awards"
    Then I see table is refreshing
#    When I click on parallel lines menu bar with data target value "Awards"
#    And I select "Download as PDF" from parallel lines dropdown of "Awards"
#    And I download the file
#    And I wait for "4" seconds
#    Then I see "Awards" on page "1" of "govgrants" pdf file
#    And I switch to parent tab
    And I click on page navigation arrow "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    Then I see table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" shows "Page 1"
    And I save the total records from the flex table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    And I select value inside table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" is "5"
    Then I see "5" records inside flex table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for LWC
      | EGMS ID | contains | {SavedValue:AwardEGMSID} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:specialConditionPhaseLevelTableId---" panel
    And I expand nested table containing column value "{SavedValue:AwardEGMSID}"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:specialConditionsChildTableId---"

  @443856_1 @ValidateAwardsplconWithEXEAwardlistviewpageInawardspecialconditionmodulewhichisvisibleinmonitoringphase @GRegression1 @GranteeTBE
  Scenario: Validate Award spl con With EXE Award list view page In award special condition module which is visible in monitoring phase without special conditions
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Victor EXE user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    When I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Monitoring" sub tab
    And I click on "Delete" icon for "Terms" inside flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see field "Status" as "Activated"
    And I navigate to "Monitoring" tab
    When I navigate to "Awards Special Conditions" content inside "Monitoring" subheader on left panel
    Then I softly see "Awards" page block displayed
    When I click on parallel lines menu bar with data target value "Awards"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Awards"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Awards"
    And I select "Download as PDF" from parallel lines dropdown of "Awards"
    And I download the file
    And I wait for "4" seconds
    Then I see "Awards" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I click on page navigation arrow "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    Then I see table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" shows "Page 1"
    And I save the total records from the flex table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    And I select value inside table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" is "5"
    Then I see "5" records inside flex table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for LWC
      | EGMS ID | contains | {SavedValue:AwardEGMSID} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:specialConditionPhaseLevelTableId---" panel
    And I expand nested table containing column value "{SavedValue:AwardEGMSID}"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:specialConditionsChildTableId---"

  @443824 @ValidateAwardWithPMProfileProgramincomeRevenuebyFocusareaandDrawdownByGrantAwardTasksectionInActualTabofAwardPagelayout @PM_Grantee @P2_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Validate Award With PM Profile Program income Revenue by Focus area  and Drawdown By Grant Award Task section In Actual Tab of Award Page layout
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-<userName>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Projections" sub tab
    And I save the value from row "1" for column name "Projected Program Income ($)" as "ProjectedProgramIncome" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I save the value from row "1" for column name "Program Income Justification" as "ProgramIncomeJustification" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    And I save the value from row "1" for column name "Revised Program Income Earned" as "RevisedProgramIncomeEarned" from flex table "---grantee_tableId:-:actualsTabProgramIncomeTableId---"
    Then I softly see value "{SavedValue:ProjectedProgramIncome}" is "Equals to" the value "{SavedValue:RevisedProgramIncomeEarned}"
    Then I softly see value "{SavedValue:ProgramIncomeJustification}" for title "Program Income Details" inside table "---grantee_tableId:-:actualsTabProgramIncomeTableId---"
    Then I softly can see row level action button "Show Financial Transactions" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    And I click on "Show Financial Transactions" icon for "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see "Drawdown By  Award" opens in overLay window
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    When I "Collapse" page block contaninig value "Financial Transactions"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    When I "Expanded" page block contaninig value "Financial Transactions"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    When I click on parallel lines menu bar with data target value "Financial Transactions"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Financial Transactions"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Financial Transactions"
    And I select "Download as PDF" from parallel lines dropdown of "Financial Transactions"
    And I download the file
    And I wait for "4" seconds
    Then I see "Financial Transactions" on page "1" of "govgrants" pdf file
    Examples:
      | userType   | userName      |
      | GRANTEE PM | Sarah PM user |

  @443824 @ValidateAwardWithPMProfileProgramincomeRevenuebyFocusareaandDrawdownByGrantAwardTasksectionInActualTabofAwardPagelayout @PM_Grantee @P2_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Validate Award With PM Profile Program income Revenue by Focus area  and Drawdown By Grant Award Task section In Actual Tab of Award Page layout
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-<userName>"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Projections" sub tab
    And I save the value from row "1" for column name "Projected Program Income ($)" as "ProjectedProgramIncome" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    And I save the value from row "1" for column name "Program Income Justification" as "ProgramIncomeJustification" from flex table "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    And I save the value from row "1" for column name "Revised Program Income Earned" as "RevisedProgramIncomeEarned" from flex table "---grantee_tableId:-:actualsTabProgramIncomeTableId---"
    Then I softly see value "{SavedValue:ProjectedProgramIncome}" is "Equals to" the value "{SavedValue:RevisedProgramIncomeEarned}"
    Then I softly see value "{SavedValue:ProgramIncomeJustification}" for title "Program Income Details" inside table "---grantee_tableId:-:actualsTabProgramIncomeTableId---"
    Then I softly can see row level action button "Show Financial Transactions" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    And I click on "Show Financial Transactions" icon for "Automation Permanent Focus Area" inside flex table with id "---grantee_tableId:-:actualsTabDrawDownTableId---"
    Then I softly see "Drawdown By  Award" opens in overLay window
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    When I "Collapse" page block contaninig value "Financial Transactions"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    When I "Expanded" page block contaninig value "Financial Transactions"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:DrawdownByAwardModalTableId---"
    When I click on parallel lines menu bar with data target value "Financial Transactions"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Financial Transactions"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Financial Transactions"
    And I select "Download as PDF" from parallel lines dropdown of "Financial Transactions"
    And I download the file
    And I wait for "4" seconds
    Then I see "Financial Transactions" on page "1" of "govgrants" pdf file
    Examples:
      | userType   | userName      |
      | GRANTEE PM | Sarah PM user |

  @443823 @ValidateAwardWithPMProfileFinancialsummaryandExpenditureDetailssectionInActualTabofAwardPagelayout @PM_Grantee @P3_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Validate Award With PM Profile Financial summary and Expenditure Details section In Actual Tab of Award Page layout
    And I "Created" standalone subaward "Automation Runtime Award" with properties "default-<userName>"
    When I login to "Grantee" app as "<userType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I click on "Edit" in the page details
    And I enter value "Cash and Non-Cash Match" into field "CostSharing__c"
    And I click on "Save" in the page details
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Award}"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Activated"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Award Amount This Action" as "AwardAmountThisAction"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    And I save the field labeled "Total Awarded Budget" as "TotalAwardedBudget"
    Then I softly see field "Total Awarded Budget" inside page block
    Then I softly see field "Spent to Date" inside page block
    Then I softly see field "Remaining Balance" inside page block
    Then I softly see field "Total Match Expenditures to Date this Budget Period" inside page block
    Then I softly see value "{SavedValue:AwardAmountThisAction}" is "Equals to" the value "{SavedValue:TotalAwardedBudget}"
    Then I softly can see row level action button "Show Financial Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly can see row level action button "Report Non-Cash Match Line Item" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on "Show Financial Transactions" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Financial Transactions" opens in overLay window
    Then I softly see "Expenditure Details" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I "Collapse" page block contaninig value "Expenditure Details"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I "Expanded" page block contaninig value "Expenditure Details"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I click on parallel lines menu bar with data target value "Expenditure Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Expenditure Details"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Expenditure Details"
    And I select "Download as PDF" from parallel lines dropdown of "Expenditure Details"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Expenditure Details" on page "1" of "govgrants" pdf file
    And I close the tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I "Collapse" page block contaninig value "Cash Match Details"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I "Expanded" page block contaninig value "Cash Match Details"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Cash Match Details"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I select "Download as PDF" from parallel lines dropdown of "Cash Match Details"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Cash Match Details" on page "1" of "govgrants" pdf file
    And I close the tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I "Collapse" page block contaninig value "Program Income Expenses"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I "Expanded" page block contaninig value "Program Income Expenses"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Program Income Expenses"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Program Income Expenses"
    And I select "Download as PDF" from parallel lines dropdown of "Program Income Expenses"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Program Income Expenses" on page "1" of "govgrants" pdf file
    And I close the tab
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Report Non-Cash Match Line Item" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Add Non-Cash Match" opens in overLay window
    Then I softly see "Report Non Cash Match" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I "Collapse" page block contaninig value "Report Non Cash Match"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I "Expanded" page block contaninig value "Report Non Cash Match"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I click on parallel lines menu bar with data target value "Report Non Cash Match"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Report Non Cash Match"
    Then I see table is refreshing
    When I click on parallel lines menu bar with data target value "Report Non Cash Match"
    And I select "Download as PDF" from parallel lines dropdown of "Report Non Cash Match"
    And I download the file
    And I wait for "6" seconds
    Then I softly see "Report Non Cash Match" on page "1" of "govgrants" pdf file
    Examples:
      | userType   | userName      |
      | GRANTEE PM | Sarah PM user |

  @485099 @ValidatePOAwardlistviewpageInawardspecialconditionmodulewhichisvisibleinmonitoringphase @GRegression5 @PO_Grantee @P3_Grantee
  Scenario: Validate PO Award list view page In award special condition module which is visible in monitoring phase
    And I "Created" standalone subaward "Automation Runtime award" with properties "default-Grantee PO user"
    And I updated direct grant award for title "{SavedValue:Automation Runtime award}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime award}"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "Monitoring" tab
    When I navigate to "Awards Special Conditions" content inside "Monitoring" subheader on left panel
    Then I softly see "Awards" page block displayed
    When I click on parallel lines menu bar with data target value "Awards"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Awards"
    Then I see table is refreshing
    And I click on page navigation arrow "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for table id "Next"
    Then I see table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" shows "Page 2"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    Then I see table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" shows "Page 1"
    And I save the total records from the flex table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    And I select value inside table "---grantee_tableId:-:specialConditionPhaseLevelTableId---" is "5"
    Then I see "5" records inside flex table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    And I click on advance filter of table id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for LWC
    And I enter advance filter values inside id "---grantee_tableId:-:specialConditionPhaseLevelTableId---" for LWC
      | EGMS ID | contains | {SavedValue:AwardEGMSID} |
    And I pause execution for "5" seconds
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:specialConditionPhaseLevelTableId---"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:specialConditionPhaseLevelTableId---" panel
    And I expand nested table containing column value "{SavedValue:AwardEGMSID}"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:specialConditionsChildTableId---"