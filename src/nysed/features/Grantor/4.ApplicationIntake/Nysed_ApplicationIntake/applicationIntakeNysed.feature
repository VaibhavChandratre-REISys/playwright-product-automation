@applicationIntakeNysed @applicationIntake1
Feature: Validate all scenarios in the Application Intake

  @489497 @489503 @VerifythattheSubrecipientUserdoesnotseethequestionLeverageAllowedontheOpportunityLayout @Sprint-00 @US-487276
  Scenario Outline: Verify that the Subrecipient User does not see the question "Leverage Allowed?" on the Opportunity Layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Given I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    Given I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    Given I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block
    And I pause execution for "5" seconds
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    Given I navigate to "Overview" sub tab
    Then I softly cannot see field "Leverage Allowed?" inside page block
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    #489503
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:budgetPeriodTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @489523 @VerifythattheInternalUserdoesnotseetheLeverageAllowedcolumnintheApplicationBudgetCategoriestable @Sprint-00 @US-487276
  Scenario Outline: Verify that the Internal User does not see the "Leverage Allowed?" column in the Application 'Budget Categories' table.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    Given I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see field "Status" as "Created"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly do not see "Other Leverage" in flex table header "---announcement:-:budgetPeriodTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |
#      | FO       | Automation FO user    |
#      | FD       | Automation FD user    |
#      | ADMIN    | Automation ADMIN user |

  @489072 @489074 @489079 @489092 @Sprint-00 @US-487280
  Scenario Outline: Verify that the Internal User sees a new Applications list filter "Applications - Created", is added when the user navigate to Application phase->Left hand Application menu and the Order of the filter should be: i. ApplicationsAlliiApplications
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT-<User>"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AppId"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    Then I softly see toggle option "Applications - All" inside flex table id "---applicationIntake:-:applicationPhaseTableId---"
    Then I softly see toggle option "Applications - Created" inside flex table id "---applicationIntake:-:applicationPhaseTableId---"
    Then I softly see toggle option "Applications - Submitted" inside flex table id "---applicationIntake:-:applicationPhaseTableId---"
    And I wait for "2" seconds
    #489074
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    Then I softly see toggle option "Applications - All" inside flex table id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see toggle option "Applications - Created" inside flex table id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see toggle option "Applications - Submitted" inside flex table id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppId}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    Then I softly see value "Created" for title "Status" against the value "{SavedValue:AppId}" inside table "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    #489079
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AppId}" in flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:AppId}" in flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I click on "View" icon for "{SavedValue:AppId}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I pause execution for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail
    #489092
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "Announcement Overview" page block displayed
    Then I softly see "Application Overview" page block displayed
    Then I softly see "Project Information" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Acknowledgement" page block displayed
    Then I softly see "System Information" page block displayed
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Summary" page block displayed
    Then I softly see "Budget Summary by Focus Area" page block displayed
    Then I softly see "Budget Periods" page block displayed
    Then I softly see "Budget Narrative" page block displayed
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly see "Application Files" page block displayed
    Then I softly see "Notes" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "System Emails" page block displayed
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download As PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |
#      | FO       | Automation FO user    |
#      | FD       | Automation FD user     |
#      | ADMIN    | Automation ADMIN user |

  @491325 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaAnnouncementNameontheBudgetPeriodBudgetCategoriestableoftheApplicationwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedas"No" @Sprint-01 @US-487306
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: Announcement Name" on the Budget Period-->Budget Categories table of the Application when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement Application}" inside rows of enhanced grid id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"

    Examples:
      | User       |
      | GRANTEE_SC |
#      | GRANTEE_VO  |

  @491449 @VerifythattheInternaluserseestheFocusareanameintheformatFocusAreaAnnouncementNameontheBudgetPeriodBudgetCategoriestableoftheApplicationwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasNo @Sprint-01 @US-487306
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: Announcement Name" on the Budget Period-->Budget Categories table of the Application when the Announcements is created with the Focus Area Required? is marked as "No"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit Application" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Edit" in the page details
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | {SavedValue:GRANTEE_SC Username} | Checked        |
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I get the "EGMS ID"
    Then I softly see field "Status" as "Created"
    Given I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see field "Status" as "Created"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement Application}" inside rows of enhanced grid id "---applicationIntake:-:budgetPeriodTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : {SavedValue:Automation Runtime Announcement Application}" inside rows of enhanced grid id "---applicationIntake:-:budgetPeriodTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @492548 @VerifythattheSubrecipientuserseestheFocusareanameintheformatFocusAreaFocusAreaNameontheBudgetPeriodBudgetCategoriestableoftheApplicationwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasYes @Sprint-01 @US-487306
  Scenario Outline: Verify that the Subrecipient user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Application when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---applicationReview:-:budgetTableId---"

    Examples:
      | User       |
      | GRANTEE_SC |
#      | GRANTEE_VO  |

  @492551 @VerifythattheInternaluserseestheFocusareanameintheformatFocusAreaFocusAreaNameontheBudgetPeriodBudgetCategoriestableoftheApplicationwhentheAnnouncementsiscreatedwiththeFocusAreaRequiredismarkedasYes @Sprint-01 @US-487306
  Scenario Outline: Verify that the Internal user sees the Focus area name in the format "Focus Area: <Focus Area Name>" on the Budget Period-->Budget Categories table of the Application when the Announcements is created with the Focus Area Required? is marked as "Yes"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    And I wait for "5" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | {SavedValue:GRANTEE_SC Username} | Checked        |
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I get the "EGMS ID"
    Then I softly see field "Status" as "Created"
    Given I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see field "Status" as "Created"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---applicationIntake:-:budgetPeriodTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    When I click on "Submit Application" in the page details
    Given I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see status in Progress-bar is "Submitted" and is "dark blue"
    And I navigate to "Budget" sub tab
    And I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area" inside rows of enhanced grid id "---applicationIntake:-:budgetPeriodTableId---"

    Examples:
      | UserType | User               |
      | PM       | Automation PM user |
#      | EXE      | Automation EXE user   |
#      | PO       | Automation PO user    |

  @514888 @Sprint-07 @US-496790 @M04
  Scenario: Verify that the Grantee user cannot see below fields in Financials Tab->Budget Summary section for Competitive and Directed announcement: Waiver, Allocation Amount, Reallocation
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_CE" user
    And I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:publishedOpputunityTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:publishedOpputunityTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Waiver" inside page block
    Then I softly cannot see field "Allocation Amount" inside page block
    Then I softly cannot see field "Reallocation" inside page block
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Waiver" inside page block
    Then I softly cannot see field "Allocation Amount" inside page block
    Then I softly cannot see field "Reallocation" inside page block
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:Automation Runtime Announcement Application}" into field "Title__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Waiver" inside page block
    Then I softly cannot see field "Allocation Amount" inside page block
    Then I softly cannot see field "Reallocation" inside page block

  @512201 @512173 @512025 @514898 @512109 @516659 @512283 @Sprint-07 @US-496790 @M04
  Scenario: Verify that the Grantee user sees below fields are added in Financials Tab->Budget Summary section and amount is populated from formula announcement: Waiver Allocation Amount Reallocation
  |Verify that the Grantee user sees below fields are hidden at opportunity layout->Overview Tab->Opportunity Specific Settings Section. a. Program Income Allowed? b. Pre-Application Required? c. Are Expense Details Required on Reimbursements? |
  |Verify that the Grantee user sees below fields are hidden on opportunity layout->Overview Tab->Opportunity Information Section: a. Funding Organization b. Funding Organization Division/Office c. Program Type|
  |Verify that the Grantee user sees below fields are not hidden at opportunity layout->Overview Tab->Opportunity Specific Settings Section:, if budget type is selected as 'FS-10': Focus Area Required? Allocation Level|
  |Verify that the Grantee user sees below reference fields are shown on opportunity layout->Overview Tab->Opportunity Information Section: a. Fund Code b. Year c. Fund Year|
  |Verify that the Grantee user sees Federal/NGO Program section is hidden on opportunity layout->Overview Tab|
  |Verify that the Grantee user sees in Financials Tab->Budget Categories are populated correctly as per FS-10 budget type.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_NO_ZERO_ALLOCATION"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_CE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Program Income Allowed?" inside page block
    Then I softly cannot see field "Pre-Application Required?" inside page block
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block
    Then I softly cannot see field "Funding Organization" inside page block
    Then I softly cannot see field "Funding Organization Division/Office" inside page block
    Then I softly cannot see field "Program Type" inside page block
    Then I softly see field "Focus Area Required?" inside page block
    Then I softly see field "Allocation Level" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Year" inside page block
    Then I softly see field "Fund Year" inside page block
    Then I softly do not see "Federal/NGO Program" page block displayed
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             | Budget Category Code |
      | Professional Staff Salaries | 15                   |
      | Support Staff Salaries      | 16                   |
      | Purchased Services          | 40                   |
      | Supplies and Materials      | 45                   |
      | Travel Expenses             | 46                   |
      | Employee Benefits           | 80                   |
      | Indirect Cost               | 90                   |
      | BOCES Purchased Services    | 49                   |
      | Minor Remodeling            | 30                   |
      | Equipment                   | 20                   |
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Program Income Allowed?" inside page block
    Then I softly cannot see field "Pre-Application Required?" inside page block
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block
    Then I softly cannot see field "Funding Organization" inside page block
    Then I softly cannot see field "Funding Organization Division/Office" inside page block
    Then I softly cannot see field "Program Type" inside page block
    Then I softly see field "Focus Area Required?" inside page block
    Then I softly see field "Allocation Level" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Year" inside page block
    Then I softly see field "Fund Year" inside page block
    Then I softly do not see "Federal/NGO Program" page block displayed
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
    Then I see the following rows under the following headers in table with id "---announcement:-:granteeAnnouncementBudgetCategory---" :
      | Budget Category             | Budget Category Code |
      | Professional Staff Salaries | 15                   |
      | Support Staff Salaries      | 16                   |
      | Purchased Services          | 40                   |
      | Supplies and Materials      | 45                   |
      | Travel Expenses             | 46                   |
      | Employee Benefits           | 80                   |
      | Indirect Cost               | 90                   |
      | BOCES Purchased Services    | 49                   |
      | Minor Remodeling            | 30                   |
      | Equipment                   | 20                   |
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Program Income Allowed?" inside page block
    Then I softly cannot see field "Pre-Application Required?" inside page block
    Then I softly cannot see field "Are Expense Details Required on Reimbursements?" inside page block
    Then I softly cannot see field "Funding Organization" inside page block
    Then I softly cannot see field "Funding Organization Division/Office" inside page block
    Then I softly cannot see field "Program Type" inside page block
    Then I softly see field "Focus Area Required?" inside page block
    Then I softly see field "Allocation Level" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Year" inside page block
    Then I softly see field "Fund Year" inside page block
    Then I softly do not see "Federal/NGO Program" page block displayed
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---applicationIntake:-:formulaAllocatedAmountTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
    Then I see the following rows under the following headers in table with id "---announcement:-:granteeAnnouncementBudgetCategory---" :
      | Budget Category             | Budget Category Code |
      | Professional Staff Salaries | 15                   |
      | Support Staff Salaries      | 16                   |
      | Purchased Services          | 40                   |
      | Supplies and Materials      | 45                   |
      | Travel Expenses             | 46                   |
      | Employee Benefits           | 80                   |
      | Indirect Cost               | 90                   |
      | BOCES Purchased Services    | 49                   |
      | Minor Remodeling            | 30                   |
      | Equipment                   | 20                   |

  @512270 @512292 @512276 @Sprint-07 @US-496790 @M04
  Scenario: Verify that the Grantee user sees below fields are hidden at opportunity layout->Overview Tab->Opportunity Specific Settings Section:, if budget type is selected as 'Lump Sum': Focus Area Required? Allocation Level
  |Verify that the Grantee user sees below fields are set to default value at opportunity layout->Financial Tab->Budget Specific Settings Section:, if budget type is selected as 'Lump Sum': Budgeting is Required for: Only First Budget Period Is a Detailed...|
  |Verify that the Grantee user sees in Financials Tab->Budget Categories are populated correctly as per Lump Sum budget type.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_CE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Allocation Level?" inside page block
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Budgeting is Required for: Only First Budget Period" inside page block
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?: No" inside page block
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category | Budget Category Code |
      | Lump Sum        | 0                    |
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Allocation Level?" inside page block
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Budgeting is Required for: Only First Budget Period" inside page block
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?: No" inside page block
    Then I see the following rows under the following headers in table with id "---announcement:-:granteeAnnouncementBudgetCategory---" :
      | Budget Category | Budget Category Code |
      | Lump Sum        | 0                    |
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Allocation Level?" inside page block
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Budgeting is Required for: Only First Budget Period" inside page block
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?: No" inside page block
    Then I see the following rows under the following headers in table with id "---announcement:-:granteeAnnouncementBudgetCategory---" :
      | Budget Category | Budget Category Code |
      | Lump Sum        | 0                    |

  @534366 @535673 @Sprint-13 @US-527480 @M04
  Scenario Outline: Verify that the grantee users see that 'Professional Salaries' is renamed to 'Professional Staff Salaries' and 'BOCES Services' is renamed to 'BOCES Purchased Services'.
  |Verify that the grantee users see that the help text of the Budget Type field changed to "Budget Type: (Lump Sum or FS-10)"|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUS_NO_ZERO_ALLOCATION"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Budget Type"
    Then I softly see "Budget Type: (Lump Sum or FS-10)" shown as help text
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Budget Type"
    Then I softly see "Budget Type: (Lump Sum or FS-10)" shown as help text
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:granteeAnnouncementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Budget Type"
    Then I softly see "Budget Type: (Lump Sum or FS-10)" shown as help text
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---announcement:-:granteeAnnouncementBudgetCategory---" :
      | Budget Category             |
      | Professional Staff Salaries |
      | BOCES Purchased Services    |

    Examples:
      | UserType   |
      | GRANTEE_CE |

  @533975 @US-491865 @Sprint-10 @M05
  Scenario Outline:Verify that the Grantee User cannot see the following fields in the Application Layout->Budget tab->Budget Summary section, if the budget type is Lump sum.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
      #533975
    Then I softly see field "Waiver" inside page block
    Then I softly see field "Allocation Amount" inside page block
    Then I softly see field "Reallocation" inside page block
    Then I softly see field "Total Available" inside page block
    Then I softly see field "Total Budgeted Amount" inside page block
    Then I softly cannot see field "Indirect Rate" inside page block
    Then I softly cannot see field "Maximum Indirect Allowed" inside page block
    Then I softly cannot see field "Budgeted Direct Amount" inside page block
    Then I softly cannot see field "Requested Indirect Amount" inside page block

    Examples:
      | UserType   |
      | GRANTEE_CE |
