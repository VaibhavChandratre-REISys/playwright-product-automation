@GranteeAwardFromApplication @GranteeGrantAwardRegression
Feature: Validate all scenarios for Grantee Award from Application

  @482394 @PMUserVerifythepeerreviewfunctionalityforaward @P2_Grantee @GRegression1 @GranteeTBE
  Scenario:PM User-Verify the peer review functionality for award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Sarah PM"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Sarah PM"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "DAVID_FO_APPROVER"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_FOUR_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly cannot see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"

  @482632 @VerifyAdminuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward @P3_Grantee @ADMIN_Grantee @GRegression4
  Scenario Outline:Verify Admin user(Non owner) can view award details page but cannot see edit action on award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I <Assertion> top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I <Assertion> top right button "Send Email" inside flex table "CommunicationHistory"

    Examples:
      | User           | Assertion  |
      | GRANTEE ADMIN1 | softly see |

  @482633 @VerifyAuditoruserNonownercanviewawarddetailspagebutcannotseeeditactiononaward @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline:Verify AUDITOR user(Non owner) can view award details page but cannot see edit action on award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly do not see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly do not see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly do not see top right button "Send Email" inside flex table "CommunicationHistory"

    Examples:
      | User            | Assertion  |
      | GRANTEE AUDITOR | softly see |

  @482627 @VerifyPOuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward @PO_Grantee @P3_Grantee @GRegression4 @GranteeTBE
  Scenario Outline:Verify PO user(Non owner) can view award details page but cannot see edit action on award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<OwnerName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-<OwnerName>"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<OwnerName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_FOUR_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I save the field labeled "EGMS ID" as "awardEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Title" as "TitleFiles" from flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I save the value from row "1" for column name "Title" as "TitleNotes" from flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{SavedValue:awardEGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click on "View" icon for "{SavedValue:awardEGMSID}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:TitleFiles}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "{SavedValue:TitleNotes}" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"

    Examples:
      | UserType   | OwnerType  | OwnerName     |
      | GRANTEE PO | GRANTEE PM | Sarah PM user |

  @482628 @VerifyEXEuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward @P3_Grantee @EXE_rantee @GRegression1 @GranteeTBE
  Scenario Outline:Verify EXE user(Non owner) can view award details page but cannot see edit action on award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<OwnerName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-<OwnerName>"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<OwnerName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_FOUR_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I save the field labeled "EGMS ID" as "awardEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Title" as "TitleFiles" from flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I save the value from row "1" for column name "Title" as "TitleNotes" from flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{SavedValue:awardEGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click on "View" icon for "{SavedValue:awardEGMSID}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:TitleFiles}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "{SavedValue:TitleNotes}" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"

    Examples:
      | UserType    | OwnerType  | OwnerName     |
      | GRANTEE EXE | GRANTEE PM | Sarah PM user |

  @482629 @VerifyPMuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward @P3_Grantee @PM_Grantee @GRegression4 @GranteeTBE
  Scenario Outline:Verify PM user(Non owner) can view award details page but cannot see edit action on award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<OwnerName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-<OwnerName>"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<OwnerName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_FOUR_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I save the field labeled "EGMS ID" as "awardEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Title" as "TitleFiles" from flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I save the value from row "1" for column name "Title" as "TitleNotes" from flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{SavedValue:awardEGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click on "View" icon for "{SavedValue:awardEGMSID}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:TitleFiles}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "{SavedValue:TitleNotes}" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"

    Examples:
      | UserType   | OwnerType  | OwnerName       |
      | GRANTEE PM | GRANTEE PO | Grantee PO user |

  @482630 @VerifyFOuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward @FO_Grantee @P3_Grantee @GRegression4 @GranteeTBE
  Scenario Outline:Verify FO user(Non owner) can view award details page but cannot see edit action on award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<OwnerName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-<OwnerName>"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<OwnerName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_FOUR_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I save the field labeled "EGMS ID" as "awardEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    And I wait for "3" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
#    And I click modal button "Close"
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Title" as "TitleFiles" from flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I save the value from row "1" for column name "Title" as "TitleNotes" from flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{SavedValue:awardEGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click on "View" icon for "{SavedValue:awardEGMSID}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:TitleFiles}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "{SavedValue:TitleNotes}" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"

    Examples:
      | UserType   | OwnerType  | OwnerName     |
      | GRANTEE FO | GRANTEE PM | Sarah PM user |

  @482631 @VerifyFDuserNonownercanviewawarddetailspagebutcannotseeeditactiononaward @P3_Grantee @FD_Grantee @GRegression4 @GranteeTBE
  Scenario Outline:Verify FD user(Non owner) can view award details page but cannot see edit action on award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<OwnerName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-<OwnerName>"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<OwnerName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_FOUR_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Draft"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I navigate to "Overview" sub tab
    When I save the field labeled "EGMS ID" as "awardEGMSID"
    And I save the field labeled "Award Title" as "Automation Runtime award"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---" by clicking "Edit" :
      | Title                            | Is Primary Program |
      | Automation Permanent NGO Program | Checked            |
    And I navigate to "Monitoring" sub tab
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I save the value from row "1" for column name "Title" as "TitleFiles" from flex table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    And I save the value from row "1" for column name "Title" as "TitleNotes" from flex table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "{SavedValue:awardEGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I cannot see row level action button "Edit" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I cannot see row level action button "Delete" against "{SavedValue:awardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I click on "View" icon for "{SavedValue:awardEGMSID}" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly cannot see row level action button "Remove" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see top right button "New" in flex table with id "---grantee_tableId:-:awardApproverTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "View" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "{SavedValue:TitleFiles}" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleFiles}" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see value "{SavedValue:TitleNotes}" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "View" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly cannot see row level action button "Remove" against "{SavedValue:TitleNotes}" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"

    Examples:
      | UserType   | OwnerType  | OwnerName     |
      | GRANTEE FD | GRANTEE PM | Sarah PM user |

  @486513 @OtherTypeARVerifyPMusershouldabletoapprovedtheAR&shouldabletocreate&activatenewaward
  Scenario Outline: Other Type AR -Verify PM user should able to approved the AR & should able to create & activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    And I wait for "2" seconds
    When I save the field labeled "Description of Other Changes" as "DescriptionofOtherChanges"
    When I save the field labeled "Justification for Purpose and Summary" as "JustificationforPurposeandSummary"
    When I save the field labeled "If Other amendment type, explain" as "IfOtheramendmenttypeexplain"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Description of Other Changes" as "{SavedValue:DescriptionofOtherChanges}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:JustificationforPurposeandSummary}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:IfOtheramendmenttypeexplain}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

    Examples:
      | UserName      | OwnerType  | UserType   | emailIdFrom                     | emailIdTo                       | CreatedBy |
      | Sarah PM user | GRANTEE PM | GRANTEE PM | sarah.pm.ggmergeqa2@yopmail.com | victor.exeqagrantee@yopmail.com | Sarah PM  |

  @486518 @OtherTypeARVerifyADMINusershouldabletoapprovedtheAR&shouldabletocreate&activatenewaward
  Scenario Outline: Other Type AR -Verify ADMIN user should able to approved the AR & should able to create & activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Grantee PO user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    And I wait for "2" seconds
    When I save the field labeled "Description of Other Changes" as "DescriptionofOtherChanges"
    When I save the field labeled "Justification for Purpose and Summary" as "JustificationforPurposeandSummary"
    When I save the field labeled "If Other amendment type, explain" as "IfOtheramendmenttypeexplain"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | Rating is required to save.   |
      | Comments is required to save. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
