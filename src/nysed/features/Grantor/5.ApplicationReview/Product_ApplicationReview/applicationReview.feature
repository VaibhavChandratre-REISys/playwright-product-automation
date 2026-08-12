@AppReview @applicationReviewWithouBg @grantor-regression @grantor-parallel-regression @regression @applicationReviewTBE
Feature: Validate all scenarios in the Application Review

  Background: Submit the application for Review
    And I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"

  @65083  @verifyValidationMessageOnSendForReview
  Scenario Outline: Verify Validation message is shown if application is not selected for submitting the review process
    And I login to "As a Grantor" app as "dynamicUser" user
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
    And I wait for "3" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    Then I see the following messages in the page details :
      | Please select the reviews to send. |
    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

  @75449 @75451 @75450 @75448 @75454 @VerifyAbleToViewApplication
  Scenario Outline: To verify user is able to view Applications in Applications section in Related log tab of announcement
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I wait for "3" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:relatedFOApplicationsTableId---" panel
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Project Title" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    And I click on advance filter of table id "---applicationReview:-:relatedFOApplicationsTableId---" for LWC
    And I enter advance filter values inside id "---applicationReview:-:relatedFOApplicationsTableId---" for LWC
      | EGMS ID | contains | InvalidValue |
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---"
    And I refresh the page
    And I click on advance filter of table id "---applicationReview:-:relatedFOApplicationsTableId---" for LWC
    And I enter advance filter values inside id "---applicationReview:-:relatedFOApplicationsTableId---" for LWC
      | Application Title | contains | {SavedValue:Automation Runtime Announcement Application Review} |
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Application Title" inside table "---applicationReview:-:relatedFOApplicationsTableId---"
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---" with wait for record
    Then I see the sub-header is "{SavedValue:Automation Runtime Announcement Application Review}" in the page details
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Proposal" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I wait for "3" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "All Competitive Announcements"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:competitiveAnnouncementTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I click on parallel menu button in flex table title "Funding Decision Memo (FDM)"
    And I select "Download as PDF" from parallel lines dropdown of "Funding Decision Memo (FDM)"
    When I download the file
    Then I see "Funding Decision Memo (FDM)" on page "1" of "govgrants" pdf file
    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |

  @79668 @ValidatingErrorMessageSameReviewerManagementReviewStepForm
  Scenario Outline: To validate system generated error message, When user adding same reviewer multiple times in Reviewers section of related log tab in management review step of Application phase
    And I login to "As a Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I get the "EGMS ID"
    And I wait for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    Then I softly see value "Pre-Screen Review" for title "Step Name" inside table "---announcement:-:reviewStepTableId---"
    Then I softly see value "SME Review" for title "Step Name" inside table "---announcement:-:reviewStepTableId---"
    Then I softly see value "Management Review" for title "Step Name" inside table "---announcement:-:reviewStepTableId---"
    When I click on "View" icon for "Management Review" inside flex table with id "---announcement:-:reviewStepTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
    Then I softly see the following messages in the page details contains:
      | This user has already been added to this review step. |
    Examples:
      | Announcement Name                                               | Application Name                                                |
      | {SavedValue:Automation Runtime Announcement Application Review} | {SavedValue:Automation Runtime Announcement Application Review} |