#        | GRANTEE_SC |

  @526488 @526480_Users @526481_Users @Sprint-10 @US-522312 @M05
  Scenario Outline:  Verify that grantee users other than 'Create and Edit' and 'Submit and Certify' role cannot see the Other Leverage column in Budget Categories and cannot edit the checkbox field in the Acknowledgement and Chief Administrator's Certification. - Formula BA
  |Verify that grantee users (GRANTEE_LEA GRANTEE_VO GRANTEE_NU) see the following field-level changes and sequence in the Primary Place of Performance section under the Overview tab on the Application layout. - Formula By Applicant|
  |Verify that grantee users (GRANTEE_LEA GRANTEE_V0 GRANTEE_NU) see the following field updates and that the fields are displayed in a 3-column view in the Opportunity Overview section under the Overview tab on the Application layout. - Formula By Applicant|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_FOCUSNO_NO_ZERO_ALLOCATION"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Acknowledgement" is not editable
    Then I softly see field "Street" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "State" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "Country" inside page block
    Then I do not see below fields in "Primary Place of Performance" page block
      | Congressional district     |
      | 4-Digit Zip Code Extension |
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Add/View Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Chief Administrator's Certification" page block displayed with apostrophe in value
    Then I softly see field "Acknowledgement" is not editable
    Then I softly see field "Submitted By" is not editable
    Then I softly see field "Submitted On" is not editable
    Then I softly see the text containing "By signing this report, I certify to the best of my knowledge and belief that the report is true, complete, and accurate, and the expenditures, disbursements, and cash receipts are for the purposes and objectives set forth in the terms and conditions of the Federal (or State) award. I am aware that any false, fictitious, or fraudulent information, or the omission of any material fact, may subject me to criminal, civil, or administrative penalties for fraud, false statements, false claims, or otherwise. (U.S. Code Title 18, Section 1001 and Title 31, Sections 3729-3730 and 3801-3812)."
    And I navigate to "Overview" sub tab
    Then I softly see field "Opportunity ID" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Match Required?" inside page block
    Then I softly see field "Required Match %" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Year" inside page block
    Then I softly see field "Announcement Fund Year" inside page block
    Then I do not see below fields in "Opportunity Overview" page block
      | Program Income Allowed? |

    Examples:
      | UserType    |
      | GRANTEE_LEA |
#      | GRANTEE_VO |
#      | GRANTEE_NU  |

  @526526 @528572 @526492_Users @526498_Users @526368 @526133 @530101 @530103 @Sprint-10  @Sprint-11 @US-522312 @US-494451 @US-504881 @M05
  Scenario Outline:  Verify that grantee users other than 'Create and Edit' and 'Submit and Certify' role cannot see the Other Leverage column in Budget Categories and cannot edit the checkbox field in the Acknowledgement and Chief Administrator's Certification.- Formula BAFA
  |Verify that the internal users see the following field updates and that the fields are displayed in a 3-column view in the Announcement Overview section under the Overview tab on the Application layout.|
  |Verify that grantee users (GRANTEE_LEA GRANTEE_VO GRANTEE_NU) see the following field-level changes and sequence in the Primary Place of Performance section under the Overview tab on the Application layout. - Formula By Applicant and Focus Area|
  |Verify that grantee users (GRANTEE_LEA GRANTEE_VO GRANTEE_NU) see the following field updates and that the fields are displayed in a 3-column view in the Opportunity Overview section under the Overview tab on the Application layout. - Formula By Applicant and Focus Area|
  |Verify that grantee users cannot see the specified columns under Budget Categories and can enter budget only at the Budget Category level, if 'Is a Detailed Budget Required on the Application?' is set to No. - Formula By Applicant and Focus Area|
  |Verify that grantee users other than those with the 'Create and Edit' and the 'Submit and Certify' roles cannot enter a budget at the Budget Category level if 'Is a Detailed Budget Required on the Application?' is set to No.|
  |Verify that internal users cannot see the Proposal tab on the Application layout, as it is hidden. |
  |Verify that internal users see the 'Goals and Objectives' and 'Key Performance Indicators' sections are moved to the Overview tab.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANTANDFOCUSAREA__NO_ZERO_ALLOCATION"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    #526368
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly see "Budget Category" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget Category Code" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Project Cost" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Include In the Indirect cost calculation" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Line Item available if applicable" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Add/View Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "Edit" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "Undo" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name          | Budget | Cash Match | Non-Cash Match |
      | Support Staff Salaries | 500    | 100        | 100            |
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly see field "Acknowledgement" is not editable
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    #526133
    Then I softly see "Budget Category" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget Category Code" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Project Cost" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Include In the Indirect cost calculation" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Line Item available if applicable" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Add/View Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Add/View Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Chief Administrator's Certification" page block displayed with apostrophe in value
    Then I softly see field "Acknowledgement" is not editable
    Then I softly see field "Submitted By" is not editable
    Then I softly see field "Submitted On" is not editable
    Then I softly see the text containing "By signing this report, I certify to the best of my knowledge and belief that the report is true, complete, and accurate, and the expenditures, disbursements, and cash receipts are for the purposes and objectives set forth in the terms and conditions of the Federal (or State) award. I am aware that any false, fictitious, or fraudulent information, or the omission of any material fact, may subject me to criminal, civil, or administrative penalties for fraud, false statements, false claims, or otherwise. (U.S. Code Title 18, Section 1001 and Title 31, Sections 3729-3730 and 3801-3812)."
    And I navigate to "Overview" sub tab
    Then I softly see field "Street" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "State" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "Country" inside page block
    Then I do not see below fields in "Primary Place of Performance" page block
      | Congressional district     |
      | 4-Digit Zip Code Extension |
    Then I softly see field "Opportunity ID" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Match Required?" inside page block
    Then I softly see field "Required Match %" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Year" inside page block
    Then I softly see field "Fund Year" inside page block
    Then I do not see below fields in "Opportunity Overview" page block
      | Program Income Allowed? |
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see field "Status" as "Created"
    And I navigate to "Overview" sub tab
    Then I softly see field "Announcement ID" inside page block
    Then I softly see field "Announcement Title" inside page block
    Then I softly see field "Announcement Type" inside page block
    Then I softly see field "Budget Category Package" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Project Period Start Date" inside page block
    Then I softly see field "Project Period End Date" inside page block
    Then I softly see field "Subrecipient Match Required?" inside page block
    Then I softly see field "Required Match %" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Year" inside page block
    Then I softly see field "Fund Year" inside page block
    Then I do not see below fields in "Announcement Overview" page block
      | Program Income Allowed? |
    #530101
    Then I softly cannot see "Proposal" sub tab at view detail page
    #530103
    And I navigate to "Overview" sub tab
    Then I see only the following ordered page blocks :
      | Information                  |
      | Primary Place of Performance |
      | Announcement Overview        |
      | Application Overview         |
      | Project Information          |
      | Contacts                     |
      | Goals and Objectives         |
      | Key Performance Indicators   |
      | Acknowledgement              |
      | System Information           |

    Examples:
      | UserType    |
      | GRANTEE_LEA |
#      | GRANTEE_VO |
#      | GRANTEE_NU  |

  @526487 @528571 @526480 @526498 @526131 @Sprint-10 @US-522312 @US-494451 @M05
  Scenario Outline:  Verify that grantee users with the 'Create and Edit' and 'Submit and Certify' roles see that a new section, 'Chief Administrator's Certification' is added after the Budget Narrative section under the Budget tab on the Application layout. - Formula BA
  |Verify that grantee users see the following fields are editable and required to save in the Primary Place of Performance section under the Overview tab on the Application layout.|
  |Verify that grantee users (GRANTEE_CE GRANTEE_SC) see the following field-level changes and sequence in the Primary Place of Performance section under the Overview tab on the Application layout. - Formula By Applicant|
  |Verify that grantee users (GRANTEE_CE GRANTEE_SC) see the following field updates and that the fields are displayed in a 3-column view in the Opportunity Overview section under the Overview tab on the Application layout. - Formula By Applicant and Focus Area|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT__NO_ZERO_ALLOCATION"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Budget" sub tab
    Then I softly see "Chief Administrator's Certification" page block displayed with apostrophe in value
    Then I softly see field "Acknowledgement" is not editable
    Then I softly see field "Submitted By" is not editable
    Then I softly see field "Submitted On" is not editable
    Then I softly see the text containing "By signing this report, I certify to the best of my knowledge and belief that the report is true, complete, and accurate, and the expenditures, disbursements, and cash receipts are for the purposes and objectives set forth in the terms and conditions of the Federal (or State) award. I am aware that any false, fictitious, or fraudulent information, or the omission of any material fact, may subject me to criminal, civil, or administrative penalties for fraud, false statements, false claims, or otherwise. (U.S. Code Title 18, Section 1001 and Title 31, Sections 3729-3730 and 3801-3812)."
    And I navigate to "Overview" sub tab
    Then I softly see field "Acknowledgement" is not editable
    When I clear the value from field "Addressline1__c"
    When I clear the value from field "City__c"
    When I clear the value from field "Zip4__c"
    When I enter value "MO" into field "State__c"
    When I enter value "IN" into field "State__c"
    When I enter value "CO" into field "State__c"
    When I enter value "--None--" into field "State__c"
    When I clear the value from field "Country__c"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To save, Street is required in the Overview tab under the Primary Place of Performance section.   |
      | To save, City is required in the Overview tab under the Primary Place of Performance section.     |
      | To save, State is required in the Overview tab under the Primary Place of Performance section.    |
      | To save, Zip Code is required in the Overview tab under the Primary Place of Performance section. |
      | To save, Country is required in the Overview tab under the Primary Place of Performance section.  |
    When I enter value "K.B.Street" into field "Addressline1__c"
    When I enter value "Chicago" into field "City__c"
    When I enter value "34565" into field "Zip4__c"
    When I enter value "USA" into field "Country__c"
    When I enter value "NY" into field "State__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "5" seconds
    Then I softly see field "Zip Code" as "34565"
    Then I softly see field "Country" as "USA"
    Then I softly see field "Street" as "K.B.Street"
    Then I softly see field "City" as "Chicago"
    Then I softly see field "State" as "NY"
    Then I softly can see top right button "Edit" in page detail
    Then I softly see field "Acknowledgement" is not editable
    Then I softly see field "Street" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "State" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "Country" inside page block
    Then I do not see below fields in "Primary Place of Performance" page block
      | Congressional district     |
      | 4-Digit Zip Code Extension |
    Then I softly see field "Opportunity ID" inside page block
    Then I softly see field "Opportunity Title" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Match Required?" inside page block
    Then I softly see field "Required Match %" inside page block
    Then I softly see field "Fund Code" inside page block
    Then I softly see field "Year" inside page block
    Then I softly see field "Fund Year" inside page block
    Then I do not see below fields in "Opportunity Overview" page block
      | Program Income Allowed? |
    #526131
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly see "Budget Category" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget Category Code" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Project Cost" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Include In the Indirect cost calculation" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Line Item available if applicable" in flex table header "---applicationIntake:-:budgetPeriodTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC|

  @526484 @526482 @526124 @530098 @530099 @Sprint-10 @Sprint-11 @US-522312 @US-494451 @US-504881 @M05
  Scenario:  Verify that grantee users with the 'Create and Edit' and 'Submit and Certify' role see the Other Leverage column is removed at the category and line-item level in the Budget Categories under the Budget tab on the Application layout. - Formula By Applicant
  |Verify that grantee users with 'Create and Edit' and 'Submit and Certify' roles cannot edit checkbox field in the Acknowledgement section under the Overview tab on the Application layout. - Formula By Applicant|
  |Verify that grantee users can see that the Budget Categories and Budget Category Code at the application level are populated according to the related announcement budget and selected settings when Subrecipient Match Required? is set to Yes. - Formula BA|
  |Verify that grantee users cannot see the Proposal tab, along with the Technical Proposal section, and all the validations related to these fields are disabled. - Formula (By Applicant)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Acknowledgement" is not editable
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    #526124
    Then I softly see "Budget Category" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget Category Code" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Total Project Cost" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId----OperatingCost"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 900        | 0              |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    #530099
    And I refresh the page
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Target Values for all Key Performance Indicators. |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #530098
    Then I softly cannot see "Proposal" sub tab at view detail page

  @NYSED-2639 @NYSED-2899 @NYSED-2914 @NYSED-2913 @534008 @NYSED-2905 @NYSED-2904 @NYSED-2902 @NYSED-2904 @Sprint-24 @US-NYSED-1852 @M05
  Scenario Outline: Verify that grantee user can see 'Professional Staff Salaries' budget category under the budget categories table
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2639 #NYSED-2899 #534008 #NYSED-2914
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Support Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Supplies and Materials" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Indirect Cost" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Minor Remodeling" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly see value "Equipment" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    #NYSED-2899
    Then I softly see value "16" for title "Budget Category Code" inside table "---applicationReview:-:budgetTableId---"
    #534008 #NYSED-2914
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    #NYSED-2904
    Then I see only the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    #NYSED-2913
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $10                    | $10                                                | $1,000           | $100       | $100           | $200        | $1,200             |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 500              | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2905
    Then I softly see value "Support Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2905
    Then I softly see value "Support Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 500              | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #NYSED-2902
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    #NYSED-2902
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |
#      | GRANTEE_LEA |
#      | GRANTEE_VO  |

  @NYSED-2640 @NYSED-2650 @NYSED-2649 @NYSED-2720 @NYSED-2644 @NYSED-2643 @NYSED-2642 @532222 @NYSED-2806 @NYSED-2803 @US-504882 @Sprint-12 @Sprint-24 @US-NYSED-1855 @US-NYSED-1851 @M05
  Scenario Outline: Verify that grantee user can see the inline action name as 'View/Add Line Item Details', under the budget categories table on created application, if 'Is a Detailed Budget Required on the Application? - Yes' on the announcement
  |Verify that when grantee user clicks on the 'View/Add Line Item Details' action then related modal gets open with correct actions and fields|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2640
    Then I softly can see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2650
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    #NYSED-2720
    Then I see only the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 10000            | 100        | 100            |
    #NYSED-2649
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          | 20             |
    #NYSED-2644
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 20             | 10.00 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 500              | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 500                  | 200        | 200            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2643
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2806
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2643
    Then I softly see value "Professional Staff Salaries" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2806
    Then I softly see value "Travel Expenses" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                          | Is Key Contact |
      | Automation Grantee_CreateEdit | Checked        |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #532222
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    #NYSED-2642
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    #NYSED-2803
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2646 @NYSED-2647 @NYSED-2645 @NYSED-2721 @NYSED-2648 @NYSED-2638 @Sprint-24 @US-NYSED-1851 @M05
  Scenario Outline: Verify that the grantee user see Professional Staff Salaries, Application Budget Categories modal, having a 'Full-Time Equivalent' column ( Editable, Required, Number Field up to 2 decimal places, cannot negative and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Professional Staff Salaries"
    Then I softly can see "15 - Professional Staff Salaries" sub tab at view detail page
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             |     | 10                     | 10                                                 | 10000            | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             |     | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Position Title          | -20 |
    #NYSED-2646
    Then I softly see the following messages in the page details contains:
      | FTE cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Position Title          | ee  |
    #NYSED-2646
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             |     | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | FTE    |
      | Position Title          | 10.877 |
    #NYSED-2646
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.87 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 |                  | 88.988     | 88.988         |
    #NYSED-2647
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | ee               | 88.988     | 88.988         |
    #NYSED-2647
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | -200             | 88.988     | 88.988         |
    #NYSED-2647
    Then I softly see the following messages in the page details contains:
      | Projected Salary cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | 88.988           | 88.988     | 88.988         |
    #NYSED-2646 #NYSED-2647 #NYSED-2638
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | 88.988           | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                   |                | 20.00 | $177,976               | $20                                                | $177,976         | $177,976   | $177,976       | $355,952    | $533,928           |
    #NYSED-2646 #NYSED-2647
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget   | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $177,976 | $177,976   | $177,976       | $355,952    | $533,928           |
      | Action menu | Support Staff Salaries      | 16                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0       | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $177,976 | $177,976   | $177,976       | $355,952    | $533,928           |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | ee                     | 10                                                 | 10000            | 100        | 100            |
    #NYSED-2645
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 |                        | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | -20                    |
    #NYSED-2645
    Then I softly see the following messages in the page details contains:
      | Annualized Rate of Pay cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | 88.988                 |
    #NYSED-2645
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | 88.988           |            |                |
    #NYSED-2721
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | Cash       | Non-Cash       |
    #NYSED-2721
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | -100       | -100           |
    #NYSED-2645 #NYSED-2721
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | 88.988     | 88.988         |
    #NYSED-2645 #NYSED-2721
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      |                         | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    #NYSED-2648
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | {SavedValue:Char256}    | 10             | 10  | 88.988                 | 10                                                 | 88.988           | 88.988     | 88.988         |
    #NYSED-2645
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}    | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | {SavedValue:Char255}    | 20             |
    #NYSED-2645
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}    | 20             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2719 @NYSED-2903 @NYSED-2804 @NYSED-2861 @US-529701 @US-529643 @US-529684 @Sprint-24 @US-NYSED-1855 @US-NYSED-1859 @M05 @Bug-Ticket-538472
  Scenario Outline:Verify that if Announcement owner has selected 'Sub-recipient Match Required- No' setting then on application , the grantee user can not see columns- Cash Match, Non-Cash Match and Total Match on budget table and categories modal - Professional Staff Sala
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES_NO_MATCH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2719 #NYSED-2903
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2719
    Then I see only the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2903
    Then I see only the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2804
    Then I see only the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2861
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2861
    Then I see only the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see column header "Actions" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Vendor" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---applicationIntake:-:EquipmentCategoryTableId---"


    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2641 @NYSED-2900 @NYSED-2802 @NYSED-2836 @NYSED-2541 @NYSED-2859 @Sprint-24 @US-NYSED-1852 @US-NYSED-1855 @US-NYSED-1851 @M05 @BugTicket-NYSED-3587
  Scenario Outline:Verify that grantee user cannot see the inline action name as 'View/Add Line Item Details', under the budget categories table if 'Is a Detailed Budget Required on the Application? - No' on the announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2900
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2641
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Professional Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Professional Staff Salaries" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2802
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Travel Expenses" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2836
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Indirect Cost" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2541
    Then I softly cannot see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "BOCES Purchased Services" in flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2859
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Minor Remodeling" in flex table with id "---applicationReview:-:budgetTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @526348 @532223 @526038 @US-491860 @US-491865 @Sprint-10 @US-504882 @Sprint-11 @M05
  Scenario Outline:Verify that Grantee User can see the following fields populated in the Application Layout->Budget tab->Budget Summary by focus area section, for Formula - By Applicant and Focus Area announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BYAPPLICANTFOCUSAREA_INDIRECTRATE_NOTALLOWED"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    #526038
    Then I softly see field "Indirect Rate (%)" as "0.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$0"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 500    | 100        | 100            |
    And I refresh the page
    And I pause execution for "5" seconds
      #526348 #526038
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Actions     | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
      | Action menu | Automation Permanent Focus Area | N/A    | $1,000            | $0           | $1,000          | $0                       | $500                   | $500                      | $1,000                |
      |             |                                 |        | $1,000            | $0           | $1,000          | $0                       | $500                   | $500                      | $1,000                |
    And I wait for "2" seconds
    #532223
    Then I softly cannot see top right button "Submit Application" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #532223
    Then I softly cannot see top right button "Submit Application" in page detail
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #532223
    Then I softly cannot see top right button "Submit Application" in page detail

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC |

  @532226 @532235 @US-504882 @Sprint-11 @M05 @Bug-Ticket-541229
  Scenario Outline:Verify that the 'Submit and Certify' Role user see the validation if the Requested Indirect Amount is greater than the Maximum Indirect Allowed - Formula: By Applicant and Focus Area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 1000   | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Submit Application" in the page details
    #532226
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 0      | 0          | 0              |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #532235
    Then I softly see field "Acknowledgement" as "True"
    Then I softly see field "Submitted By" as "Automation Grantee_SubmitCertify"
    Then I softly see field "Submitted On" is getting updated with todays date
    And I navigate to "Overview" sub tab
    Then I softly see field "Acknowledgement" as "True"
    Then I softly see field "Submitted By" as "Automation Grantee_SubmitCertify"
    Then I softly see field "Submitted On" is getting updated with todays date

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @532225 @US-504882 @Sprint-11 @M05
  Scenario Outline:Verify that the 'Submit and Certify' Role user see the validation if the Requested Indirect Amount is greater than the Maximum Indirect Allowed - Formula: By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULA_BYAPPLICANT1_FOCUSAREA_NO_INDIRECTRATE_UNRESTRICTED"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 500    | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Submit Application" in the page details
    #532225
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @532234 @532191 @US-527857 @US-504882 @Sprint-11 @M05
  Scenario Outline:Verify that the 'Submit and Certify' Role user see the changes below when the application is successfully submitted to the grantor and the status changes to 'Submitted to Grantor' - Formula- By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULA_BYAPPLICANT1_FOCUSAREA_NO_INDIRECTRATE_UNRESTRICTED"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 0      | 0          | 0              |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    #532191
    Then I softly see field "Status" as "Submitted to Grantor"
    #532234
    Then I softly see field "Acknowledgement" as "True"
    Then I softly see field "Submitted By" as "Automation Grantee_SubmitCertify"
    Then I softly see field "Submitted On" is getting updated with todays date
    And I navigate to "Overview" sub tab
    Then I softly see field "Acknowledgement" as "Checked"
    Then I softly see field "Submitted By" as "Automation Grantee_SubmitCertify"
    Then I softly see field "Submitted On" is getting updated with todays date

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @526288 @Sprint-12 @US-491865 @M05
  Scenario Outline:  Verify that Grantee User can see the following fields populated in the Application Layout->Budget tab->Budget Summary section, for Formula - By Applicant announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Title                   | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Title       | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "4" seconds
    #526288
    Then I softly see field "Waiver" as "N/A"
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$100"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$100"
    Then I softly see field "Total Budgeted Amount" as "$1,100"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @526034 @530083 @US-500144 @Sprint-11 @US-491860 @Sprint-10 @M05
  Scenario Outline: Verify that Grantee User can see Indirect Rate is populated as 0% in the application when the Indirect Rate Type is 'Not Allowed' for Formula (By Applicant) announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BYAPPLICANT3_DETAILBUDGET_YES_INDIRECTRATE_NOTALLOWED"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    #530083
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    #526034
    Then I softly see field "Indirect Rate (%)" as "0.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$0"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @526291 @533488 @US-532447 @US-491865 @Sprint-12 @M05 @Bug-Ticket-539143
  Scenario Outline: Verify that Grantee User can see the following fields populated in the Application Layout->Budget tab->Budget Summary by focus area section, for Formula - By Applicant and Focus Area announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I wait for "3" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I enter value "20.87" into field "Indirect_Rate__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I click on "Remove" icon for "Employee Benefits" inside flex table with id "---announcement:-:announcementBudgetCategory---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category          | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | BOCES Purchased Services | Yes                                  | 34000                          |
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category  | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Minor Remodeling | Yes                                  | 12000                          |
    And I edit the following rows inline in flex table with id "---announcement:-:announcementBudgetCategory---" by clicking "Edit" :
      | Budget Category | Include In Indirect Cost Calculation | Line Item Level, If Applicable |
      | Equipment       | Yes                                  | 1500                           |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount2---" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Pre-Encumbrance |
      | {SavedValue:fundingAccount2} | 100             |
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    And I wait for "1" seconds
    And I click toggle button to select "Announcements - All"
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "No" into field "DetailedBudgetingRequired__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Given I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I wait for "1" seconds
    And I "Approve" in the approval decision
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 1500              |
    When I re-login to "Grants Portal" app as "<ReloginUser>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
      | Support Staff Salaries      | 1000   | 450        | 450            |
      | Purchased Services          | 1000   | 450        | 450            |
      | Supplies and Materials      | 1000   | 450        | 450            |
      | Travel Expenses             | 1000   | 450        | 450            |
      | Indirect Cost               | 1000   | 450        | 450            |
      | BOCES Purchased Services    | 1000   | 450        | 450            |
      | Minor Remodeling            | 1000   | 450        | 450            |
      | Equipment                   | 1000   | 450        | 450            |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    #532447
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | Support Staff Salaries      | 16                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | Purchased Services          | 40                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | Supplies and Materials      | 45                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | Travel Expenses             | 46                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | Indirect Cost               | 90                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | BOCES Purchased Services    | 49                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | Minor Remodeling            | 30                   | $1,000 | $450       | $450           | $900        | $1,900             |
      | Action menu | Equipment                   | 20                   | $1,000 | $450       | $450           | $900        | $1,900             |
      |             | Grand Total                 |                      | $9,000 | $4,050     | $4,050         | $8,100      | $17,100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---" :
      | Actions     | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available | Maximum Indirect Allowed | Budgeted Direct Amount | Requested Indirect Amount | Total Budgeted Amount |
      | Action menu | Automation Permanent Focus Area | N/A    | $1,500            | $0           | $1,500          | $800                     | $8,000                 | $1,000                    | $9,000                |
      |             |                                 |        | $1,500            | $0           | $1,500          | $800                     | $8,000                 | $1,000                    | $9,000                |
    Then I softly can see row level action button "No Actions Available" against "Automation Permanent Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

    Examples:
      | UserType | ReloginUser |
      | PM       | GRANTEE_SC  |
