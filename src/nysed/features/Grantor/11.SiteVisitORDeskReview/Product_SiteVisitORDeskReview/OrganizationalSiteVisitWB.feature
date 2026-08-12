@organizationalSiteVisitWB @grantor-regression @grantor-parallel-regression @siteVisit @regression @siteVisit_Lwc_Run @siteAndDeskReview
Feature: Validate all scenarios in Organizational Site Visit Without Background

  @236110 @ValidateSiteVisitFDusercanabletoreassignownershipofsitevisitfromFDtootherFDuserinReviewedstateofsitevisit @sprint-14-US-234219  @reassignment @FieldHistoryExclude
  Scenario: Validate Site Visit FD user can able to reassign ownership of site visit from FD to other FD user in 'Reviewed' state of site visit
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    And I navigate to "Related Log" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "SiteVisit"
    And I enter "Creation" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "Organizational_SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---orgLevelSiteVisits:-:associateContactsId---"
    When I click "Associate" after selection of "{SavedValue:SPI1 Username}" in the table "---orgLevelSiteVisits:-:siteVisitContactsTableId---"
    And I pause execution for "3" seconds
    And I click modal button "Close"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SitevVisitId"
    And I refresh the page
    And I click on "Notify" in the page details
    And I click on "Conduct" in the page details
    And I pause execution for "5" seconds
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:PM Username} | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "{SavedValue:PM Username}" inside table
    And I wait for "3" seconds
    And I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    Then I softly see field "Status" as "Submitted for Review"
    And I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:PM Username}" inside flex table with id "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    And I enter values into fields
      | Value  | Field             |
      | Passed | Rating__c         |
      | Passed | ReviewComments__c |
    When I click modal button "Save"
    And I click on submit review
#    When I close "Site Visit Reviewers" modal by clicking the top right x button
    Then I softly see value "Submitted" for title "Status" inside table "---orgLevelSiteVisits:-:orgPeerReviewTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "As a Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation FD" into field "input-1"
    And I select value "Automation FD1" into field "input-2"
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
    When I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "Automation Permanent Subrecipient Org" in "ActiveAccount" panel
    And I click on "View" icon for "Automation Permanent Subrecipient Org" inside table
    Given I navigate to "Related Log" sub tab
    When I perform quick search for "{SavedValue:SitevVisitId}" in "---orgLevelSiteVisits:-:siteVisitsPanelId---" panel
    And I click on "View" icon for "{SavedValue:SitevVisitId}" inside flex table with id "---orgLevelSiteVisits:-:siteVisitsPanelId---"
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Submit for Approval" in page detail
    And I navigate to "Responsibilities" sub tab
    Then I see value "Automation FD1" for title "Name" inside table "---sitevisits:-:siteVisitOwnerTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I can see top right button "New" in flex table with id "---sitevisits:-:approverSiteVisitTableId---"
    When I navigate to "Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---sitevisits:-:siteVisitAddFilesTableId---"
    Then I can see top right button "New" in flex table with id "---sitevisits:-:siteVisitNotesTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Automation FD1" for title "New Value" inside field history table
    Then I softly see value "Automation FD" for title "Original Value" inside field history table