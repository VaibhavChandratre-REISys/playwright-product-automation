@GranteePreApplicationsGrantsGov @GranteeGrantsgovOpportunityrerun
Feature: Validate all scenarios for Pre-Applications Grants Gov

  @476909 @ValidatePreAppwithAdminprofilePreapplicationpagelayoutofgrantsgovleadwithYessetting @ADMIN_Grantee @P2_Grantee @GRegression1
  Scenario: Validate PreApp with Admin profile Pre application page layout of grants.gov lead with Yes setting
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I re-login to "Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on "Collapse" button on header
    Then I softly see "Expand" button for header
    And I click on "Expand" button on header
    Then I softly see "Collapse" button for header
    And I click on "Collapse" button for page
    Then I softly see "Expand" button for page
    And I click on "Expand" button for page
    Then I softly see "Collapse" button for page
    Then I softly see "Resize" button for page
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Pre-Applications" inside "Applications" is displayed
    Then I see "Applications" inside "Applications" is displayed
    And I click on bottom button "Navigator" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Level" as "Detailed Line Item Budget"
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Cost Sharing or Match Requirement?" as "Cash and Non-Cash Match"
    And I expand nested table containing column value "BP01"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    Then I softly cannot see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---"
    And I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationNoteTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:preApplicationNoteTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"

  @463421 @463422 @463423 @463424 @PreAppVerifywithPOProfileOverviewTab @GRegression1 @GranteeTBE
  Scenario: PreApp - Verify with PO Profile ,Overview Tab.
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "Pre-Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly see "System Information" page block displayed
    And I click on "Edit" in the page details
    Then I softly see fields "DUNS__c" is in edit mode
    Then I softly see fields "ProjectDirectorContact__c" is in edit mode
    Then I softly see that "Total Budget Request" rendered in view mode only
    Then I softly see that "Internal Organization" rendered in view mode only
    Then I softly see that "Opportunity Title" rendered in view mode only
    Then I softly see that "Opportunity Number" rendered in view mode only
    Then I softly see that "Opportunity Category" rendered in view mode only
    Then I softly see that "Award Floor" rendered in view mode only
    Then I softly see that "Pre-Application Due Date" rendered in view mode only
    Then I softly see that "Award Ceiling" rendered in view mode only
    Then I softly see that "Application Due Date" rendered in view mode only
    And I navigate to "Budget" sub tab
    And I enter value "Additive" into field "ProgramIncomeType__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    When I click "Associate" after selection of "Wildlife Services" in the table "---grantee_tableId:-:preAppAssociateProgramTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly can see row level action button "View" against "Wildlife Services" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see row level action button "Edit" against "Wildlife Services" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see row level action button "Remove" against "Wildlife Services" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    And I click on "Remove" icon for "Wildlife Services" inside flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---" without waiting for record
    Then I softly do not see value "Wildlife Services" for title "Title" inside table "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click on parallel lines menu bar with data target value "External Programs"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "External Programs"
    Then I see table is refreshing
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name     | Project Role    | Is Key Contact |
      | Sarah PM | Project Officer | Checked        |
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see row level action button "Remove" against "Sarah PM" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Remove" icon for "Sarah PM" inside flex table with id "---grantee_tableId:-:preApplicationContactTableId---" without waiting for record
    Then I softly do not see value "Sarah PM" for title "Title" inside table "---grantee_tableId:-:preApplicationContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Contacts"
    Then I see table is refreshing
    Then I softly see link "Created By" inside Page block
    Then I softly see field "Created By" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see link "{SavedValue:CreatedBy}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see link "Last Modified By" inside Page block
    Then I softly see field "Last Modified By" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    Then I softly see field "Last Modified Date" inside page block
    #@463422
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see that "Project Period Start Date" rendered in view mode only
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see that "Project Period End Date" rendered in view mode only
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I click on top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I enter values into fields
      | Value | Field              |
      | 2     | BudgetStartDate__c |
      | 100   | BudgetEndDate__c   |
    When I click modal button "Save"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:preAppAssociateBudgetTableId---"
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:preAppAssociateFocusAreaTableId---"
    And I click modal button "Close"
    Then I softly can see row level action button "Delete" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly can see row level action button "Edit" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    When I click on parallel lines menu bar with data target value "Budget Period Details"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Budget Period Details"
    Then I see table is refreshing
    #@463423
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    Then I softly see that "Total Budget Request" rendered in view mode only
    Then I softly see that "Cost Sharing or Match Requirement?" rendered in view mode only
    Then I softly see that "Required Match (%)" rendered in view mode only
    Then I softly see that "Are Indirect Costs Allowed?" rendered in view mode only
    Then I softly see that "Budget Type" rendered in view mode only
    Then I softly see fields "MOEIndicator__c" is in edit mode
    Then I softly see fields "FundingAgencyRestriction__c" is in edit mode
    Then I softly see fields "ProgramIncomeType__c" is in edit mode
    Then I softly see fields "BudgetBuildupNeeded__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Add Line Item Details" against "Construction" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:preAppllicationLineItemsTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:preAppllicationLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Other Leverage |
      | Construction | The narrative | 1000         | 100        | 100            |
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see total records count "Total Records: 24" in flex table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    When I navigate to "Setup" sub tab
    #463424
    Given I expand nested table containing column value "BP01"
    And I click on "Remove" icon for "Automation Permanent Focus Area2" inside flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---" without waiting for record
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see total records count "Total Records: 12" in flex table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Details |
      | Automation Permanent Focus Area | 1000                         | Automation Test        |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    Then I can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    Then I can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    And I click on "Delete" icon for "Rate" inside flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---" without waiting for record
    Then I softly do not see value "Rate" for title "Title" inside table "---grantee_tableId:-:preApplicationIndirectRateTableId---"

  @463426 @PreAppVerifyWithEXESummaryBudgetinBudgetTab @P1_Grantee @EXE_Grantee @GRegression1
  Scenario: PreApp - Verify With EXE , Summary Budget in Budget Tab.
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APP_YES_NGO_BUDGET_TYPE"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "SUMMARY_BUDGET"
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---" without waiting for record
    And I navigate to "Budget" sub tab
    And I click on "Edit" in the page details
    And I enter value "Additive" into field "ProgramIncomeType__c"
    And I click on "Save" in the page details
    Given I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationFocusAreaTableId---" by clicking "Edit" :
      | Focus Area Title                | Budget Request |
      | Automation Permanent Focus Area | 5000           |
    Then I softly see value "$5,000.00" for title "Budget Request" inside table "---grantee_tableId:-:preApplicationFocusAreaTableId---"
    And I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "Pre-Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see that "Project Period Start Date" rendered in view mode only
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see that "Project Period End Date" rendered in view mode only
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    Then I softly see field "Total Budget Request" as "$5,000.00"
    And I save the field labeled "Maintenance of Effort Required?" as "MaintenanceofEffortRequired?"
    Then I softly see field "Maintenance of Effort Required?" as "{SavedValue:MaintenanceofEffortRequired?}"
    And I save the field labeled "Are Indirect Costs Allowed?" as "AreIndirectCostsAllowed?"
    Then I softly see field "Are Indirect Costs Allowed?" as "{SavedValue:AreIndirectCostsAllowed?}"
    And I save the field labeled "Maximum Indirect Cost Rate" as "MaximumIndirectCostRate"
    Then I softly see field "Maximum Indirect Cost Rate" as "{SavedValue:MaximumIndirectCostRate}"
    Then I softly see field "Budget Level" as "Summary Budget"
    Then I softly see field "Budget Type" as "NGO"
    Given I expand nested table containing column value "BP01"
    Then I softly do not see "Award Budget" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly do not see "Cash Match" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly do not see "Other Leverage" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "$5,000.00" for title "Budget Request" inside table "---grantee_tableId:-:preApplicationFocusAreaTableId---"
    When I navigate to "Setup" sub tab
    Given I expand nested table containing column value "BP01"
    Then I cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:setupPreAppChildFocusTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:setupPreAppChildFocusTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:setupPreAppChildFocusTableId---"

  @463448 @PreAppVerifywithPOProfilewhenpreapplicationduedateiscrossedforgrantsgovleadthenunabletoseethecreatepreapplicationbutton @P3_Grantee @PM_Grantee @GRegression1
  Scenario Outline: PreApp - Verify with PO Profile ,when preapplication due date is crossed for grants.gov lead then unable to see the create pre application button.
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{AUTOEnvData:AutomationPermanentLeadPreApplicationExpired}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{AUTOEnvData:AutomationPermanentLeadPreApplicationExpired}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly cannot see top right button "Create Pre-Application" in page detail

    Examples:
      | User       |
      | GRANTEE PM |

  @463449 @PreAppVerifywithPOProfilewhenpreapplicationduedateiscrossedforgrantsgovleadthenunabletoseethecreatepreapplicationbutton @PO_Grantee @P2_Grantee @GRegression2
  Scenario Outline: PreApp - Verify with PO Profile ,when preapplication due date is crossed for grants.gov lead then unable to see the create pre application button.
    When I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{AUTOEnvData:AutomationPermanentLeadPreApplicationExpired}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{AUTOEnvData:AutomationPermanentLeadPreApplicationExpired}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly cannot see top right button "Create Pre-Application" in page detail

    Examples:
      | User       |
      | GRANTEE PO |

  @476674 @VerifywithAuditorprofileGrantsGovleadpreapplicationableseeinViewmodeonly @GRegression1 @GranteeTBE
  Scenario: Verify with Auditor profile , Grants.Gov lead - pre application able see in View mode only.
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---" without waiting for record
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test1 Execution" inside chatter
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see "Pre-Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly see "System Information" page block displayed
    Then I cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see that "Project Period Start Date" rendered in view mode only
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see that "Project Period End Date" rendered in view mode only
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Overview" page block displayed
    Then I softly see "Budget Level Information" page block displayed
    Then I softly see "Budget Details" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    And I save the field labeled "Total Budget Request" as "TotalBudgetRequest"
    Then I softly see field "Total Budget Request" as "{SavedValue:TotalBudgetRequest}"
    And I save the field labeled "Cost Sharing or Match Requirement?" as "CostSharingorMatchRequirement?"
    Then I softly see field "Cost Sharing or Match Requirement?" as "{SavedValue:CostSharingorMatchRequirement?}"
    And  I save the field labeled "Maintenance of Effort Required?" as "MaintenanceofEffortRequired?"
    Then I softly see field "Maintenance of Effort Required?" as "{SavedValue:MaintenanceofEffortRequired?}"
    And I save the field labeled "Are Indirect Costs Allowed?" as "AreIndirectCostsAllowed?"
    Then I softly see field "Are Indirect Costs Allowed?" as "{SavedValue:AreIndirectCostsAllowed?}"
    And I save the field labeled "Maximum Indirect Cost Rate" as "MaximumIndirectCostRate"
    Then I softly see field "Maximum Indirect Cost Rate" as "{SavedValue:MaximumIndirectCostRate}"
    Then I softly see field "Budget Level" as "Detailed Line Item Budget"
    Then I softly see field "Budget Type" as "Construction"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$5,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    Then I softly cannot see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see post "Automation Test1 Execution" by user "Sarah PM"
    When I navigate to "Responsibilities" sub tab
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---"
    And I navigate to "Files" sub tab
    Then  I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then  I cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"

  @463419 @ValidatePreAppwithPOprofilePreapplicationpagelayoutofgrantsgovlead @GRegression3
  Scenario: Validate PreApp with PO profile Pre application page layout of grants gov lead
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPM1User}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001271854" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001271854" with properties "PRE_APPLICATION_YES"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    Then I softly see fields "Title__c" is in edit mode
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Pre-Application Title" as "PreApplicationTitle"
    When I click on "Edit" in the page details
    And I clear the value from field "Title__c"
    And I navigate to "Budget" sub tab
    And I enter value "--None--" into field "ProgramIncomeType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Pre-Application Title is required in the Overview tab under the Pre-Application Overview section. |
      | To Save, Program Income Treatment Type is required in the Budget tab under the Budget Overview section.    |
    And I enter value "Additive" into field "ProgramIncomeType__c"
    And I navigate to "Overview" sub tab
    And I enter value "{SavedValue:PreApplicationTitle}" into field "Title__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required.                       |
      | Overview Tab - Associate at least one Contact with Pre-Application.         |
      | Overview Tab - Provide a value for Project Abstract.                        |
      | Overview Tab - Provide a value for UEI.                                     |
      | Overview Tab - Provide a value for Project Director/Principal Investigator. |
    When I click on "Edit" in the page details
    And I enter "Grantee_Edition_DetailLineItems" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Collapse" button for page
    Then I softly see "Resize" button for page
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:preAppEGMSID}" inside table
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Pre-Applications" inside "Applications" is displayed
    Then I see "Applications" inside "Applications" is displayed
    And I click on bottom button "Navigator" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:PreApplicationAssociateBP---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:PreApplicationAssociateFocusArea---"
    And I wait for "5" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I wait for "5" seconds
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Pre-App Line Items" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Details |
      | Automation Permanent Focus Area | 1000                         | Automation Test        |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:preAppEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Victor EXE" inside table "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:preAppEGMSID}" inside table
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name       | Is Key Contact | Project Role                                   |
      | Victor EXE | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Responsibilities" sub tab
    And I refresh the page
    And I wait for "5" seconds
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | David FO | Step 1          |
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name       | Pre-Application |
      | Victor EXE | Step 2          |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Letter of Intent" from computer
    When I click modal button "Close"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Pre-Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit to Grantor" in page detail
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value    | Field       |
      | Accepted | Decision__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    Then I softly can see top right button "Create Application" in page detail

  @476574 @ValidatePreAppwithAdminprofilePreapplicationpagelayoutofgrantsgovlead
  Scenario: Validate PreApp with Admin profile Pre application page layout of grants.gov lead
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPM1User}"
    Given I login to "Grantee" app as "GRANTEE PO" user
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
    When I click on "Activate" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to Activate the lead?" is displayed
    When I click modal button "OK"
    Then I softly see field "State" as "Posted"
    Then I can see top right button "Qualify Lead" in page detail
    And I click on "Qualify Lead" in the page details
    Then I softly see field "Status" as "Qualified Lead"
    And I save the field labeled "EGMS ID" as "QualifiedLeadEGMSID"
    And I click on "Edit" in the page details
    And I enter "Grantee_Qualifiedleads_Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I refresh the page
    And I wait for "3" seconds
    And I enter "Grantee_Opportunity_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I enter value "No" into field "LimitOnAdministrativeRate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | The Funding Opportunity has been validated successfully. |
    And I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    Then I softly see fields "Title__c" is in edit mode
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I save the field labeled "Pre-Application Title" as "PreApplicationTitle"
    When I click on "Edit" in the page details
    And I clear the value from field "Title__c"
    And I navigate to "Budget" sub tab
    And I enter value "--None--" into field "ProgramIncomeType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Pre-Application Title is required in the Overview tab under the Pre-Application Overview section.       |
      | To Save, Program Income Treatment Type is required in the Budget tab under the Budget Overview section.          |
    And I enter value "Additive" into field "ProgramIncomeType__c"
    And I navigate to "Overview" sub tab
    And I enter value "{SavedValue:PreApplicationTitle}" into field "Title__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required.                       |
      | Overview Tab - Associate at least one Contact with Pre-Application.         |
      | Overview Tab - Provide a value for Project Abstract.                        |
      | Overview Tab - Provide a value for UEI.                                     |
      | Overview Tab - Provide a value for Project Director/Principal Investigator. |
    When I click on "Edit" in the page details
    And I enter "Grantee_Edition_DetailLineItems" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name       | Is Key Contact | Project Role                                   |
      | Victor EXE | Checked        | Project Director/Principal Investigator(PI/PD) |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:PreApplicationAssociateBP---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:PreApplicationAssociateFocusArea---"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Pre-App Line Items" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---" by clicking "Edit" :
      | Focus Area Name                 | Projected Program Income ($) | Program Income Details |
      | Automation Permanent Focus Area | 1000                         | Automation Test        |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    When I upload attachment without random number "Attachment.pdf" of type "Letter of Intent" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationNoteTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    When I re-login to "Grantee" app as "GRANTEE ADMIN" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Collapse" button for page
    Then I softly see "Resize" button for page
    Then I softly see "Navigator" button display on footer
    And I click on bottom button "Navigator" in page detail
    Then I see "Pending Tasks" inside "My Tasks" is displayed
    Then I see "Completed Tasks" inside "My Tasks" is displayed
    Then I see "Pre-Applications" inside "Applications" is displayed
    Then I see "Applications" inside "Applications" is displayed
    And I click on bottom button "Navigator" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Quickview" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    And I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    And I wait for "2" seconds
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    Then I softly cannot see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    Then I softly cannot see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    When I close "Pre-App Line Items" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    Then I cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    Then I cannot see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    Then I cannot see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:preApplicationApprovalTableId---"
    When I navigate to "Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"

  @480768 @OpportunitiesconvertedtoApplicationGrantsgovVerifyPMusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @EXE_Grantee @P2_Grantee @GRegression1
  Scenario Outline: Opportunities converted to Pre-Application (Grants.gov) - Verify EXE user can navigate to Opportunity details page from Opportunities Converted to Pre-Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Delete" in page detail

    Examples:
      | User            |
      | GRANTEE EXE     |

  @480769 @OpportunitiesconvertedtoApplicationGrantsgovVerifyPMusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @FO_Grantee @P3_Grantee @GRegression2
  Scenario Outline: Opportunities converted to Pre-Application (Grants.gov) - Verify FO user can navigate to Opportunity details page from Opportunities Converted to Pre-Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Delete" in page detail

    Examples:
      | User            |
      | GRANTEE FO      |

  @480771 @OpportunitiesconvertedtoApplicationGrantsgovVerifyPMusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @FD_Grantee @P3_Grantee @GRegression2
  Scenario Outline: Opportunities converted to Pre-Application (Grants.gov) - Verify FD user can navigate to Opportunity details page from Opportunities Converted to Pre-Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Delete" in page detail

    Examples:
      | User            |
      | GRANTEE FD      |

  @480773 @OpportunitiesconvertedtoApplicationGrantsgovVerifyPMusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @AUDITOR_Grantee @P4_Grantee @GRegression2
  Scenario Outline: Opportunities converted to Pre-Application (Grants.gov) - Verify AUDITOR user can navigate to Opportunity details page from Opportunities Converted to Pre-Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Delete" in page detail

    Examples:
      | User            |
      | GRANTEE AUDITOR |

  @480774 @OpportunitiesconvertedtoApplicationGrantsgovVerifyPMusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @ADMIN_Grantee @P3_Grantee @GRegression2
  Scenario Outline: Opportunities converted to Pre-Application (Grants.gov) - Verify ADMIN user can navigate to Opportunity details page from Opportunities Converted to Pre-Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Delete" in page detail

    Examples:
      | User            |
      | GRANTEE ADMIN   |

  @481129 @OpportunitiesconvertedtoApplicationGrantsgovVerifyPMusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @PO_Grantee @P2_Grantee @GRegression2
  Scenario Outline: Opportunities converted to Pre-Application (Grants.gov) - Verify PO user can navigate to Opportunity details page from Opportunities Converted to Pre-Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:opportunitysGranteeTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:opportunitysGranteeTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Delete" in page detail

    Examples:
      | User            |
      | GRANTEE PO      |

  @475750 @ValidateNotYetConvertedOpportunitGrantsgovPMusercancreatePreApplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord @P2_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Grants.gov PM user can create Pre-Application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPM1User}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001271854" with properties "default"
    Given I login to "Grantee" app as "<userName>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001271854" with properties "PRE_APPLICATION_YES"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    Then I softly see fields "Title__c" is in edit mode
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I see the header is "Pre-Application" in the page details
    Examples:
      | userName   |
      | GRANTEE PO |

  @493683 @Validateonclickviewactionmodalgetopeninviewmode @P3_Grantee @GRegression1
  Scenario: Validate on click view action modal get open in view mode
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    When I upload attachment without random number "Attachment.pdf" of type "Letter of Intent" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    And I click on "View" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I softly see the image "Attachment.pdf" in page detail

  @472431_1 @validatethatPM(RecordOwner)userseeCreateApplicationbuttonagaininthesameorganizationontherelatedopportunity/Preapplicationonceapplicationisdeleted
  Scenario: Validate that PM(Record Owner) user see Create Application button again in the same organization on the related opportunity/Preapplication once application is deleted
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "Delete" icon for "{SavedValue:PreappEGMSID}" inside table with table id "---grantee_tableId:-:PreApplication---" without processing
    Then I softly see confirmation box with body "Are you sure you want to permanently delete the draft pre-application?" is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PreApplication---"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    When I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:PreappEGMSID}"