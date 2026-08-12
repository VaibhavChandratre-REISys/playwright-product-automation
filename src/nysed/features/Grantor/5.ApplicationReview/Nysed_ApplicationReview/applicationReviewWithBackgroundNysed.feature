@appReviewNysed
Feature: Validate all scenarios in the Application Review with background

  Background: Submit the application for Review
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"


  @537603 @NYSEDSprint-14 @US-525073 @M05 @October2025
  Scenario Outline:Verify that the 'Create and Edit' and 'Submit and Certify' users see the validation message when the Total Budgeted Amount is more than the Allocation Amount on application created for Formula BA Announcement and application status is Revision Initiated.
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I navigate to "Applications" tab
    And I wait for "3" seconds
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537603
    Then I softly can see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 0           |
    #537603
    Then I softly see the following messages in the page details contains:
      | Due in days cannot be less than 1 |
    When I click on "Undo" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Minimum # of Reviews Required | Required? |
      | Group 1   | 0                             | Checked   |
    #537603
    Then I softly see the following messages in the page details contains:
      | For required panel the Minimum Number of Reviews should be greater than zero. |
    When I click on "Undo" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Minimum # of Reviews Required | Required? | Due in Days |
      | Group 1   | 1                             | Unchecked | 7           |
    #537603
    Then I softly see the following messages in the page details contains:
      | Reviewers are not required for optional panels |

    Examples:
      | UserType |
      | PO       |

  @537648 @537645 @537673-ProgramCoordinator @537617 @537645-ProgramCoordinator @NYSEDSprint-14 @US-525073 @540241 @NYSEDSprint-15 @US-487962 @M05 @October2025
  Scenario Outline:Verify that inline actions for reviewers table, are not visible to users other than coordinators -Program Office Review
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    #537617
    Then I see the following rows under the following headers in table with id "---applicationReview:-:reviewersTableId---" :
      | Actions     | Reviewer                 | Email                          | Organization | # of Reviews Assigned |
      | Action menu | {SavedValue:FD Username} | {SavedValue:AutomationFDEmail} | NYSED        | 0                     |
    #537645
    Then I softly can see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    #537648
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly cannot see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Remove" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    #537645
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    #537645
    Then I softly see value "Assigned" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    #537673
    Then I softly can see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Send to Previous Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    When I click on "Request Revision" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "4"
    And I wait for "15" seconds
    When I click on "Cancel" in the page details
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #540241
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:appreviewsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | FO      |

  @537612 @537588 @NYSEDSprint-14 @US-525073 @M05 @Bug-Ticket-545993 @October2025
  Scenario Outline:Verify that 'Validate' and 'Add' section button should not be visible to the Announcement Owner -Program Office Review
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537588
    Then I softly cannot see row level action button "Edit" against "Group 1" in flex table with id "---applicationReview:-:formTableId---"
    #537612
    Then I softly cannot see top right button "Add" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly cannot see top right button "Validate" in flex table with id "---applicationReview:-:formTableId---"
    When I click on "Review Form" icon for "Group 1" inside flex table with id "---applicationReview:-:formTableId---"
    Then I softly cannot see top right button "Add" in flex table with id "---applicationReview:-:reviewPanelCategoriesTableId---"
    #537588
    Then I softly see "Review Categories" page block displayed

    Examples:
      | UserType |
      | PM       |

  @537679 @537652 @537669 @538859 @538858 @NYSEDSprint-14 @US-525073 @M05 @October2025
  Scenario Outline:Verify that buttons on Application table, are not visible to users other than coordinators -Program Office Review
    When I login to "As a Grantor" app as "PO" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    #537652
    Then I softly see value "Assigned" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    Then I softly can see row level action button "Assign" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly can see row level action button "Request Revision" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #537679
    Then I softly cannot see top right button "Reject" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see top right button "Promote to Next Step" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    #537669
    Then I softly can see row level action button "View" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see row level action button "Assign" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see row level action button "Request Revision" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Then I softly cannot see row level action button "Assign" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:reviewersTableId---"
    #538859
    Then I softly cannot see row level action button "Delete" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #538858
    Then I softly can see row level action button "Delete" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "Delete" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    #538858
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:appreviewsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | FD       |
#      | FO      |

  @537720 @537724 @537693 @537696 @537715 @537711 @539380 @540211 @NYSEDSprint-14 @NYSEDSprint-15 @US-525073 @US-537800 @M05 @fiscalreviewcompleted @October2025
  Scenario Outline: Verify that inline action 'Undo' is only visible to associated reviewers when application not promoted to FDM.  -Program Office Review
    When I login to "As a Grantor" app as "PO" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    #537693
    Then I softly can see top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    #539380
    Then I see the following rows under the following headers in table with id "---applicationReview:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type          | Subject                                                                                                                      | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Application Review | Conduct Program Office Review Review for Application #{SavedValue:EGMSID} Submitted by Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    #537715
    Then I softly cannot see row level action button "Send Back to Reviewer" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    #537715
    Then I softly can see row level action button "Send Back to Reviewer" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    #540211
    Then I see the following rows under the following headers in table with id "---applicationReview:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type          | Subject                                                                                                                      | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Application Review | Conduct Grants Finance Review Review for Application #{SavedValue:EGMSID} Submitted by Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    #537720
    Then I softly can see row level action button "Undo" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    #537720
    Then I softly can see top right button "Undo" in page detail
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<NonReviewers>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    #537720
    Then I softly cannot see row level action button "Undo" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"
    #537696
    Then I softly cannot see top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    #537720
    Then I softly cannot see top right button "Undo" in page detail
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    #537711
    Then I softly can see row level action button "Send Back to Reviewer" against "<Announcement Name>" in flex table with id "---applicationReview:-:appreviewsTableId---"

    Examples:
      | Announcement Name                                               | NonReviewers |
      | {SavedValue:Automation Runtime Announcement Application Review} | FO           |

  @539391 @496629 @NYSEDSprint-15 @US-537800 @NYSEDSprint-03 @US-487966 @M05 @October2025
  Scenario Outline: Verify that when the associated Coordinator/s clicks on 'Send Back to Reviewer' button then the below task is generated for assigned application reviewer. - Program Office Review
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    When I click on "Send Back to Reviewer" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    #539391 #496629
    Then I see the following rows under the following headers in table with id "---applicationReview:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type     | Subject                                                                                                     | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revise Review | Revise Program Office Review for Application #{SavedValue:EGMSID} Submitted by {SavedValue:SubrecipientOrg} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    #496629
    Then I softly cannot see top right button "Decline" in page detail
    Then I softly can see top right button "Submit" in page detail
    Then I softly can see top right button "Edit" in page detail

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @540216 @496510 @NYSEDSprint-15 @US-537800 @NYSEDSprint-03 @US-487966 @M05 @October2025
  Scenario Outline: Verify that when the associated Coordinator/s clicks on 'Send Back to Reviewer' button then the below task is generated for assigned application reviewer. - Grant Finance Review
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    When I login to "As a Grantor" app as "EXE" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name                 | Due in Days |
      | Grant Finance Review Form | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:PM Username} |
    When I click on "Assign" icon for "{SavedValue:PM Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "3" seconds
    When I click on "Send Back to Reviewer" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    #540216 #496510
    Then I see the following rows under the following headers in table with id "---applicationReview:-:pendingTaskTableId---" :
      | Actions     | EGMS ID             | Task Type     | Subject                                                                                                              | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revise Review | Revise Grants Finance Review for Application #{SavedValue:EGMSID} Submitted by Automation Permanent Nysed School Org | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    #496510
    Then I softly cannot see top right button "Decline" in page detail
    Then I softly can see top right button "Submit" in page detail
    Then I softly can see top right button "Edit" in page detail

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @537802 @538865 @537815 @537830 @537820 @538895 @537817 @537833 @539297 @NYSEDSprint-14 @US-525075 @NYSEDSprint-15 @US-528127 @M05 @October2025
  Scenario Outline: Verify that the 'Create and Edit' and 'Submit and Certify' users see the validation message when the Total Budgeted Amount is more than the Allocation Amount on application created for Formula BA Announcement and application status is Revision Initiated.
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I click on "Cancel" in the page details
    #537802
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Cancel Revision" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    #538865
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Cancel Revision" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    And I navigate to "Revisions" sub tab
    Then I softly see that "Due Date" rendered in view mode only
    Then I softly see that "Revisions Request Status" rendered in view mode only
    Then I softly see that "Applicant Name" rendered in view mode only
    Then I softly see that "Application Sections for Revisions" rendered in view mode only
    Then I softly see that "Details" rendered in view mode only
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    #537815
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Cancel Revision" in page detail
    Then I softly cannot see top right button "Send to Subrecipient" in page detail
    And I navigate to "Revisions" sub tab
    Then I softly see that "Due Date" rendered in view mode only
    Then I softly see that "Revisions Request Status " rendered in view mode only
    Then I softly see that "Applicant Name" rendered in view mode only
    Then I softly see that "Application Sections for Revisions" rendered in view mode only
    Then I softly see that "Details" rendered in view mode only
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    And I navigate to "Revisions" sub tab
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    #537830
    Then I softly see field "Details" as "Automation Details"
    #537820
    Then I softly see field "Application Sections for Revisions" as "Budget Tab: Budget Details"
    Then I softly see field "Due Date" as "{Date:M/d/yyyy::d+7}"
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Revision Initiated"
    And I navigate to "Revisions" sub tab
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 2000   | 100        | 0              |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    #539297
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |
    Then I softly can see top right button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 0              |
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I pause execution for "5" seconds
    #539297
    Then I softly see field "Status" as "Revision Submitted"
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Revision Submitted"
    #538895
    Then I softly cannot see top right dropdown button "Request Revisions" in page detail
    Then I softly cannot see top right dropdown button "Complete Revision" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Revision Submitted"
    #537817
    Then I softly cannot see top right dropdown button "Request Revisions" in page detail
    Then I softly cannot see top right dropdown button "Complete Revision" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Revision Submitted"
    #537833
    Then I softly can see top right dropdown button "Request Revisions" in page detail
    Then I softly can see top right dropdown button "Complete Revision" in page detail
    Then I softly can see top right dropdown button "Back to Current Review Step" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @540236 @540240 @NYSEDSprint-15 @US-487962 @M05
  Scenario Outline:Verify that the status of the application is updated as 'Review Incomplete' when it is sent for review and the coordinator initiates the revision. - Program Office Review step
  |Verify that the related task is closed for the reviewer when the application is in sent for review status and the coordinator initiates the revision.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I click on "Cancel" in the page details
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    #540236
    Then I softly see value "Review Incomplete" for title "Status" inside table "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    #540240
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I pause execution for "2" seconds
    And I navigate to "Applications" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationReview:-:PhaseRespectivecompletedTaskTableId---"
    #540240
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit" in page detail
    Then I softly cannot see top right button "Decline" in page detail

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @539589 @539558 @NYSEDSprint-15 @US-487962 @M05
  Scenario Outline:Verify that the announcement owner does not see the 'Send Back to Reviewer' action for a review at the at any review step if the review status is one of the following:
    Given I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 1   | 7           |
    Given I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name | Due in Days |
      | Group 2   | 7           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FD Username} |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:FO1 Username} |
    When I click on "Assign" icon for "{SavedValue:FD Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I click on "Assign" icon for "{SavedValue:FO1 Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    And I wait for "2" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "All" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    Then I softly see the following messages in the page details contains:
      | Application successfully assigned to Reviewer. |
    Then I close "Assign Applications" modal by clicking the top right x button
    And I refresh the page
    And I wait for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Decline" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Decline" in the page details without processing
    And I wait for "5" seconds
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "2" seconds
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:appTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "2" seconds
    #539589
    Then I softly cannot see row level action button "Send Back to Reviewer" against "{SavedValue:FD Username}" in flex table with id "---applicationReview:-:appreviewsTableId---"
    Then I softly cannot see row level action button "Send Back to Reviewer" against "{SavedValue:FO Username}" in flex table with id "---applicationReview:-:appreviewsTableId---"
    Then I softly cannot see row level action button "Send Back to Reviewer" against "{SavedValue:FO1 Username}" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I navigate to "Revisions" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Revision Submitted"
    When I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    When I click on "Complete Revision" in the page details
    And I pause execution for "4" seconds
    And I refresh the page
    And I pause execution for "4" seconds
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I pause execution for "2" seconds
    #539558
    Then I softly can see row level action button "Send Back to Reviewer" against "Automation FD" in flex table with id "---applicationReview:-:appreviewsTableId---"
    Then I softly can see row level action button "Send Back to Reviewer" against "Automation FO" in flex table with id "---applicationReview:-:appreviewsTableId---"
    Then I softly can see row level action button "Send Back to Reviewer" against "Automation FO1" in flex table with id "---applicationReview:-:appreviewsTableId---"

    Examples:
      | Coordinator | Announcement Name                                               |
      | PO          | {SavedValue:Automation Runtime Announcement Application Review} |