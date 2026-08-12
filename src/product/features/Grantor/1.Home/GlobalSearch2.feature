@globalSearchRegression @globalSearch2 @grantor-regression @grantor-parallel-regression @regression @globalExecution2
Feature: Validate all scenarios for the global search

  @390386 @390389 @ValidateEXEuserisabletoseetheglobalsearchbarforSubrecipientOrganziation @sprint-2-US-386939 @GlobalSearch
  Scenario Outline: subrecipient organization ->Verify that user is able to expand the result by External S/R org module and Filter/Refine the the result by configured Columns for an External S/R org.
  |subrecipient Organization -> Verify that user redirect to that record when user click on any hyperlink provided (e.g. - Acc Name ) on objects after global search the any record for External S/R org.|
    When I login to "Grantor" app as "<User>" user
    And I wait for "1" seconds
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Account Name" inside table "Organizations" for global search record
    And I click on hyperlink for global search containing value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see page title contains as "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see field "Status" as "Active"
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    Then I softly see value "SAN DIEGO ELECTRICAL TRAINING TRUST" for title "Account Name" inside table "Organizations" for global search record
    Then I softly see "Account Name" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "EIN" inside refine by filter
    Then I softly see "UEI" inside refine by filter
    Then I softly see "Organization Type" inside refine by filter
    Then I softly see "Created Date" inside refine by filter
    Then I softly see "Agency Abbreviation" inside refine by filter
    Then I softly see "Executive Office" inside refine by filter
    And I refresh the page
    And I wait for "4" seconds
    And I select "Organizations" from dropdown for Global search
    And I perform quick search inside global search "SAN DIEGO ELECTRICAL TRAINING TRUST"
    And I click on "Expand List" button on left navigation for global search
    Then I softly see record count "1" for module "Organizations" on left navigation for global search

    Examples:
      | User  |
      | ADMIN |
      | EXE   |
      | PM    |

  @390420 @390405 @390408 @390410 @390424 @390428 @ValidateEXEuserisabletoseetheglobalsearchbarforanAwardDeskReview @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Award Desk Review is in the Created, submit for review and sent to grantor state
  |Verify that Non-Owner user doesn't have an edit option in any stage of Award Desk Review and will get error message on page.|
  |Verify that PM user have edit access for record only when edit access setting is yes for peer reviewer when Award desk review is a submit for review state.|
  |Verify that the record owner is able to edit the access for record when Org Desk Review is in the Created, submit for review and sent to grantor state|
  |Verify that Non-Owner user doesn't have an edit option in any stage of Org Desk Review and will get error message on page.|
  |Verify that PM user have edit access for record only when edit access setting is yes for peer reviewer when org desk review is a submit for review state.|
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    And I wait for "2" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:DeskReview}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:DeskReview}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:DeskReview}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:DeskReview}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I wait for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    #390420 #390428
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    And I pause execution for "5" seconds
    Given I click on "Conduct" in the page details
    And I pause execution for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "SiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I wait for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted for Review"
    #390410 #390428
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "SiteVisitReviewerRoles"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I wait for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    When I click on "Save" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    Given I click on "Complete Review" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                       | Desk Review |
      | {SavedValue:EXE1 Username} | Step 1      |
    And I pause execution for "3" seconds
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I pause execution for "3" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Send to Subrecipient" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Sent to Subrecipient"
    Then I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReview}" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReview}" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see top right button "Save" in page detail
    Then I softly cannot see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I wait for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    And I click on row level action button "Edit" against "{SavedValue:DeskReview}" in global search with id "Site Visits"
    #390408 #390424
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390406 @390409 @390411 @390421 @390425 @390427 @ValidateEXEuserisabletoseetheglobalsearchbarforAwardSiteVisit @sprint-2-US-386939 @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when Award site visit is in the Created, submit for review and sent to grantor state
  |Verify that Non-Owner user doesn't have an edit option in any stage of Award Site Visit and will get error message on page.|
  |Verify that PM (Reviewer)user have edit access for record only when edit access setting is yes for peer reviewer when Award Site Visit is a submit for review state.|
  |Org Site Visit -> Verify that the record owner is able to edit the access for record when Org site visit is in the Created, submit for review and sent to grantor state|
  |Org site visit  -> Verify that Non-Owner user doesn't have an edit option in any stage of Org Site Visit and will get error message on page.|
  |Org Site Visit -> Verify that PM user have edit access for record only when edit access setting is yes for peer reviewer when Org Site Visit is a submit for review state.|
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default-Automation EXE user" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
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
    And I pause execution for "2" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    And I click on "Save" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Site Visit/Desk Review" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitSourceTableId---"
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitSourceTableId---" panel
    When I check "{SavedValue:SitevVisitId}" boxes in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---sitevisits:-:siteVisitSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:siteVisitTargetTableId---" panel
    Then I softly see value "{SavedValue:SitevVisitId}" for title "Site Visit ID" inside table "---sitevisits:-:siteVisitTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I pause execution for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    #390421 #390427
    Then I softly see field "Status" as "Created"
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "SiteVisitReviewerRoles" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PO Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PO Username}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I pause execution for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    Then I softly see field "Status" as "Submitted for Review"
    #390411 #390427
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PO Username}" inside flex table with id "SiteVisitReviewerRoles"
    And I wait for "3" seconds
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I pause execution for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    When I click on "Save" in the page details
    And I pause execution for "3" seconds
    Given I click on "Complete Review" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PO Username} | Step 1     |
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                     | Site Visit |
      | {SavedValue:PM Username} | Step 2     |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---orgLevelSiteVisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" panel
    Then I see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---"
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:sitevisitPhasePendingTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I pause execution for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    And I click on "Send to Subrecipient" in the page details
    Then I softly see field "Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---" without waiting for record
    And I click on "Accept and Close" in the page details
    Then I see status in Progress-bar is "Closed" and is "dark blue"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I pause execution for "1" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    And I click on row level action button "Edit" against "{SavedValue:SitevVisitId}" in global search with id "Site Visits"
    #390409 #390425
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390415 @390418 @390430 @390432 @ValidateEXEuserisabletoseetheglobalsearchbarforAwardSiteVisit @sprint-2-US-386939 @GlobalSearch
  Scenario:Verify that user is able to expand the result by award site visit module and Filter/Refine the the result by configured Columns for an award site visit.
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Award site visit.|
  |Org Site visit -> Verify that user is able to expand the result by Org site visit module and Filter/Refine the the result by configured Columns for an Org site visit.|
  |Org Site Visit ->Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Org site visit.|
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default-Automation EXE user" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Competitive"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "---sitevisits:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:grantsTableId---"
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
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "Site Visits" for global search record
    #390430
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Visit Period" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "MonitoringType" inside refine by filter
    Then I softly see "Subrecipient POC" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:SitevVisitId}"
    Then I softly see value "{SavedValue:SitevVisitId}" for title "EGMS ID" inside table "Site Visits" for global search record
    And I click on hyperlink for global search containing value "{SavedValue:SitevVisitId}"
  #390418 #390432
    Then I softly see page title contains as "{SavedValue:Automation Runtime Site Visit}"

  @390416 @390419 @390429 @390431 @ValidateEXEuserisabletoseetheglobalsearchbarforDeskReview @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that user is able to expand the result by award desk review module and Filter/Refine the the result by configured Columns for an award desk review
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Award desk review.|
  |Verify that user is able to expand the result by Org desk review module and Filter/Refine the the result by configured Columns for an Org desk review|
  |Org site visit -> Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, S/R POC ) on objects after global search the any record for Org desk review.|
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-Automation EXE user" of type "Formula_By_Applicant_Focus_Area"
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    And I wait for "2" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    Then I softly see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "Site Visits" for global search record
    #390429
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Visit Period" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "MonitoringType" inside refine by filter
    Then I softly see "Subrecipient POC" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    And I wait for "4" seconds
    And I select "Site Visits" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:DeskReview}"
    Then I softly see value "{SavedValue:DeskReview}" for title "EGMS ID" inside table "Site Visits" for global search record
    And I click on hyperlink for global search containing value "{SavedValue:DeskReview}"
      #390419 #390431
    Then I softly see page title contains as "{SavedValue:Automation Runtime Award Desk}"

  @390455 @390454 @390457 @390458 @ValidateEXEuserisabletoseetheglobalsearchbarforApplicationNegotiation @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that Record owner can edit only the negotiation tab when application is in the review initiated state and negotiation is in the created state
  |Verify that Non-Owner user doesn't have an edit option in any stage of application and will get error message on page.|
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, owner first name, owner last name ) on objects after global search the any record for application.|
  |Verify that user is able to expand the result by for application module and Filter/Refine the the result by configured Columns for an Application.|
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "3" seconds
    Then I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    And I wait for "2" seconds
    And I navigate to "Negotiations" sub tab
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AppID"
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on row level action button "Edit" against "{SavedValue:AppID}" in global search with id "Applications"
    When I click on "Save" in the page details
      #390454
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Cancel Negotiation" in page detail
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on hyperlink for global search containing value "{SavedValue:AppID}"
      #390457
    Then I softly see page title contains as "{SavedValue:Automation Runtime FDM Announcement}"
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    Then I softly see value "{SavedValue:AppID}" for title "EGMS ID" inside table "Applications" for global search record
    And I perform quick search inside global search "Applications"
      #390458
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Application Name" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Application Due Date" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see "Submitted On" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I refresh the page
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AppID}"
    And I click on row level action button "Edit" against "{SavedValue:AppID}" in global search with id "Applications"
      #390455
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390459 @390460 @390461 @390465 @ValidateEXEuserisabletoseetheglobalsearchbarforPre-ApplicationNegotiation @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that Record owner can edit only the negotiation tab when pre-application is in the submit to grantor state and negotiation is in the created state
  |Verify that Record owner can edit only the negotiation tab when pre-application is in the submit to grantor state and negotiation is in the created state|
  |Verify that Non-Owner user doesn't have an edit option in any stage of Pre-application and will get error message on page.|
  |Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID, owner first name, owner last name ) on objects after global search the any record for Pre-application.|
  |Verify that user is able to expand the result by for Pre-application module and Filter/Refine the the result by configured Columns for an Pre-Application.|
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
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreAppID"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    And I click on hyperlink for global search containing value "{SavedValue:PreAppID}"
    #390459 #390461
    Then I softly see page title contains as "{SavedValue:Automation Runtime Announcement for Pre-App}"
    Then I softly can see top right button "Request Negotiation" in page detail
    Then I softly can see top right button "Accept" in page detail
    Then I softly can see top right button "Reject" in page detail
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    #390459
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I enter "Negotiation_Edit" values from "PreApplication_Field_Values.xlsx"
    And I edit the following rows inline in flex table with id "---preApplication:-:negotiationFormTableId---" by clicking "Edit" :
      | Form Name                     | Needs Negotiation |
      | Standard Pre-Application form | Checked           |
    When I click on "Save" in the page details
    And  I wait for "2" seconds
    #390459
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    Then I softly see value "{SavedValue:PreAppID}" for title "EGMS ID" inside table "Pre-Applications" for global search record
    #390465
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Pre-Application Name" inside refine by filter
    Then I softly see "Announcement EGMS ID" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Pre-Application Due Date" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see "Status" inside refine by filter
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I select "Pre-Applications" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:PreAppID}"
    And I click on row level action button "Edit" against "{SavedValue:PreAppID}" in global search with id "Pre-Applications"
    #390460
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @390873 @390875 @390882 @390886 @ValidateEXEuserisabletoseetheglobalsearchbarforSubrecipientContacts @sprint-2-US-386939 @GlobalSearch
  Scenario: Subrecipient Contact-> Verify that the record owner and Admin is able to edit the access for record when Subrecipient contact is in the New, Invitation sent, Register, Active, Invitation Expired state
  |Subrecipient Contact -> Verify that Non-Owner user doesn't have an edit option in any stage of Subrecipient Contact and will get error message on page.|
  |Subrecipient Contact -> Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID ) on objects after global search the any record for S/R contact.|
  |subrecipient contact -> Verify that user is able to expand the result by S/R Contact module and Filter/Refine the the result by configured Columns for an S/R Contact|
    When I login to "Grantor" app as "EXE" user
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:NewUser}"
    #390886
    Then I softly see "Name" inside refine by filter
    Then I softly see "Type" inside refine by filter
    Then I softly see "Organization Name" inside refine by filter
    Then I softly see "Email" inside refine by filter
    Then I softly see "Phone" inside refine by filter
    Then I softly see "Status" inside refine by filter
    And I click on row level action button "Edit" against "{user:NewUser}" in global search with id "Contacts"
    And I pause execution for "3" seconds
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:InvitationSentUser}"
    And I click on row level action button "Edit" against "{user:InvitationSentUser}" in global search with id "Contacts"
    And I pause execution for "3" seconds
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:RegisteredUser}"
    And I click on row level action button "Edit" against "{user:RegisteredUser}" in global search with id "Contacts"
    And I pause execution for "3" seconds
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:ActiveUser}"
    And I click on row level action button "Edit" against "{user:ActiveUser}" in global search with id "Contacts"
    And I pause execution for "3" seconds
    #390873
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{user:InactiveUser}"
    And I click on row level action button "Edit" against "{user:InactiveUser}" in global search with id "Contacts"
    #390875
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Contacts" subheader on left panel
    And I pause execution for "3" seconds
    When I click on top right button "New" in flex table with id "---home:-:subrecipientContactTableId---"
    And I enter "Creation" values from "SubrecipientContact_Field_Values.xlsx"
    When I enter in modal value "Non-User" into field "UserRole__c"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "Email"
    When I click modal button "Save"
    And I pause execution for "3" seconds
    And I refresh the page
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Contact} Contact"
    And I click on hyperlink for global search containing value "{SavedValue:Automation Runtime Contact} Contact"
    #390882
    Then I softly see page title contains as "{SavedValue:Automation Runtime Contact}"
    And I select "Contacts" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:Automation Runtime Contact} Contact"
    And I click on hyperlink for global search containing value "SAN DIEGO ELECTRICAL TRAINING TRUST"
    #390882
    Then I softly see page title contains as "SAN DIEGO ELECTRICAL TRAINING TRUST"

  @393746 @ValidateEXEuserisabletoseetheglobalsearchbarforanannouncement @sprint-2-US-386939 @GlobalSearch
  Scenario: Verify that Column label should correctly displayed and clickable on that object when user global search any record by using EGMS ID or any keyword
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Competitive Announcement"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I select "Announcements" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AnnEGMSID}"
    Then I softly see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "Announcements" for global search record
    Then I softly see value "{SavedValue:Automation Runtime Competitive Announcement}" for title "Announcement Name" inside table "Announcements" for global search record
    Then I softly see value "" for title "Application Due Date" inside table "Announcements" for global search record
    Then I softly see value "Automation EXE" for title "Created By" inside table "Announcements" for global search record
    Then I softly see value "Created" for title "Status" inside table "Announcements" for global search record

  @389003  @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that the record owner is able to edit the access for record when Award is in the Created, submit for review, Reviewed, Accepted state
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Created"
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Reviewed"
    And I click on "Save" in the page details
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Accepted"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389008 @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that Non-Owner user doesn't have an edit option in any stage of award and will get error message on page.
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Created"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:FO Username}" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    Then I softly see value "Submitted" for title "Status" against the value "{SavedValue:FO Username}" inside table "---subAwardStandAlone:-:peerReviewersTableId---"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Accepted"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    And I pause execution for "2" seconds
    And I refresh the page
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see that "Subaward" is in "Activated" status
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389011 @sprint-2-US-386939  @GlobalSearch @bug-451578
  Scenario: Verify that user is not able to change the owner in any state of Award and will get the error message and non-owner user is not able to see the change owner option
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    And I click on row level action button "Change Owner" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    Then I softly see "Change Owner" opens in overLay window
    When I click modal button "Cancel"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"

  @389017 @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that PM user as Reviewer have edit access for record only when edit access setting is yes for peer reviewer when award is a submit for review state.
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | Yes                  |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389023 @sprint-2-US-386939  @GlobalSearch
  Scenario Outline: Verify that if PM user does not have edit access for peer review then PM user will get error message for award when award is in the submit for review state or in Reviewed states
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    And I perform quick search for "Automation Permanent Funding Account" in "---subAwardStandAlone:-:awardFundingAccountsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I pause execution for "5" seconds
    And I check the checkbox in modal with field value "I Agree"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Risk Assessment | Name                     |
      | Step 1          | {SavedValue:PM Username} |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Award  | Name                     |
      | Step 1 | {SavedValue:PM Username} |
    When I get the "EGMS ID"
    And I enter the following values into flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" by clicking "New" :
      | Reviewer Name            | Role            | Description                 | Due Date | Allow Record Editing |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        | No                   |
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---subAwardStandAlone:-:peerReviewersTableId---" without waiting for record
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:AwardEGMSID}" in global search with id "Awards"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Award Name                                   | Grant Name                                   |
      | {SavedValue:Automation Runtime Direct Award} | {SavedValue:Automation Runtime Direct Award} |

  @389027 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to see the 5 most recently used records in the dropdown list when user clicks on search input box for awardbox for announcement
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Grants" from dropdown for Global search
    And I click on global search box
    Then I softly see recent "5" records in global search box

  @389031 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to see the all the list of modules after clicking on 'suggested for you section' for award.
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    Then I softly see dropdown option "All" under the "Suggested For You" section
    Then I softly see dropdown option "Amendment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Announcements" under the "Suggested For You" section
    Then I softly see dropdown option "Applications" under the "Suggested For You" section
    Then I softly see dropdown option "Chatter" under the "Suggested For You" section
    Then I softly see dropdown option "Closeouts" under the "Suggested For You" section
    Then I softly see dropdown option "Contacts" under the "Suggested For You" section
    Then I softly see dropdown option "Events" under the "Suggested For You" section
    Then I softly see dropdown option "External Registration" under the "Suggested For You" section
    Then I softly see dropdown option "Focus Areas" under the "Suggested For You" section
    Then I softly see dropdown option "Funding Decision Memos (FDM)s" under the "Suggested For You" section
    Then I softly see dropdown option "Funding Sources" under the "Suggested For You" section
    Then I softly see dropdown option "Grants" under the "Suggested For You" section
    Then I softly see dropdown option "Key Performance Indicators (KPI)s" under the "Suggested For You" section
    Then I softly see dropdown option "Organizations" under the "Suggested For You" section
    Then I softly see dropdown option "Payment Requests" under the "Suggested For You" section
    Then I softly see dropdown option "Pre-Applications" under the "Suggested For You" section
    Then I softly see dropdown option "Programs" under the "Suggested For You" section
    Then I softly see dropdown option "Monitoring Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reports" under the "Suggested For You" section
    Then I softly see dropdown option "Reviews" under the "Suggested For You" section
    Then I softly see dropdown option "Risk Assessment" under the "Suggested For You" section
    Then I softly see dropdown option "Site Visits" under the "Suggested For You" section
    Then I softly see dropdown option "Strategic Plans" under the "Suggested For You" section
    Then I softly see dropdown option "Awards" under the "Suggested For You" section
    Then I softly see dropdown option "Terms and Conditions" under the "Suggested For You" section
    Then I softly see dropdown option "Tasks" under the "Suggested For You" section

  @389048 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that PO user is able to see the table for extra objects which are present in the search result for subaward module
    When I login to "Grantor" app as "PO" user
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "Grants"
    And I click on "Expand List" button on left navigation for global search
    And I click on "Show more" button on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Email Messages" on left navigation for global search
    Then I softly see the text "Notes" on left navigation for global search
    Then I softly see the text "Tasks" on left navigation for global search
    Then I softly see the text "Folders" on left navigation for global search

  @389053 @389043  @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID) on objects after global search the any record for announcement.
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I wait for "3" seconds
    And I select "Awards" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:AwardEGMSID}"
    And I wait for "2" seconds
