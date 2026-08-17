@AlaskaRegression @AlaskaAnnouncementModule
Feature: Announcement

  @Sprint-6-US-394148 @401330 @404254 @404224 @404247 @404252 @404255 @Bug-487321
  Scenario: Announcements: Grantor - Setting Up Shared Revenue Program Announcement
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    #404224
    And I enter "CompetitiveSR" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I see the following messages in the page details :
      | Only Directed type announcements can be created for Shared Revenue Programs. |
    And I click modal button "Close"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    #401330
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #404252
    Then I softly do not see "Financials" sub tab in page detail
    When I navigate to "Overview" sub tab
    #404247
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I softly do not see fields "IsMatchRequired__c" is visible
    Then I softly do not see fields "GranteeMatch__c" is visible
    When I navigate to "Overview" sub tab
    #404255
    Then I softly see "Information" page block displayed
    Then I softly see fields "SharedRevenueProgram__c" is visible
    And I enter "Directed_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    #404254
    When I navigate to "Overview" sub tab
    Then I softly see field "Type" as "Directed"
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement     |
      | {SavedValue:PM Username} | NA           |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Directed Announcements"
    And I perform quick search for "Record Id" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Setup" sub tab
    And I expand nested table containing column value "Pre-Screen Review"
    When I click on "Review Form" icon for "Pre-Screen" inside flex table with id "---announcement:-:subReviewPanelTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Eligibility    | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Completeness   | 50                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Eligibility"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Eligibility"
    And I expand nested table containing column value "Completeness"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    When I close "Review Form" modal by clicking the top right x button
    And I wait for "3" seconds
    When I collapse nested table containing column value "Pre-Screen Review"
    And I wait for "3" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Compliance Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Schedule       | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Environment    | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Permits        | 40                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Schedule"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Schedule"
    And I expand nested table containing column value "Environment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Environment"
    And I expand nested table containing column value "Permits"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Permits"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "ASC Review"
    And I pause execution for "2" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Fiscal Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Budget         | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Match          | 40                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Program Income | 30                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Budget"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Budget"
    And I expand nested table containing column value "Match"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Match"
    And I expand nested table containing column value "Program Income"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Program Income"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    And I collapse nested table containing column value "ASC Review"
    And I pause execution for "2" seconds
    And I expand nested table containing column value "ASC Review"
    When I click on "Review Form" icon for "Program Review" inside flex table with id "---announcement:-:preScreenReviewFormTableId---" without waiting for record
    And I pause execution for "4" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Capability     | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Approach       | 30                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header | Section Weight (%) |
      | Impact         | 40                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Capability"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Capability"
    And I expand nested table containing column value "Approach"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Approach"
    And I expand nested table containing column value "Impact"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Impact"
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    When I collapse nested table containing column value "ASC Review"
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Management Review"
    When I click on "Review Form" icon for "Management Review" inside flex table with id "---announcement:-:subReviewPanelTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header             | Section Weight (%) |
      | Return on Investment (ROI) | 50                 |
    And I edit the following rows inline in flex table with id "---announcement:-:reviewPanelTableId---" by clicking "Edit" :
      | Section Header      | Section Weight (%) |
      | Strategic Alignment | 50                 |
    And I pause execution for "4" seconds
    And I expand nested table containing column value "Return on Investment (ROI)"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    And I collapse nested table containing column value "Return on Investment (ROI)"
    And I expand nested table containing column value "Strategic Alignment"
    When I enter the following values into flex table with id "---announcement:-:reviewPanelQuestionsTableId---" by clicking "New" :
      | Question Order | Question  | Type    | Max Score |
      | 1              | Question1 | Written | 100       |
    And I pause execution for "4" seconds
    When I close "Review Form" modal by clicking the top right x button
    And I pause execution for "2" seconds
    When I collapse nested table containing column value "Management Review"
    And I pause execution for "2" seconds
    And I click on top right button "Validate" in flex table with id "---announcement:-:preScreenReviewFormTableId---"
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "COOP-CA DES AGRICULTEURS DE SYN" by showing entries "All" in flex table with id "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I click on "Save" in the page details
    And I wait for "4" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"

  @Sprint-19-US-474407 @475779 @475785 @475776
  Scenario: Announcement -Grant Type Field should be consistent
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Opportunities" tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:publishedOpportunityTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:publishedOpportunityTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see "Opportunity Information" page block displayed
    #475779
    Then I softly see fields "Program__r.Type__c" is visible
    #475785 #475776
    And I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---announcement:-:competitiveTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---announcement:-:competitiveTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see fields "Program__r.Type__c" is visible

  @Sprint-19-US-474407-1 @475781 @475773
  Scenario Outline: Announcement -Grant Type Field should be consistent
    Given I login to "As a Grantor" app as "<User>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation_NoGrantType" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | Grant Type is required to save. |
    Examples:
      | User  |
      | EXE   |
      | PM    |

  @Sprint-19-US-474407-2 @475813 @475780 @475783
  Scenario: Announcement -Grant Type Field should be consistent
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Planning" tab
    #475813 #475780
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    Then I softly see fields "Type__c" is visible
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgEGMSID"
    And I wait for "2" seconds
    #475783
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgEGMSID}" in "---program:-:programsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:ProgEGMSID}" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see fields "Type__c" is visible

  @Sprint-19-US-474407-3 @475812 @475770 @475775
  Scenario: Announcement -Grant Type Field should be consistent
    #475812
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    #475770
    Then I softly see fields "Type__c" is visible
    When I enter "Creation1" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgEGMSID1"
    And I wait for "2" seconds
    #475775
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - All"
    And I perform quick search for "{SavedValue:ProgEGMSID1}" in "---program:-:programsTableId---" panel
    And I wait for "3" seconds
    When I click on "View" icon for "{SavedValue:ProgEGMSID1}" inside flex table with id "---program:-:programsTableId---"
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see fields "Type__c" is visible

  @Sprint-17-US-471510 @472123 @472128 @472118 @472122
  Scenario: Announcement: Add a section and field titled Ineligible Project Activities
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I navigate to "Overview" sub tab
    #472123
    Then I softly see "Ineligible Project Activities" page block displayed
    #472128
    Then I softly see fields "Ineligible_Project_Activities__c" is visible
    #472118
    When I am on "INTERNAL" portal
    And I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see "Ineligible Project Activities" page block displayed
    #472122
    Then I softly see fields "Ineligible_Project_Activities__c" is visible

  @Sprint-13-US-470445 @471467 @472214 @471541 @471471 @471463 @471464 @476468 @472216 @471544 @471473
  Scenario: Announcement: Add announcement specific settings for FRN and USAC
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CSM FRN None" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    #471467
    Then I see the following messages in the page details :
      | FRN Required? is required to save. |
    When I close "Create Announcement" modal by clicking the top right x button
    #472214
    And I navigate to "Announcements" tab
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    #471541
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    #471471
    And I enter "Edition No FRN" values from "Announcement_Field_Values.xlsx"
    #471463
    Then I softly see fields "FRN_Required__c" is visible
    #471464
    Then I softly see fields "USAC_Required__c" is visible
    And I click on "Save" in the page details
    Then I see the following messages in the page details :
      | FRN Required? is required to save under Overview. |
    #476468
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "CSM USAC None" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    Then I see the following messages in the page details :
      | USAC Required? is required to save. |
    When I close "Create Announcement" modal by clicking the top right x button
    #472216
    And I navigate to "Announcements" tab
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    #471544
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    #471473
    And I enter "Edition No USAC" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see the following messages in the page details :
      | USAC Required? is required to save under Overview. |

  @Sprint-13-US-470445-1 @471523 @471521 @471522 @471525
  Scenario: Announcement: Add announcement specific settings for FRN and USAC
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR_SR"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    When I clear the value from field "AL_FCCRegistrationNumber__c"
    When I clear the value from field "AL_UniversalServiceAdministrativeCompany__c"
    And I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I enter "EditionSR" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | Automation City1 SPI       | Checked        |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "NFR - 1st Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    When I enter "NFRCity1FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "3" seconds
    And I click on "Validate" in the split screen page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
    #471523
    Then I softly see the following messages in the page details :
      | FRN must be populated on the Organization Profile before submitting application |
    #471525
    Then I softly see the following messages in the page details :
      | USAC must be populated on the Organization Profile before submitting application |
    And I wait for "2" seconds
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    When I enter value as "7898543567" into "FCC Registration Number (FRN)" on old form
    When I enter value as "545643245" into "Universal Service Administrative Company (USAC)" on old form
    And I click on "Save" in the page details
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "3" seconds
    When I click on "Submit Application" in the page details
    And I wait for "2" seconds
    #471521
    Then I softly cannot see the following messages in the page details :
      | FRN must be populated on the Organization Profile before submitting application |
    #471522
    Then I softly cannot see the following messages in the page details :
      | USAC must be populated on the Organization Profile before submitting application |
    Then I softly see field "Status" as "Submitted to Grantor"

  @Sprint-8-US-436615 @437941 @437956
  Scenario: Announcement: Update Eligible Applicant Types
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    #437941
    Then I softly see "Eligibility Details" page block displayed
    #437956
    Then I see multipicklist field "EligibleApplicantTypes__c" contains value "1st Class City" under list "Eligible Applicant Types"

  @Sprint-8-US-430664 @433118 @433121 @433115 @433106 @433109 @433111 @433116
  Scenario: Announcements: Update budget categories and types
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    #433106
    Then I softly do not see fields "BudgetType__c" is visible
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Financials" sub tab
    Then I softly see "Budget Categories" page block displayed
    And I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    Then I softly do not see "Type" in flex table header "---announcement:-:announcementBudgetCategory---"
    #433118 #433109
    When I click "Associate" after selection of "Ancillary Costs" by showing entries "All" in flex table with id "---announcement:-:selectProgramBudgetCategory---"
    #433111
    Then I softly see "Category Name" in flex table header "---announcement:-:announcementBudgetCategory---"
    Then I softly see "Category Description" in flex table header "---announcement:-:announcementBudgetCategory---"
    Then I softly see "Federal Cost Category" in flex table header "---announcement:-:announcementBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    Then I softly see "Budget Categories" page block displayed
    #433115
    Then I softly see value "Ancillary Costs" for title "Category Name" inside table "---announcement:-:announcementBudgetCategory---"
    #433116
    Then I softly see "Name" in flex table header "---announcement:-:announcementBudgetCategory---"
    Then I softly see "Description" in flex table header "---announcement:-:announcementBudgetCategory---"
    Then I softly see "Federal Cost Category" in flex table header "---announcement:-:announcementBudgetCategory---"
    #433121
    Then I softly do not see "Type" in flex table header "---announcement:-:announcementBudgetCategory---"

  @Sprint-8-US-443405 @445858 @445862 @445856 @445865 @445860
  Scenario: Announcements: Add "Federal Award Number" to Announcement
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "PROGRAM_TYPE_NFR"
    Given I am on "INTERNAL" portal
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see "Information" page block displayed
    Then I softly see fields "Fiscal_Year__c" is visible
    #445858 #445862 #445856
    Then I softly see fields "FederalAwardNumber__c" is visible
    #445865 #445860
    When I enter value as "FAN@123" into "Federal Award Number" on old form
    And I click on "Save" in the page details

  @Sprint-8-US-433065 @434952 @434951 @434950
  Scenario Outline: Application: Update budget categories
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "PROGRAM_TYPE_NFR"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "PROGRAM_TYPE_NFR"
    And I login to "As a Grantor" app as "PM" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AppEGMSID"
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    When I expand nested table containing column value "BP01"
    #434952
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetCategoryTableId---" :
      | Category Name             |
      | Fringe Benefits           |
      | Labor and Fringe Benefits |
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    #434951 --GA User--
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    When I expand nested table containing column value "BP01"
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetCategoryTableId---" :
      | Category Name             |
      | Fringe Benefits           |
      | Labor and Fringe Benefits |
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    #434950
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    And I click on "View" icon for "{SavedValue:AppEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Periods" page block displayed
    When I expand nested table containing column value "BP01"
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:budgetCategoryTableId---" :
      | Category Name             |
      | Fringe Benefits           |
      | Labor and Fringe Benefits |
    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @Sprint-19-US-474120 @476271 @476274 @476270 @476336 @476333 @476238 @476332 @476265 @476262 @476205 @476196 @476255 @476223 @476335 @476272 @476245
  Scenario: Announcement: Do not automatically add budget categories to announcements
    When I login to "As a Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    #476270 #476223
    Then I see the following messages in the page details :
      | At least one Budget Category should be associated with the Announcement |
    When I navigate to "Financials" sub tab
    #476262 #476196
    Then I softly see "Budget Categories" page block displayed
    #476271 #476333 #476265 #476205
    When I click "Associate" after selection of "Ancillary Costs" by showing entries "All" in flex table with id "---announcement:-:selectProgramBudgetCategory---"
    #476332
    When I close "Associate Budget Categories" modal by clicking the top right x button
    #476238
    Then I softly see value "Ancillary Costs" for title "Category Name" inside table "---announcement:-:announcementBudgetCategory---"
    #476274
    And I click on top right button "Associate" in flex table with id "---announcement:-:AnnouncementBudgetCategory---"
    #476255 #476245
    Then I softly do not see value "Ancillary Costs" for title "Category Name" inside table "---announcement:-:selectProgramBudgetCategory---"
    When I navigate to "Financials" sub tab
    And I click on "Save" in the page details
    #476336 #476335 #476272
    Then I softly cannot see the following messages in the page details :
      | At least one Budget Category should be associated with the Announcement |

  @Sprint-6-US-390056 @427358 @427366 @427375
  Scenario: Announcements: GA: Allow Optional Match on announcement/opportunity
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    #427358
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I see only the following ordered options in dropdown field "Grantee Match Required?" :
      | --None-- | Yes | No | Optional |
    When I enter "Creation Modal" values from "Announcement_Field_Values.xlsx"
    #427366
    Then I see field "Grantee Match (%)" is not editable
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    #427375
    Then I softly see "Announcement Specific Settings" page block displayed
    Then I softly see field "Grantee Match Required?" as "Optional"

  @Sprint-11-US-443388 @448738 @448720 @448784 @448782 @448783 @448758
  Scenario Outline: Announcement: Add Negotiation to Supporting Document Checklist
    When I login to "As a Grantor" app as "<User>" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    #448784 #448758
    Then I softly see "Supporting Documents Checklist" page block displayed
    And I click on top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    Then I softly see "Description" in flex table header "---announcement:-:annChecklist---"
    Then I softly see "Required" in flex table header "---announcement:-:annChecklist---"
    Then I softly see "Applies To" in flex table header "---announcement:-:annChecklist---"
    Then I softly see "Status" in flex table header "---announcement:-:annChecklist---"
    #448738
    Then I see multipicklist field "AttachmentLocation__c" contains value "Negotiation" under list "Select an Option"
    When I navigate to "Setup" sub tab
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Setup" sub tab
    #448782 #448720
    Then I softly see "Supporting Documents Checklist" page block displayed
    And I click on top right button "Add" in flex table with id "---program:-:checklistTableId---"
    Then I softly see "Description" in flex table header "---program:-:checklistTableId---"
    Then I softly see "Required" in flex table header "---program:-:checklistTableId---"
    Then I softly see "Applies To" in flex table header "---program:-:checklistTableId---"
    Then I softly see "Status" in flex table header "---program:-:checklistTableId---"
    #448783
    Then I see multipicklist field "AttachmentLocation__c" contains value "Negotiation" under list "Select an Option"
    Examples:
      | User  |
      | EXE   |
      | PM    |

  @Sprint-8-US-433446 @436038 @436046 @436040 @436059 @436061 @436064 @440341 @440343 @440337 @440495 @440497 @440369 @440498 @440496
  @440429 @436077 @436080 @436082 @436068 @436070 @436073 @436103 @436107 @436108 @436135 @436138 @436139 @436166 @436168 @436170 @436174
  @436175 @436176 @436090 @436092 @436086 @441265 @440847 @440855 @440863 @441252 @441254 @441255 @441257 @441289 @441271 @441272 @441279
  @441280 @441281 @441287 @441283 @441301 @441291 @441293 @441294 @441296 @441298 @441299 @441300
  Scenario: Announcements: Add "Additional Information" and "Technical Assistance" and "Fiscal Year"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Then I softly see "Description" page block displayed
    Then I softly see fields "AnnouncementDescription__c" is visible
    #436059
    Then I softly see fields "Additional_Information__c" is visible
    #440341
    Then I softly see "Information" page block displayed
    Then I softly see fields "Fiscal_Year__c" is visible
    And I click on "Save" in the page details
    #440495
    Then I softly see the following messages in the page details :
      | Fiscal Year is required to save under Overview. |
    #440498
    And I enter value "2025" into field "Fiscal_Year__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    #436068
    Then I softly see "Technical Assistance Information" page block displayed
    #436077
    Then I softly see fields "Technical_Assistance_Availability__c" is visible
    When I enter "Technical Assistance Info" values from "Announcement_Field_Values.xlsx"
    #436103
    Then I softly see fields "Question_Deadline__c" is visible
    #436135
    Then I softly see fields "Response_Deadline__c" is visible
    #436166
    Then I softly see fields "Submit_questions_to__c" is visible
    #436174
    Then I softly see fields "Submit_questions_toPhone__c" is visible
    #436090
    When I enter "Technical Assistance Info1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Technical Assistance Information" page block displayed
    Then I softly see the text "Technical Assistance Availability is required to save."
    When I navigate to "Overview" sub tab
    And I enter "EditionTech" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "---AUTOEnvData:-:fundingAccount---" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    Then I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account                    | Pre-Encumbrance |
      | ---AUTOEnvData:-:fundingAccount--- | 2000            |
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---announcement:-:annoucementContactTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement     |
      | {SavedValue:PM Username} | NA           |
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PM Username} | Step 1       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name                      | Responsibility  | Description              | Due Date | Allow Record Editing |
      | {SavedValue:EXE Username} | Fiscal Reviewer | Review Financial details | 10       | No                   |
    And I wait for "3" seconds
    And I click on "Send for Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    And I refresh the page
    And I get the "EGMS ID"
    And I pause execution for "3" seconds
    And I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside table
    When I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:reviewersTableId---" without waiting for record
    And I pause execution for "7" seconds
    When I enter in modal value "Passed" into field "Rating__c"
    And I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Draft Competitive Announcements"
    And I perform quick search for "Record id" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "Record id" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    Given I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 90         | 350      |
    And I wait for "3" seconds
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:announcementBudgetCategory---"
    When I click "Associate" after selection of "Ancillary Costs" by showing entries "All" in flex table with id "---announcement:-:selectProgramBudgetCategory---"
    When I close "Associate Budget Categories" modal by clicking the top right x button
    And I wait for "2" seconds
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I refresh the page
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    And I "Approve" in the approval decision
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
    #436046
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Modal1" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    Then I softly see fields "AnnouncementDescription__c" is visible
    #436061
    Then I softly see fields "Additional_Information__c" is visible
    #440343
    Then I softly see "Information" page block displayed
    Then I softly see fields "Fiscal_Year__c" is visible
    And I click on "Save" in the page details
    #440497
    Then I softly see the following messages in the page details :
      | Fiscal Year is required to save under Overview. |
    #440496
    And I enter value "2025" into field "Fiscal_Year__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    #436070
    Then I softly see "Technical Assistance Information" page block displayed
    #436080
    Then I softly see fields "Technical_Assistance_Availability__c" is visible
    When I enter "Technical Assistance Info" values from "Announcement_Field_Values.xlsx"
    #436107
    Then I softly see fields "Question_Deadline__c" is visible
    #436138
    Then I softly see fields "Response_Deadline__c" is visible
    #436168
    Then I softly see fields "Submit_questions_to__c" is visible
    #436175
    Then I softly see fields "Submit_questions_toPhone__c" is visible
    #436092
    When I enter "Technical Assistance Info1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Technical Assistance Information" page block displayed
    Then I softly see the text "Technical Assistance Availability is required to save."
    And I wait for "5" seconds
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "CITY1" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I navigate to "Overview" sub tab
    #441265
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see fields "Fiscal_Year__c" is visible
    #440847
    Then I softly see "Details" page block displayed
    Then I softly see fields "AnnouncementDescription__c" is visible
    Then I softly see fields "Additional_Information__c" is visible
    #440855
    Then I softly see "Technical Assistance Information" page block displayed
    #440863
    Then I softly see fields "Technical_Assistance_Availability__c" is visible
    When I enter "Technical Assistance Info" values from "Announcement_Field_Values.xlsx"
    #441252
    Then I softly see fields "Question_Deadline__c" is visible
    #441254
    Then I softly see fields "Response_Deadline__c" is visible
    #441255
    Then I softly see fields "Submit_questions_to__c" is visible
    #441257
    Then I softly see fields "Submit_questions_toPhone__c" is visible
    When I navigate to "Overview" sub tab
    When I click on "Qualify" in the page details
    Then I softly see field "Status" as "Qualified"
    #441289
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see fields "Fiscal_Year__c" is visible
    #441271
    Then I softly see "Details" page block displayed
    Then I softly see fields "AnnouncementDescription__c" is visible
    Then I softly see fields "Additional_Information__c" is visible
    #441272
    Then I softly see "Technical Assistance Information" page block displayed
    #441279
    Then I softly see fields "Technical_Assistance_Availability__c" is visible
    When I enter "Technical Assistance Info" values from "Announcement_Field_Values.xlsx"
    #441280
    Then I softly see fields "Question_Deadline__c" is visible
    #441281
    Then I softly see fields "Response_Deadline__c" is visible
    #441283
    Then I softly see fields "Submit_questions_to__c" is visible
    #441287
    Then I softly see fields "Submit_questions_toPhone__c" is visible
    When I navigate to "Overview" sub tab
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AppEGMSID"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name              | Budget | Cash Match | Non-Cash Match |
      | Labor and Fringe Benefits  | 1000   | 150        | 50             |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | Automation City1 SPI       | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "NFR - 1st Class Municipality" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    When I enter "NFRCity1FormFields" values from "ApplicationForm_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "3" seconds
    And I click on "Validate" in the split screen page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    And I wait for "3" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:AnnEGMSID}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    When I navigate to "Overview" sub tab
    #441301
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see fields "Fiscal_Year__c" is visible
    #441291
    Then I softly see "Opportunity Details" page block displayed
    Then I softly see fields "Additional_Information__c" is visible
    #441293
    Then I softly see "Technical Assistance Information" page block displayed
    #441294
    Then I softly see fields "Technical_Assistance_Availability__c" is visible
    #441296
    Then I softly see fields "Question_Deadline__c" is visible
    #441298
    Then I softly see fields "Response_Deadline__c" is visible
    #441299
    Then I softly see fields "Submit_questions_to__c" is visible
    #441300
    Then I softly see fields "Submit_questions_toPhone__c" is visible
    #436040
    When I am on "INTERNAL" portal
    When I re-login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    And I wait for "2" seconds
    And I click on top right button "New" in flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    And I wait for "3" seconds
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    And I click modal button "Continue"
    And I wait for "2" seconds
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I navigate to "Overview" sub tab
    Then I softly see "Description" page block displayed
    Then I softly see fields "AnnouncementDescription__c" is visible
    #436064
    Then I softly see fields "Additional_Information__c" is visible
    #440337
    Then I softly see "Information" page block displayed
    Then I softly see fields "Fiscal_Year__c" is visible
    And I click on "Save" in the page details
    #440369
    Then I softly see the following messages in the page details :
      | Fiscal Year is required to save under Overview. |
    #440429
    And I enter value "2025" into field "Fiscal_Year__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    #436073
    Then I softly see "Technical Assistance Information" page block displayed
    #436082
    Then I softly see fields "Technical_Assistance_Availability__c" is visible
    When I enter "Technical Assistance Info" values from "Announcement_Field_Values.xlsx"
    #436108
    Then I softly see fields "Question_Deadline__c" is visible
    #436139
    Then I softly see fields "Response_Deadline__c" is visible
    #436170
    Then I softly see fields "Submit_questions_to__c" is visible
    #436176
    Then I softly see fields "Submit_questions_toPhone__c" is visible
    #436086
    When I enter "Technical Assistance Info1" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see "Technical Assistance Information" page block displayed
    Then I softly see the text "Technical Assistance Availability is required to save."