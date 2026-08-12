@GranteePreApplicationsManual @GranteePreAwardRegression
Feature: Validate all scenarios for Pre-Applications Manual

  @463425 @PreAppVerifywithPMproofileLineItemBudgetinBudgetTab @P1_Grantee @PM_Grantee @GRegression1
  Scenario: PreApp - Verify with PO Profile ,Overview Tab.
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "COSTSHARING_NO-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APP_YES_NO_CONST_NO_SETTING"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "LINE_ITEM_BUDGET-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
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
    Then I softly can see row level action button "Delete" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly can see row level action button "Edit" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Level" as "Line Item Budget"
    Then I softly see field "Budget Type" as "Non-Construction"
    Given I expand nested table containing column value "BP01"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Personnel" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Fringe Benefits" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Travel" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Equipment" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Supplies" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Contractual" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" by clicking "Edit" :
      | Category     | Award Budget |
      | Construction | 1000         |
    And I wait for "5" seconds
    Then I softly see value "$1,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "$1,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" by clicking "Edit" :
      | Budget Category | Award Budget |
      | Construction    | 0            |
    And I wait for "5" seconds
    Then I softly see value "$0.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "$200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    When I navigate to "Setup" sub tab
    And I click on "Edit" icon for "BP01" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I enter in modal value "300" into field "BudgetEndDate__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    When I enter in modal value "302" into field "BudgetStartDate__c"
    When I enter in modal value "365" into field "BudgetEndDate__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    When I click "Next" after selection of "BP02" in the table "---grantee_tableId:-:preAppAssociateBudgetTableId---"
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:preAppAssociateFocusAreaTableId---"
    And I click modal button "Close"
    Then I softly can see row level action button "Delete" against "BP02" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly can see row level action button "Edit" against "BP02" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    And I collapse nested table containing column value "BP01"
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP02"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Personnel" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Fringe Benefits" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Travel" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Equipment" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Supplies" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Contractual" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:preAppBudgetDetailTableId---"
    When I navigate to "Setup" sub tab
    Given I expand nested table containing column value "BP02"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I click on "Remove" icon for "Automation Permanent Focus Area2" inside flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---" without waiting for record
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:preAppcationBudgetTableId---"

  @463417 @ValidatePreAppwithPMprofileifinopportunitiespreapplicationrequiredselectNOthenonlyunabletocreatepreapplication @P3_Grantee @PM_Grantee @GRegression3
  Scenario: Validate PreApp with PM profile if in opportunities pre application required select NO then only unable to create pre application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    When I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Then I softly can see top right button "Create Application" in page detail
    Then I softly see field "Pre-Application Required?" as "No"

  @463439 @463457 @ValidatePreAppwithPMProfilAlltabsandsectionformanuallead @P2_Grantee @P3_Grantee @PM_Grantee @GRegression1
  Scenario: Validate PreApp with PM Profile All tabs and section for manual lead
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "COSTSHARING_NO"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APP_YES_NO_CONST_NO_SETTING"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "LINE_ITEM_BUDGET"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I see the header is "Pre-Application" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "PreAppEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:PreAppEGMSID}"
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I wait for "2" seconds
    And I click on back arrow
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Pre-Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Type" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly see "Is Primary Program" in flex table header "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    When I click on parallel lines menu bar with data target value "External Programs"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:preApplicationContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly see "Budget Period #" in flex table header "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click on parallel lines menu bar with data target value "Budget Period Details"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Overview" page block displayed
    Then I softly see "Budget Level Information" page block displayed
    Then I softly see "Budget Details" page block displayed
    Then I softly see "Budget Period #" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    When I click on parallel lines menu bar with data target value "Budget Details"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:preResponsibiltiesTableId---"
    Then I softly see "Pre-Application" in flex table header "---grantee_tableId:-:preResponsibiltiesTableId---"
    When I click on parallel lines menu bar with data target value "Approvers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Name" in flex table header "---grantee_tableId:-:preApplicationOwnerTableId---"
    Then I softly see "Responsibility" in flex table header "---grantee_tableId:-:preApplicationOwnerTableId---"
    When I click on parallel lines menu bar with data target value "Owner"
    Then I see option "Refresh" present in parallel dropdown
    When I navigate to "Files" sub tab
    Then I softly see "Pre-Application Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly can see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:preApplicationAddFilesTableId---"
    When I click on parallel lines menu bar with data target value "Pre-Application Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:preApplicationNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    When I click on parallel lines menu bar with data target value "Messages"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see "Chatter" sub tab at view detail page
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    #463457
    And I navigate to "Budget" sub tab
    Then I softly see field "Maintenance of Effort Required?" as "Yes"
    Then I softly cannot see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly cannot see field "Required Match(%)" inside page block
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly see field "Are Indirect Costs Allowed?" as "No"
    Then I softly do not see "Program Income" page block displayed
    Then I softly do not see "Indirect Rates" page block displayed
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:opportunityEGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Is Match Required?" as "No"
    Then I softly cannot see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly cannot see field "Required Match(%)" inside page block
    Then I softly cannot see field "Match Source" inside page block
    Then I softly cannot see field "Program Income Treatment Type" inside page block
    Then I softly cannot see field "Maximum Indirect Cost Rate" inside page block
    Then I softly cannot see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Program Income Allowed?" as "No"
    Then I softly see field "Are Indirect Costs Allowed?" as "No"
    Then I softly see field "Is Leverage Allowed?" as "No"

  @463455 @ValidateNotYetConvertedOpportunityManualPMusercancreatePreApplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario: Validate Not Yet Converted Opportunity Manual PM user can create Pre-Application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
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
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I re-login to "Grantee" app as "GRANTEE AUDITOR" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:PreappEGMSID}" in flex table with id "---grantee_tableId:-:PreApplication---"
    Then I softly can see row level action button "View" against "{SavedValue:PreappEGMSID}" in flex table with id "---grantee_tableId:-:PreApplication---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:PreappEGMSID}" in flex table with id "---grantee_tableId:-:PreApplication---"
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    When I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    And I navigate to "Setup" sub tab
    Then I softly cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    Then I softly cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Pre-Application Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNotesTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed

  @463442 @ValidatePreAppwithPMprofileabletoRejectwithmultipleapproverableReject @P3_Grantee @PM_Grantee @GRegression1
  Scenario: Validate PreApp with PM profile ,Able to Reject with multiple approver able Reject
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "COSTSHARING_NO"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APP_YES_NO_CONST_NO_SETTING"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "LINE_ITEM_BUDGET"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description | Due Date | Allow Record Editing |
      | David FO      | Program Reviewer | Test        | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | David FO | Step 2          |
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Reject" in the approval decision
    Then I softly see status in Progress-bar is "Rejected" and is "Red"

  @463432 @ValidatePreAppWithPMprofileabletoaddpeerreviewerwithAllowrecordEditingNO @GRegression1
  Scenario: Validate PreApp With PM profile Able to add peer reviewer with Allow record Editing NO
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "COSTSHARING_NO"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APP_YES_NO_CONST_NO_SETTING"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Responsibility   | Description | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Test        | 5        | No                   |
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly can see row level action button "Delete" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly do not see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly can see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I can softly see modal button "Submit Review"
    Then I can softly see modal button "Edit"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    When I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:PreApplicationPeerReviewers---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see status in Progress-bar is "Reviewed" and is "dark blue"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Delete" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    Then I softly cannot see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:PreApplicationPeerReviewers---"
    And I delete the file in download folder
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Peer Reviewers"
    Then I see table is refreshing

  @463440 @PreAppVerifywithPOprofilewithmultipleapproverabletoapprove @P2_Grantee @PO_Grantee @GRegression1
  Scenario:PreApp - Verify with PO profile ,with multiple approver able to approve.
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "Edit" :
      | Name       | Pre-Application |
      | Victor EXE | NA              |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Pre-Application |
      | Step 3          |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Responsibilities - At least one approver is required |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | David FO | Step 1          |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name       | Pre-Application |
      | Victor EXE | Step 2          |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name       | Pre-Application |
      | Grantee PO | Step 3          |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | Sarah PM | Step 4          |
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationApprovalTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | Sarah PM | Step 4          |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | You cannot specify the same user for multiple steps for Pre-Application |
    And I refresh the page
    And I wait for "2" seconds
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
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"

  @463446 @ValidatePreAppwithPOprofileusingtherecorddecisionabletoaccept @P1_Grantee @PO_Grantee @GRegression1
  Scenario: Validate PreApp with PO profile ,using the record decision able to accept
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | David FO | Step 2          |
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
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

  @463447 @ValidatePreAppwithPOprofileusingtherecorddecisionabletoselectnotaccept @P2_Grantee @PO_Grantee @GRegression2
  Scenario: Validate PreApp with PO profile using the record decision able to select not accept
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:preResponsibiltiesTableId---" by clicking "New" :
      | Name     | Pre-Application |
      | David FO | Step 2          |
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
      | Value        | Field       |
      | Not Accepted | Decision__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Not Accepted"
    Then I see status in Progress-bar is "Not Accepted" and is "Red"
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityConvertedToApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail

  @463434 @ValidatePreAppWithPOProfileChecktheaccessinReviewedStatewithAllowrecordEditingYes @P2_Grantee @PO_Grantee @GRegression2
  Scenario: Validate PreApp With PO Profile Check the access in Reviewed State with Allow record Editing Yes
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
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
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Victor EXE" inside table "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    Then I softly cannot see row level action button "Enter Review" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:preAppEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:preAppEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "Victor EXE" in flex table with id "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:preApplicationPeerReviewTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    When I click on "Edit" icon for "Automation Permanent NGO Program" inside flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    Then I softly can see top right button "Save" in flex table with id "---grantee_tableId:-:preApplicationExternalProgramTableId---"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly can see row level action button "View" against "Sarah PM" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see row level action button "Edit" against "Sarah PM" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see row level action button "Remove" against "Sarah PM" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click on "Edit" icon for "Sarah PM" inside flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    Then I softly can see top right button "Save" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    And I refresh the page
    And I wait for "2" seconds
    And I navigate to "Setup" sub tab
    Then I softly can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:PreApplicationBudgetPeriodDetails---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:PreApplicationAssociateBP---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:PreApplicationAssociateFocusArea---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Add Line Item Details" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    When I close "Pre-App Line Items" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---"
    When I click on "Edit" icon for "Automation Permanent Focus Area2" inside flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---"
    Then I softly can see top right button "Save" in flex table with id "---grantee_tableId:-:preApplicationProgramIncomeTableId---"
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    Then I can see row level action button "Edit" against "Rate" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    Then I can see row level action button "Delete" against "Rate" in flex table with id "---grantee_tableId:-:preApplicationIndirectRateTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    When I upload attachment without random number "Attachment.pdf" of type "Letter of Intent" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:preApplicationAddFileTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:preApplicationNoteTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    When I navigate to "Files" sub tab
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    Then I cannot see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"
    Then I cannot see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:preApplicationNoteTableId---"

  @473231 @487216 @ValidateNotYetConvertedOpportunityManualPMusercancreatePre-applicationfromOpportunityifPre-ApplicationRequiredisselectedasYesonOpportunityrecord @P2_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual PM user can create Pre-application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<userName>"
    Given I login to "Grantee" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
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
    Then I see the header is "Pre-Application" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    Examples:
      | userName        | userType   |
      | Grantee PO user | GRANTEE PO |

  @487152 @ValidateNotYetConvertedOpportunityManualPMusercancreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNOonOpportunityrecord  @P1_Grantee @PO_Grantee @GRegression1
  Scenario Outline: Validate Not Yet Converted Opportunity Manual PM/PO user can create Application from Opportunity if Pre-Application Required? is selected as NO on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<userName>"
    Given I login to "Grantee" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "No"
    And I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Examples:
      | userName        | userType   |
      | Grantee PO user | GRANTEE PO |

  @463456 @ValidatePreAppwithPOprofileifinopportunitiespreapplicationrequiredselectYesthenonlyabletocreatepreapplication @P2_Grantee @Po_Grantee @GRegression2
  Scenario: Validate PreApp with PO profile if in opportunities pre application required select Yes then only able to create pre application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    When I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly can see top right button "Create Pre-Application" in page detail
    Then I softly see field "Pre-Application Required?" as "Yes"
    And I click on "Create Pre-Application" in the page details
    And I wait for "2" seconds
    Then I softly see fields "Title__c" is in edit mode
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I navigate to "Budget" sub tab
    Then I softly see field "Cost Sharing or Match Requirement?" as "Cash and Non-Cash Match"
    Then I softly see field "Required Match (%)" as "10.00%"
    Then I softly see field "Maintenance of Effort Required?" as "Yes"
    Then I softly see field "Are Indirect Costs Allowed?" as "Yes"
    Then I softly see field "Maximum Indirect Cost Rate" as "10.00%"
    Then I softly see field "Program Income Treatment Type" as "Additive"
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:opportunityEGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly see field "Is Match Required?" as "Yes"
    Then I softly see field "Cost Sharing or Matching Requirement" as "Cash and Non-Cash Match"
    Then I softly see field "Required Match(%)" as "10.00%"
    Then I softly see field "Match Source" as "External Source"
    Then I softly see field "Is Program Income Allowed?" as "Yes"
    Then I softly see field "Program Income Treatment Type" as "Additive"
    Then I softly see field "Maximum Indirect Cost Rate" as "10.00%"
    Then I softly see field "Rate for Organization Use" as "Federally approved indirect rate"
    Then I softly see field "Are Indirect Costs Allowed?" as "Yes"
    Then I softly see field "Is Leverage Allowed?" as "Yes"

  @463428 @ValidatePMprofileAsperbudgettypeNonConstructionabletoseetheCategories @GRegression5 @PM_Grantee @P2_Grantee
  Scenario: Validate PM profile As per budget type Non-Construction able to see the Categories
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "COSTSHARING_NO-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APP_YES_NO_CONST_NO_SETTING"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "LINE_ITEM_BUDGET-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Type" as "Non-Construction"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Personnel" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "Fringe Benefits" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "Travel" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "Equipment" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "Supplies" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "Contractual" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "Construction" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"
    Then I softly see value "Other" for title "Category" inside table "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---"

  @463438 @ValidatePreAppwithPOprofilevalidatebutton @GRegression5 @P2_Grantee @PO_Grantee
  Scenario: Validate Pre App with PO profile validate button
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Files Tab - Attach the "Letter of Intent" required for the Funding Opportunity. |
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:preApplicationAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Letter of Intent" from computer
    When I click modal button "Close"
    And I navigate to "Overview" sub tab
    And I click on "Remove" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Associate at least one Contact with Pre-Application. |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:preApplicationContactTableId---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:preAppAssociateContactTableId---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:preApplicationContactTableId---" by clicking "Edit" :
      | Name       | Is Key Contact | Project Role                                   |
      | Victor EXE | Checked        | Project Director/Principal Investigator(PI/PD) |
    And I click on "Edit" in the page details
    And I clear the value from field "ProjectAbstract__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide a value for Project Abstract. |
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "ProjectAbstract__c"
    And I click on remove for lookup from field "DUNS__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide a value for UEI. |
    And I click on "Edit" in the page details
    When I enter value "YRNMVN96JC17" into field "DUNS__c"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    When I click on "Delete" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    And I wait for "4" seconds
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---"
    When I close "Pre-App Line Items" modal by clicking the top right x button
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Tab - Enter budget details for all the budget periods associated before submitting the Pre-Application for approval. |
    When I click on "Add Line Item Details" icon for "Construction" inside flex table with id "---grantee_tableId:-:PreApplicationBudgetCategoryTableId---" with wait for record
    When I enter the following values into flex table with id "---grantee_tableId:-:PreApplicationDetailsLineItemTableId---" by clicking "New" :
      | Title        | Narrative     | Award Budget | Cash Match | Non-Cash Match |
      | Construction | The narrative | 5000         | 500        | 500            |
    When I close "Pre-App Line Items" modal by clicking the top right x button
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Pre-Application has been validated successfully. |

    @463427 @Validatewithpouserasperbudgettype-ConstructionabletoseetheCategories
    Scenario:Validate with PO user, As per budget type  - Construction able to see the Categories.
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    And I navigate to "Applications" tab
    When I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    And I click toggle button to select "Pre-Applications - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:preApplicaltionTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---" without waiting for record
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
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
    Then I softly can see row level action button "Delete" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly can see row level action button "Edit" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I navigate to "Budget" sub tab
    Then I softly see field "Budget Type" as "Construction"
    Given I expand nested table containing column value "BP01"
    Then I softly see "Award Budget" in flex table header "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Administrative and legal expenses" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Land, structures, rights-of-way, appraisals, etc." for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Relocation expenses and payments" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Other architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Project inspection fees" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Site work" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Construction" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Indirect costs" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Equipment" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Miscellaneous" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"
    Then I softly see value "Contingencies" for title "Budget Category" inside table "---grantee_tableId:-:preAppBudgetDetailTableId---"

  @495015 @PreAppvalidatecreationfunctionalityofpre-application
  Scenario: PreApp - Verify creation functionality of pre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "Default"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    When I click on parallel lines menu bar with data target value "Pre-Applications - All"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:PreApplication---" panel
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Opportunity}" in flex table with id "---grantee_tableId:-:PreApplication---"
    Then I softly can see row level action button "Edit" against "{SavedValue:Automation Runtime Opportunity}" in flex table with id "---grantee_tableId:-:PreApplication---"
    Then I softly can see row level action button "Delete" against "{SavedValue:Automation Runtime Opportunity}" in flex table with id "---grantee_tableId:-:PreApplication---"
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:preApplicaltionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
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
    Then I softly can see row level action button "Delete" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Then I softly can see row level action button "Edit" against "BP01" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:preAppcationBudgetTableId---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:preAppAssociateBudgetTableId---"
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:preAppAssociateFocusAreaTableId---"
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:opportunityEGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    And I click on "Download as PDF" in the page details
    And I wait for "7" seconds
    And I download the file
    Then I softly see "Pre-Application - {SavedValue:Automation Runtime Opportunity}" on page "1" of "govgrants" pdf file
    And I switch to parent tab
    And I wait for "2" seconds
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
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
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
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "Delete" icon for "{SavedValue:appEGMSID}" inside table with table id "---grantee_tableId:-:ApplicationTableId---" without processing
    Then I softly see confirmation box with body "Are you sure you want to permanently delete the draft application?" is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I navigate to "Applications" tab
    And I navigate to "Pre-Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Pre-Applications - All"
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---grantee_tableId:-:PreApplication---" panel
    When I click on "View" icon for "{SavedValue:PreappEGMSID}" inside table
    Then I softly see field "Status" as "Accepted"
    Then I softly see status in Progress-bar is "Accepted" and is "dark blue"
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:appEGMSID}"