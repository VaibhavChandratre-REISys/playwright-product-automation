@applicationIntakeNysed @applicationIntakeParentChildNysed @applicationIntakeParentChildNysed3
Feature: Validate all scenarios in the Application Intake parent child realationship

  Background:Set Parent Organization Field as Yes On Subrecipient Organization
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:SubrecipientOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:SubrecipientOrg---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "Yes" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds

  @543042 @543047 @543045 @543041 @543046 @543043 @NYSEDSprint-17 @US-540528 @M05
  Scenario Outline:Verify that the grantee user cannot create more applications than the 'Maximum # Applications Allowed' at the related directed opportunity for self when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
  |Verify that the grantee user cannot create more applications than the 'Maximum # Applications Allowed' at the related directed opportunity for each child organization when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.|
  |Verify that the grantee user cannot create more applications than the 'Maximum # Applications Allowed' at the related directed opportunity for child organization when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.|
  |Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related directed opportunity for self when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.|
  |Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related directed opportunity for each child organization when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.|
  |Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related directed opportunity for child organization when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.|
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
    #543041
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
    #543042
    Then I softly see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are 2. |
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID2"
    #543043
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    #543045
    Then I softly see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for this child organization. Maximum # Applications Allowed for this opportunity are 2. |
    And I wait for "3" seconds
    When I click modal button "Close"
    When I click alert button "OK"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg2AppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg2AppEGMSID2"
    #543046
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    #543047
    Then I softly see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for this child organization. Maximum # Applications Allowed for this opportunity are 2. |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    And I perform quick search for "<Announcement Name>" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "<Announcement Name>" inside flex table with id "---announcement:-:annoucementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    And I wait for "3" seconds
    Then I softly see "Total Records: 6" inside flex table with id "---applicationReview:-:relatedFOApplicationsTableId---"

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |

  @546644 @546600 @NYSEDSprint-17 @US-540528 @M05 @Bug-Ticket-NYSED-1476 @Bug-Ticket-NYSED-1500
  Scenario Outline:Verify that the Submit and Certify Role user can submit the another application which is Revision initiated when one application has approved FDM OR Converted to award, when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application FDM" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULABA_FS10_MAXIMUM_APPLICATION_ALLOWED_1"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application FDM}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application FDM}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | 2000              |
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
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
    And I perform quick search for "{SavedValue:ParentAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ParentAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
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
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 500                     | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    #546644 #546600
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I wait for "5" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ChildAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #546600
    Then I softly see field "Status" as "Review Initiated"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "3" seconds
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID1"
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
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Cancel Revision" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ChildAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Revision Initiated"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
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
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    #546644
    Then I softly see field "Status" as "Revision Submitted"

    Examples:
      | UserType   | Announcement Name                                            |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application FDM} |

  @546609 @546601 @NYSEDSprint-17 @US-540528 @M05
  Scenario Outline:Verify that the Submit and Certify Role user can submit the another application which is Revision initiated when one application has approved FDM OR Converted to award, when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application FDM" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULABAFA_FS10_MAXIMUM_APPLICATION_ALLOWED_1"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "4" seconds
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
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
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
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 500                     | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    #546609 #546601
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I wait for "5" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ChildAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #546601
    Then I softly see field "Status" as "Review Initiated"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "3" seconds
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID1"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "5"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Cancel Revision" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ChildAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    Then I softly see field "Status" as "Revision Initiated"
    And I navigate to "Revisions" sub tab
    And I wait for "3" seconds
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
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    And I wait for "5" seconds
    #546609
    Then I softly see field "Status" as "Revision Submitted"

    Examples:
      | UserType   | Announcement Name                                            |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application FDM} |

  @546603 @NYSEDSprint-17 @US-540528 @M05
  Scenario Outline:Verify that the Submit and Certify Role user can submit the another application when one application has approved FDM OR Converted to award,when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.: Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application FDM" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_MAXIMUM_APPLICATION_ALLOWED_1"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "4" seconds
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
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "4" seconds
    And I click on "Edit" in the page details
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    And I pause execution for "2" seconds
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
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    #546603
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I wait for "5" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ChildAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #546603
    Then I softly see field "Status" as "Review Initiated"

    Examples:
      | UserType   | Announcement Name                                            |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application FDM} |

  @546602 @NYSEDSprint-17 @US-540528 @M05
  Scenario Outline:Verify that the Submit and Certify Role user can submit the another application when one application has approved FDM OR Converted to award, when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.: Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application FDM" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_MAXIMUM_APPLICATION_ALLOWED_1"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000  | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    And I wait for "9" seconds
    When I click on "Submit" in the page details without processing
    And I wait for "4" seconds
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
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
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
    And I pause execution for "2" seconds
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
    And I wait for "3" seconds
    Then I softly see value "Review Completed" for title "Decision Status" inside table "---applicationReview:-:applicationAssignTableId---"
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
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
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:FO Username} | Step 1 |
    And I navigate to "Funding Decision Memo" sub tab
    And I click on "Edit" in the page details
    And I wait for "2" seconds
    And I enter value "AWS" into field "GrantCode__c"
    And I enter value "Yes" into field "NYSED_OSCApproved__c"
    And I enter value "Justified" into field "Justification__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Edit" icon for "<Announcement Name>" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I enter unique value in column with apiName "NYSED_ProjectIDSeqNo__c" for table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on top right button "Save" in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" by clicking "Edit" :
      | Application Title   | Total Commitment Amount | Recommend for Funding | Comments    |
      | <Announcement Name> | 1000                    | Yes                   | Recommended |
    And I wait for "2" seconds
    And I click on "Submit for Approval" in the page details
    And I "Approve" in the approval decision
    And I wait for "3" seconds
    #546602
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I wait for "5" seconds
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:ChildAppEGMSID1}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #546602
    Then I softly see field "Status" as "Review Initiated"

    Examples:
      | UserType   | Announcement Name                                            |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application FDM} |

  @546122 @539365 @NYSEDSprint-15 @US-502891 @M05
  Scenario Outline: Verify that a new picklist field, 'Not For Profit', has been added on the Create Application modal, and it is a reference field from the respective subrecipient organization profile. - Not for Profit: Yes
  |Verify that the 'Not For Profit' field is added after the SAM Expiration Date field in the Information section under the Overview tab on the Application layout and that it is read-only. - Not For Profit: Yes|
  |Verify that the Indirect Rate (%) populates the value as per the related announcement or the subrecipient organization if the Not For Profit flag is set to 'Yes' on the respective Subrecipient Organization layout.|
    And I save the field labeled "Not For Profit" as "NotForProfit"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    Then I softly see default value "Yes" for the field "NYSED_NotForProfit__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    #546122
    Then I softly see that "Not For Profit" rendered in view mode only
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #546122
    Then I softly see field "Not For Profit" as "{SavedValue:NotForProfit}"
    When I navigate to "Budget" sub tab
    #539365
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 10         | 10             |
    And I refresh the page
    And I wait for "3" seconds
    #539365
    Then I softly see field "Maximum Indirect Allowed" as "$50"

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |
#      | GRANTEE_CE | {SavedValue:Automation Runtime Announcement Application} |

  @NYSED-2225 @NYSEDSprint-26 @US-NYSED-2112 @M05
  Scenario Outline:Verify that the Grantee user is stopped from creating an application when attempting to exceed the value specified in the “Maximum # Applications Allowed” field. - Competitive type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_MAXIMUM_APPLICATION_ALLOWED_1"
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
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID1"
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
    #NYSED-2225
    Then I softly see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are 1. |
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    #NYSED-2225
    Then I softly see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for this child organization. Maximum # Applications Allowed for this opportunity are 1. |

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |

  @NYSED-3532 @NYSEDSprint-26 @US-NYSED-2112 @M05
  Scenario Outline:Verify that the Grantee user is able to create and submit multiple applications for 'Self' and 'On Behalf Of' when the ‘Is Parent Organization' is set to 'Yes', and 'Maximum # Applications Allowed’ is set to blank at the opportunity. - Directed type
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
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
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
    And I enter value "Self" into field "NYSED_CreatingFor__c"
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
    And I enter value "Self" into field "NYSED_CreatingFor__c"
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
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID3"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
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
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID2"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    #NYSED-3532
    Then I softly cannot see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are <Maximum # Applications Allowed number>. |
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID4"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
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
    #NYSED-3532
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    #NYSED-3532
    Then I softly cannot see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are <Maximum # Applications Allowed number>. |
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID3"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
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
    #NYSED-3532
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @NYSED-3530 @NYSEDSprint-26 @US-NYSED-2112 @M05
    @NYSED-2223 @NYSED-2081 @NYSEDSprint-26 @US-NYSED-1847 @M05
  Scenario Outline:Verify that the Grantee user is able to create and submit multiple applications for 'Self' and 'On Behalf Of' when the ‘Is Parent Organization' is set to 'Yes', and 'Maximum # Applications Allowed’ is set to blank at the opportunity. - Competitive type
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I pause execution for "3" seconds
    And I clear the value from field "MaxApplicationsAllowed__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I pause execution for "3" seconds
    When I click on "Update Details" in the page details
    When I enter in modal value "1" into field "Bud_Stop__c"
    When I enter in modal value "20" into field "Pay_Stop__c"
    When I click modal button "Save"
    And I click modal button "Close"
    When I navigate to "Financials" sub tab
    And I pause execution for "3" seconds
    And I click on "Edit" in the page details
    And I pause execution for "3" seconds
    And I enter value "Restricted" into field "Indirect_Rate_Type__c"
    And I enter value "Justified" into field "Justification__c"
    Then I softly see fields "Indirect_Rate__c" is in edit mode
    And I enter value "100" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
    And I wait for "3" seconds
    When I get the "EGMS ID"
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
    And I wait for "2" seconds
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
    And I wait for "3" seconds
    #NYSED-2081
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. If blank, any number of applications can be submitted." shown as help text
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    #NYSED-2081
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. If blank, any number of applications can be submitted." shown as help text
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
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
    #NYSED-2081
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. If blank, any number of applications can be submitted." shown as help text
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
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
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID3"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
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
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID2"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    #NYSED-3530
    Then I softly cannot see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are <Maximum # Applications Allowed number>. |
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID4"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #NYSED-3530 #NYSED-2223
    Then I softly see field "Status" as "Submitted to Grantor"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    #NYSED-3530
    Then I softly cannot see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are <Maximum # Applications Allowed number>. |
    And I wait for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildOrg1AppEGMSID3"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #NYSED-3530 #NYSED-2223
    Then I softly see field "Status" as "Submitted to Grantor"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |