@applicationIntakeNysed @applicationIntakeParentChildNysed @applicationIntakeParentChildNysed1
Feature: Validate all scenarios in the Application Intake parent child realationship

  Background:Set Parent Organization Field as Yes On Subrecipient Organization
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:AutomationPermanentChildOrganization1---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:AutomationPermanentChildOrganization1---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "No" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds

  @543048 @543049 @NYSEDSprint-17 @US-540528 @M05
  Scenario Outline:Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related directed opportunity when the 'Is Parent Organization' flag on the organization profile is set to 'No'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMP_DIREC_MAXIMUM_APPLICATION_ALLOWED_2"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    #543048
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    #543049
    Then I softly see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are 2. |

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |

  @NYSED-3533 @NYSEDSprint-26 @US-NYSED-2112 @M05 @ExecutionRemaining
  Scenario Outline:Verify that the Grantee user is able to create and submit multiple applications when the ‘Is Parent Organization' is set to 'No', and 'Maximum # Applications Allowed’ is set to blank at the opportunity. - Directed type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    And I clear the value from field "MaxApplicationsAllowed__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:AutomationPermanentChildOrganization1}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
    When I navigate to "Setup" sub tab
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
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Publish" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID3"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                                     | Project Role   | Is Key Contact |
      | {SavedValue:CHILD_EXTERNAL_SC1 Username} | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    #NYSED-3533
    Then I softly cannot see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are <Maximum # Applications Allowed number>. |
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID4"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                                     | Project Role   | Is Key Contact |
      | {SavedValue:CHILD_EXTERNAL_SC1 Username} | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | UserType           |
      | CHILD_EXTERNAL_SC1 |

  @NYSED-3531 @NYSEDSprint-26 @US-NYSED-2112 @M05
  Scenario Outline:Verify that the Grantee user is able to create and submit multiple applications when the ‘Is Parent Organization' is set to 'No', and 'Maximum # Applications Allowed’ is set to blank at the opportunity. - Competitive type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    And I clear the value from field "MaxApplicationsAllowed__c"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    And I enter value "Not Allowed" into field "Indirect_Rate_Type__c"
    And I enter value "Justified" into field "Justification__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:AutomationPermanentChildOrganization1}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
    When I navigate to "Setup" sub tab
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
    When I get the "EGMS ID"
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Publish" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID2"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID3"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                                     | Project Role   | Is Key Contact |
      | {SavedValue:CHILD_EXTERNAL_SC1 Username} | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 88.988         | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I click modal button "Save and Continue"
    #NYSED-3531
    Then I softly cannot see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are <Maximum # Applications Allowed number>. |
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID4"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                                     | Project Role   | Is Key Contact |
      | {SavedValue:CHILD_EXTERNAL_SC1 Username} | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 88.988         | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #NYSED-3531
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | UserType           |
      | CHILD_EXTERNAL_SC1 |