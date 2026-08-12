@FormulaWB @AnnouncementTemp2  @Product-M04 @announcementExecution @Productannouncement
Feature: Validate all scenarios in the Formula Announcement tab

  @204386 @204387 @ValidatePMuserdeleteanyfocusareafromtheFocusareassectionthatFocusarearowfromtheApplicantssectionshouldgetremovedautomaticallyforallapplicants&subtotalshouldgetupdated @sprint-8-US-206947  @Allocation
  Scenario: Validate PM user delete any focus area from the "Focus areas" section,that Focus area row from the "Applicants" section should get removed automatically (for all applicants) & subtotal should get updated
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" by showing entries "All" in flex table with id "---announcement:-:selectAnnouncementServiceArea1TableId---"
    And I pause execution for "3" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    Then I softly see value "{SavedValue:SubrecipientOrg}" for title "Applicants" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I softly see value "Automation Permanent Focus Area" for title "Focus Area" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click on "Remove" icon for "Automation Permanent Focus Area2" inside table with table id "---announcement:-:AnnouncementServiceArea1TableId---" without processing
    #204387
    Then I see confirmation box with body "This Focus area will also get removed from the Applicants table, Are you sure you want to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I refresh the page
    #204386
    Then I softly do not see value "Automation Permanent Focus Area2" for title "Focus Area" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"

  @219184 @ValidateusershouldnotbeabletoaddmorethanonebudgetperiodforformulaAnnouncement @sprint-8-US-208408  @Allocation
  Scenario: Validate user should not be able to add more than one budget period for formula Announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I wait for "2" seconds
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    Then I softly see the following messages in the page details contains:
      | In the Formula announcements budgeting can be done only for first budget period. |

  @220898 @ValidateuseraddsamefocusareatodifferentOrganizationthenonlyrespectivefocusareashoulddisplaytothisorganization @sprint-9-US-204998  @Allocation @Pre-ScreenOnHoldSPI @APIFAILINVALIDSESSIONID
  Scenario: Validate user add same focus area to different Organization then only respective focus area should display to this organization
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" and properties "LUMSUM_BY_APPLICANT_FOCUS_AREA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Summary" page block displayed
    Then I softly see value "{SavedValue:AutomationPermanentFocusArea}" for title "Focus Area" inside table "---applicationIntake:-:budgetSummaryTableId---"
    When I click on "Qualify" in the page details
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Summary" page block displayed
    Then I softly see value "{SavedValue:AutomationPermanentFocusArea}" for title "Focus Area" inside table "---applicationIntake:-:budgetSummaryTableId---"
    And I navigate to "Opportunities" tab
    And I pause execution for "3" seconds
    When I navigate to "Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:qualifiedTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:qualifiedTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Financials" sub tab
    And I wait for "5" seconds
    Then I softly see "Budget Summary" page block displayed
    Then I softly see value "{SavedValue:AutomationPermanentFocusArea}" for title "Focus Area" inside table "---applicationIntake:-:budgetSummaryTableId---"

  @226416 @VerifyIfuseraddingonefocusareathenatleastonefocusareamustbepresentinthefocusareasectionotherwiseshowtheerrormessageonAddorganizations @sprint-11-US-201040  @Allocation
  Scenario: Verify If user adding one focus area, then at least one focus area must be present in the focus area section, otherwise, show the error message on Add organizations .
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnn_ProgWithNoFA" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #226416
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Please associate at least one Focus Area before adding Organization, As Allocation level is by "By Applicant and Focus Area" . |

  @222464 @222465 @222468 @VerifyusercannotdeletetheassociatedfocusareawhenAnnouncementisinApprovedPublishedUnpublishedState @sprint-11-US-201558  @Allocation
  Scenario: Verify user cannot delete the associated focus area when Announcement is in Approved Published Unpublished state.
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApp_FocusYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I click modal button "Close"
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
	      And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
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
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    #222464
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    #222465
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:AnnouncementServiceArea1TableId---"
    #222468
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    And I click on "Remove" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:AnnouncementServiceArea1TableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | As allocation is "By Applicant and Focus Area", Focus area table must contain at least one focus area if Organizations are associated with the Announcement. |

  @222261 @Verifyifuserwantsupdatethefinalallocationforagivenorganization&iftheannouncementstatusisunderrevisionthenusershouldseetheupdatedfinalallocationisreflectedinthecorrespondingapplicationbeforeawardcreation @sprint-11-US-201558  @Allocation
  Scenario Outline: Verify if user wants update the final allocation for a given organization & if the announcement status is under revision then user should see the updated final allocation is reflected in the corresponding application (before promoting to FDM )
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" and properties "BY_APPLICANT_FOCUS_NO_ZERO_ALLOCATION"
    And I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    When I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I perform quick search for "<Announcement Name>" in "---announcement:-:formulaAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I click on "Unpublish" in the page details
    Then I softly see field "Status" as "Under Revision"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter value "Public School Districts" into field "EligibleApplicantTypes__c"
    And I enter value "Test" into field "AnnouncementDescription__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    And I wait for "2" seconds
    Then I see status in Progress-bar is "Published" and is "dark blue"
    And I created approved FDM on application "<Announcement Name>"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly see field "Allocation Amount" as "$1,000"

    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @FormulaWBRerun @222381 @VerifyusercanseerowleveleditactionintheapplicantsectionwhenformulaannouncementisinArchivedstateformulaannouncementswithallocationlevelByApplicantFocusArea @sprint-11-US-201558  @Allocation
  Scenario: Verify user can see row level edit action in the applicant section when formula announcement is in Archived state(formula announcements with allocationlevel By Applicant & Focus Area)
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click toggle button to select "Announcements - Closed and Archived"
    When I perform quick search for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:ArchivedStateFormulaAnn_ByApplicantAndFocusArea}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    #222381
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Title                           | Allocation Amount |
      | Automation Permanent Focus Area | 900               |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |

  @326929 @ValidateAdminusershouldabletoseethetwocolumnsinApprovedstateforFormulaAnnouncementwhenAllocationisbyApplicants @sprint-10-US-320518
  Scenario: Verify external user should not see opportunity those external org are added eligible criteria but not invited on formula type of announcement
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I click modal button "Close"
    And I refresh the page
    When I navigate to "Financials" sub tab
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement |
      | Automation PM | Step 1       |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 1000              |
    When I navigate to "Financials" sub tab
	      And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    And I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I expand nested table containing column value "Program Office Review"
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                |
      | {SavedValue:PM Username} | Program Coordinator |
    And I collapse nested table containing column value "Program Office Review"
    And I wait for "2" seconds
    And I expand nested table containing column value "Grants Finance Review"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---announcement:-:CoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Grants Finance Review"
    And I expand nested table containing column value "Funding Decision Memo"
    When I enter the following values into flex table with id "---announcement:-:FDMReviewStepTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    And I collapse nested table containing column value "Funding Decision Memo"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I pause execution for "5" seconds
    And I click on "Publish" in the page details
    Then I softly see status in Progress-bar is "Published" and is "dark blue"
    When I re-login to "Grants Portal" app as "CHILD_EXTERNAL_SC1" user on "SUBPORTAL" portal
    And I wait for "3" seconds
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    Then I softly do not see value "{SavedValue:AnnEGMSID}" for title "EGMS ID" inside table "---applicationIntake:-:activeOpportunitiesTableId---"


