@deskRevieNysed
Feature: Validate all scenarios in Desk Review

  @491076 @491078 @491079 @491081 @491083 @491085 @VerifythattheInternaluserseeonlyEditactionbuttonattheDeskReviewspagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownDeskReviewsCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Desk Reviews page layout and other record flow action buttons at page level action dropdown.: Desk Reviews: Created
    Given I published "Competitive" type announcement having name "Automation Runtime Award Desk Review" and properties "NO_RISK_ASSESSMENT-<Filter>"
    When I initiated an application review for application "{SavedValue:Automation Runtime Award Desk Review}" on announcement "{SavedValue:Automation Runtime Award Desk Review}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime Award Desk Review}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime Award Desk Review}" and properties "<Filter>"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime Award Desk Review}"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-<Filter>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
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
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Then I softly can see top right dropdown button "Notify" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name       | Desk Review |
      | <Approval> | Step 1      |
    And I save the field labeled "EGMS ID" as "DeskReviewId"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I refresh the page
    And I click on "Notify" in the page details
    Then I softly see status in Progress-bar is "Notified" and is "dark blue"
    Then I softly see field "Status" as "Notified"
      #@491078
    Then I softly can see top right dropdown button "Conduct" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
     #@491079
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
    When I perform quick search for "{SavedValue:DeskReviewId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReviewId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReviewId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
     #@491081
    Then I can see top right button "Undo" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I pause execution for "4" seconds
    #@491083
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly see field "Status" as "Submitted to Grantor"
      #@491085
    Then I softly can see top right dropdown button "Accept And Close" in page detail
    Then I softly can see top right dropdown button "Send back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | Filter             | Approval      | SubUser |
      | PM       | Automation PM user | Automation PM | SPI1    |
#      | EXE      | Automation EXE user|Automation EXE| SPA     |

  @491076_1 @491078_1 @491079_1 @491081_1 @491083_1 @491085_1 @VerifythattheInternaluserseeonlyEditactionbuttonattheDeskReviewspagelayoutandotherrecordflowactionbuttonsatpagelevelactiondropdownDeskReviewsCreated @Sprint-01 @US-490341
  Scenario Outline: Verify that the Internal user see only 'Edit' action button at the Desk Reviews page layout and other record flow action buttons at page level action dropdown.: Desk Reviews: Created
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default-<Filter>" of type "Competitive"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default-<Filter>" of type "Competitive"
    When I login to "As a Grantor" app as "<UserType>" user
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
    And I wait for "3" seconds
    And I get the "EGMS ID"
    #@491076_1
    And I save the field labeled "EGMS ID" as "DeskReview"
    Then I softly can see top right dropdown button "Notify" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name       | Desk Review |
      | <Approval> | Step 1      |
    And I save the field labeled "EGMS ID" as "DeskReviewId"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I refresh the page
    And I click on "Notify" in the page details
    Then I softly see status in Progress-bar is "Notified" and is "dark blue"
    Then I softly see field "Status" as "Notified"
      #@491078_1
    Then I softly can see top right dropdown button "Conduct" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Conduct" in the page details
    Then I softly see status in Progress-bar is "In Progress" and is "dark blue"
     #@491079_1
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
    When I perform quick search for "{SavedValue:DeskReviewId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "{SavedValue:DeskReviewId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I switch to tab number "1"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    And I refresh the page
    And I wait for "5" seconds
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:DeskReviewId}" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:DeskReviewId}" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
     #@491081_1
    Then I can see top right button "Undo" in page detail
    Then I softly can see top right dropdown button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I click on "Send to Subrecipient" in the page details
    Then I softly see status in Progress-bar is "Sent to Subrecipient" and is "dark blue"
    When I re-login to "Grants Portal" app as "<SubUser>" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    Then I softly see field "Status" as "Sent to Subrecipient"
    And I pause execution for "4" seconds
    #@491083_1
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI1 Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Then I softly see field "Status" as "Submitted to Grantor"
      #@491085_1
    Then I softly can see top right dropdown button "Accept And Close" in page detail
    Then I softly can see top right dropdown button "Send back to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType | Filter             | Approval      | SubUser |
      | PM       | Automation PM user | Automation PM | SPI1    |
#      | EXE      | Automation EXE user|Automation EXE| SPA     |