#      | PM       | GRANTEE_CE  |

  @530078 @530072 @US-500144 @Sprint-11 @M05 @Bug-Ticket-535277
  Scenario Outline:Verify that Grantee User can see the following fields populated in the Application Layout->Budget tab->Budget Summary section, for Formula - By Applicant announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULA_APPLICATIONDEADLINESOFT_YES_APPLICATIONDUEDATEPAST"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #530072
    Then I softly see field "Status" as "Closed"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    #530078
    Then I softly cannot see top right button "Qualify" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    #530078
    Then I softly cannot see top right button "Qualify" in page detail

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | FD        |

  @530075 @US-500144 @Sprint-11 @M05 @Bug-Ticket-535277
  Scenario Outline:Verify that announcement gets 'Closed' after the application due date is passed. - Is Application Deadline Soft?  set to No
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULA_APPLICATIONDUEDATEPAST1"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #530075
    Then I softly see field "Status" as "Closed"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | FD       |

  @NYSED-2912 @NYSED-2911 @NYSED-2909 @NYSED-2910 @NYSED-2908 @NYSED-2907 @US-529643 @Sprint-24 @US-NYSED-1852 @M05
  Scenario Outline: Verify that the grantee user sees Support Staff Salaries, Application Budget Categories modal, having a 'Full-Time Equivalent' column ( Editable, Required, Number  Field up to 2 decimal places and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Support Staff Salaries"
    Then I softly can see "16 - Support Staff Salaries" sub tab at view detail page
    And I click on top right button "New" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly do not see fields "GranteeAmount__c" is in edit mode
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             |     | 10                     | 10                                                 | 10000            | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             |     | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Position Title          | -20 |
    #NYSED-2912
    Then I softly see the following messages in the page details contains:
      | FTE cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE |
      | Position Title          | ee  |
    #NYSED-2912 #NYSED-2906
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             |     | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | FTE    |
      | Position Title          | 10.877 |
    #NYSED-2912 #NYSED-2906
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.87 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE    | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10.877 | 10                     | 10                                                 | 10000            | 100        | 100            |
    #NYSED-2912 #NYSED-2907
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.87 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
      | Action menu | Position Title          | 10             | 10.87 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
      |             | Total                   |                | 21.74 | $20                    | $20                                                | $20,000          | $200       | $200           | $400        | $20,400            |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2907
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $20,000 | $200       | $200           | $400        | $20,400            |
      | Action menu | Purchased Services          | 40                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Minor Remodeling            | 30                   | $0      | $0         | $0             | $0          | $0                 |
      | Action menu | Equipment                   | 20                   | $0      | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $20,000 | $200       | $200           | $400        | $20,400            |
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    #NYSED-2906
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  |                        | 10                                                 | 10000            | 100        | 100            |
    #NYSED-2908
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 |                        | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | ee                     |
    #NYSED-2908
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 |                        | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | -100                   |
    #NYSED-2908
    Then I softly see the following messages in the page details contains:
      | Annualized Rate of Pay cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | Annualized Rate of Pay |
      | Position Title          | 88.988                 |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | 88.988           | 88.988     | 88.988         |
    #NYSED-2910
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 10                                                 | 88.988           | 88.988     | 88.988         |
    #NYSED-2910
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $10                                                | $88,988          | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                   |                | 30.00 | $266,964               | $30                                                | $187,976         | $178,076   | $178,076       | $356,152    | $544,128           |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 10000            |            |                |
    #NYSED-2909
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $10                    | $10                                                | $10,000          |            |                | $0          | $10,000            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | Cash       | Non-Cash       |
    #NYSED-2909
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $10                    | $10                                                | $10,000          |            |                | $0          | $10,000            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | -100       | -100           |
    #NYSED-2909
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | Cash Match | Non-Cash Match |
      | Position Title          | 88.988     | 88.988         |
    #NYSED-2909
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $10                    | $10                                                | $10,000          | $88,988    | $88,988        | $177,976    | $187,976           |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      |                         | 10             | 10  | 10                     | 10                                                 | 10000            | 100        | 100            |
    #NYSED-2911
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | {SavedValue:Char256}    | 10             | 10  | 10                     | 10                                                 | 10000            | 100        | 100            |
    #NYSED-2911
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}    | 10             | 10.00 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position Title | # of Positions |
      | Position Title          | 10             |
    #NYSED-2911
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}    | 10             | 10.00 | $10                    | $10                                                | $10,000          | $100       | $100           | $200        | $10,200            |
      | Action menu | Position Title          | 10             | 10.00 | $10                    | $10                                                | $10,000          | $88,988    | $88,988        | $177,976    | $187,976           |
      |             | Total                   |                | 20.00 | $20                    | $20                                                | $20,000          | $89,088    | $89,088        | $178,176    | $198,176           |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category        | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Support Staff Salaries | 16                   | $20,000 | $89,088    | $89,088        | $178,176    | $198,176           |
      |             |                        |                      | $20,000 | $89,088    | $89,088        | $178,176    | $198,176           |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2814 @NYSED-2811 @NYSED-2813 @NYSED-2801 @NYSED-2805 @NYSED-2800 @NYSED-2807 @NYSED-2810 @NYSED-2808 @NYSED-2809 @NYSED-2812 @NYSED-2799 @NYSED-2815 @NYSED-2816 @Sprint-24 @US-NYSED-1855 @M05
  Scenario Outline: Verify that the grantee user sees Support Staff Salaries, Application Budget Categories modal, having a 'Full-Time Equivalent' column ( Editable, Required, Number  Field up to 2 decimal places and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2814 #NYSED-2801 #NYSED-2800
    Then I softly see value "Travel Expenses" for title "Budget Category" against the value "46" inside table "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Travel Expenses" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Travel Expenses"
    Then I softly can see "46 - Travel Expenses" sub tab at view detail page
    #NYSED-2814
    Then I see only the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         |                      | 88.988     | 88.988         |
    #NYSED-2812
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | ee                   | 88.988     | 88.988         |
    #NYSED-2812
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | -34                  | 88.988     | 88.988         |
    #NYSED-2812
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination |         | Automation Benefits- 1          | Calculation         | 88988                | 88.988     | 88.988         |
    #NYSED-2815
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2813 #NYSED-2805 #NYSED-2812
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position             | Purpose     | Destination | Automation Benefits- 2          | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2813 #NYSED-2807 #NYSED-2799
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose     | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title       | Destination | Purpose     | Automation Benefits- 1          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position             | Purpose     | Destination | Automation Benefits- 2          | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                |             |             |                                 |                     | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Position of Traveler | Destination | Purpose | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | and         | or      | test                | 88.988               | 88.988     | 88.988         |
    #NYSED-2811 #NYSED-2807 #NYSED-2812
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title       | and         | or      | Automation Benefits- 1          | test                | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    #NYSED-2807
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    When I click on "Delete" icon for "Position" inside flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    #NYSED-2807
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | 88.988               |            |                |
    #NYSED-2809
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | $88,988              |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Position of Traveler | Cash Match | Non-Cash Match |
      | Traveler             | Cash       | Non-Cash       |
    #NYSED-2809
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | $88,988              |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Position of Traveler | Cash Match | Non-Cash Match |
      | Traveler             | -100       | -100           |
    #NYSED-2809
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Position of Traveler | Cash Match | Non-Cash Match |
      | Traveler             | 88.988     | 88.988         |
    #NYSED-2809
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Traveler             | and         | Purpose | Automation Benefits- 1          | of                  | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "Delete" icon for "Traveler" inside flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                      | Destination | Purpose | Automation Benefits- 1          | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2811
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       |             | Purpose | Automation Benefits- 1          | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2810
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          |                     | 88.988               | 88.988     | 88.988         |
    #NYSED-2808
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination          | Purpose              | Type (Air, Bus, Train, Mileage) | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256} | {SavedValue:Char256} | {SavedValue:Char256} | Automation Benefits- 1          | {SavedValue:Char256} | 88.988               | 88.988     | 88.988         |
    #NYSED-2811 #NYSED-2810 #NYSED-2808 ##NYSED-2815
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination          | Purpose              | Type (Air, Bus, Train, Mileage) | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255} | {SavedValue:Char255} | {SavedValue:Char255} | Automation Benefits- 1          | {SavedValue:Char255} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Type (Air, Bus, Train, Mileage) | Position of Traveler | Destination         | Purpose             | Calculation of Cost |
      | Automation Benefits- 1          | {SavedValue:Char42}  | {SavedValue:Char42} | {SavedValue:Char42} | {SavedValue:Char42} |
    #NYSED-2811 #NYSED-2810 #NYSED-2808 #NYSED-2815
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination         | Purpose             | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char42}  | {SavedValue:Char42} | {SavedValue:Char42} | Automation Benefits- 1          | {SavedValue:Char42} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2799
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Travel Expenses | 46                   | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
      |             |                 |                      | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Position of Traveler | Type (Air, Bus, Train, Mileage) |
      | {SavedValue:Char42}  | {SavedValue:Char256}            |
    #NYSED-2816
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination         | Purpose             | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char42}  | {SavedValue:Char42} | {SavedValue:Char42} | {SavedValue:Char255}            | {SavedValue:Char42} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "Edit" :
      | Position of Traveler | Type (Air, Bus, Train, Mileage) |
      | {SavedValue:Char42}  | {SavedValue:Char42}             |
    #NYSED-2816
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" :
      | Actions     | Position of Traveler | Destination         | Purpose             | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char42}  | {SavedValue:Char42} | {SavedValue:Char42} | {SavedValue:Char42}             | {SavedValue:Char42} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |


    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2834 @NYSED-2846 @NYSED-2835 @NYSED-2845 @NYSED-2841 @NYSED-2844 @NYSED-2843 @NYSED-2839 @NYSED-2842 @NYSED-2833 @US-529694 @Sprint-12 @Sprint-24 @US-NYSED-1857 @M05
  Scenario Outline: Verify that the grantee user sees Support Staff Salaries, Application Budget Categories modal, having a 'Full-Time Equivalent' column ( Editable, Required, Number  Field up to 2 decimal places and Blank for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2834 #NYSED-2835
    Then I softly see value "Indirect Cost" for title "Budget Category" against the value "90" inside table "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    #NYSED-2846
    Then I see only the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions | Description | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title |                      | 88.988     | 88.988         |
    #NYSED-2844
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | F                    | 88.988     | 88.988         |
    #534162
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | -34                  | 88.988     | 88.988         |
    #534162
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | 88.988               | 88.988     | 88.988         |
    #NYSED-2845 #534162
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | 88.988               | 88.988     | 88.988         |
    #NYSED-2845 #NYSED-2841 #NYSED-2839 #NYSED-2833
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total          | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "Edit" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | $88,989              | 88.989     | 88.989         |
    #NYSED-2841 #534162
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,989              | $88,989    | $88,989        | $177,978    | $266,967           |
    #NYSED-2841
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    #NYSED-2841
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | 88.988               |            |                |
    #NYSED-2842
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,988              |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "Edit" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | $88,989              | Cash       | Non-Cash       |
    #NYSED-2842
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,989              |            |                | $0          | $88,989            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "Edit" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | $88,989              | -100       | -100           |
    #NYSED-2842
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "Edit" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | $88,989              | 88.989     | 88.989         |
    #NYSED-2842
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description    | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title | $88,989              | $88,989    | $88,989        | $177,978    | $266,967           |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      |             | 88.988               | 88.988     | 88.988         |
    #NYSED-2843
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description          | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256} | 88.988               | 88.988     | 88.988         |
    #NYSED-2843
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description          | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "Edit" :
      | Description          | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char255} | $88,989              | 88.989     | 88.989         |
    #534159
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions     | Description          | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255} | $88,989              | $88,989    | $88,989        | $177,978    | $266,967           |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2839 #NYSED-2833
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Indirect Cost   | 90                   | $88,989 | $88,989    | $88,989        | $177,978    | $266,967           |
      |             |                 |                      | $88,989 | $88,989    | $88,989        | $177,978    | $266,967           |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @527120 @526361 @Sprint-10 @US-522308 @US-494451 @M05
  Scenario Outline: Verify that the grantee users regardless of role sees the Indirect Rate Type Field under Budget tab when budget type is FS-10.
  |Verify that grantee users can see that the Budget Categories and Budget Category Code at the application level are populated according to the related announcement budget and selected settings when Subrecipient Match Required? is set to No. - Formula BAFA|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES_NO_MATCH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    Then I softly see field "Indirect Rate Type" inside page block
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly see field "Indirect Rate Type" inside page block
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    When I enter value "{SavedValue:Automation Runtime Announcement Application}" into field "---applicationIntake:-:applicationTitle---"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly see "Budget Category" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget Category Code" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Total Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "4" seconds
    Then I softly do not see "Cash Match" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId----OperatingCost"
    Then I softly do not see "Total Match" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Financials" sub tab
    Then I softly see field "Indirect Rate Type" inside page block

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @526125 @Sprint-10 @US-494451 @M05
  Scenario Outline: Verify that grantee users can see that the Budget Categories and Budget Category Code at the application level are populated according to the related announcement budget and selected settings when Subrecipient Match Required? is set to No. - Formula BA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES_MATCH_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    Then I softly see field "Indirect Rate Type" inside page block
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly see field "Indirect Rate Type" inside page block
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    When I enter value "{SavedValue:Automation Runtime Announcement Application}" into field "---applicationIntake:-:applicationTitle---"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly see "Budget Category" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget Category Code" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly see "Budget" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Total Match" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    Then I softly do not see "Cash Match" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly do not see "Non-Cash Match" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId----OperatingCost"
    Then I softly do not see "Total Match" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    Then I softly do not see "Total Project Cost" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Financials" sub tab
    Then I softly see field "Indirect Rate Type" inside page block

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @526006 @526360 @526008 @Sprint-10 @US-522308 @M05
  Scenario Outline: Verify that the grantee user with the 'Create and Edit' and 'Submit and Certify' roles sees the following field sequence in the Opportunity Information section and Indirect Rate Type Field is hidden when Budget Type is Lump Sum. - Formula
  |Verify that grantee users see the 'Total Available' column added after the 'Reallocation' column in the Opportunity Layout -> Financial tab -> Budget Summary section. - Formula (By Applicant)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Overview" sub tab
    Then I see below fields in "Opportunity Information" page block
      | Opportunity Name               |
      | Type                           |
      | Program                        |
      | Fund Code                      |
      | Year                           |
      | Fund Year                      |
      | Maximum # Applications Allowed |
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I see only the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Focus Area | Waiver | Allocation Amount | Reallocation | Total Available |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,000            | $0           | $1,000          |
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,000            | $0           | $1,000          |
    When I navigate to "Overview" sub tab
    Then I see below fields in "Opportunity Information" page block
      | Opportunity Name               |
      | Type                           |
      | Program                        |
      | Fund Code                      |
      | Year                           |
      | Fund Year                      |
      | Maximum # Applications Allowed |
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    When I enter value "{SavedValue:Automation Runtime Announcement Application}" into field "---applicationIntake:-:applicationTitle---"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
      | N/A    | $1,000            | $0           | $1,000          |
    When I navigate to "Overview" sub tab
    Then I see below fields in "Opportunity Information" page block
      | Opportunity Name               |
      | Type                           |
      | Program                        |
      | Fund Code                      |
      | Year                           |
      | Fund Year                      |
      | Maximum # Applications Allowed |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @526009 @Sprint-10 @US-522308 @M05
  Scenario Outline: Verify that grantee users see the 'Total Available' column added after the 'Reallocation' column in the Opportunity Layout -> Financial tab -> Budget Summary section. - Formula (By Applicant and Focus Area)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
      | N/A    | $1,000            | $0           | $1,000          |
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Focus Area                      | Waiver | Allocation Amount | Reallocation | Total Available |
      | Automation Permanent Focus Area | N/A    | $1,000            | $0           | $1,000          |
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    When I enter value "{SavedValue:Automation Runtime Announcement Application}" into field "---applicationIntake:-:applicationTitle---"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetSummaryTableId---" :
      | Waiver | Allocation Amount | Reallocation | Total Available |
      | N/A    | $1,000            | $0           | $1,000          |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @526012 @Sprint-10 @US-522308 @M05
  Scenario Outline: Verify that grantee users cannot see the 'Total Available' column added in the Opportunity Layout -> Financial tab -> Budget Summary section for the Competitive and Directed announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Total Available" inside page block
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    Then I softly cannot see field "Total Available" inside page block
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    When I enter value "{SavedValue:Automation Runtime Announcement Application}" into field "---applicationIntake:-:applicationTitle---"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Total Available" inside page block

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @528556 @Sprint-10 @US-487951 @M05
  Scenario Outline:  Verify that grantee user can not see field 'Indirect Rate (%)' on the application layout if  budget type of announcement is 'Lump Sum' - Formula Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Then I softly cannot see field "Indirect Rate (%)" inside page block

    Examples:
      | UserType   |
      | GRANTEE_CE |
      | GRANTEE_SC |

  @526445 @537644 @Sprint-10 @US-487951 @US-535876 @M05 @API_Unrstricted_IndirectRate_lowestOnOrganization @bug-id-538470
  Scenario Outline:  Verify that grantee user can use the lower rate between max rate and org rate on application if rate type is Unrestricted  - Formula Announcement
  |Verify that the grantee user can see the Indirect Rate (%) field data type is changed to a percent field with 2 decimal places on application if rate type is Restricted or Unrestricted.-Lower rate at organization|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_UNRESTRICTED_LOWEST_INDIRECTRATE_ONORGANIZATION"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Then I softly see field "Indirect Rate (%)" is not editable
    Then I softly see field "Indirect Rate (%)" as "10.00%"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC |

  @526524 @526500 @526492 @530777 @530873 @530778 @Sprint-10 @Sprint-11 @US-522312 @US-504881 @M05
  Scenario:  Verify that grantee users with the 'Create and Edit' and 'Submit and Certify' role see the Other Leverage column is removed at the category and line-item level in the Budget Categories under the Budget tab on the Application layout. - Formula BAFA
  |Verify that grantee users with 'Create and Edit' and 'Submit and Certify' roles cannot edit checkbox field in the Acknowledgement section under the Overview tab on the Application layout. - Formula By Applicant and Focus Area|
  |Verify that grantee users ( GRANTEE_SC)see the following field-level changes and sequence in the Primary Place of Performance section under the Overview tab on the Application layout. - Formula By Applicant and Focus Area|
  |Verify that grantee users cannot see the Proposal tab, along with the Technical Proposal section, and all the validations related to these fields are disabled. - Formula (By Applicant and Focus Area)|
  |Verify that grantee users other than 'Create and Edit' and 'Submit and Certify' cannot see the Proposal tab and that the 'Goals and Objectives' and 'Key Performance Indicators' sections are moved to the Overview tab on the Application layout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    Then I softly see field "Acknowledgement" is not editable
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see row level action button "Edit" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Support Staff Salaries" in flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 900        | 0              |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    Then I softly see field "Street" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "State" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "Country" inside page block
    Then I do not see below fields in "Primary Place of Performance" page block
      | Congressional district     |
      | 4-Digit Zip Code Extension |
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    And I refresh the page
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    #530778
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide Target Values for all Key Performance Indicators. |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I wait for "3" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #530777
    Then I softly cannot see "Proposal" sub tab at view detail page
    #530873
    And I navigate to "Overview" sub tab
    Then I see only the following ordered page blocks :
      | Information                  |
      | Primary Place of Performance |
      | Opportunity Overview         |
      | Application Overview         |
      | Project Information          |
      | Contacts                     |
      | Goals and Objectives         |
      | Key Performance Indicators   |
      | Acknowledgement              |
      | System Information           |

  @NYSED-2838 @NYSED-2557 @NYSED-2544 @NYSED-2872 @NYSED-2857 @US-529701 @US-529699 @US-529694 @Sprint-12 @Sprint-24 @US-NYSED-1858 @US-NYSED-1859 @M05 @Bug-Ticket-538472
  Scenario Outline:Verify that if Announcement owner has selected 'Sub-recipient Match Required- No' setting then on application , the grantee user can not see columns- Cash Match, Non-Cash Match and Total Match on budget table and categories modal - Indirect Cost
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES_NO_MATCH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2838
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2838
    Then I see only the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions | Description | Proposed Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2544
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2557 #NYSED-2544
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I see only the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2872
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I see only the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2857
    Then I softly see value "Minor Remodeling" for title "Budget Category" against the value "30" inside table "---applicationReview:-:budgetTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2840 @NYSED-2837 @NYSED-2546 @NYSED-2542 @NYSED-2858 @NYSED-2863 @NYSED-2860 @533482 @US-532447 @US-529701 @US-529699 @US-529694 @Sprint-12 @Sprint-24 @US-NYSED-1859 @M05 @Bug-Ticket-538472
  Scenario Outline:Verify that other than submit and certify or create and edit role user cannot see the New button and Edit & Delete actions on the modal, if the application is in created state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2858
    Then I softly can see row level action button "View/Add Line Item Details" against "Minor Remodeling" in flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Indirect Cost" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I see only the following headers in table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" :
      | Actions | Description | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | 0                    | 100        | 100            |
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description    | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title | 0                    | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Purpose       | Cost                | 150                  | 100        | 100            |
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Purpose       | Cost                | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | 250                  | 100        | 100            |
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | 250                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2840 #NYSED-2840
    Then I softly see value "Indirect Cost" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2546
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2863
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2840 #533482
    Then I softly see value "Indirect Cost" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2546
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2863
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                          | Is Key Contact |
      | Automation Grantee_CreateEdit | Checked        |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #NYSED-2837
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    #NYSED-2837
    Then I softly see the text containing "Budget Category : Indirect Cost"
    Then I softly can see "90 - Indirect Cost" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    #NYSED-2542
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2860
    Then I softly see the text containing "Budget Category : Minor Remodeling"
    Then I softly can see "30 - Minor Remodeling" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |


  @NYSED-2548 @NYSED-2556 @NYSED-2547 @NYSED-2545 @NYSED-2540 @NYSED-2539 @NYSED-2552 @NYSED-2553 @NYSED-2549 @NYSED-2538 @NYSED-2871 @NYSED-2870 @NYSED-2867 @NYSED-2866 @NYSED-2868
    @NYSED-2865 @NYSED-2864 @NYSED-2862 @533479 @NYSED-2551 @Sprint-12 @Sprint-24 @US-NYSED-1858 @US-NYSED-1859 @M05
  Scenario Outline: Verify that the grantee user can see on save all the added value sums up properly at the category level- BOCES Purchased Services
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2862
    Then I see only the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2548 #NYSED-2545 #NYSED-2540 #NYSED-2538
    Then I softly see value "BOCES Purchased Services" for title "Budget Category" against the value "49" inside table "---applicationReview:-:budgetTableId---"
    #NYSED-2540
    Then I softly can see row level action button "View/Add Line Item Details" against "BOCES Purchased Services" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : BOCES Purchased Services"
    Then I softly can see "49 - BOCES Purchased Services" sub tab at view detail page
    #NYSED-2545
    Then I see only the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Destination   | Calculation         |                      | 88.988     | 88.988         |
    #NYSED-2556
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Destination   | Calculation         | F                    | 88.988     | 88.988         |
    #NYSED-2556
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Destination   | Calculation         | -34                  | 88.988     | 88.988         |
    #NYSED-2556
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Destination   | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2556 #NYSED-2547 #NYSED-2539
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title              | Destination   | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | Purpose       | Cost                | 88.988               | 88.988     | 88.988         |
    And I wait for "3" seconds
    #NYSED-2556 #NYSED-2548 #NYSED-2547 #NYSED-2539 #533479
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title              | Destination   | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title              | Purpose       | Cost                | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                       |               |                     | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title              | and           | test                | 88.988               | 88.988     | 88.988         |
    #NYSED-2556 #NYSED-2547 #533479
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title              | and           | test                | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    #NYSED-2556
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    #533479 #NYSED-2547
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Traveler                    | and           | of                  | 88.988               |            |                |
    #NYSED-2551
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Traveler                    | and           | of                  | $88,988              |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Traveler                    | and           | or                  | 88.988               | Cash       | Non-Cash       |
    #NYSED-2551
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Traveler                    | and           | or                  | $88,988              |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Traveler                    | and           | or                  | 88.988               | -100       | -100           |
    #NYSED-2551
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Traveler                    | and           | or                  | 88.988               | 88.988     | 88.988         |
    #NYSED-2551
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Traveler                    | and           | or                  | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "Delete" icon for "Traveler" inside flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                             | 88.98         | 88.988              | 88.988               | 88.988     | 88.988         |
    #NYSED-2552
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position                    |               | 88.988              | 88.988               | 88.988     | 88.988         |
    #NYSED-2553
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position                    | and           |                     | 88.988               | 88.988     | 88.988         |
    #NYSED-2549
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Name of BOCES        | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256}        | {SavedValue:Char256} | {SavedValue:Char256} | 88.988               | 88.988     | 88.988         |
    #NYSED-2552 #NYSED-2553 #NYSED-2549
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES        | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}        | {SavedValue:Char255} | {SavedValue:Char255} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES       | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char255}        | {SavedValue:Char42} | {SavedValue:Char42} | $88,988              | 88.988     | 88.988         |
    #NYSED-2552 #NYSED-2553 #NYSED-2549
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES       | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}        | {SavedValue:Char42} | {SavedValue:Char42} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "BOCES Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "5" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Name of BOCES        | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char255}        | {SavedValue:Char255} | Calculation         | $88,988              | 88.988     | 88.988         |
    And I wait for "2" seconds
    #NYSED-2552 #NYSED-2553 #NYSED-2549
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:BOCESPurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Name of BOCES        | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}        | {SavedValue:Char255} | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category          | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | BOCES Purchased Services | 49                   | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
      |             |                          |                      | $88,988 | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         |                      | 88.988     | 88.988         |
    #NYSED-2870
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | ee                   | 88.988     | 88.988         |
    #NYSED-2870
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | -34                  | 88.988     | 88.988         |
    #NYSED-2870
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2871
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title                      | Provider of Service        | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2871 #NYSED-2870 #NYSED-2865 #NYSED-2864
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Position Title                      | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      |             | Total                               |                            |                     | $177,976             | $177,976   | $177,976       | $355,952    | $533,928           |
    Then I softly can see row level action button "Edit" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Position Title" in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Calculation         | 88.989               | 88.988     | 88.988         |
    And I wait for "5" seconds
    #NYSED-2870 #NYSED-2864
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title                      | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Description                         | Calculation         | $88,989              | $88,988    | $88,988        | $177,976    | $266,965           |
      |             | Total                               |                     | $177,977             | $177,976   | $177,976       | $355,952    | $533,929           |
    #NYSED-2870
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I wait for "5" seconds
    When I click on "Delete" icon for "Description" inside flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    #NYSED-2864
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | 88.988               |            |                |
    #NYSED-2867
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Cash Match | Non-Cash Match |
      | Description                         | Cash       | Non-Cash       |
    #NYSED-2867
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              |            |                | $0          | $88,988            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Cash Match | Non-Cash Match |
      | Description                         | -100       | -100           |
    #NYSED-2867
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Cash Match | Non-Cash Match |
      | Description                         | 88.988     | 88.988         |
    #NYSED-2867
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    When I click on "Delete" icon for "Description" inside flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        |                     | 88.988               | 88.988     | 88.988         |
    #NYSED-2866
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                                     | Provider of Service        | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2868
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | {SavedValue:Char256}                | Provider of Service        | {SavedValue:Char256} | 88.988               | 88.988     | 88.988         |
    #NYSED-2866 #NYSED-2868
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char255}                | Provider of Service        | {SavedValue:Char255} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Provider of Service/Vendor | Description of Work to be Performed | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Provider of Service        | {SavedValue:Char42}                 | {SavedValue:Char42} | 88.988               | 88.988     | 88.988         |
    #NYSED-2866 #NYSED-2868
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char42}                 | Provider of Service        | {SavedValue:Char42} | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "5" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Provider of Service/Vendor | Proposed Expenditure |
      | Provider of Service        | 88.989               |
    #NYSED-2866
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | {SavedValue:Char42}                 | Provider of Service        | {SavedValue:Char42} | $88,989              | $88,988    | $88,988        | $177,976    | $266,965           |
      |             | Total                               |                            |                     | $88,989              | $88,988    | $88,988        | $177,976    | $266,965           |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2865 #NYSED-2548
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget   | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Support Staff Salaries      | 16                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Purchased Services          | 40                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Supplies and Materials      | 45                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Travel Expenses             | 46                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | Indirect Cost               | 90                   | $0       | $0         | $0             | $0          | $0                 |
      | Action menu | BOCES Purchased Services    | 49                   | $88,988  | $88,988    | $88,988        | $177,976    | $266,964           |
      | Action menu | Minor Remodeling            | 30                   | $88,989  | $88,988    | $88,988        | $177,976    | $266,965           |
      | Action menu | Equipment                   | 20                   | $0       | $0         | $0             | $0          | $0                 |
      |             | Grand Total                 |                      | $177,977 | $177,976   | $177,976       | $355,952    | $533,929           |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @535214 @533411 @533392 @533408 @533439 @533387 @Sprint-12 @US-532447 @FS-10
  Scenario Outline: Verify that users with the 'View Only' or 'LEA Admin' roles cannot edit an application when it is in the 'Created' state and they click the row-level edit action in the list view.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "7" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter value "K.B.Street" into field "Addressline1__c"
    When I enter value "Automation" into field "Addressline2__c"
    When I enter value "12" into field "County__c"
    When I enter value "Chicago" into field "City__c"
    When I enter value "34565" into field "Zip4__c"
    When I enter value "USA" into field "Country__c"
    When I enter value "AK" into field "State__c"
    And I enter value "Manual Test" into field "ProjectAbstract__c"
    #533387
    Then I softly see fields "Title__c" is in edit mode
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    #533387
    Then I softly see rich text field "Justification__c" with fieldname "Justification for Project Cost" as "Automation Test Description"
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    #533387
    Then I softly see field "Street" as "K.B.Street"
    Then I softly see field "PO Box" as "Automation"
    Then I softly see field "City" as "Chicago"
    Then I softly see field "County Code" as "12"
    Then I softly see field "State" as "AK"
    Then I softly see field "Zip Code" as "34565"
    Then I softly see field "Country" as "USA"
    Then I softly see rich text field "ProjectAbstract__c" with fieldname "Project Abstract" as "Manual Test"
    And I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | Title                               | Target |
      | {SavedValue:AutomationPermanentKPI} | 10     |
    #533439
    Then I softly see value "{SavedValue:AutomationPermanentKPI}" for title "Title" inside table "---applicationReview:-:kpiTableId---"
    When I click on top right button "Associate" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I click "Add" after selection of "Automation Grantee_CreateEdit" by showing entries "All" in flex table with id "---applicationIntake:-:associateNewContactsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                          | Project Role   |
      | Automation Grantee_CreateEdit | Fiscal Contact |
    #533408
    Then I softly can see row level action button "View" against "Fiscal Contact" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Contact" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "Remove" against "Fiscal Contact" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly see value "Fiscal Contact" for title "Project Role" inside table "---applicationReview:-:flexGridAppContactTableId---"
    When I click on "Remove" icon for "Fiscal Contact" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I wait for "2" seconds
    #533408
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #535214
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #533411
    Then I softly cannot see top right button "Associate" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    #533392
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #535214
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #533411
    Then I softly cannot see top right button "Associate" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    #533392
    Then I softly cannot see top right button "Edit" in page detail

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @535860 @533442 @533555 @533554 @533552 @533551 @533493 @533509 @533506 @Sprint-12 @US-532447 @LUMPSUM @Bug-Ticket-542245 @Bug-Ticket-NYSED-10182
  Scenario Outline:Verify that the 'Edit' page action should not be visible to the user with the 'View Only' or 'LEA Admin' role when the application is in the 'Created' state, and user is not able to edit any section present in each tab for Lump Sum Budget Type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    #533554
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    When I click on "Delete" icon for "Notes Record" inside flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    And I wait for "2" seconds
    #533554
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---" by clicking "New" :
      | Title                    | Description      |
      | Notes Record Of SPI User | Automation Notes |
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I wait for "5" seconds
    And I upload attachment "AttachmentTesting.pdf" of type "General Assurances" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see "General Assurances" has been added in "Application Files" flex table
    And I click on "Edit" icon for "General Assurances" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Suspension" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    #533552
    Then I softly see value "Automation.pdf" for title "Title" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly see value "Suspension" for title "Classification" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Edit" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "View" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Download" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Delete" against "Suspension" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I wait for "3" seconds
    When I click on "Delete" icon for "Suspension" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    #533552
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I upload attachment "AttachmentTesting.pdf" of type "General Assurances" from computer
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see "General Assurances" has been added in "Application Files" flex table
    When I click on "Attach" icon for "Optional" inside flex table with id "---applicationIntake:-:ExternalSupportingDocumentsChecklistTableId---"
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click modal button "Close"
    #533506
    Then I softly can see row level action button "Attach" against "Optional" in flex table with id "---applicationIntake:-:ExternalSupportingDocumentsChecklistTableId---"
    Then I softly see value "View" for title "Template Link" inside table "---applicationIntake:-:ExternalSupportingDocumentsChecklistTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #535860
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:AutomationObjective}" in flex table with id "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationObjective}" in flex table with id "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    #535860 #533442
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #533493
    Then I softly can see row level action button "No Actions Available" against "Lump Sum" in flex table with id "---applicationReview:-:budgetTableId---"
    And I navigate to "Forms and Files" sub tab
    #533555
    Then I softly cannot see row level action button "Edit" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    #533551
    Then I softly do not see top right button "Add Files" inside flex table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly cannot see row level action button "Delete" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly cannot see row level action button "Edit" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "View" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Download" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    #533509
    Then I softly cannot see row level action button "Attach" against "Optional" in flex table with id "---applicationIntake:-:ExternalSupportingDocumentsChecklistTableId---"
    Then I softly can see row level action button "No Actions Available" against "Optional" in flex table with id "---applicationIntake:-:ExternalSupportingDocumentsChecklistTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #535860
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Associate" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:GRANTEE_SC Username}" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:AutomationObjective}" in flex table with id "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationObjective}" in flex table with id "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    #535860 #533442
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:AutomationPermanentKPI}" in flex table with id "---applicationIntake:-:kpiTableId---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #533493
    Then I softly can see row level action button "No Actions Available" against "Lump Sum" in flex table with id "---applicationReview:-:budgetTableId---"
    And I navigate to "Forms and Files" sub tab
    #533555
    Then I softly cannot see row level action button "Edit" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Of SPI User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    #533551
    Then I softly do not see top right button "Add Files" inside flex table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly cannot see row level action button "Delete" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly cannot see row level action button "Edit" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "View" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly can see row level action button "Download" against "General Assurances" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    #533509
    Then I softly cannot see row level action button "Attach" against "Optional" in flex table with id "---applicationIntake:-:ExternalSupportingDocumentsChecklistTableId---"
    Then I softly see value "View" for title "Template Link" inside table "---applicationIntake:-:ExternalSupportingDocumentsChecklistTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @533576 @533588 @Sprint-12 @US-532447 @LUMPSUM
  Scenario Outline:Verify that on the Application layout -> Messages tab -> Messages section, section button 'Send Email' is only visible to the user with 'Create and Edit' or 'Submit and Certify' role, when application is in 'Created' state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "---announcement:-:collabMessages---"
    And I send the email under collab tab with following details:
      | To                       | Subject         | Body                       |
      | {SavedValue:PMYopmailId} | Automation Test | Automation Test Email Body |
    And I wait for "12" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    And I wait for "7" seconds
    #533576
    Then I softly can see row level action button "Reply" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    When I click on "Reply" icon for "Automation Test" inside flex table with id "---announcement:-:collabMessages---"
    And I wait for "7" seconds
    And I send the email under collab tab with following details:
      | To                        | Subject             | Body                       |
      | {SavedValue:FO1YopmailId} | RE: Automation Test | Automation Test Email Body |
    And I wait for "12" seconds
    Then I see the text "Email Sent Successfully." in modal
    And I close "Send Email" modal by clicking the top right x button
    And I refresh the page
    And I wait for "7" seconds
    #533576
    Then I softly can see row level action button "Reply" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "RE: Automation Test" in flex table with id "---announcement:-:collabMessages---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    And I navigate to "Messages" sub tab
    #533588
    Then I softly can see row level action button "Reply" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    And I navigate to "Messages" sub tab
    #533588
    Then I softly cannot see row level action button "Reply" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"
    Then I softly can see row level action button "View" against "Automation Test" in flex table with id "---announcement:-:collabMessages---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @533606 @533607 @US-532447 @Sprint-12 @M05
  Scenario Outline:Verify that on the Application layout -> Budget tab -> Budget Summary by Focus Area section, section button 'Add Focus Area' is only visible to the user with 'Create and Edit' or 'Submit and Certify' role.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_SECOND_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    #533606
    Then I softly see top right button "Add Focus Area" inside flex table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "Remove Focus Area" icon for "Automation Permanent Focus Area2" inside flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I wait for "2" seconds
    #533606
    Then I softly see the following messages in the page details contains:
      | Focus Area(s) successfully removed. |
    Then I softly see "Total Records: 1" inside flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I click on top right button "Add Focus Area" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area2" in "---applicationIntake:-:AddFocusAreaTableAppId---" panel
    When I click "Add" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---applicationIntake:-:AddFocusAreaTableAppId---"
    And I click modal button "Close"
    #533606
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    #533607
    Then I softly do not see top right button "Add Focus Area" inside flex table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove Focus Area" against "Automation Permanent Focus Area2" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Permanent Focus Area2" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    #533607
    Then I softly do not see top right button "Add Focus Area" inside flex table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Remove Focus Area" against "Automation Permanent Focus Area2" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Permanent Focus Area2" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @533109 @533108 @533473 @533148 @Sprint-12 @US-528576 @M05
  Scenario Outline:  Verify that the grantor user should see a Application layout -> Budget tab -> Budget Periods Section -> Budget Categories Other Leverage column is removed/hidden at category and line-item level.
  |Verify that the grantor user should see a new section 'Chief Administrator's Certification' is reflecting from Application submitted by subrecipient at Application Layout->Budget tab, after Budget Narrative section.|
  |Verify that the grantor user should see text is change to instructional text from acknowledgment section, at Application Layout->Overview tab - Submitted Application|
  |Verify that the grantor user should see that on the Application layout -> Overview tab -> Primary Place of Performance section -> below are the field level sequence and changes have been made.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I wait for "120" seconds
    When I expand nested table containing column value "BP01"
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:budgetPeriodTableId---"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    Then I softly do not see "Other Leverage" in flex table header "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 900        | 0              |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I wait for "3" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I get the "EGMS ID"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    Then I softly see "Chief Administrator's Certification" page block displayed with apostrophe in value
    Then I softly see field "Acknowledgement" is not editable
    Then I softly see field "Submitted By" is not editable
    Then I softly see field "Submitted On" is not editable
    Then I softly see the text containing "By signing this report, I certify to the best of my knowledge and belief that the report is true, complete, and accurate, and the expenditures, disbursements, and cash receipts are for the purposes and objectives set forth in the terms and conditions of the Federal (or State) award. I am aware that any false, fictitious, or fraudulent information, or the omission of any material fact, may subject me to criminal, civil, or administrative penalties for fraud, false statements, false claims, or otherwise. (U.S. Code Title 18, Section 1001 and Title 31, Sections 3729-3730 and 3801-3812)."
    And I navigate to "Overview" sub tab
    Then I softly see the text containing "I hereby certify that the information provided above is accurate and complete."
    Then I softly see field "Acknowledgement" is not editable
    Then I softly see field "Submitted By" is not editable
    Then I softly see field "Submitted On" is not editable
    Then I softly see field "Street" inside page block
    Then I softly see field "PO Box" inside page block
    Then I softly see field "City" inside page block
    Then I softly see field "County Code" inside page block
    Then I softly see field "State" inside page block
    Then I softly see field "Zip Code" inside page block
    Then I softly see field "Country" inside page block
    Then I do not see below fields in "Primary Place of Performance" page block
      | Congressional district     |
      | 4-Digit Zip Code Extension |

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @NYSED-2763 @NYSED-2764 @NYSED-2765 @NYSED-2768 @NYSED-2777 @NYSED-2780 @NYSED-2781 @NYSED-2782 @NYSED-2786 @NYSED-2795 @NYSED-2794 @NYSED-2788 @535084 @NYSED-2918 @NYSED-2919 @535083 @NYSED-2931 @NYSED-2923 @Sprint-12 @US-529675 @US-529682 @US-529710 @M05 @Sprint-24 @US-NYSED-1854 @US-NYSED-1860 @US-NYSED-1853
  Scenario Outline: Verified that the grantee user can see on save all the added value sums up properly at the category level- Purchased Services , Supplies and Materials , Equipment
  |Verify that grantee user can see 'Purchased Services', 'Equipment' and 'Supplies and Materials' budget category under the budget categories table|
  |Verify that grantee user can see the inline action name as 'View/Add Line Item Details', under the budget categories table on created application, if 'Is a Detailed Budget Required on the Application? - Yes' on the announcement|
  |Verify that if Announcement owner has selected 'Sub-recipient Match Required- Yes' setting then on application , the grantee user can see columns- Cash Match, Non-Cash Match and Total Match on budget table and categories modal - Purchased Services, Equipment and Supplies and Materials|
  |Verify that if Announcement owner has selected 'Sub-recipient Match Required- Yes' setting then on application , the grantee user can see columns- Cash Match, Non-Cash Match and Total Match on budget table and categories modal - Purchased Services, Equipment and Supplies and Materials|
  |Verify that the grantee user see Supplies and Materials, Application Budget Categories modal, having a 'Proposed Expenditure' column ( Not- Editable and Formula )|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2768 #NYSED-2786
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    #Purchased Services
    #NYSED-2777
    #NYSED-2764 #NYSED-2765
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I see only the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    #NYSED-2763
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | 100                  | 100        | 100            |
      | Description of Item1        | No              | Provider of Services1 | Calculation of Cost1 | 200                  | 200        | 200            |
      | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | 200.89               | 10.99      | 100.89         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description of Item1        | No              | Provider of Services1 | Calculation of Cost1 | $200                 | $200       | $200           | $400        | $600               |
      | Action menu | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | $20,089              | $1,099     | $10,089        | $11,188     | $31,277            |
      |             | Total                       |                 |                       |                      | $20,389              | $1,399     | $10,389        | $11,788     | $32,177            |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2763
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category    | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Purchased Services | 40                   | $20,389 | $1,399     | $10,389        | $11,788     | $32,177            |
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Description of Item2" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | $100                 | $100       | $100           | $200        | $300               |
      | Action menu | Description of Item1        | No              | Provider of Services1 | Calculation of Cost1 | $200                 | $200       | $200           | $400        | $600               |
      |             | Total                       |                 |                       |                      | $300                 | $300       | $300           | $600        | $900               |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2763
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category    | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Purchased Services | 40                   | $300   | $300       | $300           | $600        | $900               |
    #Supplies and Materials
    #NYSED-2780 #NYSED-2781 #NYSED-2795
    Then I softly see value "Supplies and Materials" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    #NYSED-2782
    Then I softly can see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    #NYSED-2788
    Then I softly can see top right button "New" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    #NYSED-2786
    Then I softly see column header "Actions" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Cash Match" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Non-Cash Match" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Total Match" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Total Project Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2        | 100       | 100             | 1000                 | 100        | 100            |
      | Description of Item1        | 200                                                      | 3.5      | 50        | 100             | 1000                 | 100        | 100            |
      | Description of Item2        | 200                                                      | 2,3      | 30        | 100             | 1000                 | 100        | 100            |
    #NYSED-2794 #NYSED-2788 #NYSED-2780
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "3.50" for title "Quantity" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$50" for title "Unit Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$275" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item1" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item1" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item1" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    #NYSED-2788
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2794 #NYSED-2780
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category        | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Supplies and Materials | 45                   | $3,000 | $300       | $300           | $600        | $3,600             |
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item1" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item1" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I click on "Delete" icon for "Description of Item1" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item2" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    #NYSED-2788
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    #NYSED-2780
    When I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description of Item         | 300                                                      |
    #NYSED-2788
    Then I softly see value "300" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2780
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category        | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Supplies and Materials | 45                   | $1,000 | $100       | $100           | $200        | $1,200             |
    #Equipment
    #NYSED-2918
    Then I softly see value "Equipment" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    #NYSED-2919 #NYSED-2931
    Then I softly can see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    #NYSED-2931 #NYSED-2923
    Then I softly see column header "Actions" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Vendor" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Cash Match" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Non-Cash Match" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Total Match" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Total Project Cost" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Equipment       | 20                   | $10,000 | $100       | $100           | $200        | $10,200            |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2766 @NYSED-2783 @NYSED-2920 @NYSED-2819 @Sprint-12 @US-NYSED-1854 @US-NYSED-1860 @Sprint-24 @US-NYSED-1856 @M05
  Scenario Outline:Verify that grantee user cannot see the inline action name as 'View/Add Line Item Details', under the budget categories table if 'Is a Detailed Budget Required on the Application? - No' on the announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2766
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly can see row level action button "Edit" against "Purchased Services" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    #NYSED-2783
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Supplies and Materials" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly can see row level action button "Edit" against "Supplies and Materials" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    #NYSED-2920
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Equipment" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly can see row level action button "Edit" against "Equipment" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    #NYSED-2819
    Then I softly cannot see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly can see row level action button "Edit" against "Employee Benefits" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2767 @NYSED-2769 @NYSED-2784 @NYSED-2787 @NYSED-2924 @NYSED-2928 @NYSED-2921 @US-529675 @US-529682 @US-529710 @Sprint-12 @Sprint-24 @US-NYSED-1860 @US-NYSED-1853 @M05
  Scenario Outline: Verify that grantee user cannot see the New button and Edit & Delete actions on 'Purchased Services', 'Equipment' and 'Budget Category: 45 - Supplies and Materials' modal, if the application is in other than created state
  |Verify that other than submit and certify or create and edit role user cannot see the New button and Edit & Delete actions on the modal, if the application is in created state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "View/Add Line Item Details" against "Purchased Services" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2        | 100       | 100             | 900                  | 100        | 100            |
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$900" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,100" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2924 #NYSED-2928
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2769
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2787
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2924 #NYSED-2928
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
   #NYSED-2769
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Purchased Services" for title "Budget Category" inside table "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2787
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2924 #NYSED-2928
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                          | Is Key Contact |
      | Automation Grantee_CreateEdit | Checked        |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    #NYSED-2767
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2784
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see the text containing "Budget Category : Supplies and Materials"
    Then I softly can see "45 - Supplies and Materials" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Description of Item" in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |

  @NYSED-2779 @NYSED-2785 @535082 @NYSED-2821 @NYSEDSprint-24 @US-NYSED-1854 @US-NYSED-1853 @M05
  Scenario Outline:Verify that if Announcement owner has selected 'Sub-recipient Match Required- No' setting then on application, the grantee user can not see columns- Cash Match, Non-Cash Match and Total Match on budget table and categories modal - Purchased Services, Equipment, Employee Benefits and Supplies Services
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES_NO_MATCH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2779
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I see only the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2785
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"

    Then I softly see column header "Actions" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Description of Item/Service" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I softly see column header "Actions" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Vendor" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Quantity" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Unit Cost" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Additional Cost" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculation of Cost (if other than Quantity * Unit Cost)" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Calculated Proposed Expenditure" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see column header "Proposed Expenditure" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2821
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget |
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I see only the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Actions | Benefit | Proposed Expenditure |

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC |

  @NYSED-2770 @NYSED-2776 @NYSED-2925 @Sprint-24 @US-NYSED-1860 @US-NYSED-1853 @M05
  Scenario Outline: Verify that the grantee user can add/edit/delete line items on Application Budget Categories Modal, if Application is in created state - Purchased Services, Equipment and Supplies and Materials
  |Verify that when grantee user can see section button New on the 'Budget Category: 40 - Purchased Services' modal, 'Equipment' modal & 'Budget Category : Supplies and Materials' modal and when clicked, new line item is added|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2770
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Purchased Services"
    Then I softly can see "40 - Purchased Services" sub tab at view detail page
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | 100                  | 100        | 100            |
   #NYSED-2776 #NYSED-2770
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                  | 200        | 200            |
    #NYSED-2776 #NYSED-2770
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $200                 | $200       | $200           | $400        | $600               |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    #NYSED-2776 #NYSED-2770
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2925 #NYSED-2917
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "$200" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Edit" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly can see row level action button "Delete" against "Description of Item" in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Cash Match | Non-Cash Match |
      | Description of Item | 1200       | 1200           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$1,200" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$1,200" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$2,400" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$12,400" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2917
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2771 @NYSED-2772 @NYSED-2775 @NYSED-2773 @Sprint-24 @US-NYSED-1853 @M05
  Scenario Outline: Verify that the grantee user see  Purchased Services, Application Budget Categories modal, having a 'Calculation of Cost' column (Short text 255 Character, Editable, by default blank for all row and Required on Save)
  |Verify that the grantee user see  Purchased Services, Application Budget Categories modal, having a 'Description of Item' column (Short text 255 Character, Editable, by default blank for new row and Required on Save)|
  |Verify that the grantee user see  Purchased Services, Application Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Currency Field without decimals, by default zero for new row and Required on Save)|
  |Verify that the grantee user see Purchased Services, Application Budget Categories modal, having a 'Provider of Services' column (Short text 255 Character, Editable, by default blank for all row and Required on Save)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    #NYSED-2772
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                             | Yes             | Provider of Services | Calculation of Cost | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | ---AUTOEnvData:-:Char256--- | Yes             | Provider of Services | Calculation of Cost | 100                  | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | ---AUTOEnvData:-:Char255--- | Yes             | Provider of Services | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Provider of Services | Description of Item/Service |
      | Provider of Services | Description of Item         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Delete" icon for "Provider of Services" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2771
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services |                     | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost         | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | ---AUTOEnvData:-:Char256--- | 100                  | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost         | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | ---AUTOEnvData:-:Char255--- | $100                 | $100       | $100           | $200        | $300               |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost |
      | Description of Item         | Calculation of Cost |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2773
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost |                      | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | ee                   | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | -99                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | 500.88               | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $50,088              | $100       | $100           | $200        | $50,288            |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2775
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             |                 | Calculation of Cost | 100                  | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor             | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | ---AUTOEnvData:-:Char256--- | Calculation of Cost | 100                  | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor             | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | ---AUTOEnvData:-:Char255--- | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item | Provider/Vendor |
      | Description of Item | Provider        |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider        | Calculation of Cost | $100                 | $100       | $100           | $200        | $300               |
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2774 @NYSED-2789 @NYSED-2926 @Sprint-24 @US-NYSED-1853 @M05
  Scenario Outline: Verify that the grantee user see Purchased Services, Application Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal, cannot be negative and $0 for new row)
  |Verify that the grantee user see Supplies and Materials, Application Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns (Editable, Optional, Currency Field, not accepting decimal, cannot negative and $0 for new row)|
  |Verify that the grantee user see Equipment, Application Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns ( Editable, Optional, Currency Field without decimal places, negative not allowed and $0 for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #Purchased Services
    #NYSED-2774
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure |
      | Description of Item         | Yes             | Provider of Services | Calculation of Cost | 100                  |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 | $0         | $0             | $0          | $100               |
      |             | Total                       |                 |                      |                     | $100                 | $0         | $0             | $0          | $100               |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match | Non-Cash Match |
      | Description of Item         | 20.12      | 10.77          |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 | $2,012     | $1,077         | $3,089      | $3,189             |
      |             | Total                       |                 |                      |                     | $100                 | $2,012     | $1,077         | $3,089      | $3,189             |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match | Non-Cash Match |
      | Description of Item         | ee         | ee             |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" :
      | Actions     | Description of Item/Service | Is Subcontract? | Provider/Vendor      | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description of Item         | Yes             | Provider of Services | Calculation of Cost | $100                 |            |                | $0          | $100               |
      |             | Total                       |                 |                      |                     | $100                 | $0         | $0             | $0          | $100               |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match | Non-Cash Match |
      | Description of Item         | -11        | -77            |
    Then I softly see the following messages in the page details contains:
      | Cash Match cannot be negative.     |
      | Non-Cash Match cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    #Supplies and Materials
    #NYSED-2789
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2        | 100       | 100             | 1000                 |            |                |
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$0" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match | Non-Cash Match |
      | Description of Item         | -100       | -100           |
    Then I softly see the following messages in the page details contains:
      | Non-Cash Match cannot be negative. |
      | Cash Match cannot be negative.     |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Cash Match | Non-Cash Match |
      | Description of Item         | 20.12      | 20.12          |
    #NYSED-2789
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$2,012" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$2,012" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$4,024" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$5,024" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2926
    #Equipment
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                |
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$0" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$0" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$0" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Cash Match | Non-Cash Match |
      | Description of Item | 10.0       | 10.0           |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Cash Match | Non-Cash Match |
      | Description of Item | @$F        | %GH            |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$0" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Cash Match | Non-Cash Match |
      | Description of Item | -88        | -99            |
    #NYSED-2926
    Then I softly see the following messages in the page details contains:
      | Cash Match cannot be negative.     |
      | Non-Cash Match cannot be negative. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @536097 @NYSEDSprint-13 @US-519161 @M05 @Bug-Ticket-543935 @needtochangeuseraftercreationofneworg @ExecutionPendingDueToBug
  Scenario Outline:Verify that the 'Submit and Certify' and 'LEA Admin' users, if they change the role for any active user, then the user works as per the new role. View Only Role-->change to Submit and Certify Role.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_VO Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "6" seconds
    And I enter in modal value "Submit and Certify" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "Submit and Certify" for title "Role" against the value "{SavedValue:EXTERNAL_VO Username}" inside table "---home:-:userContactsTableId---"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ANOTHER_ORG_NOTFORPROFIT_NO_BAFA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "EXTERNAL_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter value "K.B.Street" into field "Addressline1__c"
    When I enter value "Automation" into field "Addressline2__c"
    When I enter value "12" into field "County__c"
    When I enter value "Chicago" into field "City__c"
    When I enter value "34565" into field "Zip4__c"
    When I enter value "USA" into field "Country__c"
    When I enter value "AK" into field "State__c"
    And I enter value "Manual Test" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "EXTERNAL_VO" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "USA" into field "BillingCountry"
    And I click on "Save" in the page details
      #536097
    Then I softly see field "Country" as "USA"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    And I enter value "Changed Role" into field "Justification__c"
    When I click on "Save" in the page details
      #536097
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit Application" in page detail
    Then I softly see rich text field "Justification__c" with fieldname "Justification for Project Cost" as "Changed Role"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_VO Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "7" seconds
    And I enter in modal value "View Only" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "View Only" for title "Role" against the value "{SavedValue:EXTERNAL_VO Username}" inside table "---home:-:userContactsTableId---"

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_LEA |

  @536093 @NYSEDSprint-13 @US-519161 @M05 @Bug-Ticket-543935 @needtochangeuseraftercreationofneworg @ExecutionPendingDueToBug
  Scenario Outline:Verify that the 'Submit and Certify' and 'LEA Admin' users, if they change the role for any active user, then the user works as per the new role. Create and Edit Role-->change to LEA Admin Role.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_CE Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "6" seconds
    And I enter in modal value "LEA Admin" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "LEA Admin" for title "Role" against the value "{SavedValue:EXTERNAL_CE Username}" inside table "---home:-:userContactsTableId---"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ANOTHER_ORG_NOTFORPROFIT_NO_BAFA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "EXTERNAL_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter value "K.B.Street" into field "Addressline1__c"
    When I enter value "Automation" into field "Addressline2__c"
    When I enter value "12" into field "County__c"
    When I enter value "Chicago" into field "City__c"
    When I enter value "34565" into field "Zip4__c"
    When I enter value "USA" into field "Country__c"
    When I enter value "AK" into field "State__c"
    And I enter value "Manual Test" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    When I re-login to "Grants Portal" app as "EXTERNAL_CE" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    And I enter value "USA" into field "BillingCountry"
    And I click on "Save" in the page details
      #536093
    Then I softly see field "Country" as "USA"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "Edit" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "3" seconds
      #536093
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right dropdown button "Submit Application" in page detail
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    And I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_CE Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "7" seconds
    And I enter in modal value "Create and Edit" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "Create and Edit" for title "Role" against the value "{SavedValue:EXTERNAL_CE Username}" inside table "---home:-:userContactsTableId---"

    Examples:
      | UserType     |
#      | EXTERNAL_SC  |
      | EXTERNAL_LEA |

  @536101 @536102 @NYSEDSprint-13 @US-519161 @M05 @needtochangeuseraftercreationofneworg
  Scenario: Verify that at least 1 Active 'LEA Admin' or 'Submit and Certify' role user should be present in the organization, post update, if not so do not edit and give below validation:
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "EXTERNAL_SC" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_SC Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "6" seconds
    And I enter in modal value "Create and Edit" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "Create and Edit" for title "Role" against the value "{SavedValue:EXTERNAL_SC Username}" inside table "---home:-:userContactsTableId---"
    When I re-login to "Grants Portal" app as "EXTERNAL_LEA" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_LEA Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "6" seconds
    And I enter in modal value "Create and Edit" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
      #536101
    Then I softly see the following messages in the page details contains:
      | Action cannot be completed. The organization must have an active 'LEA Admin' or 'Submit and Certify' user. Assign 1 user with either 'LEA Admin' or 'Submit and Certify' user role, before editing the existing one. |
    And I click modal button "Close"
    When I click alert button "OK"
    And I wait for "4" seconds
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_LEA Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "7" seconds
    And I enter in modal value "Submit and Certify" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "Submit and Certify" for title "Role" against the value "{SavedValue:EXTERNAL_SC Username}" inside table "---home:-:userContactsTableId---"
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_LEA Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "6" seconds
    And I enter in modal value "Create and Edit" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "Create and Edit" for title "Role" against the value "{SavedValue:EXTERNAL_LEA Username}" inside table "---home:-:userContactsTableId---"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I pause execution for "3" seconds
    When I click on "Edit" icon for "Automation Grantee_SubmitCertify" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "6" seconds
    And I enter in modal value "Create and Edit" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
      #536102
    Then I softly see the following messages in the page details contains:
      | Action cannot be completed. The organization must have an active 'LEA Admin' or 'Submit and Certify' user. Assign 1 user with either 'LEA Admin' or 'Submit and Certify' user role, before editing the existing one. |
    And I click modal button "Close"
    When I click alert button "OK"
    And I wait for "4" seconds
    When I click on "Edit" icon for "{SavedValue:EXTERNAL_LEA Username}" inside flex table with id "---home:-:userContactsTableId---"
    And I wait for "7" seconds
    And I enter in modal value "LEA Admin" into field "NYSED_RecipientRole__c"
    And I click modal button "Save"
    Then I softly see value "LEA Admin" for title "Role" against the value "{SavedValue:EXTERNAL_LEA Username}" inside table "---home:-:userContactsTableId---"

  @NYSED-2790 @NYSED-2791 @NYSEDSprint-25 @US-NYSED-1854 @M05
  Scenario Outline: Verify that the grantee user see Supplies and Materials, Application Budget Categories modal, having a 'Description of Item' column (Short text 255 Character, Editable, by default blank for new row and Required on Save)
  |Verify that the grantee user see Supplies and Materials, Application Budget Categories modal, having a 'Proposed Expenditure' column (Editable, Currency Field without decimals, by default blank for new row and Required on Save, cannot negative)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                             | 200                                                      | 2        | 100       | 100             | 1000                 | 100        | 100            |
    #NYSED-2790
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | ---AUTOEnvData:-:Char256--- | 200                                                      | 2        | 100       | 100             | 1000.9               | 100        | 100            |
    #NYSED-2790 #NYSED-2791
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "---AUTOEnvData:-:Char255---" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$10,009" for title "Proposed Expenditure" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$10,209" for title "Total Project Cost" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | ---AUTOEnvData:-:Char255--- | 300                                                      |
    #NYSED-2790 #NYSED-2791
    Then I softly see value "300" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "---AUTOEnvData:-:Char255---" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$10,009" for title "Proposed Expenditure" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$10,209" for title "Total Project Cost" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item/Service" against the value "300" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I click on "Delete" icon for "---AUTOEnvData:-:Char255---" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | 200                                                      | 2        | 100       | 100             |                      | 100        | 100            |
    #NYSED-2791
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | 200                                                      | 2        | 100       | 100             | -1000                | 100        | 100            |
    #NYSED-2791
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                 | 200                                                      | 2        | 100       | 100             | mek                  | 100        | 100            |
    #NYSED-2791
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2793 @NYSED-2792 @NYSEDSprint-25 @US-NYSED-1854 @M05
  Scenario Outline: Verify that the grantee user see Supplies and Materials, Application Budget Categories modal, having a 'Unit Cost' column ( Editable, Required, Currency Field up to 2 decimal places, cannot be negative and $0 for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2793
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost |
      | Description of Item         | 3        |           |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2        | -888      | 100             | 1000                 | 100        | 100            |
    And I wait for "1" seconds
    #NYSED-2793 #NYSED-2792
    Then I softly see the following messages in the page details contains:
      | Unit Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2        | @#FF      | 100             | 1000                 | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "5" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2        | 100       | 100             | 1000                 | 100        | 100            |
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Quantity | Unit Cost |
      | Description of Item         | 3        |           |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | @#FF     | 2         | 100             | 1000                 | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "5" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 88.988   | 100       | 100             | 1000                 | 100        | 100            |
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "88.98" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$8,998" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2927 @NYSED-2929 @Sprint-12 @US-529710 @M05
  Scenario Outline: Verify that the grantee user see Equipment, Application Budget Categories modal, having a 'Description of Item' column (Short text 255 Character, Editable, by default blank for all row and Required on Save)
  |Verify that the grantee user see Equipment, Application Budget Categories modal, having a 'Quantity' column ( Editable, Required, Number  Field up to 2 decimal places and Blank for new row)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2927
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      |                     | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item         | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | ---AUTOEnvData:-:Char256--- | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see value "---AUTOEnvData:-:Char255---" for title "Description of Item" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "---AUTOEnvData:-:Char255---" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "2.00" for title "Quantity" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Vendor | Description of Item |
      | test   | Description of Item |
    Then I softly see value "Description of Item" for title "Description of Item" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   |          | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    #NYSED-2929
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   |          | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    #NYSED-2929
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | ee       | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    #NYSED-2929
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | -34      | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Quantity cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 34.12    | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see value "Description of Item" for title "Description of Item" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "34.12" for title "Quantity" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$3,512" for title "Calculated Proposed Expenditure" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "test" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2817 @NYSED-2818 @NYSED-2824 @NYSED-2822 @NYSED-2825 @NYSED-2831 @NYSED-2832 @NYSEDSprint-14 @US-535876 @Sprint-24 @US-NYSED-1856 @M05
  Scenario Outline: Verify that grantee user can see 'Employee Benefits' budget category under the budget categories table
  |Verify that grantee user can see the inline action name as 'View/Add Line Item Details', under the budget categories table on created application, if 'Is a Detailed Budget Required on the Application? - Yes' on the announcement|
  |Verify that if Announcement owner has selected 'Sub-recipient Match Required- Yes' setting then on application, the grantee user can see columns- Cash Match, Non-Cash Match and Total Match on budget table and categories modal - Employee Benefits|
  |Verify that the grantee user can add/edit/delete line items on Application Budget Categories Modal, if Application is in created state - Employee Benefits|
  |Verify that the grantee user can see on save all the added value sums up properly at the category level- Employee Benefits|
  |Verify that when grantee user can see section button New on the 'Budget Category: 80 - Employee Benefits' modal and when clicked, new line item is added|
  |Verify that when grantee user clicks on the 'View/Add Line Item Details' action then related modal gets open with correct actions and fields|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    #change sec
    And I wait for "10" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2817 #NYSED-2818 #NYSED-2822 #NYSED-2832
    Then I see only the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions | Budget Category | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---applicationReview:-:budgetTableId---"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    Then I see only the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Actions | Benefit | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
    #NYSED-2824
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 2                    |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | $2                   |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 20                   |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | $20                  |
    When I click on "Delete" icon for "Automation Benefits- 1" inside flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2825 #NYSED-2831
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 28.99                | 50         | 10             |
      | Automation Benefits- 2 | 100                  | 7.88       | 20             |
      | Automation Benefits- 3 | 500.78               | 10         | 2              |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits- 1 | $2,899               | $50        | $10            | $60         | $2,959             |
      | Automation Benefits- 2 | $100                 | $788       | $20            | $808        | $908               |
      | Automation Benefits- 3 | $50,078              | $10        | $2             | $12         | $50,090            |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 2 | 20                   | 20         | 20             |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits- 1 | $2,899               | $50        | $10            | $60         | $2,959             |
      | Automation Benefits- 2 | $20                  | $20        | $20            | $40         | $60                |
      | Automation Benefits- 3 | $50,078              | $10        | $2             | $12         | $50,090            |
      | Total                  | $52,997              | $80        | $32            | $112        | $53,109            |
    When I click on "Delete" icon for "Automation Benefits- 2" inside flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Automation Benefits- 1 | $2,899               | $50        | $10            | $60         | $2,959             |
      | Automation Benefits- 3 | $50,078              | $10        | $2             | $12         | $50,090            |
      | Total                  | $52,977              | $60        | $12            | $72         | $53,049            |
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category   | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Employee Benefits | 80                   | $52,977 | $60        | $12            | $72         | $53,049            |

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2830 @NYSED-2828 @NYSEDSprint-14 @US-535876 @Sprint-24 @US-NYSED-1856 @M05
  Scenario Outline: Verify that the grantee user see Application Budget Categories modal, having a 'Proposed Expenditure' column ( Editable, Required, Currency Field without decimal places and $0 for new row)
  |Verify that the grantee user see Application Budget Categories modal, having a 'Benefit' column (Short text 255 Character, Editable, by default blank for new row and Required on Save)|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #NYSED-2830
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 |                      |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | $%^HH                |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 88.88                |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | $8,888               |
    When I click on "Delete" icon for "Automation Benefits- 1" inside flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2828
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit | Proposed Expenditure |
      |         | 4                    |
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                     | Proposed Expenditure |
      | ---AUTOEnvData:-:Char256--- | 4                    |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                     | Proposed Expenditure |
      | ---AUTOEnvData:-:Char255--- | $4                   |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                     | Proposed Expenditure | Cash Match | Non-Cash Match |
      | ---AUTOEnvData:-:Char255--- | 20                   | 20         | 20             |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Benefit                     | Proposed Expenditure |
      | ---AUTOEnvData:-:Char255--- | $20                  |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                     | Proposed Expenditure |
      | ---AUTOEnvData:-:Char255--- | -99                  |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Proposed Expenditure cannot be negative. |

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC  |

  @NYSED-2820 @NYSED-2823 @538252 @US-535876 @NYSEDSprint-14 @Sprint-24 @US-NYSED-1856 @M05
  Scenario Outline: Verify that grantee user cannot see the New button and Edit & Delete actions on 'Budget Category: 80 - Employee Benefits' modal, if the application is in other than created state
  |Verify that other than submit and certify or create and edit role user cannot see the New button and Edit & Delete actions on the modal, if the application is in created state.|
  |Verify that the grantee user can see the Indirect Rate (%) field data type is changed to a percent field with 2 decimal places on application if rate type is Restricted or Unrestricted or Fixed.-Lower rate on announcement|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly can see row level action button "View/Add Line Item Details" against "Employee Benefits" in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefit-1 | 500                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Title                   | 10             | 10  | 10                     | 10                                                 | 500              | 100        | 100            |
    And I click modal button "Close"
    #NYSED-2823
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-2823
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                          | Is Key Contact |
      | Automation Grantee_CreateEdit | Checked        |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #538252
    When I navigate to "Budget" sub tab
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Given I expand nested table containing column value "BP01"
    #NYSED-2820
    Then I softly see value "Employee Benefits" for title "Budget Category" inside table "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    Then I softly see the text containing "Budget Category : Employee Benefits"
    Then I softly can see "80 - Employee Benefits" sub tab at view detail page
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Automation Benefit-1" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_CE |

  @NYSED-2829 @NYSEDSprint-14 @US-535876 @M05
  Scenario Outline: Verify that the grantee user see Application Budget Categories modal, having a 'Cash Match' and 'Non Cash Match' columns in Line Item Details table (Editable, Optional, Currency Field without decimal, cannot be negative and $0 for new row)
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    #Employee Benefits
    #NYSED-2829
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure |
      | Automation Benefits- 1 | 2                    |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Automation Benefits- 1 | $2                   | $0         | $0             | $0          | $2                 |
      |             | Total                  | $2                   | $0         | $0             | $0          | $2                 |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 20                   | 20.12      | 10.77          |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Automation Benefits- 1 | $20                  | $2,012     | $1,077         | $3,089      | $3,109             |
      |             | Total                  | $20                  | $2,012     | $1,077         | $3,089      | $3,109             |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 2                    | $%^        | DF%^^          |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" :
      | Actions     | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Automation Benefits- 1 | $2                   |            |                | $0          | $2                 |
      |             | Total                  | $2                   | $0         | $0             | $0          | $2                 |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "Edit" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 2                    | -11        | -99            |
    Then I softly see the following messages in the page details contains:
      | Cash Match cannot be negative.     |
      | Non-Cash Match cannot be negative. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @537658 @537662 @537671 @537660 @NYSEDSprint-14 @US-535253 @M05
  Scenario:Verify that the section button 'New' is not visible to internal users in the Notes section under the Forms and Files tab on the Application layout when the application is in the 'Created' state.
  |Verify that the section button 'New' is visible to all internal users in the Notes section under the Forms and Files tab on the Application layout when the application is in the 'Submitted to Grantor', 'Review Initiated' or 'Reviewed' state.|
  |Verify that the inline action buttons are not visible to grantee users in the Notes section when the note is added by an internal user and the application is in the 'Submitted to Grantor', 'Review Initiated' or 'Reviewed' state.|
  |Verify that inline action buttons are visible to note owner only in the Notes section under Forms and Files tab on the Application layout when application is in the 'Submitted to Grantor', 'Review Initiated' or 'Reviewed' state.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I enter value "K.B.Street" into field "Addressline1__c"
    When I enter value "Automation" into field "Addressline2__c"
    When I enter value "12" into field "County__c"
    When I enter value "Chicago" into field "City__c"
    When I enter value "34565" into field "Zip4__c"
    When I enter value "USA" into field "Country__c"
    When I enter value "AK" into field "State__c"
    And I enter value "Manual Test" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I get the "EGMS ID"
    And I refresh the page
    #537658
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see field "Status" as "Created"
    And I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Title                   | 10             | 10  | 10                     | 10                                                 | 500              | 100        | 100            |
    And I click modal button "Close"
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit                | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefits- 1 | 200                  | 10         | 50             |
    And I click modal button "Close"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #537656 - Submitted to Grantor
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Forms and Files" sub tab
    #537662 537656
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                         | Description      |
      | Notes Record Added by FD User | Automation Notes |
    Then I softly can see row level action button "Edit" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
     #537671  Submitted to Grantor
    And I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "New" inside flex table "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Forms and Files" sub tab
    #537662 537656
    Then I softly see top right button "New" inside flex table "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "No Actions Available" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    And I wait for "2" seconds
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    #537660
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I softly can see row level action button "Edit" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record Added by FD User" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "Edit" :
      | Title                         | Description              |
      | Notes Record Added by FD User | Automation Notes-Updated |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:grantorApplicationNotesTableId---" :
      | Title                         | Description              |
      | Notes Record Added by FD User | Automation Notes-Updated |
    When I click on "Delete" icon for "Notes Record Added by FD User" inside flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    #Notes add before review initiate
    Given I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Forms and Files" sub tab
    When I enter the following values into flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---" by clicking "New" :
      | Title                               | Description      |
      | Notes Record_Before review initiate | Automation Notes |
    Then I softly can see row level action button "Edit" against "Notes Record_Before review initiate" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record_Before review initiate" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I wait for "5" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    And I wait for "3" seconds
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementTableId---"
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
     #537671  'Review Initiated'
    And I navigate to "Forms and Files" sub tab
    Then I softly do not see top right button "New" inside flex table "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "Notes Record1" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    Then I softly cannot see row level action button "Delete" against "Notes Record1" in flex table with id "---applicationIntake:-:subrecipientApplicationNotesTableId---"
    #537660 'Review Initiated'
    Given I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I navigate to "Forms and Files" sub tab
    Then I softly can see row level action button "Edit" against "Notes Record_Before review initiate" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record_Before review initiate" in flex table with id "---applicationIntake:-:grantorApplicationNotesTableId---"

  @537460 @NYSEDSprint-14 @US-529521 @M05
  Scenario Outline:  Verify that the Internal User sees 'View/Add Line Item Details' action button is available for FS-10 budget type when 'Is a Detailed Budget Required on the Application?' is set to Yes.- Employee Benefits
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    When I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Title   | 100                  | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I wait for "3" seconds
    When I click on "Submit Application" in the page details
    And I pause execution for "6" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "Record Id" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I pause execution for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Edit" against "Title" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly cannot see row level action button "Delete" against "Title" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"
    Then I softly can see row level action button "No Actions Available" against "Title" in flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @539288 @539258 @NYSEDSprint-15 @US-537967 @M05
  Scenario Outline:Verify that grantee users do not see the All forms section under the Forms and Files tab on the Application layout.
  |Verify that internal users do not see the All forms section under the Forms and Files tab on the Application layout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    #539288
    Then I softly do not see "All Forms" page block displayed
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Application Files              |
      | Notes                          |
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    #539288
    Then I softly do not see "All Forms" page block displayed
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Application Files              |
      | Notes                          |
    And I get the "EGMS ID"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    When I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    #539258
    Then I softly do not see "All Forms" page block displayed
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Application Files              |
      | Notes                          |
    Given I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    When I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    #539258
    Then I softly do not see "All Forms" page block displayed
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Application Files              |
      | Notes                          |
    Given I re-login to "As a Grantor" app as "<InternalUser>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    When I navigate to "Forms and Files" sub tab
    And I wait for "2" seconds
    #539258
    Then I softly do not see "All Forms" page block displayed
    Then I see only the following ordered page blocks :
      | Supporting Documents Checklist |
      | Application Files              |
      | Notes                          |

    Examples:
      | UserType   | InternalUser |
      | GRANTEE_CE | FD           |
#      | GRANTEE_LEA | FO           |
#      | GRANTEE_VO  | EXE          |

  @540043 @NYSEDSprint-15 @US-528127 @M05
  Scenario Outline:Verify that the 'Create and Edit' and 'Submit and Certify' users see the validation message when the Total Budgeted Amount is more than the Allocation Amount on the Application created for the Formula BAFA Announcement and application status is Created.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES_NO_MATCH"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 11000                |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Overview" sub tab
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    #540043
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount cannot be more than the Allocation Amount for Focus Areas {Automation Permanent Focus Area} |
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 1000                 |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    #540043
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount cannot be more than the Allocation Amount for Focus Areas {Automation Permanent Focus Area} |
    And I wait for "3" seconds
    #540043
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @539296 @NYSEDSprint-15 @US-528127 @M05
  Scenario: Verify that the 'Create and Edit' and 'Submit and Certify' users see the validation message when the Total Budgeted Amount is more than the Allocation Amount on the Application created for the Formula BA Announcement and application status is Created.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 11000            | 900        | 0              |
    And I click modal button "Close"
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    #539296
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount cannot be more than the Allocation Amount. |
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 900        | 0              |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    #539296
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - The Budgeted Amount cannot be more than the Allocation Amount. |

  @539747-BA @NYSEDSprint-15 @US-528127 @M05
  Scenario Outline:Verify that the 'Create and Edit' and 'Submit and Certify' users see that the data type of all currency fields at the Application layout->Budget tab has been changed to accept whole numbers only when the budget type is selected as FS-10. - Formula Ann
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 110.11 | 500        | 400            |
    And I refresh the page
    And I wait for "2" seconds
    #539747
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$1,101"
    Then I softly see field "Budgeted Direct Amount" as "$11,011"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Total Budgeted Amount" as "$11,011"
    Then I softly see value "$11,011" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Given I expand nested table containing column value "BP01"
    #539747
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget  | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $11,011 | $500       | $400           | $900        | $11,911            |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#        | GRANTEE_CE |

  @539747-BAAF @512177-BAAF @545645 @NYSEDSprint-15 @US-528127 @NYSEDSprint-14 @NYSEDSprint-19 @US-536980 @US-544809 @M05 @M04
  Scenario Outline:Verify that the 'Create and Edit' and 'Submit and Certify' users see that the data type of all currency fields at the Application layout->Budget tab has been changed to accept whole numbers only when the budget type is selected as FS-10. - Formula Ann
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I navigate to "Overview" sub tab
    #512177
    Then I softly do not see "Applicants" page block displayed
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 500    | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    #539747 #545645
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$50"
    Then I softly see field "Budgeted Direct Amount" as "$500"
    Then I softly see field "Requested Indirect Amount" as "$500"
    Then I softly see field "Total Budgeted Amount" as "$1,000"
    Then I softly see value "$1,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$50" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Given I expand nested table containing column value "BP01"
    #539747
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $500   | $10        | $10            | $20         | $520               |
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I wait for "2" seconds
    #545645
    Then I softly see that "Allocation Amount" rendered in view mode only
    Then I softly see that "Indirect Rate (%)" rendered in view mode only
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only
    Then I softly see that "Budgeted Direct Amount" rendered in view mode only
    Then I softly see that "Total Budgeted Amount" rendered in view mode only

    Examples:
      | UserType   |
      | GRANTEE_SC |
#        | GRANTEE_CE |

  @539294-Competitive @512177-Competitive @545631 @NYSEDSprint-15 @US-528127 @NYSEDSprint-14 @US-536980 @NYSEDSprint-19 @US-544809 @M05 @M04
  Scenario Outline:Verify that the 'Create and Edit' and 'Submit and Certify' users see that the data type of all currency fields at the Application layout->Budget tab has been changed to accept whole numbers only when the budget type is selected as FS-10.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I navigate to "Overview" sub tab
    #512177
    Then I softly do not see "Applicants" page block displayed
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AppID"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 500    | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    #539294
    Then I softly see field "Subaward Floor" as "$1,000"
    Then I softly see field "Subaward Ceiling" as "$10,000"
    Then I softly see field "Maximum Indirect Allowed" as "$50"
    Then I softly see field "Budgeted Direct Amount" as "$500"
    Then I softly see field "Requested Indirect Amount" as "$500"
    Then I softly see field "Total Budgeted Amount" as "$1,000"
    Then I softly see value "$1,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$50" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I refresh the page
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    #539294
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $500   | $10        | $10            | $20         | $520               |
    When I click on "Edit" in the page details
    #545631
    Then I softly see that "Indirect Rate (%)" rendered in view mode only
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only
    Then I softly see that "Budgeted Direct Amount" rendered in view mode only
    Then I softly see that "Total Budgeted Amount" rendered in view mode only

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @539294-Directed @512177-Directed @545633 @NYSEDSprint-15 @US-528127 @NYSEDSprint-14 @US-536980 @NYSEDSprint-19 @US-544809 @M05 @M04
  Scenario Outline:Verify that the 'Create and Edit' and 'Submit and Certify' users see that the data type of all currency fields at the Application layout->Budget tab has been changed to accept whole numbers only when the budget type is selected as FS-10.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Then I navigate to "Overview" sub tab
    #512177
    Then I softly do not see "Applicants" page block displayed
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AppID"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 500    | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    #545633 #539294
    Then I softly see field "Subaward Floor" as "$1,000"
    Then I softly see field "Subaward Ceiling" as "$10,000"
    Then I softly see field "Maximum Indirect Allowed" as "$50"
    Then I softly see field "Budgeted Direct Amount" as "$500"
    Then I softly see field "Requested Indirect Amount" as "$500"
    Then I softly see field "Total Budgeted Amount" as "$1,000"
    Then I softly see value "$1,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$50" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I refresh the page
    And I wait for "3" seconds
    Given I expand nested table containing column value "BP01"
    #539294
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---" :
      | Actions     | Budget Category             | Budget Category Code | Budget | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Professional Staff Salaries | 15                   | $500   | $10        | $10            | $20         | $520               |
    When I click on "Edit" in the page details
    #545633
    Then I softly see that "Indirect Rate (%)" rendered in view mode only
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only
    Then I softly see that "Budgeted Direct Amount" rendered in view mode only
    Then I softly see that "Total Budgeted Amount" rendered in view mode only

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @539353 @543862 @NYSEDSprint-15 @US-502891 @US-538768 @M05
  Scenario Outline: Verify that when Save & Continue is clicked on the Create Application modal, the grantee user is not stopped if it is set as Yes on the respective organization profile.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I wait for "7" seconds
    #539353
    Then I softly see field "Not For Profit" as "Yes"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AppID"
    When I navigate to "Overview" sub tab
    #539353
    Then I softly see field "Not For Profit" as "Yes"
    #543862
    Then I softly see field "Applicant Organization" as "{SavedValue:SubrecipientOrg}"
    Then I softly see field "Creating For" as "Self"
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "UEI" inside page block
    Then I softly see field "SAM Expiration Date" inside page block

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @545636 @543146 @NYSEDSprint-17 @US-538768 @NYSEDSprint-19 @US-544809 @M05
  Scenario Outline:Verify that the 'Submit and Certify' user see the validation message after clicking the Submit Application button when the Requested Indirect Amount is greater than the Maximum Indirect Allowed at focus area level. - Competitive
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_SECOND_FOCUS_AREA"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I click modal button "Save and Continue"
    #543146
    Then I softly see the following messages in the page details contains:
      | To save, Creating For is required. |
    Then I see only the following ordered options in dropdown field "NYSED_CreatingFor__c" :
      | --None-- | Self | On behalf of |
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
     #543146
    Then I softly see field "Child Organization" inside page block
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Select 'Child Organization' to continue or select 'Self' in the 'Creating for' field. |
    #543146
    Then I softly see field "Creating For" added after "Application Title"
    Then I softly see field "Child Organization" added after "Creating For"
    Then I softly see field "Not For Profit" added after "Child Organization"
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    #543146
    Then I softly cannot see field "Child Organization" inside page block
    And I click modal button "Save and Continue"
    Then I softly cannot see the following messages in the page details contains:
      | To save, Creating For is required. |
    Then I softly cannot see the following messages in the page details contains:
      | Select 'Child Organization' to continue or select 'Self' in the 'Creating for' field. |
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    #543146
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 500    | 100        | 100            |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    #545636
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @543145 @NYSEDSprint-17 @US-538768 @M05
  Scenario Outline:Verify that the Grantee user is stopped when clicking on the Save and Continue button on the Create Application modal if the 'Not For Profit' flag is set to NA at the organization profile.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:AutomationPermanentNotforProfitNAOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:AutomationPermanentNotforProfitNAOrg---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "5" seconds
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Is Parent Organization" as "Yes"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:AutomationPermanentNotforProfitNAOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                        | Allocation Amount |
      | {SavedValue:AutomationPermanentNotforProfitNAOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I wait for "2" seconds
    And I collapse nested table containing column value "Grants Finance Review"
    And I click on "Submit For Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    #543145
    Then I softly see field "Not For Profit" as "NA"
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    #543145
    Then I softly see the following messages in the page details contains:
      | 'Not For Profit' value is not available for the organization. Contact LEA Admin or Submit and Certify user to update the value at the organization profile. |

    Examples:
      | ExternalUser                |
      | PARENT_ORG_EXTERNAL_USER_SC |

  @512170 @Sprint-07 @US-496790 @M04
  Scenario: Verify that the Grantee user see below field is shown on opportunity layout->Overview Tab->Opportunity Specific Settings Section: a. First Payment%
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_CE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see field "First Payment %" inside page block
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I navigate to "Overview" sub tab
    Then I softly see field "First Payment %" inside page block
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    When I navigate to "Overview" sub tab
    Then I softly see field "First Payment %" inside page block
    When I hovering mouse on help text icon inside page block detail "First Payment %"