#    And I click on "Awards" button on left navigation for global search
    #389043
    Then I softly see "EGMS ID" inside refine by filter
#    Then I softly see "Announcement EGMS ID" inside refine by filter
    Then I softly see "Award Title" inside refine by filter
    Then I softly see "Recipient Organization" inside refine by filter
#    Then I softly see the text "Cumulative Obligation" on left navigation for global search
#    Then I softly see "Min" inside refine by filter
#    Then I softly see "Max" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:AwardEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"

  @389060 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user can sort any objects after global search any record (Eg: EGMS ID, Relevance, Program)
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I select "Awards" from dropdown for Global search
    And I perform quick search inside global search "awards"
#    And I click on "Awards" button on left navigation for global search
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
#    Then I softly see options "Announcement EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Award Title" inside "Relevance" dropdown
    Then I softly see options "Recipient Organization" inside "Relevance" dropdown
#    Then I softly see options "New Obligation" inside "Relevance" dropdown
#    Then I softly see options "Cumulative Obligation" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389314  @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Grant is in the Created state
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:GrantEGMSID}" in global search with id "Grants"
    And I wait for "3" seconds
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail

  @389322 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user redirect to that record when user click on any hyperlink provided (e.g. - EGMS ID , Internal Organization, Owner First Name, Owner Last Name ) on objects after global search the any record for Grant.
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "{SavedValue:GrantEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Draft"
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    And I click on hyperlink for global search containing value "Automation"
    Then I softly see the text containing "{SavedValue:EXE Username}"

  @389323 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that user can sort any objects after global search any record by (Relevance, EGMS ID, Grant Title, Internal organization, External organization,  Project period) Status.
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "Grants"
    Then I softly see options "Relevance" inside "Relevance" dropdown
    Then I softly see options "EGMS ID" inside "Relevance" dropdown
    Then I softly see options "Grant Title" inside "Relevance" dropdown
    Then I softly see options "External Organization" inside "Relevance" dropdown
    Then I softly see options "Project Period" inside "Relevance" dropdown
    Then I softly see options "Number of Awards" inside "Relevance" dropdown
    Then I softly see options "Cumulative Obligation" inside "Relevance" dropdown
    Then I softly see options "Owner First Name" inside "Relevance" dropdown
    Then I softly see options "Owner Last Name" inside "Relevance" dropdown
    Then I softly see options "Status" inside "Relevance" dropdown

  @389324 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by Grant module and Filter/Refine the the result by configured Columns for an Grant.
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I wait for "2" seconds
    And I navigate to "Grants" tab
    And I select "Grants" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:GrantEGMSID}"
    Then I softly see value "{SavedValue:GrantEGMSID}" for title "EGMS ID" inside table "Grants" for global search record
    And I perform quick search inside global search "Grants"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Grant Title" inside refine by filter
    Then I softly see "External Organization" inside refine by filter
    Then I softly see "Project Period" inside refine by filter
    Then I softly see the text "Number of Awards" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see "Owner First Name" inside refine by filter
    Then I softly see "Owner Last Name" inside refine by filter
    And I filter field record by "EXE" by label "Owner Last Name" in left panel for global search
    Then I softly see value "EXE1" for title "Owner Last Name" inside table "Grants" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Awards" on left navigation for global search
    Then I softly see the text "Site Visits" on left navigation for global search
    Then I softly see the text "Grants" on left navigation for global search

  @389327 @389335 @389342 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when Focus Area is in the Created state
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FocusEGMSID"
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
      #389335
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
#    Then I softly see "Owner First Name" inside refine by filter
#    Then I softly see "Owner Last Name" inside refine by filter
    Then I softly see the text "Status" on left navigation for global search
