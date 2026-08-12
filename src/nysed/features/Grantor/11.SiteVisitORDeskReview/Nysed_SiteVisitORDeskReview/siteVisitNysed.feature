@siteVisitsNysed
Feature: Validate all scenarios in the Site Visit

  @491056 @491061 @491062 @491067 @491064 @491066 @VerifythattheInternaluserseeonlyEditactionbuttonattheSiteVisitpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownSiteVisitCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Site Visit page layout and other record flow action buttons at page level action dropdown.: Site Visit: Created
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "NO_RISK_ASSESSMENT-<Filter>"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}" and properties "<Filter>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-<Filter>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:grantName}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "GrantorActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    Then I can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Notify" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name       | Site Visit |
      | <Approval> | Step 1     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I refresh the page
    And I click on "Notify" in the page details
    And I save the field labeled "EGMS ID" as "SiteVisitId"
    Then I softly see field "Status" as "Notified"
      #@491061
    Then I softly can see top right dropdown button "Conduct" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
     #@491062
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I close the tab
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
     #@491064
    Then I can see top right button "Undo" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
     #@491066
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | Filter             | Approval      | SubUser |
      | PM       | Automation PM user | Automation PM | SPI1    |
#      | EXE      | Automation EXE user|Automation EXE| SPA     |

  @491056_1 @491061_1 @491062_1 @491064_1 @491067_1 @491066_1 @VerifythattheInternaluserseeonlyEditactionbuttonattheSiteVisitpagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownSiteVisitCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Site Visit page layout and other record flow action buttons at page level action dropdown.: Site Visit: Created
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default-<Filter>" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-<Filter>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "GrantorActiveGrants" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "GrantorActiveGrants"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "SiteVisitID"
    Then I softly can see top right dropdown button "Notify" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I can see top right button "Save" in page detail
    Then I can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name       | Site Visit |
      | <Approval> | Step 1     |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I refresh the page
    And I click on "Notify" in the page details
    And I save the field labeled "EGMS ID" as "SiteVisitId"
    Then I softly see field "Status" as "Notified"
     #@491061_1
    Then I softly can see top right dropdown button "Conduct" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
      #491062_1
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit for Approval" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I switch to tab number "1"
    And I pause execution for "3" seconds
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I close the tab
    And I refresh the page
    When I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:SiteVisitID}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:SiteVisitID}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
     #@491064_1
    Then I can see top right button "Undo" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "SPI1" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
     #@491066_1
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | Filter             | Approval      | SubUser |
      | PM       | Automation PM user | Automation PM | SPI1    |
#      | EXE      | Automation EXE user|Automation EXE| SPA     |