#    When I navigate to "History" sub tab
#    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
#    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Description of Other Changes" as "{SavedValue:DescriptionofOtherChanges}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:JustificationforPurposeandSummary}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:IfOtheramendmenttypeexplain}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table
    Examples:
      | UserName        | OwnerType  | UserType       | emailIdFrom                     | emailIdTo                       | CreatedBy     |
      | Grantee PO user | GRANTEE PO | GRANTEE ADMIN1 | sarah.pm.ggmergeqa2@yopmail.com | victor.exeqagrantee@yopmail.com | Product Admin |

  @486535 @OtherTypeARVerifyEXEusershouldabletoapprovedtheAR&shouldabletocreate&activatenewaward
  Scenario Outline: Other Type AR -Verify EXE user should able to approved the AR & should able to create & activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<UserName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    And I wait for "2" seconds
    When I save the field labeled "Description of Other Changes" as "DescriptionofOtherChanges"
    When I save the field labeled "Justification for Purpose and Summary" as "JustificationforPurposeandSummary"
    When I save the field labeled "If Other amendment type, explain" as "IfOtheramendmenttypeexplain"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Description of Other Changes" as "{SavedValue:DescriptionofOtherChanges}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:JustificationforPurposeandSummary}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:IfOtheramendmenttypeexplain}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

    Examples:
      | UserName        | OwnerType  | UserType    | emailIdFrom                     | emailIdTo                       | CreatedBy  |
      | Grantee PO user | GRANTEE PO | GRANTEE EXE | sarah.pm.ggmergeqa2@yopmail.com | victor.exeqagrantee@yopmail.com | Victor EXE |

  @486536 @OtherTypeARVerifyFDusershouldabletoapprovedtheAR&shouldabletocreate&activatenewaward
  Scenario Outline: Other Type AR -Verify FD user should able to approved the AR & should able to create & activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    And I wait for "2" seconds
    When I save the field labeled "Description of Other Changes" as "DescriptionofOtherChanges"
    When I save the field labeled "Justification for Purpose and Summary" as "JustificationforPurposeandSummary"
    When I save the field labeled "If Other amendment type, explain" as "IfOtheramendmenttypeexplain"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Description of Other Changes" as "{SavedValue:DescriptionofOtherChanges}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:JustificationforPurposeandSummary}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:IfOtheramendmenttypeexplain}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

    Examples:
      | UserName      | OwnerType  | UserType   | emailIdFrom                     | emailIdTo                       | CreatedBy          |
      | Sarah PM user | GRANTEE PM | GRANTEE FD | sarah.pm.ggmergeqa2@yopmail.com | victor.exeqagrantee@yopmail.com | Danielle FD Garcia |

  @486538 @OtherTypeARVerifyPMusershouldabletoapprovedtheAR&shouldabletocreate&activatenewaward @P1_Grantee @FO_Grantee @GRegression1
  Scenario Outline: Other Type AR -Verify PM user should able to approved the AR & should able to create & activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<UserName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    And I wait for "2" seconds
    When I save the field labeled "Description of Other Changes" as "DescriptionofOtherChanges"
    When I save the field labeled "Justification for Purpose and Summary" as "JustificationforPurposeandSummary"
    When I save the field labeled "If Other amendment type, explain" as "IfOtheramendmenttypeexplain"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Description of Other Changes" as "{SavedValue:DescriptionofOtherChanges}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:JustificationforPurposeandSummary}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:IfOtheramendmenttypeexplain}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

    Examples:
      | UserName      | OwnerType  | UserType   | emailIdFrom                     | emailIdTo                       | CreatedBy |
      | Sarah PM user | GRANTEE PM | GRANTEE FO | sarah.pm.ggmergeqa2@yopmail.com | victor.exeqagrantee@yopmail.com | David FO  |

  @486539 @OtherTypeARVerifyPMusershouldabletoapprovedtheAR&shouldabletocreate&activatenewaward
  Scenario Outline: Other Type AR -Verify PM user should able to approved the AR & should able to create & activate new award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-<UserName>"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-<UserName>"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    And I enter "Grantee_Other_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    And I enter "Grantee_Other_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "OTHAMENDID"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:AwardEGMSID}"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I see value "Record Id" for title "{SavedValue:OTHAMENDID}" inside table "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentRequestTableId---"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - My Records"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly see value "Created" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    When I perform quick search for "Created" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly do not see value "Approved" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    Then I softly do not see value "Submitted to Grantor" for title "Status" inside table "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click toggle button to select "Amendment Requests - Draft"
    When I perform quick search for "{SavedValue:OTHAMENDID}" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Award EGMS ID" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Amendment Type" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Initiated By" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "{SavedValue:OTHAMENDID}" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I see the header is "Amendment Request" in the page details
    Then I softly see "Collapse" button for header
    Then I softly see field "EGMS ID" as "{SavedValue:OTHAMENDID}"
    Then I softly see field "Status" as "Created"
    Then I softly see field "Initiated By" as "Grantor"
    Then I softly see field "Amendment Type" as "Other"
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Delete" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    When I navigate to "Overview" sub tab
    Then I softly see "Details" page block displayed
    Then I softly see "Other Changes" page block displayed
    Then I softly see "General Condition" page block displayed
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "Grant EGMS ID" as "{SavedValue:GrantEGMSID}"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    Then I softly see field "Grant Award Number" as "{SavedValue:GrantAwardNumber}"
    Then I softly see field "Award EGMS ID" as "{SavedValue:AwardEGMSID}"
    Then I softly see link "{SavedValue:AwardEGMSID}" inside Page block
    And I wait for "2" seconds
    When I save the field labeled "Description of Other Changes" as "DescriptionofOtherChanges"
    When I save the field labeled "Justification for Purpose and Summary" as "JustificationforPurposeandSummary"
    When I save the field labeled "If Other amendment type, explain" as "IfOtheramendmenttypeexplain"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I enter in modal value "Terms1" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "1" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see value "Terms1" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    And I save the value from row "1" for column name "Title" as "TermsTitle" from flex table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:amendmentSpecialConditionsTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see value "David FO" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Automation FD | Program Reviewer | Automation Description | 5        | No                   |
    Then I softly see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Fiscal Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Send for Review" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Edit" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly can see row level action button "Delete" against "Program Reviewer" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Fiscal Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Edit" icon for "Program Reviewer" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see fields "name__r.name" is in edit mode
    Then I softly see fields "ReviewerRole__c" is in edit mode
    Then I softly see fields "Responsibility__c" is in edit mode
    Then I softly see fields "DueDate__c" is in edit mode
    Then I softly see fields "AllowRecordEdit__c" is in edit mode
    And I click on top right button "Save" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Delete" icon for "Automation FD" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    Then I softly do not see value "Automation FD" for title "Role" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Sent for Review" has been added in flextable with Id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    And I navigate to "Files" sub tab
    Then I softly see "Amendment Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Title" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Amendment Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Notice of Award" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see "Notice of Award" has been added in "Amendment Files" flex table
    And I click on "Delete" icon for "Notice of Award" inside flex table with id "---grantee_tableId:-:amendmentRequestAddFile---" without waiting for record
    Then I softly do not see value "Notice of Award" for title "Title" inside table "---grantee_tableId:-:amendmentRequestAddFile---"
    When I click on parallel lines menu bar with data target value "Amendment Files"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" by clicking "Edit" :
      | Created By  | Title         | Description       |
      | <CreatedBy> | Notes Record1 | Automation Notes1 |
    And I wait for "2" seconds
    Then I softly see value "Notes Record1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    And I click on "Delete" icon for "Notes Record1" inside flex table with id "---grantee_tableId:-:amendmentRequestNotesTableId---" without waiting for record
    Then I softly do not see value "Notes Recor1" for title "Title" inside table "---grantee_tableId:-:amendmentRequestNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    When I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I can see top right button "Edit" in page detail
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see that "Review Type" rendered in view mode only
    Then I softly see fields "Rating__c" is in edit mode
    Then I see textarea field "ReviewComments__c" is editable
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    Then I softly see "Edit" modal button
    Then I softly see "Submit Review" modal button
    And I click on submit review
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    Then I softly can see row level action button "View" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:OTHAMENDID}" in flex table with id "---grantee_tableId:-:AmendmentTableId---"
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    Then I softly cannot see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I click on "Resend for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    Then I softly see value "Sent for Review" for title "Status" inside table "---grantee_tableId:-:amendmentPeerReviewerTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:amendmentPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    When I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Reviewed" for title "New Value" inside field history table
    Then I softly see value "Submitted for Review" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "3" seconds
    Then I can see top right button "Edit" in page detail
    Then I can see top right button "Submit for Approval" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Name" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:AmendmentApproverRolesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name       | Amendment Request |
      | Victor EXE | Step 1            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | David FO | Step 2            |
    When I enter the following values into flex table with id "---grantee_tableId:-:AmendmentApproverRolesTableId---" by clicking "New" :
      | Name     | Amendment Request |
      | Sarah PM | Step 3            |
    Then I softly see link "Victor EXE" inside Page block
    Then I softly see link "David FO" inside Page block
    Then I softly see link "Sarah PM" inside Page block
    And I click on "Submit for Approval" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "Submit for Approval.pdf" as name
    Then I softly see snapshot with name containing "Complete Review.pdf" as name
    And I wait for "2" seconds
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Approved" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "From Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "To Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "CC Address" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Email Subject" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Attention To" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see "Preview" in flex table header "---grantee_tableId:-:amendmentMessageTableID---"
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To          | Subject            | Body            |
      | <emailIdTo> | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "<emailIdFrom>" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "<emailIdTo>" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I wait for "3" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I navigate to "Amendments" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Delete" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:AmendmentTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:AmendmentTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I re-login to "Grantee" app as "<OwnerType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Pending Activation" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I can see top right button "Activate Award" in page detail
    Then I can see top right button "Delete" in page detail
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID2"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID2}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly see field "Description of Other Changes" as "{SavedValue:DescriptionofOtherChanges}"
    Then I softly see field "Justification for Purpose and Summary" as "{SavedValue:JustificationforPurposeandSummary}"
    Then I softly see field "If Other amendment type, explain" as "{SavedValue:IfOtheramendmenttypeexplain}"
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Amendments" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:AmendmentRequestTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see value "{SavedValue:TermsTitle}" for title "Title" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Pending Activation" for title "Original Value" inside field history table
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Amended" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID2}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"
    And I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "{SavedValue:AwardEGMSID2}" for title "New Value" inside field history table
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "Original Value" inside field history table

    Examples:
      | UserName        | OwnerType  | UserType   | emailIdFrom                     | emailIdTo                       | CreatedBy  |
      | Grantee PO user | GRANTEE PO | GRANTEE PO | sarah.pm.ggmergeqa2@yopmail.com | victor.exeqagrantee@yopmail.com | Grantee PO |

  @482343 @482351 @482352 @482356 @482359 @482361 @482363 @482368 @482400 @ValidatePMUsertheoverviewtabofaward @P2_Grantee @PM_Grantee @GRegression1 @GRegression4
  Scenario: Validate PM User the overview tab of award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    When I click on "Create Award" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Award" in the page details
    Then I softly see field "Award Title" inside page block
    Then I softly see asterisk mark on "Award Title"
    Then I softly see field "Grant EGMS ID" inside page block
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I click on back arrow
    Then I softly see field "Amendment Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Amendment Number"
    Then I softly see "Amendment number provided in NOA Document. Field should allow only numbers upto 4 digits" shown as help text
    When I click on "Edit" in the page details
    And I enter value "10" into field "AwardIssueDate__c"
    And I enter value "Test" into field "PaymentSystem__c"
    And I enter value "123" into field "CongressionalDistrictName__c"
    And I enter value "12345" into field "VersionNumber__c"
    Then I softly see label "Amendment Number" maximum length is "4" for input field
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Award Issue Date" inside page block
    Then I softly see asterisk mark on "Award Issue Date"
    Then I softly see field "Award Type" inside page block
    Then I softly see field "Award Type" as "Initial"
    Then I softly see field "Version Number" inside page block
    Then I softly see field "Version Number" as "1"
    When I hovering mouse on help text icon inside page block detail "Version Number"
    Then I softly see "System generated number used to track changes to the award" shown as help text
    Then I softly see field " Funding Organization " inside page block
    And I save the field labeled " Funding Organization " as "FundingOrganization "
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    Then I softly see field " Internal Organization " inside page block
    And I save the field labeled " Internal Organization " as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    Then I softly see field "Maintenance Of Effort Amount" inside page block
    Then I softly see field "Maintenance of Effort Statutory Reference" inside page block
    When I hovering mouse on help text icon inside page block detail "Maintenance of Effort Statutory Reference"
    Then I softly see "URL of MOE" shown as help text
    Then I softly see field "Terms and Conditions Link" inside page block
    When I hovering mouse on help text icon inside page block detail "Terms and Conditions Link"
    Then I softly see "Enter link to award terms and conditions as provided in award letter" shown as help text
    Then I softly see field "Separate Attachment for Terms and Conditions?" inside page block
    When I hovering mouse on help text icon inside page block detail "Separate Attachment for Terms and Conditions?"
    Then I softly see "Terms & Conditions must be uploaded in the Files section." shown as help text
    Then I softly see field "Funder Payment System" inside page block
    When I hovering mouse on help text icon inside page block detail "Funder Payment System"
    Then I softly see "The federal payment system providing the funds for the award." shown as help text
    Then I softly see field "Funder Payment System Sub-Account Number" inside page block
    When I click on "Edit" in the page details
    And I enter value "1234" into field "VersionNumber__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #482351
    Then I softly see "External Programs" page block displayed
    Then I softly see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Program Number" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Type" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Is Primary Program" in flex table header "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Remove" icon for "Automation Permanent NGO Program" inside table with table id "---grantee_tableId:-:awardExternalProgranTableId---" without processing
    Then I softly see confirmation box with body "Are you sure, you want to remove the associated program?" is displayed
    When I click modal button "OK"
    Then I softly see the following messages in the page details :
      | Record removed successfully. |
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Select at least one record. |
    When I click "Associate" after selection of "Automation Permanent NGO Program" in the table "---grantee_tableId:-:awardAssociateExternalProgranTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Programs associated successfully. |
    When I click modal button "Close"
    And I wait for "3" seconds
    When I click on parallel lines menu bar with data target value "External Programs"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "External Programs"
    Then I see table is refreshing
    When I click on "Program Number" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Program Number" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Program Number" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Program Number" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Type" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Type" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Is Primary Program" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Ascending" for column "Is Primary Program" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on "Is Primary Program" column header inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see sort order "Descending" for column "Is Primary Program" inside table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardExternalProgranTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    #482352
    Then I softly see "Contacts" page block displayed
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name       | Is Key Contact |
      | Victor EXE | UnChecked      |
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I save the field labeled "Application Number" as "ApplicationNumber"
    And I click on hyperlink containing value "{SavedValue:ApplicationNumber}"
    When I navigate to "Overview" sub tab
    Then I softly see "Check" symbol against the value "Victor EXE" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    And I wait for "3" seconds
    And I click on back arrow
    And I wait for "3" seconds
    And I click on back arrow
    And I wait for "3" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details :
      | Select at least one record. |
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Contacts added successfully. |
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Contacts"
    Then I see table is refreshing
    When I click on "Project Role" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Project Role" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Project Role" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Project Role" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Name" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Name" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Name" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Name" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Email" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Email" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Email" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is Key Contact" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Is Key Contact" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is Key Contact" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Is Key Contact" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Ascending" for column "Is User" inside table with id "---grantee_tableId:-:awardContactTableId---"
    When I click on "Is User" column header inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see sort order "Descending" for column "Is User" inside table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardContactTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    #482356
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    When I hovering mouse on help text icon inside modal "Mobile Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, First Name is required in the Contact Information section.     |
      | To Save, Last Name is required in the Contact Information section.      |
      | To Save, Phone is required in the Contact Information section.          |
      | To Save, Email is required in the Contact Information section.          |
      | To Save, Address Line 1 is required in the Address Information section. |
      | To Save, State is required in the Address Information section.          |
      | To Save, City is required in the Address Information section.           |
      | To Save, Country is required in the Address Information section.        |
      | To Save, Zip Code is required in the Address Information section.       |
      | To Save, Project Role is required in the Contact Information section.   |
    When I enter in modal value "Automation Runtime Title" into field "Title"
    When I enter in modal value "Other" into field "Role__c"
    When I enter in modal value "Automation Runtime" into field "FirstName"
    When I enter in modal value "Execution" into field "LastName"
    When I enter in modal value "8967093890" into field "Phone"
    When I enter in modal value "8967093440" into field "MobilePhone"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter in modal value "{SavedValue:uniqueEmailID}" into field "Email"
    When I enter in modal value "Mail Street" into field "MailingStreet"
    When I enter in modal value "Howard Lane" into field "Address2__c"
    When I enter in modal value "AK: Alaska" into field "State__c"
    When I enter in modal value "VA" into field "MailingCity"
    When I enter in modal value "123" into field "CongressionalDistrict__c"
    When I enter in modal value "USA" into field "MailingCountry"
    When I enter in modal value "United" into field "County__c"
    When I enter in modal value "1234" into field "X4DigitZipCodeExtension__c"
    When I enter in modal value "12345" into field "MailingPostalCode"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see value "{SavedValue:Automation Runtime} Execution" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "{SavedValue:Automation Runtime} Execution" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Remove" against "{SavedValue:Automation Runtime} Execution" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:Automation Runtime} Execution" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardContactTableId---" by clicking "Edit" :
      | Name                                      | Is Key Contact | Project Role                                   |
      | {SavedValue:Automation Runtime} Execution | Checked        | Project Director/Principal Investigator(PI/PD) |
    Then I softly see value "Project Director/Principal Investigator(PI/PD)" for title "Project Role" against the value "{SavedValue:Automation Runtime} Execution" inside table "---grantee_tableId:-:awardContactTableId---"
    #482359
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I save the field labeled "Application Number" as "ApplicationNumber"
    And I click on hyperlink containing value "{SavedValue:ApplicationNumber}"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Address line 1" as "Addressline1"
    And I save the field labeled "Address line 2" as "Addressline2"
    And I save the field labeled "City" as "City"
    And I save the field labeled "County" as "County"
    And I save the field labeled "State" as "State"
    And I save the field labeled "Congressional District" as "CongressionalDistrict"
    And I save the field labeled "Country" as "Country"
    And I save the field labeled "Zip Code" as "ZipCode"
    When I navigate to "Setup" sub tab
    And I wait for "2" seconds
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I navigate to "Budget" sub tab
    And I save the field labeled "Program Income Treatment Type" as "ProgramIncomeTreatmentType"
    And I save the field labeled "Required Match(%)" as "RequiredMatch"
    And I save the field labeled "Maximum Indirect Cost Rate" as "MaximumIndirectCostRate"
    And I save the field labeled "Total Budget Requested" as "TotalBudgetRequested"
    And I click on back arrow
    And I wait for "3" seconds
    And I click on back arrow
    And I wait for "3" seconds
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see field "Address line 1" as "{SavedValue:Addressline1}"
    Then I softly see field "Address line 2" as "{SavedValue:Addressline2}"
    Then I softly see field "City" as "{SavedValue:City}"
    Then I softly see field "County" as "{SavedValue:County}"
    Then I softly see field "State" as "{SavedValue:State}"
    Then I softly see field "Congressional District" as "{SavedValue:CongressionalDistrict}"
    Then I softly see field "Country" as "{SavedValue:Country}"
    Then I softly see field "Zip Code" as "{SavedValue:ZipCode}"
    When I click on "Edit" in the page details
    And I clear the value from field "Addressline1__c"
    And I clear the value from field "Addressline2__c"
    And I clear the value from field "City__c"
    And I clear the value from field "County__c"
    And I clear the value from field "County__c"
    And I enter value "--None--" into field "State__c"
    And I clear the value from field "CongressionalDistrictName__c"
    And I clear the value from field "Zip4__c"
    And I clear the value from field "Country__c"
    And I clear the value from field "ZipCode4Extension__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Address Line 1 is required in the Overview tab under the Primary Place of Performance section.         |
      | To Save, City is required in the Overview tab under the Primary Place of Performance section.                   |
      | To Save, State is required in the Overview tab under the Primary Place of Performance section.                  |
      | To Save, Congressional District is required in the Overview tab under the Primary Place of Performance section. |
      | To Save, Zip Code is required in the Overview tab under the Primary Place of Performance section.               |
      | To Save, Country is required in the Overview tab under the Primary Place of Performance section.                |
    And I enter value "Alen" into field "Addressline1__c"
    And I enter value "Dow" into field "Addressline2__c"
    And I enter value "VA" into field "City__c"
    And I enter value "Cargo" into field "County__c"
    And I enter value "AK" into field "State__c"
    And I enter value "123" into field "CongressionalDistrictName__c"
    And I enter value "12345" into field "Zip4__c"
    And I enter value "USA" into field "Country__c"
    And I enter value "1234" into field "ZipCode4Extension__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Address line 1" as "Alen"
    Then I softly see field "Address line 2" as "Dow"
    Then I softly see field "City" as "VA"
    Then I softly see field "County" as "Cargo"
    Then I softly see field "State" as "AK"
    Then I softly see field "Congressional District" as "123"
    Then I softly see field "Zip Code" as "12345"
    Then I softly see field "Country" as "USA"
    Then I softly see field "4-digit Zip Code Extension" as "1234"
    Then I softly see "System Information" page block displayed
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see field "Created by" inside page block
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    And I save the field labeled "Last Modified by" as "LastModifiedby"
    Then I softly see field "Last Modified by" inside page block
    Then I softly see link "{SavedValue:LastModifiedby}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I click on hyperlink containing value "{SavedValue:Createdby}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    #482361, 482363
    And I navigate to "Projections" sub tab
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Redirection Threshold (%)" as "{SavedValue:RequiredMatch}"
    Then I softly see field "Award Amount to Date" as "{SavedValue:TotalBudgetRequested}"
    Then I softly see field "Program Income Treatment Type" as "{SavedValue:ProgramIncomeTreatmentType}"