#    And I filter field record by "EXE" by label "Owner Last Name" in left panel for global search
#    Then I softly see value "EXE" for title "Owner Last Name" inside table "Focus Areas" for global search record
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "External Registration" on left navigation for global search
    Then I softly see the text "Chatter" on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
      #389342
    And I click on hyperlink for global search containing value "{SavedValue:FocusEGMSID}"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Draft"

  @389343 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that Non-Owner user doesn't have an edit option in any stage of Focus Area and will get error message on page.
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "FocusEGMSID"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - Draft"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    When I click on "Activate" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click toggle button to select "Focus Areas - All"
    When I perform quick search for "{SavedValue:Automation Runtime Focus Area}" in "---focusarea:-:focusAreaTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Focus Area}" inside table
    And I click on "Deactivate" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Focus Areas" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FocusEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FocusEGMSID}" in global search with id "Focus Areas"
    Then I softly see the text containing "You dont have sufficient access to edit this record"

  @389459 @389460 @389461 @389462 @sprint-2-US-386939  @GlobalSearch @wip
  Scenario Outline: Verify that the record owner is able to edit the access for record when funding decision memo(FDM) is in the Created state
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    And I login to "Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Application Name>" inside table
    And I get the "EGMS ID"
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name  | Due in Days |
      | Pre-Screen | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "5" seconds
    And I save the value from row "1" for column name "EGMS ID" as "AppId1" from flex table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I wait for "2" seconds
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I refresh the page
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    Then I softly can see top right button "Funding Decision Memo" in page detail
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Completed"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "Announcement EGMS ID" as "FDMEGMSID"
#    And I save the field labeled "EGMS ID" as "FDMEGMSID"
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FDMEGMSID}"
    #389459
    And I click on row level action button "Edit" against "{SavedValue:FDMEGMSID}" in global search with id "Funding Decision Memos (FDM)s"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FDMEGMSID}"
    And I click on hyperlink for global search containing value "Funding Decision Memo"
    And I wait for "3" seconds
    #389461
    Then I softly see field "Status" as "Created"
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FDMEGMSID}"
    #389462
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Name" inside refine by filter
    Then I softly see "Announcement Name" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "# of Applications Available for Review" on left navigation for global search
    Then I softly see "Min" inside refine by filter
    Then I softly see "Max" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I select "Funding Decision Memos (FDM)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:FDMEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:FDMEGMSID}" in global search with id "Funding Decision Memos (FDM)s"
   #389460
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @389463 @389464 @sprint-2-US-386939  @GlobalSearch
  Scenario:Verify that the record owner is able to edit the access for record when KPI is in the Created state
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    #389464
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{SavedValue:KPIEGMSID}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    When I click on "Activate" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - All"
    When I perform quick search for "{SavedValue:KPIEGMSID}" in "---keyperformanceindicator:-:kpiTableId---" panel
    And I click on "View" icon for "{SavedValue:KPIEGMSID}" inside table
    And I click on "Deactivate" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:KPIEGMSID}" in global search with id "Key Performance Indicators (KPI)s"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"


  @389465 @389466 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that user is able to expand the result by KPI module and Filter/Refine the the result by configured Columns for an KPI.
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    And I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    When I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    When I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "KPIEGMSID"
    And I navigate to "Planning" tab
    And I select "Key Performance Indicators (KPI)s" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:KPIEGMSID}"
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Domain" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:KPIEGMSID}"
    And I wait for "3" seconds
    #389466
    Then I softly see field "Status" as "Created"

  @389475 @389483  @389486 @389479 @sprint-2-US-386939  @GlobalSearch
  Scenario: Verify that the record owner is able to edit the access for record when Strategic plan is in the Created state
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "StrategyDescription__c"
    And I click on "Save" in the page details
    Then I softly see that "Status" is in "Draft" status
    And I save the field labeled "EGMS ID" as "StrategicEGMSID"
    And I navigate to "Planning" tab
    And I select "Strategic Plans" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
    And I click on row level action button "Edit" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    And I navigate to "Planning" tab
    And I select "Strategic Plans" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
      #389483
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Created By" inside refine by filter
    Then I softly see the text "Status" on left navigation for global search
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Closeouts" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:StrategicEGMSID}"
    And I wait for "3" seconds
     #389486
    Then I softly see field "Status" as "Draft"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Strategic Plans" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:StrategicEGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:StrategicEGMSID}" in global search with id "Strategic Plans"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
      #389479
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Then I softly see that "Status" is in "Draft" status

  @389495 @389502 @389505 @sprint-2-US-386939 @bug-451476
  Scenario: Verify that the Admin is able to edit the access for terms and condition when terms and condition is in the New and active state state
    When I login to "Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "2" seconds
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I click modal button "Close"
    And I pause execution for "3" seconds
    And I navigate to "Planning" tab
    And I select "Terms and Conditions" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:EGMSID}"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
    And I click on row level action button "Edit" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
    Then I see textarea field "Description__c" is editable
    And I navigate to "Planning" tab
    And I select "Terms and Conditions" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:EGMSID}"
        #389502
    Then I softly see "EGMS ID" inside refine by filter
    Then I softly see "Title" inside refine by filter
    Then I softly see "Source" inside refine by filter
    Then I softly see "Effective From" inside refine by filter
    Then I softly see "Mandatory?" inside refine by filter
    Then I softly see "Source" inside refine by filter
    Then I softly see "Status" inside refine by filter
    Then I softly see the text "Refine By" on left navigation for global search
    And I click on "Expand List" button on left navigation for global search
    Then I softly see the text "Announcements" on left navigation for global search
    Then I softly see the text "Programs" on left navigation for global search
    Then I softly see the text "Amendment Requests" on left navigation for global search
    And I click on hyperlink for global search containing value "{SavedValue:EGMSID}"
    And I wait for "3" seconds
       #389505
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I select "Terms and Conditions" from dropdown for Global search
    And I perform quick search inside global search "{SavedValue:EGMSID}"
    And I click on row level action button "Edit" against "{SavedValue:EGMSID}" in global search with id "Terms and Conditions"
    Then I softly see the text containing "You dont have sufficient access to edit this record"