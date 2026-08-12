@emailRegression @applicationEmailScenarios @applicationIntakeEmailScenarios @applicationRegression @grantor-regression @grantor-parallel-regression @app @regression @ApplicationAndPre-App
Feature: Validate all email scenarios in the Application Intake

  #applicationIntakeWB
  @197064 @sprint-4-US-197579 @reassignment
  Scenario: Validate App email should be generated for new owner for App if it's related Ann ownership assign to other user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Review" and properties "NEGOTIATION"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "3" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "1" seconds
    Given I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I click on "Splitview" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I wait for "2" seconds
    And I click on "Edit" in the split screen page details
    And I wait for "2" seconds
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    And I wait for "2" seconds
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime Announcement Application Review}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:Automation Runtime Announcement Application Review}" for title "Announcement Name" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:announcementListTableId---" panel
    Then I softly can see row level action button "Initiate Review Process" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:announcementListTableId---"
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    Then I softly can see row level action button "Request Negotiation" against "{SavedValue:Automation Runtime Announcement Application Review}" in flex table with id "---applicationReview:-:appTableId---"
    When I click on "Request Negotiation" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:appTableId---" without waiting for record
    And I navigate to "Negotiations" sub tab
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "3" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I click on "Edit" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter value "Automation Negotiation Iniatiation" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I checkout to yopmail with mailid "pm1.automation.qa2@yopmail.com"
    And I pause execution for "100" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Application Negotiation {SavedValue:Automation Runtime Announcement Application Review} : Application {SavedValue:EGMSID} hasbeen Resubmitted by the Subrecipient
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that the Application {SavedValue:EGMSID} for the Announcement  {SavedValue:Automation Runtime Announcement Application Review} has been resubmitted for review by Automation SPI3.

      Log in to EGMS and click here to access the negotiation request.

      Please do not reply to this system-generated email. You may contact the Governates Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  #preAplicationWB
  @72576 @75866 @75865 @preApplicationSubmittedToGrantorPendingTask @buglogged125701  @buglogged169487
  Scenario: Validate whether user can change the pre-application due date while creating the pre-application
  Validate whether pre-application title field is editable while creating the pre-application | Validate whether the Announcement owner receives an email notification when the pre-application is submitted to grantor |
  Validate whether the external user recieves an email notification when the pre-application is accepted by the grantor
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-Application" and properties "PRE_APPLICATION_YES"
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Published Competitive Announcements"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---announcement:-:competitiveTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside flex table with id "---announcement:-:competitiveTableId---"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnId"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-Application}" in "---preApplication:-:notYetQualifiedTable---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-Application}" inside table
    When I click on "Qualify" in the page details
    Then I softly see field "Pre-Application Due Date" is not editable
    And I click on "Create Pre-Application" in the page details
    And I pause execution for "5" seconds
    Then I softly see fields "Title__c" is in edit mode
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "preAppId"
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I switch to tab number "1"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I switch to parent tab
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:preappID}" in "---preApplication:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:preappID}" inside table
    When I click on "Accept" in the page details
    And I wait for "3" seconds
    And I logout
    And I wait for "3" seconds
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "50" seconds
    And I refresh the page
    And I see the mail subject is as follows :
      """
      Sandbox: Notification: Pre-Application Submitted for Announcement{SavedValue:AnnId} by SAN DIEGO ELECTRICAL TRAINING TRUST
      """
    Given I am on "INTERNAL" portal
    And I login to "Grantor" app as "dynamicUser" user
    And I pause execution for "80" seconds
    And I checkout to yopmail with mailid "automationspi31.qa2@yopmail.com"
    And I refresh the page
    Then I see the mail subject is as follows :
      """
      Pre-Application {SavedValue:Automation Runtime Announcement for Pre-Application} {SavedValue:AnnId} has been Accepted
      """

  @197235 @ValidatePre-appemailshouldbegeneratedfornewownerforpre-appifit'srelatedAnnownershipassigntonewAnnuser @sprint-4-US-197579  @reassignment
  Scenario: Validate Pre-app email should be generated for new owner for pre-app if it's related Ann ownership assign to new Ann user
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES-Automation EXE user"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    And I wait for "4" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I click on "Edit" in the split screen page details
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Request Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    When I enter "Nego_Edit1" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly can see top right button "Send to Subrecipient" in page detail
    And I click on "Send to Subrecipient" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Status" as "Sent to Subrecipient" in "Negotiation Request Details" pageblock
    When I re-login to "Grantor" app as "ADMIN" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation EXE" into field "input-1"
    And I select value "Automation EXE1" into field "input-2"
    And I select module "Announcement" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:annAdminOwnerReplaceTableId---" panel
    When I check "{SavedValue:Automation Runtime Announcement for Pre-App}" boxes in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---announcement:-:annAdminOwnerReplaceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---announcement:-:annAdminTargetOwnerReplaceTableId---" panel
    Then I see value "{SavedValue:Automation Runtime Announcement for Pre-App}" for title "Announcement Name" inside table "---announcement:-:annAdminTargetOwnerReplaceTableId---"
    And I pause execution for "5" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:externalPendingTasktableId---" panel
    And I click on "Start" icon for "Record Id" inside table
    And I navigate to "Negotiations" sub tab
    And I click on "Edit" in the page details
    When I enter value "Automation Test" into field "ApplicantResponse__c"
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I softly see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Status" as "Submitted to Grantor" in "Negotiation Request Details" pageblock
    And I checkout to yopmail with mailid "exe1.automation.qa2@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Pre Application Negotiation {SavedValue:Automation Runtime Announcement for Pre-App}: Pre Application {SavedValue:PreappEGMSID}has been Resubmitted by the Subrecipient
      """
    Then I see the mail text is as follows :
      """
      Hello,

      This email is to notify you that the Pre Application {SavedValue:Automation Runtime Announcement for Pre-App} for the Announcement {SavedValue:Automation Runtime Announcement for Pre-App} has been resubmitted for review by Automation SPI3.

      Log in to EGMS and click here to access the negotiation request.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com,if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """

  @224655 @ValidatePre-appnewownerpeerreviewershouldabletosubmitthereviewcommentsforpre-app @sprint-11-US-218319  @reassignment
  Scenario: Validate Pre-app new owner of peer reviewer should able to submit the review comments for pre-app
    And I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_YES"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I click on "Create Pre-Application" in the page details
    And I wait for "4" seconds
    When I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "PreappEGMSID"
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Forms and Files" sub tab
    And I navigate to "Quickview" sub tab in split screen
    And I click on "Splitview" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I click on "Edit" in the split screen page details
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    And I click on "Save" in the split screen page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---home:-:internalHomePendingTaskTableId---" panel
    Then I see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---home:-:internalHomePendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I navigate to "Responsibilities" sub tab
    And I enter the following values into flex table with id "---preApplication:-:preAppPeerReviewTableId---" by clicking "New" :
      | Reviewer Name             | Responsibility   | Description                 | Due Date |
      | {SavedValue:EXE Username} | Program Reviewer | Automation Test Description | 7        |
    And I enter the following values into flex table with id "---preApplication:-:preAppPeerReviewTableId---" by clicking "New" :
      | Reviewer Name            | Responsibility  | Description                 | Due Date |
      | {SavedValue:FO Username} | Fiscal Reviewer | Automation Test Description | 7        |
    And I click on "Send for Review" icon for "Program Reviewer" inside flex table with id "---preApplication:-:preAppPeerReviewTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    And I click on "Send for Review" icon for "Fiscal Reviewer" inside flex table with id "---preApplication:-:preAppPeerReviewTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    Then I softly see that "Sent for Review" has been added in flextable with Id "---preApplication:-:preAppPeerReviewTableId---"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    Then I see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---applicationReview:-:pendingTaskTableId---"
    And I navigate to "Home" tab
    When I navigate to "My Tasks" content inside "Reassign" subheader on left panel
    When I reassign task to "Automation EXE1"
    When I perform quick search for "{SavedValue:PreappEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    When I check "{SavedValue:PreappEGMSID}" boxes in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I click on top right button "Reassign Selected" in flex table with id "---program:-:grantorTaskReassignTableId---"
    And I pause execution for "30" seconds
    And I reset the table
    When I perform quick search for "{SavedValue:PreappEGMSID}" in "---program:-:grantorTaskReassignTableId---" panel
    Then I softly do not see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---program:-:grantorTaskReassignTableId---"
    When I re-login to "Grantor" app as "EXE1" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:PreappEGMSID}" in "---applicationReview:-:pendingTaskTableId---" panel
    Then I softly see value "{SavedValue:PreappEGMSID}" for title "EGMS ID" inside table "---applicationReview:-:pendingTaskTableId---"
    And I click on "Start" icon for "{SavedValue:PreappEGMSID}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I softly see value "Automation EXE1" for title "Reviewer Name" against the value "Program Reviewer" inside table "---preApplication:-:preAppPeerReviewTableId---"
    Then I softly see value "Automation FO" for title "Reviewer Name" against the value "Fiscal Reviewer" inside table "---preApplication:-:preAppPeerReviewTableId---"
    When I click on "Enter Review" icon for "Automation EXE1" inside flex table with id "---preApplication:-:preAppPeerReviewTableId---" without waiting for record
    And I wait for "8" seconds
    When I enter in modal value "Cannot Rate" into field "Rating__c"
    When I enter in modal value "Passed" into field "ReviewComments__c"
    When I click modal button "Save"
    And I click on submit review
    And I pause execution for "2" seconds
    Then I softly see that "Submitted" has been added in flextable with Id "---preApplication:-:preAppPeerReviewTableId---"
    And I checkout to yopmail with mailid "pm.automation.qa2@yopmail.com"
    And I pause execution for "5" seconds
    Then I refresh the page
    And I see the mail subject is as follows :
      """
      Notification: Pre-Application Submitted for Announcement {SavedValue:AnnEGMSID} by SAN DIEGO ELECTRICAL TRAINING TRUST
      """
    Then I see the mail text is as follows :
      """
      Hello Automation,

      This email is to notify you that Pre-Application {SavedValue:PreappEGMSID} for Announcement {SavedValue:Automation Runtime Announcement for Pre-App} has been submitted.

      Pre-Application Details:
      Pre-Application Title : {SavedValue:Automation Runtime Announcement for Pre-App}
      Applicant Organization : SAN DIEGO ELECTRICAL TRAINING TRUST
      Announcement Title: {SavedValue:Automation Runtime Announcement for Pre-App}
      Announcement Type: Competitive

      Log in to EGMS and click here to start reviewing the details.

      Please do not reply to this system-generated email. You may contact the GovGrants Support Team at govgrantssupport@reisystems.com if you have any questions or need assistance with this task.

      Thank you.
      The EGMS Team
      """