#    Commenting below step because decimal points is not display appropriate in application once resolved this issue uncomment the step US - 484695 on hold
#    Then I softly see field "Maximum Indirect Cost Rate" as "{SavedValue:MaximumIndirectCostRate}"
    Then I softly see field "Maximum Indirect Cost Rate" as "10.00%"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I clear the value from field "AwardIssueDate__c"
    And I clear the value from field "PaymentSystem__c"
    And I navigate to "Projections" sub tab
    And I enter value "--None--" into field "ProgramIncomeType__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Program Income Treatment Type is required in the Projections tab under the Budget Period Details section. |
      | To Save, Award Issue Date is required in the Overview tab under the Details section.                               |
      | To Save, Funder Payment System is required in the Overview tab under the Details section.                          |
    When I navigate to "Overview" sub tab
    And I enter value "10" into field "AwardIssueDate__c"
    And I enter value "Test" into field "PaymentSystem__c"
    And I navigate to "Projections" sub tab
    And I enter value "Additive" into field "ProgramIncomeType__c"
    And I enter value "10" into field "BudgetRedirectionThreshhold__c"
    And I enter value "800" into field "BudgetPeriodEndDate__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see field "Budget Redirection Threshold (%)" as "10.00%"
    Then I softly see field "Budget Period End Date" as "{Date:M/d/yyyy::d+800}"
    Then I softly see field "Carry-Forward this Action" as "$0.00"
    When I hovering mouse on help text icon inside page block detail "Carry-Forward this Action"
    Then I softly see "This amount does not add to total awarded amount as it was awarded in a prior budget period" shown as help text
    Then I softly see field "Award Amount This Action" as "{SavedValue:TotalBudgetRequested}"
    When I hovering mouse on help text icon inside page block detail "Award Amount This Action"
    Then I softly see "Award Budget Amount in this award" shown as help text
    #482368
    When I navigate to "Overview" sub tab
    And I save the field labeled "Application" as "ApplicationNumber"
    And I click on hyperlink containing value "{SavedValue:ApplicationNumber}"
    Then I see the header is "Application" in the page details
    And I navigate to "Setup" sub tab
    Given I expand nested table containing column value "BP01"
    And I save the value from row "1" for column name "Focus Area Title" as "FocusArea" from flex table "---grantee_tableId:-:ChildBudgetPeriodDetailsFromBudgetOfSetUp---"
    And I click on back arrow
    And I navigate to "Projections" sub tab
    Then I softly see "Focus Area" page block displayed
    Then I softly see value "{SavedValue:FocusArea}" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "{SavedValue:FocusArea}" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:FocusArea}" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:selectAwardFocusAreaTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Permanent Focus Area2" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "" for title "Start Date" against the value "Automation Permanent Focus Area2" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see value "" for title "End Date" against the value "Automation Permanent Focus Area2" inside table "---grantee_tableId:-:ProjectTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                  | Start Date | End Date |
      | {SavedValue:FocusArea} | 110        | 900      |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ProjectTableId---" by clicking "Edit" :
      | Title                            | Start Date | End Date |
      | Automation Permanent Focus Area2 | 110        | 900      |
    When I click on "Validate" in the page details
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Projections Tab - Focus Area Start Date and Focus Area End Date should be between budget period.                                           |
      | Projections Tab - Focus Area Start Date and Focus Area End Date should be between budget period.                                           |
      | Projections Tab - At least one focus area must be in place at all times during the budget period. Adjust the focus area dates accordingly. |
    When I click on parallel lines menu bar with data target value "Focus Area"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Focus Area"
    Then I see table is refreshing
    When I click on "Title" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:ProjectTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    #482400
    And I navigate to "Projections" sub tab
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I navigate to "Monitoring" sub tab
    Then I softly see "Special Conditions" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Date Effective From" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Date Effective To" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Create Special Condition" opens in overLay window
    Then I see the text " Required to Save | " in modal
    Then I see the text " Required to Submit" in modal
    Then I softly see "Information" page block displayed
    Then I softly see "Effective Dates" page block displayed
    When I "Collapse" page block contaninig value "Information"
    Then I softly do not see fields "Title__c" is visible
    When I "Expanded" page block contaninig value "Information"
    Then I softly see fields "Title__c" is visible
    When I "Collapse" page block contaninig value "Effective Dates"
    Then I softly do not see fields "EffectiveFrom__c" is visible
    When I "Expanded" page block contaninig value "Effective Dates"
    Then I softly see fields "EffectiveFrom__c" is visible
    Then I softly see field on modal "Title" inside page block
    Then I softly see asterisk mark on "Title"
    Then I softly see field on modal "Description" inside page block
    Then I softly see asterisk mark on "Description"
    When I hovering mouse on help text icon inside modal "Description"
    Then I softly see "Enter special condition as it's presented in award letter." shown as help text
    Then I softly see field on modal "Sequence" inside page block
    Then I softly see asterisk mark on "Sequence"
    When I hovering mouse on help text icon inside modal "Sequence"
    Then I softly see "Provide the required sequence for terms and conditions. This allow up to 18 digits." shown as help text
    Then I softly see field on modal "Mandatory" inside page block
    When I hovering mouse on help text icon inside modal "Mandatory"
    Then I softly see "Check the box to make Terms and Conditions mandatory." shown as help text
    Then I softly see field on modal "Effective From Date" inside page block
    Then I softly see asterisk mark on "Effective From Date"
    Then I softly see field on modal "Effective To Date" inside page block
    Then I softly see asterisk mark on "Effective To Date"
    And I clear in modal the value from field "Sequence__c"
    And I clear in modal the value from field "EffectiveFrom__c"
    And I clear in modal the value from field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Title is required in the Information section.                   |
      | To Save, Description is required in the Information section.             |
      | To Save, Sequence is required in the Information section.                |
      | To Save, Effective To Date is required in the Effective Dates section.   |
      | To Save, Effective From Date is required in the Effective Dates section. |
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    When I enter in modal value "{SavedValue:BudgetPeriodStartDate}" into field "EffectiveFrom__c"
    When I enter in modal value "1" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Effective To Date cannot be before Effective From Date |
    When I enter in modal value "{SavedValue:BudgetPeriodEndDate}" into field "EffectiveTill__c"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Delete" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on "View" icon for "{SavedValue:TermsId}" inside flex table with id "---grantee_tableId:-:SpecialConditionTableId---" without waiting for record
    Then I softly see "Special Condition" opens in overLay window
    Then I see field "EGMS ID" as "{SavedValue:TermsId}" on modal
    Then I see field "Title" as "Terms" on modal
    Then I see field "Description" as "Terms Description" on modal
    Then I see field "Sequence" as "1" on modal
    Then I see field "Effective From Date" as "{SavedValue:BudgetPeriodStartDate}" on modal
    Then I see field "Effective To Date" as "{SavedValue:BudgetPeriodEndDate}" on modal
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "EGMS ID" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "EGMS ID" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective From" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Date Effective From" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective From" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Date Effective From" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective To" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Date Effective To" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective To" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Date Effective To" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Special Conditions"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Special Conditions"
    Then I see table is refreshing

  @482401 @ValidatePOUserthecloseouttab @P2_Grantee @Gregression2 @PO_Grantee
  Scenario: Validate PO User the closeout tab
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Grantee PO user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    Then I softly see field "Status" as "Active"
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Closeout" sub tab
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I enter in modal "Grantee_Creation" values from "Closeout_Field_Values.xlsx"
    When I enter values into fields
      | Value             | Field           |
      | {SavedValue:PPST} | CloseoutDate__c |
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    When I navigate to "Closeout" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Project Period Closeout Requests" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Type" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Project Period" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Closeout Due Date" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "EGMS ID" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "EGMS ID" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Type" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Type" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Type" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Project Period" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Project Period" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Project Period" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Project Period" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Closeout Due Date" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Closeout Due Date" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Closeout Due Date" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Closeout Due Date" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Status" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Ascending" for column "Status" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on "Status" column header inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see sort order "Descending" for column "Status" inside table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Project Period Closeout Requests"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Project Period Closeout Requests"
    Then I see table is refreshing

  @482393 @ValidatePMUsertheexpendituredetailssection @P2_Grantee @PM_Grantee @GRegression2
  Scenario: Validate PM User the expenditure details section
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    When I navigate to "Actuals" sub tab
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see the text containing "* Records are sorted by Focus Area ascending order, Row Number ascending order"
    And I select value inside table "---grantee_tableId:-:ExpenditureDetailsTableId---" is "All"
    Then I softly see value "Administrative and legal expenses" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Land, structures, rights-of-way, appraisals, etc." for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Relocation expenses and payments" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Other architectural and engineering fees" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Project inspection fees" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Site work" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Construction" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Indirect costs" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Equipment" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Miscellaneous" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "Contingencies" for title "Budget Category" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly can see row level action button "Show Financial Transactions" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly can see row level action button "Report Non-Cash Match Line Item" against "Construction" in flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    And I click on "Show Financial Transactions" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Financial Transactions" opens in overLay window
    Then I softly see "Expenditure Details" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I "Collapse" page block contaninig value "Expenditure Details"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I "Expanded" page block contaninig value "Expenditure Details"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalExpenditureTableId---"
    When I click on parallel lines menu bar with data target value "Expenditure Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Expenditure Details"
    Then I see table is refreshing
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I "Collapse" page block contaninig value "Cash Match Details"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I "Expanded" page block contaninig value "Cash Match Details"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalCashMatchTableId---"
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Cash Match Details"
    Then I see table is refreshing
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I "Collapse" page block contaninig value "Program Income Expenses"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I "Expanded" page block contaninig value "Program Income Expenses"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsModalProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Cash Match Details"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Program Income Expenses"
    Then I see table is refreshing
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Report Non-Cash Match Line Item" icon for "Construction" inside flex table with id "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see "Add Non-Cash Match" opens in overLay window
    Then I softly see "Report Non Cash Match" page block displayed on modal
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I "Collapse" page block contaninig value "Report Non Cash Match"
    Then I softly do not see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I "Expanded" page block contaninig value "Report Non Cash Match"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:AwardActualsMoalNonCashMatchTableId---"
    When I click on parallel lines menu bar with data target value "Report Non Cash Match"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Report Non Cash Match"
    Then I see table is refreshing

  @482402 @ValidatePOUserthefilessectionofaward @P3_Grantee @PO_Grantee @GRegression3
  Scenario: Validate PO User the files section of award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Grantee PO user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Other" at upload file modal
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File Attachment.pdf deleted successfully. |
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Other" at upload file modal
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File Attachment.pdf deleted successfully. |
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Terms and Conditions" at upload file modal
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    And I click on "Delete" icon for "Attachment.pdf" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---" without waiting for record
    Then I see the following messages in the page details :
      | File Attachment.pdf deleted successfully. |
    Then I softly do not see value "Attachment.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Add File" opens in overLay window
    Then I softly see the text containing "Classification"
    Then I see only the following ordered options in dropdown field "Classification" :
      | Select file classification | Interim Award Document | Notice of Award | Terms and Conditions | Other |
    Then I softly see the text containing "Upload File"
    Then I softly see the text containing "Description"
    Then I see "Upload" button is disabled at modal under library
    And I select Classification as "Terms and Conditions" at upload file modal
    When I upload file "Attachment.pdf" into library
    Then I do not see "Upload" button is disabled at modal under library
    Then I see the text "Attachment.pdf" in modal
    When I click modal button "Cancel"
    Then I do not see the text "Attachment.pdf" in modal
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" with description "Automation Test" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I navigate to "Files" sub tab
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I navigate to "Files" sub tab
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    When I navigate to "Files" sub tab
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I see "Attachment.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Edit" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I cannot see row level action button "Delete" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "Attachment.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Descending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see button "Reset Table" inside flextable "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see the following messages in the page details :
      | Table has been reset. |
    When I click on parallel lines menu bar with data target value "Award Files"
    And I wait for "1" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I select "Refresh" from parallel lines dropdown of "Award Files"
    Then I see table is refreshing

  @487106 @ValidateTabsanddatadisplayedtoPOuseronawardrecordwhenallsettingsareYes @PO_Grantee @P1_Grantee @GRegression1
  Scenario: Validate Tabs and data displayed to PO user on award record when all settings are Yes
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO user"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Grantee PO user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_THREE_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Projections" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Details" page block displayed
    Then I softly see field "Award Title" inside page block
    Then I softly see field "Grant EGMS ID" inside page block
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I click on back arrow
    Then I softly see field "Amendment Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Amendment Number"
    Then I softly see "Amendment number provided in NOA Document. Field should allow only numbers upto 4 digits" shown as help text
    Then I softly see field "Award Issue Date" inside page block
    Then I softly see field "Award Type" inside page block
    Then I softly see field "Version Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Version Number"
    Then I softly see "System generated number used to track changes to the award" shown as help text
    Then I softly see field " Funding Organization " inside page block
    And I save the field labeled " Funding Organization " as "FundingOrganization "
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    And I save the field labeled " Internal Organization " as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    Then I softly see field "Application" inside page block
    Then I softly see field "Maintenance Of Effort Amount" inside page block
    Then I softly see field "Maintenance of Effort Statutory Reference" inside page block
    When I hovering mouse on help text icon inside page block detail "Maintenance of Effort Statutory Reference"
    Then I softly see "URL of MOE" shown as help text
    Then I softly see field "Terms and Conditions Link" inside page block
    When I hovering mouse on help text icon inside page block detail "Terms and Conditions Link"
    Then I softly see "Enter link to award terms and conditions as provided in award letter" shown as help text
    Then I softly see field "Separate Attachment for Terms and Conditions?" inside page block
    When I hovering mouse on help text icon inside page block detail "Separate Attachment for Terms and Conditions?"
    Then I softly see "Terms & Conditions must be uploaded in the Files section." shown as help text
    Then I softly see field "Funder Payment System" inside page block
    When I hovering mouse on help text icon inside page block detail "Funder Payment System"
    Then I softly see "The federal payment system providing the funds for the award." shown as help text
    Then I softly see field "Funder Payment System Sub-Account Number" inside page block
    Then I softly see "Description" page block displayed
    Then I softly see field "Scope / Award Description" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Contacts" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Project Role" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Email" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Is Key Contact" in flex table header "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Is User" in flex table header "---grantee_tableId:-:awardContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Contacts added successfully. |
    And I click modal button "Close"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    When I hovering mouse on help text icon inside modal "Mobile Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    And I click modal button "Close"
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see field "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see field "County" inside page block
    Then I softly see field "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see field "Congressional District" inside page block
    Then I softly see asterisk mark on "Congressional District"
    Then I softly see field "Zip Code" inside page block
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field "Country" inside page block
    Then I softly see asterisk mark on "Country"
    Then I softly see field "4-digit Zip Code Extension" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Projections" sub tab
    Then I softly see "Project Period Details" page block displayed
    Then I softly see field " Project Period Start Date " inside page block
    Then I softly see field " Project Period End Date " inside page block
    Then I softly see field "Award Amount to Date" inside page block
    Then I softly see field "Budget Redirection Threshold (%)" inside page block
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see field "Budget Period Start Date" inside page block
    Then I softly see field "Budget Period End Date" inside page block
    Then I softly see field "Carry-Forward this Action" inside page block
    Then I softly see field "Award Amount This Action" inside page block
    Then I softly see field "Total Match Amount Required" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    Then I softly see "Focus Area" page block displayed
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    When I click on parallel lines menu bar with data target value "Focus Area"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:ProjectTableId---"
    When I click on "Start Date" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see sort order "Ascending" for column "Start Date" inside table with id "---grantee_tableId:-:ProjectTableId---"
    When I click on "End Date" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see sort order "Ascending" for column "End Date" inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on parallel lines menu bar with data target value "Award Budget"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    Then I softly see "Program Income" page block displayed
    Then I softly see "Focus Area Name" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Projected Program Income ($)" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Program Income Justification" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Program Income"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on "Focus Area Name" column header inside table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see sort order "Descending" for column "Focus Area Name" inside table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on "Projected Program Income ($)" column header inside table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see sort order "Ascending" for column "Projected Program Income ($)" inside table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on "Program Income Justification" column header inside table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see sort order "Ascending" for column "Program Income Justification" inside table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Effective from" column header inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see sort order "Descending" for column "Effective from" inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on "Effective until" column header inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Effective until" inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on "Approved Indirect Cost Rate(%)" column header inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Approved Indirect Cost Rate(%)" inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on "Indirect Cost Rate Type" column header inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see sort order "Ascending" for column "Indirect Cost Rate Type" inside table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Reviewer Name" column header inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see sort order "Descending" for column "Reviewer Name" inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on "Role" column header inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see sort order "Ascending" for column "Role" inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on "Due Date" column header inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see sort order "Ascending" for column "Due Date" inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on "Allow Record Editing" column header inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see sort order "Ascending" for column "Allow Record Editing" inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on "Status" column header inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see sort order "Ascending" for column "Status" inside table with id "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Approvers" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Award" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Progress Report" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Financial Report" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Closeout" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    When I click on parallel lines menu bar with data target value "Approvers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Award" column header inside table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see sort order "Descending" for column "Award" inside table with id "---grantee_tableId:-:awardApproverTableId---"
    When I click on "Name" column header inside table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see sort order "Ascending" for column "Name" inside table with id "---grantee_tableId:-:awardApproverTableId---"
    When I click on "Amendment Request" column header inside table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see sort order "Ascending" for column "Amendment Request" inside table with id "---grantee_tableId:-:awardApproverTableId---"
    When I click on "Progress Report" column header inside table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see sort order "Ascending" for column "Progress Report" inside table with id "---grantee_tableId:-:awardApproverTableId---"
    When I click on "Financial Report" column header inside table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see sort order "Ascending" for column "Financial Report" inside table with id "---grantee_tableId:-:awardApproverTableId---"
    When I click on "Closeout" column header inside table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see sort order "Ascending" for column "Closeout" inside table with id "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Owner" page block displayed
    When I click on parallel lines menu bar with data target value "Owner"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Name" column header inside table with id "---grantee_tableId:-:awardOwnerTableId---"
    Then I softly see sort order "Ascending" for column "Name" inside table with id "---grantee_tableId:-:awardOwnerTableId---"
    When I click on "Role" column header inside table with id "---grantee_tableId:-:awardOwnerTableId---"
    Then I softly see sort order "Ascending" for column "Role" inside table with id "---grantee_tableId:-:awardOwnerTableId---"
    And I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Title" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Report Type" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Frequency" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see "Reporting Period" in flex table header "---grantee_tableId:-:awardReportSchedulesTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see sort order "Descending" for column "EGMS ID" inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    When I click on "Report Title" column header inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see sort order "Ascending" for column "Report Title" inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    When I click on "Report Type" column header inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see sort order "Ascending" for column "Report Type" inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    When I click on "Frequency" column header inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see sort order "Ascending" for column "Frequency" inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    When I click on "Reporting Period" column header inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see sort order "Ascending" for column "Reporting Period" inside table with id "---grantee_tableId:-:awardReportSchedulesTableId---"
    When I click on parallel lines menu bar with data target value "Reports Schedule"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see sort order "Descending" for column "EGMS ID" inside table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on "Month-Year Created" column header inside table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see sort order "Ascending" for column "Month-Year Created" inside table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on parallel lines menu bar with data target value "Objectives"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see "Key Performance Indicators (KPIs)" page block displayed
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Domain" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Measure" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Unit" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Orientation" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Target" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Current Value" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Current Value As Of" in flex table header "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Descending" for column "EGMS ID" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Domain" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Domain" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Measure" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Measure" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Unit" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Unit" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Orientation" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Orientation" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Target" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Target" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Current Value" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Current Value" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on "Current Value As Of" column header inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see sort order "Ascending" for column "Current Value As Of" inside table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click on parallel lines menu bar with data target value "Key Performance Indicators (KPIs)"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see "Special Conditions" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Date Effective From" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see "Date Effective To" in flex table header "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "EGMS ID" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "EGMS ID" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective From" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Date Effective From" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on "Date Effective To" column header inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see sort order "Ascending" for column "Date Effective To" inside table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on parallel lines menu bar with data target value "Special Conditions"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see row level action button "View" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Edit" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I can see row level action button "Delete" against "Terms" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Classification" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "File Extension" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Classification" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Classification" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "File Extension" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "File Extension" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on parallel lines menu bar with data target value "Award Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see "Created Date" in flex table header "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see "Created By" in flex table header "---grantee_tableId:-:awardsNotesTableId---"
    When I click on "Title" column header inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see sort order "Ascending" for column "Title" inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on "Created By" column header inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see sort order "Ascending" for column "Created By" inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on "Description" column header inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see sort order "Ascending" for column "Description" inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on "Created Date" column header inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I softly see sort order "Ascending" for column "Created Date" inside table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see "Actions" in flex table header "CommunicationHistory"
    Then I softly see "Subject" in flex table header "CommunicationHistory"
    Then I softly see "From Address" in flex table header "CommunicationHistory"
    Then I softly see "To Address" in flex table header "CommunicationHistory"
    Then I softly see "CC Address" in flex table header "CommunicationHistory"
    Then I softly see "Attention To" in flex table header "CommunicationHistory"
    Then I softly see "Email Subject" in flex table header "CommunicationHistory"
    Then I softly see "Preview" in flex table header "CommunicationHistory"
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly see value "govgrantsuat@yopmail.com" for title "From Address" inside table "CommunicationHistory"
    Then I softly see value "pm.automation@yopmail.com" for title "To Address" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"

  @482618 @ValidatePMusercansubmitawardforreviewtoFOuserAlloweditasYes @P3_Grantee @PM_Grantee @GRegression1
  Scenario: Validate PM user can submit award for review to FO user Allow edit as Yes
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - My Records"
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:awardTableId---" panel
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:AwardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:AwardEGMSID}" in flex table with id "---grantee_tableId:-:awardTableId---"
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:AwardEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I navigate to "Projections" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:ProjectTableId---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---"

  @482624 @validateassignedapproverscanforwardSenttoownerApprovetheaward @Gregression2 @P2_Grantee @PM_Grantee
  Scenario Outline: Validate Assigned approvers can  Forward/Sent to owner/Approve the award
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default-Grantee PO"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Responsibilities" sub tab
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardApproverTableId---" by clicking "Edit" :
      | Award  | Name       |
      | Step 1 | <Approval> |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I navigate to "Management" sub tab
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    When I navigate to "Files" sub tab
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Other" from computer
    When I click modal button "Close"
    Then I see "AttachmentTesting.pdf" has been added in "Award Files" flex table
    Then I can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on "Edit" icon for "Other" inside flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I update title as "Automation.pdf" on upload file modal
    And I select Classification as "Interim Award Document" at upload file modal
    When I click modal button "Save"
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation.pdf" for title "Title" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see value "Interim Award Document" for title "Classification" inside table "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    And I navigate to "Messages" sub tab
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I click on "Validate" in the page details
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The award has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I select radio button "Forward" in the approval decision
    And I select user "<ForwardUser>" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "<User1>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Created"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Awards" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Awards - All"
    When I perform quick search for "Record Id" in "---grantee_tableId:-:awardTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---grantee_tableId:-:awardTableId---" without waiting for record
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    Then I softly see the following messages in the page details contains:
      | Successfully Disapproved |
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Rejected" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I click on back arrow
    When I navigate to "History" sub tab
    Then I softly see snapshot with name containing "SubmitForApproval.pdf" as name

    Examples:
      | User       | ForwardUser | User1       | Approval |
      | GRANTEE PM | Victor EXE  | GRANTEE EXE | Sarah PM |

  @482617 @ValidateasPMuserEditablefieldsandactionsdisplayedonAwardwhenawardisinCreated,Submittedforreview,Reviewedstate
  Scenario: Validate as PM user Editable fields and actions displayed on Award when award is in Created, Submitted for review, Reviewed state
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I "Created" award from application for opportunity "CAS-HHS0000660610" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_THREE_APPROVER"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Projections" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Details" page block displayed
    Then I softly see field "Award Title" inside page block
    Then I softly see field "Grant EGMS ID" inside page block
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    Then I see the header is "Grant" in the page details
    And I click on back arrow
    Then I softly see field "Amendment Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Amendment Number"
    Then I softly see "Amendment number provided in NOA Document. Field should allow only numbers upto 4 digits" shown as help text
    Then I softly see field "Award Issue Date" inside page block
    Then I softly see field "Award Type" inside page block
    Then I softly see field "Version Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Version Number"
    Then I softly see "System generated number used to track changes to the award" shown as help text
    Then I softly see field "Funding Organization" inside page block
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see link "{SavedValue:FundingOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:FundingOrganization}"
    Then I see the header is "Federal Organization" in the page details
    Then I see the sub-header is "{SavedValue:FundingOrganization}" in the page details
    And I click on back arrow
    And I save the field labeled "Internal Organization" as "InternalOrganization"
    Then I softly see link "{SavedValue:InternalOrganization}" inside Page block
    And I click on hyperlink containing value "{SavedValue:InternalOrganization}"
    Then I see the header is "Internal Organization" in the page details
    Then I see the sub-header is "{SavedValue:InternalOrganization}" in the page details
    And I click on back arrow
    Then I softly see field "Application" inside page block
    Then I softly see field "Maintenance Of Effort Amount" inside page block
    Then I softly see field "Maintenance of Effort Statutory Reference" inside page block
    When I hovering mouse on help text icon inside page block detail "Maintenance of Effort Statutory Reference"
    Then I softly see "URL of MOE" shown as help text
    Then I softly see field "Terms and Conditions Link" inside page block
    When I hovering mouse on help text icon inside page block detail "Terms and Conditions Link"
    Then I softly see "Enter link to award terms and conditions as provided in award letter" shown as help text
    Then I softly see field "Separate Attachment for Terms and Conditions?" inside page block
    When I hovering mouse on help text icon inside page block detail "Separate Attachment for Terms and Conditions?"
    Then I softly see "Terms & Conditions must be uploaded in the Files section." shown as help text
    Then I softly see field "Funder Payment System" inside page block
    When I hovering mouse on help text icon inside page block detail "Funder Payment System"
    Then I softly see "The federal payment system providing the funds for the award." shown as help text
    Then I softly see field "Funder Payment System Sub-Account Number" inside page block
    Then I softly see "Description" page block displayed
    Then I softly see field "Scope / Award Description" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Contacts" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:awardAssociateContactTableId---"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Contacts added successfully. |
    And I click modal button "Close"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    When I hovering mouse on help text icon inside modal "Mobile Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    And I click modal button "Close"
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see field "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see field "County" inside page block
    Then I softly see field "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see field "Congressional District" inside page block
    Then I softly see asterisk mark on "Congressional District"
    Then I softly see field "Zip Code" inside page block
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field "Country" inside page block
    Then I softly see asterisk mark on "Country"
    Then I softly see field "4-digit Zip Code Extension" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Projections" sub tab
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    When I click on parallel lines menu bar with data target value "Focus Area"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Title" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see sort order "Descending" for column "Title" inside table with id "---grantee_tableId:-:ProjectTableId---"
    When I click on "Start Date" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see sort order "Ascending" for column "Start Date" inside table with id "---grantee_tableId:-:ProjectTableId---"
    When I click on "End Date" column header inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see sort order "Ascending" for column "End Date" inside table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on parallel lines menu bar with data target value "Award Budget"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    Then I softly see "Program Income" page block displayed
    Then I softly see "Focus Area Name" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Projected Program Income ($)" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Program Income Justification" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Program Income"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Approvers" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    When I click on parallel lines menu bar with data target value "Approvers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Owner" page block displayed
    When I click on parallel lines menu bar with data target value "Owner"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see value "Progress Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see value "Financial Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "Reporting Period End Date" as "ReportingPeriodEndDate" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 17                          | 27                                  |
      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 15                          | 25                                  |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "Reporting Period End Date" as "ReportingPeriodEndDate" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
      | {SavedValue:EGMS ID1} | 17                          | 47                        |
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on parallel lines menu bar with data target value "Objectives"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on "Remove" icon for "Automation Permanent Objective" inside flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on "Remove" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on parallel lines menu bar with data target value "Special Conditions"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on parallel lines menu bar with data target value "Award Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" without waiting for record
    And I pause execution for "3" seconds
    And I navigate to "Overview" sub tab
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Projections" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Details" page block displayed
    Then I softly see field "Award Title" inside page block
    Then I softly see field "Grant EGMS ID" inside page block
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see "Description" page block displayed
    Then I softly see field "Scope / Award Description" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Contacts" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    When I hovering mouse on help text icon inside modal "Mobile Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    And I click modal button "Close"
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see field "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see field "County" inside page block
    Then I softly see field "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see field "Congressional District" inside page block
    Then I softly see asterisk mark on "Congressional District"
    Then I softly see field "Zip Code" inside page block
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field "Country" inside page block
    Then I softly see asterisk mark on "Country"
    Then I softly see field "4-digit Zip Code Extension" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Projections" sub tab
    Then I softly see "Project Period Details" page block displayed
    Then I softly see field "Project Period Start Date" inside page block
    Then I softly see field "Project Period End Date" inside page block
    Then I softly see field "Award Amount to Date" inside page block
    Then I softly see field "Budget Redirection Threshold (%)" inside page block
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see field "Budget Period Start Date" inside page block
    Then I softly see field "Budget Period End Date" inside page block
    Then I softly see field "Carry-Forward this Action" inside page block
    Then I softly see field "Award Amount This Action" inside page block
    Then I softly see field "Total Match Amount Required" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    Then I softly see "Focus Area" page block displayed
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    When I click on parallel lines menu bar with data target value "Focus Area"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on parallel lines menu bar with data target value "Award Budget"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    Then I softly see "Program Income" page block displayed
    Then I softly see "Focus Area Name" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Projected Program Income ($)" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Program Income Justification" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Program Income"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardPeerReviewerTableId---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | No                   |
    Then I softly see "Reviewer Name" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Role" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Description" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Due Date" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Allow Record Editing" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:awardPeerReviewerTableId---"
    When I click on parallel lines menu bar with data target value "Peer Reviewers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Approvers" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Award" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Progress Report" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Financial Report" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Closeout" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    When I click on parallel lines menu bar with data target value "Approvers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Owner" page block displayed
    When I click on parallel lines menu bar with data target value "Owner"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see value "Progress Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see value "Financial Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "Reporting Period End Date" as "ReportingPeriodEndDate" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 17                          | 27                                  |
      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 15                          | 25                                  |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
      | {SavedValue:EGMS ID1} | 17                          | 47                        |
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on parallel lines menu bar with data target value "Objectives"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on "Remove" icon for "Automation Permanent Objective" inside flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on "Remove" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on parallel lines menu bar with data target value "Special Conditions"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on parallel lines menu bar with data target value "Award Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record1 | Automation Notes |
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Automation Subject" for title "Subject" inside table "CommunicationHistory"
    Then I softly can see row level action button "View" against "Automation Subject" in flex table with id "CommunicationHistory"
    Then I softly can see row level action button "Reply" against "Automation Subject" in flex table with id "CommunicationHistory"
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Overview" sub tab
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Projections" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Management" sub tab at view detail page
    Then I softly can see "Monitoring" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly see "Details" page block displayed
    Then I softly see field "Award Title" inside page block
    Then I softly see field "Grant EGMS ID" inside page block
    And I save the field labeled "Grant EGMS ID" as "GrantEGMSID"
    Then I softly see link "{SavedValue:GrantEGMSID}" inside Page block
    Then I softly see "Description" page block displayed
    Then I softly see field "Scope / Award Description" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "View" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent NGO Program" in flex table with id "---grantee_tableId:-:awardExternalProgranTableId---"
    Then I softly see "Contacts" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "View" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I can see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:awardContactTableId---"
    When I click on parallel lines menu bar with data target value "Contacts"
    And I wait for "2" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:awardContactTableId---"
    Then I softly see "Create Contact" opens in overLay window
    Then I softly see field on modal "Organization" inside page block
    Then I softly see field on modal "Title" inside page block
    Then I softly see field on modal "First Name" inside page block
    Then I softly see field on modal "Last Name" inside page block
    Then I softly see field on modal "Phone" inside page block
    When I hovering mouse on help text icon inside modal "Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Mobile Phone" inside page block
    When I hovering mouse on help text icon inside modal "Mobile Phone"
    Then I softly see "Please enter number in this format (xxx)-xxx-xxxx" shown as help text
    Then I softly see field on modal "Email" inside page block
    Then I softly see field on modal "Address Line 1" inside page block
    Then I softly see field on modal "Address Line 2" inside page block
    Then I softly see field on modal "State" inside page block
    Then I softly see field on modal "Congressional District" inside page block
    When I hovering mouse on help text icon inside modal "Congressional District"
    Then I softly see "Enter 3 digit numeric value. For Example if Congressional District is 8 enter 008, if congressional District is 78 enter 078 and if Congressional District is 876 enter 876." shown as help text
    Then I softly see field on modal "City" inside page block
    Then I softly see field on modal "Country" inside page block
    Then I softly see field on modal "County" inside page block
    Then I softly see field on modal "4-Digit Zip Code Extension" inside page block
    Then I softly see field on modal "Zip Code" inside page block
    And I click modal button "Close"
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see field "Address Line 1" inside page block
    Then I softly see asterisk mark on "Address Line 1"
    Then I softly see field "Address Line 2" inside page block
    Then I softly see field "City" inside page block
    Then I softly see asterisk mark on "City"
    Then I softly see field "County" inside page block
    Then I softly see field "State" inside page block
    Then I softly see asterisk mark on "State"
    Then I softly see field "Congressional District" inside page block
    Then I softly see asterisk mark on "Congressional District"
    Then I softly see field "Zip Code" inside page block
    Then I softly see asterisk mark on "Zip Code"
    Then I softly see field "Country" inside page block
    Then I softly see asterisk mark on "Country"
    Then I softly see field "4-digit Zip Code Extension" inside page block
    And I save the field labeled "Created By" as "CreatedBy"
    Then I softly see field "Created By" as "{SavedValue:CreatedBy}"
    And I save the field labeled "Created Date" as "CreatedDate"
    Then I softly see field "Created Date" as "{SavedValue:CreatedDate}"
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see field "Last Modified By" as "{SavedValue:LastModifiedBy}"
    And I save the field labeled "Last Modified Date" as "LastModifiedDate"
    Then I softly see field "Last Modified Date" as "{SavedValue:LastModifiedDate}"
    And I navigate to "Projections" sub tab
    Then I softly see "Project Period Details" page block displayed
    Then I softly see field " Project Period Start Date " inside page block
    Then I softly see field " Project Period End Date " inside page block
    Then I softly see field "Award Amount to Date" inside page block
    Then I softly see field "Budget Redirection Threshold (%)" inside page block
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see field "Budget Period Start Date" inside page block
    Then I softly see field "Budget Period End Date" inside page block
    Then I softly see field "Carry-Forward this Action" inside page block
    Then I softly see field "Award Amount This Action" inside page block
    Then I softly see field "Total Match Amount Required" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    Then I softly see "Focus Area" page block displayed
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Start Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "End Date" in flex table header "---grantee_tableId:-:ProjectTableId---"
    When I click on parallel lines menu bar with data target value "Focus Area"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Budget Category" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Non-Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    When I click on parallel lines menu bar with data target value "Award Budget"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I click on "Add Line Items" icon for "Construction" inside flex table with id "---grantee_tableId:-:AwardBudgetTableId---" with wait for record
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Edit" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    Then I softly can see row level action button "Delete" against "Construction" in flex table with id "---grantee_tableId:-:awardLineItemsTableId---"
    When I close "Award Line Items" modal by clicking the top right x button
    Then I softly see "Program Income" page block displayed
    Then I softly see "Focus Area Name" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Projected Program Income ($)" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Program Income Justification" in flex table header "---grantee_tableId:-:awardProgramIncomeTableId---"
    When I click on parallel lines menu bar with data target value "Program Income"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:awardProgramIncomeTableId---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Edit" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly can see row level action button "Delete" against "New Indirect rate1" in flex table with id "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective from" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Effective until" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:awardIndirectRateTableId---"
    When I click on parallel lines menu bar with data target value "Indirect Rates"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:awardPeerReviewerTableId---"
    Then I softly see "Approvers" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Name" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Award" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Amendment Request" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Progress Report" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Financial Report" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    Then I softly see "Closeout" in flex table header "---grantee_tableId:-:awardApproverTableId---"
    When I click on parallel lines menu bar with data target value "Approvers"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Owner" page block displayed
    When I click on parallel lines menu bar with data target value "Owner"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    And I navigate to "Management" sub tab
    Then I softly see "Reports Schedule" page block displayed
    Then I softly see value "Progress Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    Then I softly see value "Financial Report" for title "Report Type" inside table "---grantee_tableId:-:awardReportSchedulesTableId---"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Progress_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "2" seconds
    And I expand nested table containing column value "Progress Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID1}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID2}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID3}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID4}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID5}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    Then I softly can see row level action button "Edit" against "{SavedValue:EGMS ID6}" in flex table with id "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "Reporting Period End Date" as "ReportingPeriodEndDate" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 17                          | 27                                  |
      | {SavedValue:EGMS ID2} | 27                          | {SavedValue:ReportingPeriodEndDate} |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date           |
      | {SavedValue:EGMS ID1} | 15                          | 25                                  |
      | {SavedValue:EGMS ID2} | 25                          | {SavedValue:ReportingPeriodEndDate} |
    And I click on "Edit" icon for "Financial Report" inside flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" without waiting for record
    When I enter in modal "Grantee_Financial_Schedules" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I wait for "3" seconds
    And I expand nested table containing column value "Financial Report"
    And I save the total records from the flex table id "---grantee_tableId:-:financialReportProgressReportSchedules---" as "totalRecords"
    Then I softly see total records count "{SavedValue:totalRecords}" in flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "1" for column name "EGMS ID" as "EGMS ID1" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "2" for column name "EGMS ID" as "EGMS ID2" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "3" for column name "EGMS ID" as "EGMS ID3" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "4" for column name "EGMS ID" as "EGMS ID4" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "5" for column name "EGMS ID" as "EGMS ID5" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I save the value from row "6" for column name "EGMS ID" as "EGMS ID6" from flex table "---grantee_tableId:-:financialReportProgressReportSchedules---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:awardReportSchedulesTableId---" by clicking "Edit" :
      | EGMS ID               | Reporting Period Start Date | Reporting Period End Date |
      | {SavedValue:EGMS ID1} | 17                          | 47                        |
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:ProgressReportTableId---"
    Then I softly do not see top right button "New" inside flex table "---grantee_tableId:-:FinancialsReportTableId---"
    And I navigate to "Monitoring" sub tab
    Then I softly see "Objectives" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see "Month-Year Created" in flex table header "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    When I click on parallel lines menu bar with data target value "Objectives"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see top right button "Associate" inside flex table "---grantee_tableId:-:awardObjectiveTableId---"
    And I click on "Remove" icon for "Automation Permanent Objective" inside flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I wait for "2" seconds
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---grantee_tableId:-:awardAssociateObjectiveTableId---"
    Then I softly see the following messages in the page details contains:
      | Goals/Objectives associated successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "Remove" against "Automation Permanent Objective" in flex table with id "---grantee_tableId:-:awardObjectiveTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I click on "Remove" icon for "Automation Runtime KPI" inside flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly see the following messages in the page details contains:
      | Record removed successfully. |
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    When I click "Associate" after selection of "Automation Runtime KPI" in the table "---grantee_tableId:-:selectAwardKPITableId---"
    Then I softly see the following messages in the page details contains:
      | KPIs added successfully. |
    And I click modal button "Close"
    Then I softly can see row level action button "View" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Edit" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    Then I softly can see row level action button "Remove" against "Automation Runtime KPI" in flex table with id "---grantee_tableId:-:KeyPerformanceIndicatorTableId---"
    And I wait for "3" seconds
    Then I softly can see top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    And I click on top right button "New" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I enter in modal value "Terms" into field "Title__c"
    When I enter in modal value "Terms Description" into field "Description__c"
    When I enter in modal value "1" into field "Sequence__c"
    And I click modal button "Save"
    And I save the value from row "1" for column name "EGMS ID" as "TermsId" from flex table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly see value "{SavedValue:TermsId}" for title "EGMS ID" inside table "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    Then I softly can see row level action button "Delete" against "{SavedValue:TermsId}" in flex table with id "---grantee_tableId:-:SpecialConditionTableId---"
    When I click on parallel lines menu bar with data target value "Special Conditions"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "Files" sub tab
    Then I softly see "Award Files" page block displayed
    Then I softly see top right button "Add Files" inside flex table "---grantee_tableId:-:awardAddFilesTableId---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly can see row level action button "View" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Edit" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Delete" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    Then I softly can see row level action button "Download" against "AttachmentTesting.pdf" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    When I click on parallel lines menu bar with data target value "Award Files"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I softly see "Notes" page block displayed
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:awardsNotesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:awardsNotesTableId---" by clicking "New" :
      | Title         | Description      |
      | Notes Record2 | Automation Notes |
    Then I can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    Then I can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:awardsNotesTableId---"
    When I click on parallel lines menu bar with data target value "Notes"
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                        | Subject            | Body            |
      | pm.automation@yopmail.com | Automation Subject | Automation Body |
    When I click modal button "Close"

  @482430 @validatewithpouserwhenuseractivatetheawardthenusershouldabletoseethecorrectvaluesongrant&Award
  Scenario: Verify as PO user when user activate the award then user should able to see the correct values on grant & Award
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    When I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default-Grantee PO user"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "Budget Period" as "BudgetPeriod"
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    And I save the field labeled "Grant Award Number" as "GrantAwardNumber"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Projections" sub tab
    And I save the field labeled "Project Period Start Date" as "ProjectPeriodStartDate"
    And I save the field labeled "Project Period End Date" as "ProjectPeriodEndDate"
    And I save the field labeled "Budget Period Start Date" as "BudgetPeriodStartDate"
    And I save the field labeled "Budget Period End Date" as "BudgetPeriodEndDate"
    And I wait for "2" seconds
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "Attachment.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I navigate to "Projections" sub tab
    And I wait for "3" seconds
    Then I softly see "Project Period Details" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I softly see "Focus Area" page block displayed
    Then I softly see "Award Budget" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see field "Project Period Start Date" as "{SavedValue:ProjectPeriodStartDate}"
    Then I softly see field "Project Period End Date" as "{SavedValue:ProjectPeriodEndDate}"
    Then I softly see field "Budget Period Start Date" as "{SavedValue:BudgetPeriodStartDate}"
    Then I softly see field "Budget Period End Date" as "{SavedValue:BudgetPeriodEndDate}"
    Then I softly see value "Automation Permanent Focus Area" for title "Title" inside table "---grantee_tableId:-:ProjectTableId---"
    Then I softly see "Award  Budget" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Cash Match" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Other Leverage" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see "Total Project Cost" in flex table header "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$6,000.00" for title "Award  Budget" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:AwardBudgetTableId---"
    When I navigate to "Actuals" sub tab
    Then I softly see "Financials Summary" page block displayed
    Then I softly see "Expenditure Detail" page block displayed
    Then I softly see "Program Income Revenue by Focus Area" page block displayed
    Then I softly see "Drawdown By Award" page block displayed
    Then I softly see value "$6,000.00" for title "Award Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Spent to Date" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Carry-Forward" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$6,000.00" for title "Remaining Budget" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    Then I softly see value "$0.00" for title "Program Income Expenditures" against the value "Construction" inside table "---grantee_tableId:-:ExpenditureDetailsTableId---"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    And I wait for "2" seconds
    Then I softly see field "Grant Number" as "{SavedValue:GrantNumber}"
    And I navigate to "Financials" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see value "$6,000.00" for title "Awarded Budget" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$600.00" for title "Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$500.00" for title "Non-Cash Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$1,100.00" for title "Total Match" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$100.00" for title "Other Leverage" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    Then I softly see value "$7,200.00" for title "Total Project Cost" against the value "Construction" inside table "---grantee_tableId:-:grantBudgetCategoryTableId---"
    When I navigate to "Awards" sub tab
    Then I softly see value "Activated" for title "Status" against the value "{SavedValue:AwardEGMSID}" inside table "---grantee_tableId:-:GrantsAwardsRevisionTableId---"

  @484065 @ValidatewithPMProfile,afteractivatetheawardabletoseetheactualTabinpendingCloseout,closedandamendedstateaswell @GranteeP_Q4
  Scenario: Validate with PM Profile ,After activate the award able to see the Actual Tab in pending Closeout ,closed and amended state as well.
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Sarah PM"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Sarah PM"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Submitted to Grantor" for opportunity number "{SavedValue:Automation Runtime}" with properties "DAVID_FO_APPROVER"
    And I "Created" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "STEP_FOUR_APPROVER"
    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:GrantsTable---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
    And I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I save the field labeled "Grant Number" as "GrantNumber"
    And I save the field labeled "Project Period Start Date" as "PPST"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
    Then I softly can see "Actuals" sub tab at view detail page
    And I "Approved" of type "Funding Change" amendment request for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
    And I refresh the page
    And I wait for "2" seconds
    When I navigate to "Amendments" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Record Decision" in page detail
    Then I can see top right button "Revise Amendment" in page detail
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value                       | Field             |
      | Accepted                    | Decision__c       |
      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
      | Test                        | Comments__c       |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Accepted"
    And I click on "Amend Award" in the page details
    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
    When I click on "Activate Award" in the page details
    Then I softly see field "Status" as "Activated"
    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    And I wait for "2" seconds
    Then I softly can see "Actuals" sub tab at view detail page
    And I create adhoc closeout "{SavedValue:Automation Runtime Opportunity}" for status "Approved" with properties "default"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Closeout" sub tab
    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:GrantsProjectPeriodCloseoutTableId---" without waiting for record
    When I navigate to "Overview" sub tab
    And I save the field labeled "EGMS ID" as "closeoutID"
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Pending Closeout"
    Then I softly can see "Actuals" sub tab at view detail page
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    When I navigate to "Project Period Closeouts" content inside "Closeouts" subheader on left panel
    And I click toggle button to select "Project Period Closeout - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---grantee_tableId:-:ProjectPeriodCloseout---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---grantee_tableId:-:ProjectPeriodCloseout---"
    When I click on "Submit to Grantor" in the page details
    When I enter values into fields
      | Value | Field                 |
      | 0     | SubmittedToGrantor__c |
    And I click modal button "Save"
    And I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I click on "Complete Closeout" in the page details
    And I wait for "2" seconds
    When I enter in modal value "0" into field "FederalCloseoutDate__c"
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Completed"
    When I navigate to "Overview" sub tab
    And I click on hyperlink containing value "{SavedValue:GrantEGMSID}"
    When I navigate to "Awards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID1}" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
    Then I softly see field "Status" as "Closed"
    Then I softly can see "Actuals" sub tab at view detail page