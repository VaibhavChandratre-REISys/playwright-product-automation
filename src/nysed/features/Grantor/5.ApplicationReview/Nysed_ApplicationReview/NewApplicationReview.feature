@appReviewNysed
Feature: Validate all scenarios in the Application Review

  @NYSED-5131 @NYSEDSprint-29 @US-2897 @M05 @YugaC
  Scenario Outline: Verify that the Grantee User can see the updated confirmation message upon clicking the ‘Submit to Grantor’ button on the application layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "FS10PROFESSIONALSTAFFSALARIES_BUDGETCATEGORY"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "15" seconds
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
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    When I navigate to "Revisions" sub tab
    And I enter value "Automation Request Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    When I click on "Submit to Grantor" in the page details without processing
    Then I softly see confirmation box with body "Verify the accuracy of all budget‑related information. Once the application is submitted, budget revisions will not be permitted until allowed by the Grantor. Click ‘Ok’ to confirm or ‘Cancel’ to review your entries." is displayed
    Examples:
      | Announcement Name                                               | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          | GRANTEE_SC   |

  @546086 @NYSEDSprint-16 @US-539525 @M05 @YugaC @Bug-NYSED-7579
  Scenario Outline:Verify that, as a Program Coordinator, able to see the "Risk Level" column in the "Recommended Applications" section of the Funding Decision Memo layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I navigate to "Funding Decision Memo" sub tab
    And I wait for "2" seconds
    Then I see only the following headers in table with id "---applicationReview:-:recommendedTableId---" :
      |  | Actions | EGMS ID | Application Title | Subrecipient Organization | Grant | Contractual? | Fund Year | Project ID Seq. No. | Project ID | Score | Organization Risk Level | Allocation Amount | Total Budgeted Amount | Total Commitment Amount | Recommend for Funding | Comments | Final Decision | Applicant Notified? |
    Then I see only the following headers in table with id "---applicationReview:-:nonRecommendedTableId---" :
      |  | Actions | EGMS ID | Application Title | Subrecipient Organization | Grant | Contractual? | Score | Organization Risk Level | Budgeted Amount | Total Commitment Amount | Recommended Budget | State Allocation | Recommend for Funding | Comments | Final Decision | Applicant Notified? |

    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          |

  @NYSED-3517 @NYSED-Sprint-26 @US-NYSED-2182 @M05 @YugaC
  Scenario Outline:Verify that the coordinators of the ‘Program Office Review’ step i.e., the first review step of the application review, can see the ‘Request Revision’ inline action if Revision Allowed is set as Yes on the announcement.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Then I see the header is "Review Step" in the page details
    Then I see the sub-header is "Program Office Review" in the page details
    Then I softly can see row level action button "Request Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "5" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    Then I softly see field "Status" as "Review Initiated"
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I refresh the page
    Then I see the following rows under the following headers in table with id "---applicationReview:-:applicationAssignTableId---" :
      | Application Title   | Decision Status      |
      | <Announcement Name> | Revision In-Progress |
    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | PO          |

  @NYSED-3518 @NYSED-Sprint-26 @US-NYSED-2182 @M05 @YugaC
    @NYSED-3965 @US-NYSED-3649 @NYSED-Sprint-28 @M05 @YugaC
  Scenario Outline:Verify that the coordinators of ‘Grant Finance Review Step' cannot see the ‘Request Revision’ inline action even if the Revision Allowed is set as Yes on the announcement.
  |Verify that the announcement Grant Finance Office Review coordinators can see that a new column, ‘Organization Risk Level,’ is added on the Announcement layout → Related log → Review Steps section → Review Step layout → Applications section|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    Given I login to "As a Grantor" app as "EXE" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    #NYSED-3518
    Then I softly cannot see row level action button "Request Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    #NYSED-3965
    And I hovering mouse on page block help text icon inside table "---applicationReview:-:applicationAssignTableId---" for column "Organization Risk Level"
    Then I softly see "Green Low; Yellow Medium; Red High" shown as help text
    Examples:
      | Announcement Name                                               |
      | {SavedValue:Automation Runtime Announcement Application Review} |

  @NYSED-3520 @NYSED-Sprint-26 @US-NYSED-2182 @M05 @YugaC
  Scenario Outline: Verify that the coordinators of ‘Program Office Review’ step, i.e., the first review step of application review, cannot see the ‘Request Revision’ inline action if Revision Allowed is set as No on the announcement.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT_REVISION_ALLOWED_NO"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Then I see the header is "Review Step" in the page details
    Then I see the sub-header is "Program Office Review" in the page details
    Then I softly cannot see row level action button "Request Revision" against "<Announcement Name>" in flex table with id "---applicationReview:-:applicationAssignTableId---"
    Examples:
      | Announcement Name                                | Coordinator |
      | {SavedValue:Automation Runtime FDM Announcement} | PO          |

  @NYSED-1242 @NYSED-1243 @US-NYSED-933 @NYSED-Sprint-21 @M05 @YugaC
  Scenario Outline:Verify with the Co-Ordinator when a Sub-Recipient submits the revision to the Grantor when the revision is initiated from FDM. The task below is generated for all the associated coordinator/s of FDM.
  |Verify that when the coordinator completes the revision request, the task is moved from pending task to completed task|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "<Coordinator>" user
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I click on "Initiate Revision" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationReview:-:recommendedTableId---"
    And I wait for "5" seconds
    And I switch to tab number "1"
    And I wait for "5" seconds
    And I navigate to "Revisions" sub tab
    And I wait for "2" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
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
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Revision Submitted"
    Given I re-login to "As a Grantor" app as "<Coordinator>" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "6" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    #NYSED-1242
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type       | Subject                                                                                  | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Review Revision | Review Revised Application #{SavedValue:EGMSID} for Announcement #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Revision Submitted"
    When I click on "Complete Revision" in the page details
    Then I softly see field "Status" as "Reviewed"
    #NYSED-1243
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    Then I softly see "No records found" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
    And I wait for "2" seconds
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" :
      | Actions     | EGMS ID             | Task Type       | Subject                                                                                  | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:EGMSID} | Review Revision | Review Revised Application #{SavedValue:EGMSID} for Announcement #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |
    Examples:
      | Announcement Name                                | Coordinator | ExternalUser |
      | {SavedValue:Automation Runtime FDM Announcement} | FO          | GRANTEE_SC   |

  @NYSED-3964 @US-NYSED-3649 @NYSED-Sprint-28 @M05 @YugaC
  Scenario Outline: Verify that the announcement- Program Office Review coordinators can see that a new column, ‘Organization Risk Level,’ is added on the Announcement layout → Related log → Review Steps section → Review Step layout → Applications section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    And I hovering mouse on page block help text icon inside table "---applicationReview:-:applicationAssignTableId---" for column "Organization Risk Level"
    Then I softly see "Green Low; Yellow Medium; Red High" shown as help text
    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @NYSED-3966 @US-NYSED-3649 @NYSED-Sprint-28 @M05 @YugaC
  Scenario Outline:Verify that the announcement FDM associated coordinators can see that a new column, ‘Organization Risk Level’, is added on the Announcement layout → Related log → Review Steps section → Review Step layout → Applications section
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime FDM Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I login to "As a Grantor" app as "FO" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Funding Decision Memos (FDM) - All"
    When I perform quick search for "<Announcement Name>" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I wait for "2" seconds
    When I navigate to "Funding Decision Memo" sub tab
    And I wait for "4" seconds
    And I hovering mouse on page block help text icon inside table "---applicationReview:-:recommendedTableId---" for column "Organization Risk Level"
    Then I softly see "Green Low; Yellow Medium; Red High" shown as help text
    Examples:
      | Announcement Name                                |
      | {SavedValue:Automation Runtime FDM Announcement} |

  @NYSED-7215-ProgramOfficeReview @Sprint-32 @US-NYSED-6293 @M05 @yugaC
  Scenario Outline: Verifies that the Internal User - Reviewer can see that the confirmation message is updated when the reviewer submits the review form.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    When I login to "As a Grantor" app as "<Coordinator>" user
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
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
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
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to submit this review form?" is displayed
    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | PO          |

  @NYSED-7215-GrantsFinanceReview @Sprint-32 @US-NYSED-6293 @M05 @yugaC
  Scenario Outline: Verifies that the Internal User - Reviewer can see that the confirmation message is updated when the reviewer submits the review form.- Grants Finance Review
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramOfficeReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "EGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    And I wait for "2" seconds
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
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
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    When I click on "Submit" in the page details without processing
    Then I softly see confirmation box with body "Are you sure you want to submit this review form?" is displayed

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | EXE         |

  @NYSED-8775 @NYSED-Sprint-32 @US-NYSED-8208 @M05
  Scenario Outline:Verify that Internal (All Profile) User see 'Funding Account Message' column is added on Funding Accounts Section on FDM after Funding Account Title column
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application Review" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I initiated an application review for application "{SavedValue:Automation Runtime Announcement Application Review}" on announcement "{SavedValue:Automation Runtime Announcement Application Review}" with properties "default"
    Given I Completed review step ProgramAndGrantFinanceReview from Initiated Application Review Application "{SavedValue:Automation Runtime Announcement Application Review}"
    When I login to "As a Grantor" app as "<Coordinator>" user
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Grants Finance Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---" with wait for record
    And I wait for "2" seconds
    And I click on "Funding Decision Memo" in the page details
    And I wait for "2" seconds
    And I navigate to "Funding Decision Memo" sub tab
    And I wait for "2" seconds
    #NYSED-8775
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmFundingAccountTableId---" :
      | Actions | Funding Account EGMS ID | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance | FDM Pre-Encumbrance | Outstanding Encumbrance | Expenditure Paid to Date | Pre-Encumbrance Balance |

    Examples:
      | Announcement Name                                               | Coordinator |
      | {SavedValue:Automation Runtime Announcement Application Review} | FO          |

  @NYSED-8778 @NYSED-8779 @NYSED-8780 @NYSED-Sprint-32 @US-NYSED-8208 @M05
  Scenario Outline: Verify that Internal (All Profile) User see columns are updated as per below sequence on Applications phase --> Funding Decision Memos (FDM) left module -->FDM list view
  |Verify that Internal (All Profile) User see columns are updated as per below sequence on Applications phase --> Revisions left module -->Pending Revisions List View|
  |Verify that Internal (All Profile) User see columns are updated as per below sequence on Applications phase --> Revisions left module -->Completed Revisions List View|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Applications" tab
    And I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Funding Decision Memos (FDM) - All"
    And I pause execution for "3" seconds
    #NYSED-8778
    Then I see only the following headers in table with id "---subAwardFromFDM:-:fdmTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Title | # Applications | Status |
    #NYSED-8779
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Application Reviews" subheader on left panel
    And I pause execution for "3" seconds
    Then I softly see "Actions" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "EGMS ID" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Application Title" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Institution ID" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "SED Code" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Organization Name" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Creating For" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Child Organization" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Announcement Fund Year" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Announcement Title" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Submitted On" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    Then I softly see "Status" in flex table header "---negotiation:-:negotiationPendingTaskTableId---"
    #NYSED-8780
    Then I see only the following headers in table with id "---negotiation:-:negotiationCompletedTaskTableId---" :
      |  | Actions | EGMS ID | Application Title | Institution ID | SED Code | Organization Name | Creating For | Child Organization | Announcement Fund Year | Announcement Title | Submitted On | Status |
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | FD       |

  @NYSED-8781 @NYSED-Sprint-32 @US-NYSED-8208 @M05
  Scenario Outline: Verify that External (All Profile) User see columns are updated as per below sequence on Applications phase --> Revisions left module --> Revisions List View
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Applications" tab
    And I navigate to "Revisions" content inside "Applications" subheader on left panel
    When I click toggle button to select "Revisions - All"
    And I pause execution for "3" seconds
    Then I see only the following headers in table with id "---negotiation:-:RecipientTableId---" :
      |  | Actions | EGMS ID | Application Title | Creating For | Child Organization | Announcement Fund Year | Announcement Title | Submitted On | Status |
    Examples:
      | ExternalUser |
      | GRANTEE_SC   |
#      | GRANTEE_LEA  |
#      | GRANTEE_VO |

