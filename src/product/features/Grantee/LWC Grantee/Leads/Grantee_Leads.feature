@GranteeLeads @GranteePreAwardRegression
Feature: Validate all scenarios for Leads

  @482115 @482331 @ValidateFOusershouldhaveviewaccessonlyonthequalifiedlead @FO_Grantee @P3_Grantee @GRegression2
  Scenario Outline: Validate FO user should have view access only on the qualified lead
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    #482331
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    Then I cannot see top right button "Qualify Lead" in page detail
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedEGMSID"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "<Toggles>"
    When I perform quick search for "{SavedValue:QualifiedEGMSID}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:QualifiedEGMSID}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    Then I cannot see top right button "Convert to Opportunity" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Qualification Details" page block displayed
    Then I softly see "All Qualifications" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Qualifying Organization" inside page block
    Then I softly see field "Relevance" inside page block
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I <Validation> top right button "New" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | User       | Validation     | Toggles               |
      | GRANTEE FO | softly can see | Qualified Leads - All |

  @482116 @482332 @ValidateFOusershouldhaveviewaccessonlyonthequalifiedlead @FD_Grantee @P3_Grantee @GRegression2
  Scenario Outline: Validate FD user should have view access only on the qualified lead
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    #482332
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    Then I cannot see top right button "Qualify Lead" in page detail
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedEGMSID"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "<Toggles>"
    When I perform quick search for "{SavedValue:QualifiedEGMSID}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:QualifiedEGMSID}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    Then I cannot see top right button "Convert to Opportunity" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Qualification Details" page block displayed
    Then I softly see "All Qualifications" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Qualifying Organization" inside page block
    Then I softly see field "Relevance" inside page block
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I <Validation> top right button "New" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | User       | Validation     | Toggles               |
      | GRANTEE FD | softly can see | Qualified Leads - All |

  @482117 @482334 @ValidateFOusershouldhaveviewaccessonlyonthequalifiedlead @ADMIN_Grantee @P3_Grantee @GRegression2
  Scenario Outline: Validate ADMIN user should have view access only on the qualified lead
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
#    482334
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    Then I cannot see top right button "Qualify Lead" in page detail
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedEGMSID"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "<Toggles>"
    When I perform quick search for "{SavedValue:QualifiedEGMSID}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:QualifiedEGMSID}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    Then I cannot see top right button "Convert to Opportunity" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Qualification Details" page block displayed
    Then I softly see "All Qualifications" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Qualifying Organization" inside page block
    Then I softly see field "Relevance" inside page block
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I <Validation> top right button "New" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | User           | Validation     | Toggles                |
      | GRANTEE ADMIN1 | softly can see | Qualified Leads - Open |

  @482118 @ValidateFOusershouldhaveviewaccessonlyonthequalifiedlead @Auditor_Grantee @P4_Grantee @GRegression2
  Scenario Outline: Validate AUDITOR user should have view access only on the qualified lead
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    Then I cannot see top right button "Qualify Lead" in page detail
    And I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedEGMSID"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "<Toggles>"
    When I perform quick search for "{SavedValue:QualifiedEGMSID}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:QualifiedEGMSID}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    Then I cannot see top right button "Convert to Opportunity" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Qualification Details" page block displayed
    Then I softly see "All Qualifications" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Qualifying Organization" inside page block
    Then I softly see field "Relevance" inside page block
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I <Validation> top right button "New" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed

    Examples:
      | User            | Validation        | Toggles               |
      | GRANTEE AUDITOR | softly cannot see | Qualified Leads - All |

  @462721 @ValidatetheflowofasPMuserisabletocreateandqualifythemanuallead @P1_Grantee @PM_Grantee @GRegression1
  Scenario Outline: Validate the flow of as PM/PO user is able to create and qualify the manual lead
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:QualifiedLeadEGMSID}"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I can see top right button "Convert to Opportunity" in page detail
    When I click on "Convert to Opportunity" in the page details
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "EGMS ID" as "OpportunityEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:OpportunityEGMSID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see "Additional Information" page block displayed
    Then I softly see "Financial Details" page block displayed
    Then I softly see "System Information" page block displayed
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see "Financial Overview" page block displayed
    Then I softly see "Certifications and Other" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    Examples:
      | User       |
      | GRANTEE PM |

  @482114 @ValidatetheflowofasPMuserisabletocreateandqualifythemanuallead @P1_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Validate the flow of as EXE user is able to create and qualify the manual lead
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:QualifiedLeadEGMSID}"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I can see top right button "Convert to Opportunity" in page detail
    When I click on "Convert to Opportunity" in the page details
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "EGMS ID" as "OpportunityEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:OpportunityEGMSID}"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit for Approval" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see "Additional Information" page block displayed
    Then I softly see "Financial Details" page block displayed
    Then I softly see "System Information" page block displayed
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see "Financial Overview" page block displayed
    Then I softly see "Certifications and Other" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    Examples:
      | User        |
      | GRANTEE EXE |

  @482166 @ValidateQualifyLeadPMusercanqualifytheleadwhichisingestedfromgrantsgov @PO_Grantee @P1_Grantee @GRegression1
  Scenario Outline: Validate Qualify Lead PM user can qualify the lead which is ingested from grants gov
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPM1User}"
    Given I login to "Grantee" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_CAS-HHS0001212745" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I Update for setting as grantsgov lead with opportunity number "{grantee_testData:GrantsgovOpportunityNumberPM1User}"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Archive Date" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see field with quotes "Describe "Other" Opportunity Category" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Grants.Gov URL" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    When I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    When I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I softly see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:leadsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:leadsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:leadsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:leadsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:leadsNotesTableId---"
    And I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "8" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:QualifiedLeadEGMSID}"
    Examples:
      | userType   |
      | GRANTEE PO |

  @483167 @ValidatePMusertheflowofNotyetqualifiedlead @P2_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Validate EXE user the flow of Not yet qualified lead
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    Examples:
      | User        |
      | GRANTEE EXE |

  @483181 @ValidatePMusertheflowofNotyetqualifiedlead @P2_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate PO user the flow of Not yet qualified lead
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/dd/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "2" seconds
    Then I see snapshot with name containing "SnapShot on" as name
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    Examples:
      | User       |
      | GRANTEE PO |

  @488705 @VerifyAsFOusershouldnotseenewbuttonfornotyetqualifyleadandeditaccessonnotyetqualifyleads @P3_Grantee @FD_Grantee @GRegression4
  Scenario Outline: Verify As FD user should not see new button for not yet qualify lead and edit access on not yet qualify leads
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    Then I cannot see top right button "Qualify Lead" in page detail
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:RelatedPrograms---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:AllQualificationsTable---"
    And I navigate to "Files" sub tab
    Then I softly <filter> top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Examples:
      | UserType   | filter |
      | GRANTEE FD | see    |

  @488706 @VerifyAsFOusershouldnotseenewbuttonfornotyetqualifyleadandeditaccessonnotyetqualifyleads @P4_Grantee @Auditor_Grantee @GRegression1
  Scenario Outline: Verify As AUDITOR user should not see new button for not yet qualify lead and edit access on not yet qualify leads
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    Then I cannot see top right button "Qualify Lead" in page detail
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:RelatedPrograms---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:AllQualificationsTable---"
    And I navigate to "Files" sub tab
    Then I softly <filter> top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Examples:
      | UserType        | filter     |
      | GRANTEE AUDITOR | do not see |

  @488708 @VerifyAsFOusershouldnotseenewbuttonfornotyetqualifyleadandeditaccessonnotyetqualifyleads @P3_Grantee @ADMIN_Grantee @GRegression4
  Scenario Outline: Verify As ADMIN user should not see new button for not yet qualify lead and edit access on not yet qualify leads
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    Then I cannot see top right button "Qualify Lead" in page detail
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:RelatedPrograms---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:AllQualificationsTable---"
    And I navigate to "Files" sub tab
    Then I softly <filter> top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Examples:
      | UserType       | filter |
      | GRANTEE ADMIN1 | see    |

  @462677 @ValidateEXEuserseevalidationmessageisdisplayforrequiredtosavefields @GRegression5 @P3_Grantee @EXE_Grantee
  Scenario: Validate EXE user see validation message is display for required to save fields
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Opportunity Title is required in the General Information section.                  |
      | To Save, Opportunity Number is required in the General Information section.                 |
      | To Save, Application Due Date is required in the General Information section.               |
      | To Save, Funding Organization is required in the General Information section.               |
      | To Save, Eligible Applicants is required in the Eligibility section.                        |
      | To Save, Lead Description is required in the Additional Information section.                |
      | To Save, Cost Sharing or Matching Requirement is required in the Financial Details section. |

  @463541 @ValidateOpportunitiesNotconvertedafterdeletingopportunityOrganizationswhohavequalifiedtheleadcanconverttheleadtoopportunityagain @GRegression5 @P2_Grantee @PM_Grantee
  Scenario: Validate Opportunities Not converted after deleting opportunity Organizations who have qualified the lead can convert the lead to opportunity again
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime award" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I wait for "3" seconds
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    And I click on "Delete" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "3" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    Then I softly see field "Status" as "Draft"

  @494991 @Validatethemanualleadverifythefunctionality
  Scenario Outline: Validate the manual lead & verify the functionality
    Given I login to "Grantee" app as "<Owner>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Leads Not Yet Qualified - All" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see toggle option "Leads Not Yet Qualified - Closed" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see toggle option "Leads Not Yet Qualified - Open" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see toggle option "Leads Not Yet Qualified - My Records" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    Then I softly see "General Information" page block displayed on modal
    Then I softly see field on modal "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field on modal "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside modal "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field on modal "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field on modal "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see "Eligibility" page block displayed on modal
    Then I softly see field on modal "Eligible Applicants" inside page block
    Then I softly see asterisk mark on "Eligible Applicants"
    Then I softly see "Additional Information" page block displayed on modal
    Then I softly see field on modal "Lead Description" inside page block
    Then I softly see asterisk mark on "Lead Description"
    Then I softly see "Financial Details" page block displayed on modal
    Then I softly see field on modal "Cost Sharing or Matching Requirement" inside page block
    Then I softly see asterisk mark on "Cost Sharing or Matching Requirement"
    And I click modal button "Save and Continue"
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Leads}" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly see field "Opportunity Title" as "{SavedValue:Automation Runtime Leads}"
    Then I softly see field "Opportunity Number" as "{SavedValue:Automation Runtime Opp No}"
    Then I softly see field "Application Due Date" as "{Date:M/d/yyyy::d+100}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see value "Individuals" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see value "For profit organizations other than small businesses" for the field "Eligible Applicants" inside multipicklist view list
    Then I softly see field "Lead Description" as "Automation Test"
    And I navigate to "Financials" sub tab
    Then I softly see field "Cost Sharing or Matching Requirement" as "Yes"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "General Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see asterisk mark on "Funding Organization"
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see asterisk mark on "Opportunity Number"
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see asterisk mark on "Opportunity Title"
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see asterisk mark on "Opportunity Category"
    Then I softly see field "Application Due Date" inside page block
    Then I softly see asterisk mark on "Application Due Date"
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see asterisk mark on "Funding Instrument Type"
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see field "Archive Date" inside page block
    Then I softly see asterisk mark on "Archive Date"
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Version" inside page block
    Then I softly see "Related Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Eligibility Information" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Lead Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see "Qualified Agencies" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Activate" in page detail
    Then I can see top right button "Edit" in page detail
    And I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Lead Files" flex table
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I navigate to "History" sub tab
    And I click on "Take Snapshot" in the page details
    And I wait for "5" seconds
    And I refresh the page
    And I re-login to "Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:LeadsEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:LeadsEGMSID}" in global search with id "FOA Leads"
    Then I softly see field "State" as "Forecasted"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Leads Not Yet Qualified - All" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see toggle option "Leads Not Yet Qualified - Closed" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see toggle option "Leads Not Yet Qualified - Open" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see toggle option "Leads Not Yet Qualified - My Records" inside flex table id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click toggle button to select "Leads Not Yet Qualified - My Records"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:LeadsEGMSID}" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    Then I cannot see top right button "Qualify Lead" in page detail
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Activate" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:RelatedPrograms---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:AllQualificationsTable---"
    And I navigate to "Files" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I re-login to "Grantee" app as "<Owner>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - My Records"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    And I re-login to "Grantee" app as "<NonOwner>" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:LeadsEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:LeadsEGMSID}" in global search with id "FOA Leads"
    Then I softly see field "Status" as "Posted"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I click toggle button to select "Leads Not Yet Qualified - My Records"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:LeadsEGMSID}" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    Then I cannot see top right button "Qualify Lead" in page detail
    Then I cannot see top right button "Edit" in page detail
    Then I softly see field "State" as "Posted"
    And I re-login to "Grantee" app as "<Owner>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - My Records"
    And I wait for "2" seconds
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    And I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---" without waiting for record
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "State" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:QualifiedLeadEGMSID}"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Validate" in page detail
    Then I can see top right button "Convert to Opportunity" in page detail
    Examples:
      | Owner       | NonOwner      |
      | GRANTEE PM  | GRANTEE FO    |
      | GRANTEE PO  | GRANTEE FD    |
      | GRANTEE EXE | GRANTEE ADMIN |

  @546636 @validatedefaultsharingofqualifiedleadwithallinternalusersPM/PO/FO/FD/EXE/Admin/Auditors @GranteeFlexP1
  Scenario Outline: Validate default sharing of qualified lead with all internal users PM/PO/FO/FD/EXE/Admin/Auditor
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedEGMSID"
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    And I wait for "3" seconds
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    Then I can see top right button "Convert to Opportunity" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Qualification Details" page block displayed
    Then I softly see "All Qualifications" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Qualifying Organization" inside page block
    Then I softly see field "Relevance" inside page block
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "<Toggles>"
    When I perform quick search for "{SavedValue:QualifiedEGMSID}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:QualifiedEGMSID}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    Then I <Validation> top right button "Convert to Opportunity" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Financials" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Lead Information" page block displayed
    Then I softly see "Qualification Details" page block displayed
    Then I softly see "All Qualifications" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Funding Organization" inside page block
    Then I softly see field "Opportunity Number" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Qualifying Organization" inside page block
    Then I softly see field "Relevance" inside page block
    Then I softly see field "Impact" inside page block
    Then I softly see field "Justification" inside page block
    When I navigate to "Financials" sub tab
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    Then I softly see field "Award Ceiling" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    And I navigate to "Files" sub tab
    Then I softly see "Qualified Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I <Validation Notes> top right button "New" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:qualifiedLeadsAddFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:qualifiedLeadsNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    Examples:
      | User            | Validation Notes    | Validation     | Toggles               |
      | GRANTEE AUDITOR | softly cannot see   |  cannot see    | Qualified Leads - All |
      | GRANTEE PO      | softly can see      |  can see       | Qualified Leads - All |
      | GRANTEE EXE     | softly can see      |  can see       | Qualified Leads - All |
      | GRANTEE FO      | softly can see      |  cannot see    | Qualified Leads - All |
      | GRANTEE FD      | softly can see      |  cannot see    | Qualified Leads - All |
      | GRANTEE ADMIN   | softly can see      |  cannot see    | Qualified Leads - All |

  @546659 @546650 @546646 @validateonlyPM/PO/EXEusercanseequalifybuttononlead @GranteeFlexP1
  Scenario Outline: Validate only PM/PO/EXE user can see qualify button on lead
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    And I enter "Grantee_Leads_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I re-login to "Grantee" app as "<NonUser>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    When I click on "View" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see field "State" as "Posted"
    Then I cannot see top right button "Qualify Lead" in page detail
    And I navigate to "Overview" sub tab
    Then I softly see "Related Programs" page block displayed
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:RelatedPrograms---"
    And I navigate to "Files" sub tab
    Then I softly see "Lead Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I cannot see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I cannot see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:leadsAddFileTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:LeadsAttachmentTableId---"
    Then I cannot see top right button "Activate" in page detail

    Examples:
      | User        | NonUser         |
      | GRANTEE PM  | GRANTEE FO      |
      | GRANTEE PO  | GRANTEE FD      |
      | GRANTEE EXE | GRANTEE AUDITOR |

  @546652 @validateonceNotyetqualifiedleadisdeleteitshouldberemovedfromallinteruserslayout @GranteeFlexP1
  Scenario Outline: Validate once Not yet qualified lead is delete it should be removed from all inter users layout
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:LeadsNotYetQualified---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Then I softly see "Create New Lead" opens in overLay window
    And I enter "Grantee_Leads_Creation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the header is "Lead" in the page details
    Then I softly see field "State" as "Forecasted"
    And I save the field labeled "EGMS ID" as "LeadsEGMSID"
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    And I click on "Delete" icon for "{SavedValue:LeadsEGMSID}" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Leads Not Yet Qualified - All"
    When I perform quick search for "{SavedValue:LeadsEGMSID}" in "---grantee_tableId:-:LeadsNotYetQualified---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:LeadsNotYetQualified---"
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |