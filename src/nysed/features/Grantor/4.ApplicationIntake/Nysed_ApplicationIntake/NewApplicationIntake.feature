@applicationIntakeNysed @applicationIntake2
Feature: Validate all scenarios in the Application Intake

  @NYSED-5132 @NYSEDSprint-29 @US-2897 @M05 @YugaC
  Scenario: Verify that the Grantee User can see the updated confirmation message upon clicking the ‘Submit Application’ button on the application layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
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
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Equipment     | 1000   | 100        | 100            |
    When I click on "Submit Application" in the page details without processing
    Then I softly see confirmation box with body "Verify the accuracy of all budget‑related information. Once the application is submitted, budget revisions will not be permitted until allowed by the Grantor. Click ‘Ok’ to confirm or ‘Cancel’ to review your entries." is displayed

  @NYSED-5113 @NYSED-5116 @NYSEDSprint-29 @US-4871 @M05 @YugaC
  Scenario Outline: Verify that when the Grantee User clicks on ‘Create Application’ and the ‘Is Parent Organization’ flag on the organization profile is set to ‘Yes’, the following changes are reflected in the ‘Child Organization’ field.
  |Verify that on the application layout, the Grantee User cannot view the EIN field, and the Vendor ID field is displayed after the UEI field with the correct read-only value- Child Organization Application Created|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Given I navigate to "Overview" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    When I click on "Create Application" in the page details
    And I wait for "4" seconds
    #NYSED-5113
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" inside loookup from field "NYSED_ChildOrganization__c"
    Then I see "lookup-dropdown" table contains "No Records Found"
    And I click modal button "Close"
    And I click "OK" on modal confirmation box
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly see field "Child Organization" as "Automation Permanent Child Organization"
    #NYSED-5116
    Then I softly do not see field "EIN" inside "Information" section
    Then I softly see field "UEI" inside "Information" section
    Then I softly see field "Vendor ID" inside "Information" section
    Then I softly see field "Vendor ID" is not editable

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-5114 @NYSEDSprint-29 @US-4871 @M05 @YugaC
  Scenario Outline: Verify that on the application layout, the Grantee User cannot view the EIN field, and the Vendor ID field is displayed after the UEI field with the correct read-only value.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    Given I navigate to "Overview" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Qualified"
    Given I navigate to "Overview" sub tab
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly do not see field "EIN" inside "Information" section
    Then I softly see field "UEI" inside "Information" section
    Then I softly see field "Vendor ID" is not editable

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |

  @NYSED-7203 @NYSEDSprint-32 @US-NYSED-6293 @M05
  Scenario: Verify that Guest user sees 'Indirect Rate Type' field is hidden with 'Not allowed' value when Budget type is 'Lump Sum' on Opportunity layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_COMPETITIVE_DIRECTED"
    Given I am on "SUBPORTAL" portal
    And I wait for "2" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Competitive Announcement}" in "---announcement:-:publishAnnouncementTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Competitive Announcement}" inside flex table with id "---announcement:-:publishAnnouncementTableId---"
    And I wait for "2" seconds
    Then I softly cannot see field "Indirect Rate Type" inside page block
    Then I softly cannot see field "Maximum Indirect Rate %" inside page block
    Then I see below fields in "Financial Details" page block
      | Subaward Ceiling | Subaward Floor |

  @NYSED-7211 @NYSEDSprint-32 @US-NYSED-6293 @M05
  Scenario Outline: Verify that the Grantee user sees the 'First Payment %' field is shown after the 'Advance Payment Allowed?' field with updated help text on the Opportunity layout when the 'Advance Payment Allowed?’ is set to 'Yes' on the announcement.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I see below fields in "Opportunity Specific Settings" page block
      | Subrecipient Match Required? | Subrecipient Match (%) | Focus Area Required? | Allocation Level | Objectives Required? | KPI's Required? | Risk Assessment Required? | Advance Payment Allowed? | First Payment % | Revisions Allowed? |
    Then I softly see field "First Payment %" as "12.60%"
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    Then I softly see "The percentage of the approved budget that will be forwarded to the agency as a first payment. Applicable only for eligible organizations." shown as help text
    And I wait for "2" seconds
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    Then I softly see field "First Payment %" as "12.60%"
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    Then I softly see "The percentage of the approved budget that will be forwarded to the agency as a first payment. Applicable only for eligible organizations." shown as help text
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I navigate to "Opportunities" tab
    And I wait for "10" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    Then I softly see field "First Payment %" as "12.60%"
    When I hovering mouse on help text icon inside page block detail "First Payment %"
    Then I softly see "The percentage of the approved budget that will be forwarded to the agency as a first payment. Applicable only for eligible organizations." shown as help text

    Examples:
      | ExternalUser | Announcement Name                                        |
      | GRANTEE_SC   | {SavedValue:Automation Runtime Competitive Announcement} |

  @NYSED-7213 @NYSED-7214 @NYSEDSprint-32 @US-NYSED-6293 @M05 @Bug-NYSED-8871
  Scenario Outline: Verify that the Grantee user cannot see the 'First Payment %' field after the 'Advance Payment Allowed?' field on the Opportunity layout when the 'Advance Payment Allowed?’ is set to 'No' on the announcement.
  |Verify that the Grantee user sees that on the ‘Qualified’ and ‘Converted to Application’ Opportunity layout → Overview tab → Focus Areas section, Organization Name column is hidden.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Competitive Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_COMPETITIVE_DIRECTED"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-7213
    Then I softly cannot see field "First Payment %" inside page block
    Then I see below fields in "Opportunity Specific Settings" page block
      | Subrecipient Match Required? | Subrecipient Match (%) | Focus Area Required? | Objectives Required? | KPI's Required? | Risk Assessment Required? | Advance Payment Allowed? | Revisions Allowed? |
    #NYSED-7214
    Then I see only the following headers in table with id "---applicationIntake:-:FocusAreasTableId---" :
      | Actions | EGMS ID | Title | Year Created |
    When I click on "Qualify" in the page details
    And I wait for "8" seconds
    #NYSED-7213
    Then I softly cannot see field "First Payment %" inside page block
    #NYSED-7214
    Then I see only the following headers in table with id "---applicationIntake:-:SubreceipentFocusAreasTableId---" :
      | Actions | EGMS ID | Title | Year Created |
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "4" seconds
    And I navigate to "Opportunities" tab
    And I wait for "10" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I wait for "2" seconds
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #NYSED-7213
    Then I softly cannot see field "First Payment %" inside page block
    #NYSED-7214
    Then I see only the following headers in table with id "---applicationIntake:-:SubreceipentFocusAreasTableId---" :
      | Actions | EGMS ID | Title | Year Created |
    Examples:
      | ExternalUser | Announcement Name                                        |
      | GRANTEE_SC   | {SavedValue:Automation Runtime Competitive Announcement} |

  @NYSED-8771 @NYSED-8773 @NYSED-Sprint-32 @US-NYSED-8208 @M05
  Scenario Outline:Verify that Internal (All Profile) User see columns are updated as per below sequence on Applications phase → Applications list view Table
  |Verify that Internal (All Profile) User see columns are updated as per below sequence on Applications phase --> Reviews left module -->Application Reviews list view|
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I pause execution for "3" seconds
    #NYSED-8771
    Then I softly see "Actions" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "EGMS ID" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Application Title" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Institution ID" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Organization Name" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Creating For" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Child Organization" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Announcement Fund Year" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Announcement Title" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Application Due Date" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Submitted On" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    Then I softly see "Status" in flex table header "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    #NYSED-8773
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I pause execution for "3" seconds
    Then I see only the following headers in table with id "---applicationIntake:-:ApplicationReviewsTableId---" :
      | Actions | EGMS ID | Announcement Fund Year | Announcement Title | Application Due Date | # Applications Received | # Applications Review Completed | # Applications Rejected | # Applications Pending Review | Review Status |
    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | EXE      |
#      | FO       |
#      | FD       |

  @NYSED-8772 @NYSED-Sprint-32 @US-NYSED-8208 @M05
  Scenario Outline: Verify that External (All Profile) User see columns are updated as per below sequence on Applications phase → Applications list view Table
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<ExternalUser>" user
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I pause execution for "3" seconds
    Then I see only the following headers in table with id "---applicationIntake:-:recipientApplications---" :
      | Actions | EGMS ID | Application Title | Creating For | Child Organization | Announcement Fund Year | Announcement Title | Funding Organization | Application Due Date | Submitted On | Owner | Status |
    Examples:
      | ExternalUser |
      | GRANTEE_SC   |
#      | GRANTEE_LEA  |
#      | GRANTEE_VO |

  @545641 @NYSEDSprint-19 @US-544809 @M05
  Scenario Outline:Verify that the 'Submit and Certify' user see the validation message after clicking the Submit to Grantor button when the Requested Indirect Amount is greater than the Maximum Indirect Allowed at focus area level. - Formula By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "SECOND_FOCUS_AREA"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I wait for "2" seconds
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I perform quick search for "{SavedValue:SubrecipientOrg}" in "---announcement:-:formulaAddInviteApplicantTableId---" panel
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "3" seconds
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                                | Allocation Amount |
      | {SavedValue:AutomationPermanentFocusArea} | 500               |
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                                 | Allocation Amount |
      | {SavedValue:AutomationPermanentFocusArea2} | 500               |
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
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
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
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "3" seconds
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
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
    And I wait for "3" seconds
    When I navigate to "Pending Tasks" content inside "Application Tasks" subheader on left panel
    And I wait for "3" seconds
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:phasePendingTasksTableId---" panel
    Then I see the following rows under the following headers in table with id "---negotiation:-:phasePendingTasksTableId---" :
      | Actions     | EGMS ID             | Task Type        | Subject                                                                                 | Due Date Only        | Status      |
      | Action menu | {SavedValue:EGMSID} | Revision Request | Revise Application #{SavedValue:EGMSID} for Funding Opportunity #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:phasePendingTasksTableId---"
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
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 1500   | 100        | 100            |
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    When I click on "Submit to Grantor" in the page details
    #545641
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @543149 @543138 @NYSEDSprint-17 @US-540528 @US-538768 @M05
  Scenario Outline:Verify that the grantee user can create applications equal to the 'Maximum # Applications Allowed' at the related competitive opportunity when the 'Is Parent Organization' flag on the organization profile is set to 'No'.
    When I login to "As a Grantor" app as "ADMIN" user
    And I navigate to "Home" tab
    When I navigate to "Approved Subrecipient Organizations" content inside "Organization" subheader on left panel
    When I perform quick search for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" in "ActiveAccount" panel
    And I click on "View" icon for "---AUTOEnvData:-:ExternalOrgWithoutInstitutionIDOrg---" inside table
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "5" seconds
    And I enter value "No" into field "NYSED_IsParentOrganization__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter value "2029" into field "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
    And I enter value "22.99" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:AutomationPermanentChildOrganization1}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                         | Allocation Amount |
      | {SavedValue:AutomationPermanentChildOrganization1} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
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
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "dark blue"
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
    #543138
    Then I softly see field "Application Title" inside page block
    Then I softly see field "Not For Profit" inside page block
    #543149 #543138
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    #543149 #543138
    Then I softly cannot see field "Creating For" inside page block
    Then I softly cannot see field "Child Organization" inside page block

    Examples:
      | UserType           | Announcement Name                            |
      | CHILD_EXTERNAL_SC1 | {SavedValue:Automation Runtime Announcement} |

  @543140 @543136 @543151 @543148 @544580 @NYSEDSprint-17 @US-538768 @US-538768 @NYSEDSprint-18 @US-543510 @M05
  Scenario Outline:Verify that the Grantee user see on the Create Application modal, 'Creating for' field is added if the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
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
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
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
    #543140
    Then I softly see the following messages in the page details contains:
      | To save, Creating For is required. |
    Then I see only the following ordered options in dropdown field "NYSED_CreatingFor__c" :
      | --None-- | Self | On behalf of |
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    #543140
    Then I softly cannot see field "Child Organization" inside page block
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
     #543140
    Then I softly see field "Child Organization" inside page block
    #543136
    Then I softly see field "Creating For" added after "Application Title"
    Then I softly see field "Child Organization" added after "Creating For"
    Then I softly see field "Not For Profit" added after "Child Organization"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    #543148
    Then I softly see that "Applicant Organization" rendered in view mode only
    Then I softly see that "Creating For" rendered in view mode only
    Then I softly see that "Child Organization" rendered in view mode only
    Then I softly see that "Not For Profit" rendered in view mode only
    Then I softly see that "Address" rendered in view mode only
    Then I softly see that "UEI" rendered in view mode only
    Then I softly see that "SAM Expiration Date" rendered in view mode only
    When I click on "Save" in the page details
    #543136
    Then I softly see field "Not For Profit" as "Yes"
    #543148
    Then I softly see field "Applicant Organization" as "{SavedValue:SubrecipientOrg}"
    Then I softly see field "Creating For" as "On behalf of"
    Then I softly see field "Child Organization" as "{SavedValue:AutomationPermanentChildOrganization}"
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "UEI" as "{SavedValue:UEIAutomationPermanentNysedSchoolOrg}"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                          | Project Role   | Is Key Contact |
      | Automation Grantee_CreateEdit | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Budget" sub tab
    And I wait for "2" seconds
    #543151
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    And I refresh the page
    And I wait for "3" seconds
    #543151
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Maximum Indirect Allowed" as "$100"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Total Budgeted Amount" as "$1,000"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    #544580
    Then I softly see field "Applicant Organization" as "{SavedValue:SubrecipientOrg}"
    Then I softly see field "Creating For" as "On behalf of"
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Child Organization" as "{SavedValue:AutomationPermanentChildOrganization}"
    Then I softly see field "Address" inside page block
    Then I softly see field "UEI" inside page block
    Then I softly see field "SAM Expiration Date" inside page block

    Examples:
      | UserType   |
      | GRANTEE_CE |
#      | GRANTEE_SC |

  @543150 @NYSEDSprint-17 @US-538768 @M05
  Scenario Outline:Verify that the Indirect Rate (%) populates as 0% if the Not For Profit flag is set to 'No' on the respective Parent Subrecipient Organization layout and the parent organization's indirect cost rate will be applicable to child organizations application.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "ANOTHER_ORG_NOTFORPROFIT_NO_BAFA"
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
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization1}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    #543150
    Then I softly see field "Not For Profit" as "No"
    When I navigate to "Budget" sub tab
    #543150
    Then I softly see field "Indirect Rate (%)" as "0.00%"

    Examples:
      | UserType    |
      | EXTERNAL_SC |
#      | EXTERNAL_CE |

  @543053 @NYSEDSprint-17 @US-540528 @M05
  Scenario Outline:Verify that the grantee user cannot create more applications than the 'Maximum # Applications Allowed' at the related formula opportunity for self when the 'Is Parent Organization' flag on the organization profile is set to 'Yes'.
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
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULABAFA_FS10_MAXIMUM_APPLICATION_ALLOWED_1"
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
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    And I navigate to "Opportunities" tab
    And I wait for "5" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    #543053
    Then I softly see the following messages in the page details contains:
      | The maximum number of Applications have already been created for {SavedValue:AnnEGMSID} for parent organization. Maximum # Applications Allowed for this opportunity are 1. |

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |
#      | GRANTEE_CE | {SavedValue:Automation Runtime Announcement Application} |

  @545626 @545619 @545638 @545644 @545635 @NYSEDSprint-19 @US-544809 @M05
  Scenario Outline:Verify that the grantee users see the following validation related to Key Contact works as per OOTB behavior.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ParentAppEGMSID1"
    Then I softly see field "Status" as "Created"
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #545626
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                  |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.        |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application. |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                   |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.             |
      | Overview Tab - Provide Target Values for all Key Performance Indicators.                       |
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    #545619
    Then I softly see value "" for title "Project Role" inside table "---applicationIntake:-:applicationContactsTableId---"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
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
    #545635
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$50"
    Then I softly see field "Budgeted Direct Amount" as "$500"
    Then I softly see field "Requested Indirect Amount" as "$500"
    Then I softly see field "Total Budgeted Amount" as "$1,000"
    Then I softly see value "$1,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$50" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$500" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "Submit Application" in the page details
    #532226
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Budget" sub tab
    #545644
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
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see top right button "Edit" in page detail
    And I wait for "2" seconds
    #545634
    Then I softly see that "Allocation Amount" rendered in view mode only
    Then I softly see that "Indirect Rate (%)" rendered in view mode only
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only
    Then I softly see that "Budgeted Direct Amount" rendered in view mode only
    Then I softly see that "Total Budgeted Amount" rendered in view mode only
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 600    | 100        | 100            |
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Budget | Cash Match | Non-Cash Match |
      | Indirect Cost   | 0      | 0          | 0              |
    And I refresh the page
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                                |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                  |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                        |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                 |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                   |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                             |
      | Overview Tab - Provide Target Values for all Key Performance Indicators.                                       |
      | Forms and Files Tab - Complete each mandatory item listed in the checklist before submitting this Application. |

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |

  @545634 @NYSEDSprint-19 @US-544809 @M05
  Scenario:Verify that grantee users see that for application related to formula (BA) announcement where Focus area is set to 'Yes', detailed budget required is Yes and budget type is 'FS-10', the indirect cost related calculation takes place at focus area level.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILE_BUDGET_YES"
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
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 900        | 0              |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Title       | 2000                 | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | Automation Grantee_SubmitCertify | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I navigate to "Budget" sub tab
    #545634
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$100"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$2,000"
    Then I softly see field "Total Budgeted Amount" as "$3,000"
    Then I softly see value "$3,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$100" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$1,000" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$2,000" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    #545634
    Then I softly see that "Allocation Amount" rendered in view mode only
    Then I softly see that "Indirect Rate (%)" rendered in view mode only
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only
    Then I softly see that "Budgeted Direct Amount" rendered in view mode only
    Then I softly see that "Total Budgeted Amount" rendered in view mode only

  @545632 @545643 @545640 @545637 @544582 @NYSEDSprint-19 @US-544809 @NYSEDSprint-18 @US-543510 @M05
  Scenario Outline:Verify that grantee users see that for application related to directed announcement where Focus area is set to 'Yes', detailed budget required is Yes and budget type is 'FS-10', the indirect cost related calculation takes place at focus area level.
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
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTED_COMPETATIVE_DETAILE_BUDGET_YES"
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
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AppID"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 900        | 0              |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Title       | 2000                 | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I wait for "3" seconds
    #545632
    Then I softly see field "Subaward Floor" as "$1,000"
    Then I softly see field "Subaward Ceiling" as "$10,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$100"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$2,000"
    Then I softly see field "Total Budgeted Amount" as "$3,000"
    Then I softly see value "$3,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$100" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$1,000" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$2,000" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    And I pause execution for "2" seconds
    When I click on "Submit Application" in the page details
    #545637
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    #545632
    Then I softly see that "Indirect Rate (%)" rendered in view mode only
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only
    Then I softly see that "Budgeted Direct Amount" rendered in view mode only
    Then I softly see that "Total Budgeted Amount" rendered in view mode only
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:appAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Budget" sub tab
    #545643
    Then I softly see field "Subaward Floor" as "$1,000"
    Then I softly see field "Subaward Ceiling" as "$10,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$100"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$2,000"
    Then I softly see field "Total Budgeted Amount" as "$3,000"
    Then I softly see value "$3,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$100" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$1,000" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$2,000" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Title" inside flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    When I navigate to "Overview" sub tab
    And I wait for "5" seconds
    #544582
    Then I softly see field "Applicant Organization" as "{SavedValue:SubrecipientOrg}"
    Then I softly see field "Creating For" as "Self"
    Then I softly see field "Not For Profit" as "Yes"
    Then I softly see field "Address" inside page block
    Then I softly see field "UEI" inside page block
    Then I softly see field "SAM Expiration Date" inside page block
    Then I softly cannot see field "Child Organization" inside page block
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
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
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
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
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Title       | 2000                 | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545640
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @545630 @545642 @545639 @490638 @sprint-01 @US-490341 @NYSEDSprint-19 @US-544809 @M05
    @490640 @US-490341 @sprint-01
  Scenario Outline:Verify that grantee users see that for application related to competitive announcement where Focus area is set to 'Yes', detailed budget required is Yes and budget type is 'FS-10', the indirect cost related calculation takes place at focus area level.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTED_COMPETATIVE_DETAILE_BUDGET_YES"
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
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    And I save the field labeled "EGMS ID" as "AppID"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 1000             | 900        | 0              |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Title       | 2000                 | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I wait for "3" seconds
    #545630
    Then I softly see field "Subaward Floor" as "$1,000"
    Then I softly see field "Subaward Ceiling" as "$10,000"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$100"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$2,000"
    Then I softly see field "Total Budgeted Amount" as "$3,000"
    Then I softly see value "$3,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$100" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$1,000" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$2,000" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "Edit" in the page details
    And I wait for "2" seconds
    #545630
    Then I softly see that "Indirect Rate (%)" rendered in view mode only
    Then I softly see that "Maximum Indirect Allowed" rendered in view mode only
    Then I softly see that "Budgeted Direct Amount" rendered in view mode only
    Then I softly see that "Total Budgeted Amount" rendered in view mode only
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Title                   | 10             | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Title" inside flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I pause execution for "2" seconds
    And I wait for "2" seconds
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Budget" sub tab
    #545642
    Then I softly see field "Subaward Floor" as "$1,000"
    Then I softly see field "Subaward Ceiling" as "$10,000"
    Then I softly see field "Indirect Rate (%)" as "20.88%"
    Then I softly see field "Maximum Indirect Allowed" as "$208"
    Then I softly see field "Budgeted Direct Amount" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$2,000"
    Then I softly see field "Total Budgeted Amount" as "$3,000"
    Then I softly see value "$3,000" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$208" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$1,000" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$2,000" for title "Requested Indirect Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:AutomationPermanentFocusArea}" in flex table with id "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "5" seconds
    And I navigate to "Related Log" sub tab
    And I wait for "5" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "EGMSID"
    #490640
    Then I softly can see top right dropdown button "Back to Current Review Step" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "ANNEGMSID"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Program Office Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "3" seconds
    When I click on "Request Revision" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationReview:-:applicationAssignTableId---"
    And I wait for "15" seconds
    And I switch to tab number "2"
    And I wait for "15" seconds
    When I enter value "7" into field "NegotiationDueDate__c"
    When I enter value "Budget Tab: Budget Details" into field "ApplicationSectionsForRevision__c"
    When I enter value "Automation Details" into field "ExplanationOfRevisionsNeeded__c"
    When I click on "Save" in the page details
    #492200
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Cancel Revision" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    Then I softly can see top right dropdown button "Back to Current Review Step" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit to Grantor" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail
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
    And I click on "View/Add Line Item Details" icon for "Indirect Cost" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:IndirectCostLineItemDetailsDetailTableID---" by clicking "New" :
      | Description | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Title       | 2000                 | 100        | 100            |
    And I click modal button "Close"
    And I pause execution for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #545639
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The Requested Indirect Amount must be less than or equal to the Maximum Indirect Allowed amount for Automation Permanent Focus Area. |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE |

  @544070 @544072 @537882 @539302 @537884 @537885 @NYSEDSprint-17 @US-540530 @NYSEDSprint-14 @US-536498 @M05
  Scenario Outline:Verify that a validation message is displayed when I click on the 'Submit Application' button, and combined budgeted amount of my application and other applications linked to same formula opportunity exceeds opportunity’s allocation amount - Formula BAFA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULABAFA_FS10_MAXIMUM_APPLICATION_ALLOWED_1"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
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
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
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
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 700    | 100        | 100            |
    When I click on "Submit Application" in the page details
    And I wait for "7" seconds
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Cancel Revision" in page detail
    Then I softly can see top right button "Send to Subrecipient" in page detail
    When I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    Then I softly see field "Revisions Request Status" as "Sent to Subrecipient"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
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
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 700    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #544072
    Then I softly see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 500    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit to Grantor" in the page details
    #544072
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |
    Then I softly see field "Status" as "Revision Submitted"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    #537882
    Then I see the following rows under the following headers in table with id "---applicationReview:-:pendingTaskTableId---" :
      | Actions     | EGMS ID                      | Priority | Task Type       | Subject                                                                                           | Due Date Only        | Status      |
      | Action menu | {SavedValue:ChildAppEGMSID1} | Low      | Review Revision | Review Revised Application #{SavedValue:ChildAppEGMSID1} for Announcement #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | Not Started |
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    #539302
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    #537884
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ChildAppEGMSID1}" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I wait for "2" seconds
    When I click on "Complete Revision" in the page details
    And I wait for "2" seconds
    When I navigate to "Revisions" sub tab
    Then I softly see field "Revisions Request Status" as "Complete"
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationReview:-:pendingTaskTableId---" panel
    #537885
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    And I navigate to "Applications" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:ChildAppEGMSID1}" in "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" panel
    #537885
    Then I see the following rows under the following headers in table with id "---applicationReview:-:PhaseRespectivecompletedTaskTableId---" :
      | Actions     | EGMS ID                      | Priority | Task Type       | Subject                                                                                           | Due Date             | Completed Date  | Status    |
      | Action menu | {SavedValue:ChildAppEGMSID1} | Low      | Review Revision | Review Revised Application #{SavedValue:ChildAppEGMSID1} for Announcement #{SavedValue:ANNEGMSID} | {Date:M/d/yyyy::d+7} | {Date:M/d/uuuu} | Completed |

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |

  @544071 @NYSEDSprint-17 @US-540530
  Scenario Outline:Verify that a validation message is not displayed when combined budgeted amount of my application and other applications which are created or Not Awarded and linked to the same formula opportunity exceeds opportunity’s allocation amount. - Formula BAFA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "FORMULABAFA_FS10_MAXIMUM_APPLICATION_ALLOWED_1"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
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
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
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
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 600    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "Initiate Review Process" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I wait for "4" seconds
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
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
    When I check "<Announcement Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Reject" in flex table with id "---applicationReview:-:appTableId---"
    And I pause execution for "2" seconds
    Then I softly see value "Rejected" for title "Decision Status" inside table "---applicationReview:-:appTableId---"
    When I click on "Notify" in the page details
    And I pause execution for "2" seconds
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Not Awarded"
    When I re-login to "Grants Portal" app as "GRANTEE_SC" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID1"
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
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 200    | 100        | 100            |
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "9" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "ChildAppEGMSID2"
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
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 300    | 100        | 100            |
    And I wait for "2" seconds
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    #544071
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see the following messages in the page details contains:
      | Budget Tab - The total budgeted amount across applications exceeds the allocation limit for this opportunity. |

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |

  @545719 @NYSEDSprint-19 @US-544005
  Scenario Outline: Verify that the grantee users see that the Instructional Text in Budget Periods section is added on the Application layout.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_APPLICANT"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "<Announcement Name>" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
      #545719
    Then I softly see the text containing "Equipment Budget:"
    Then I softly see the text containing " Each line item under the Equipment category must have a minimum value of $10,000. Please ensure your entries meet this threshold before submission."
    Then I softly see the text containing "Employee Benefits:"
    Then I softly see the text containing " This category is not allowed unless staff salaries have been added. To include benefits, first enter corresponding salary details."

    Examples:
      | UserType   | Announcement Name                                        |
      | GRANTEE_SC | {SavedValue:Automation Runtime Announcement Application} |
#        | GRANTEE_CE | {SavedValue:Automation Runtime Announcement Application} |
#        | GRANTEE_LEA | {SavedValue:Automation Runtime Announcement Application} |
#        | GRANTEE_VO | {SavedValue:Automation Runtime Announcement Application} |

  @546048 @NYSEDSprint-19 @US-541234 @M04
  Scenario Outline:Verify with Grantee user (Subrecipient side) unable to see Review menu in application phase on left navigator.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Applications" tab
    Then I softly do not see "Reviwes" content inside "Applications" subheader on left panel

    Examples:
      | UserType    |
      | GRANTEE_SC  |
      | GRANTEE_CE  |
      | GRANTEE_LEA |
      | GRANTEE_VO  |

  @546051 @NYSEDSprint-19 @US-541234 @M04
  Scenario Outline:Verify with internal profile able to see Review menu in application phase on left navigator.
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Applications" tab
    And I wait for "4" seconds
    Then I softly see "Reviews" content inside "Application Reviews" subheader on left panel

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FD       |
      | FO       |
      | EXE      |

  @NYSED-2798 @NYSED-2797 @NYSED-2796 @NYSEDSprint-25 @US-NYSED-1854 @M05 @BugTicket-NYSED-4927
  Scenario Outline: Verify that the grantee user see Supplies and Materials, Application Budget Categories modal, having a 'Calculated Proposed Expenditure' column (Not-Editable, Formula Field)
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
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | 200                                                      | 2.12     | 100       | 100             | 1000                 | 100        | 100            |
    #NYSED-2798
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.12" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$312" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Quantity | Unit Cost | Additional Cost |
      | Description of Item         | 2.13     | 200       | 200             |
    #NYSED-2798
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.13" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$626" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item1        | 200                                                      | 2.12     | 100       | -100            | 1000                 | 100        | 100            |
    And I wait for "2" seconds
    #NYSED-2797
    Then I softly see the following messages in the page details :
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item1        | 200                                                      | 2.12     | 100       |                 | 1000                 | 100        | 100            |
    #NYSED-2797
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.12" for title "Quantity" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "" for title "Additional Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$212" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item1" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Additional Cost |
      | Description of Item1        | eee             |
    #NYSED-2797
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.12" for title "Quantity" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "" for title "Additional Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$212" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item1" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Additional Cost |
      | Description of Item1        | 21.2            |
    #NYSED-2797
    Then I softly see value "200" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.12" for title "Quantity" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$212" for title "Additional Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$424" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item1" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item1" for title "Description of Item/Service" against the value "200" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I click on "Delete" icon for "Description of Item1" inside flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Supplies and Materials" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) | Quantity | Unit Cost | Additional Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         |                                                          | 2.12     | 100       | 100             | 1000                 | 100        | 100            |
    #NYSED-2796
    Then I softly see value "" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.12" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$312" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "2.12" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description of Item         | {SavedValue:Char256}                                     |
    #NNYSED-2796
    Then I softly see value "{SavedValue:Char255}" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "2.12" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$312" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "$1,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item/Service" against the value "2.12" inside table "---applicationIntake:-:SuppliesAndMaterialsCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2930 @NYSED-2932 @NYSED-2934 @NYSED-2935 @NYSED-2869 @NYSEDSprint-25 @US-NYSED-1854 @US-NYSED-1859 @M05 @Bug-Ticket-NYSED-4111
  Scenario Outline: Verify that the grantee user sees the Equipment, Application Budget Categories modal, which includes a 'Calculated Proposed Expenditure' column (Formula field, Read-only, and Output should be a whole number).
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
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    And I wait for "2" seconds
    Then I softly see the text containing "Budget Category : Equipment"
    Then I softly can see "20 - Equipment" sub tab at view detail page
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item | test   | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    #NYSED-2930
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
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item | Quantity | Unit Cost | Additional Cost |
      | Description of Item | 3        | 200       | 200             |
    #NYSED-2930
    Then I softly see value "3.00" for title "Quantity" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Unit Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Additional Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$800" for title "Calculated Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item" for title "Description of Item" against the value "$200" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item |        | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    #NYSED-2932
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item  | Vendor               | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item1 | {SavedValue:Char256} | 2        | 100       | 100             | calclation                                               | 10000                | 100        | 100            |
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "{SavedValue:Char255}" for title "Vendor" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item1" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item  | Vendor  |
      | Description of Item1 | testing |
    #NYSED-2932
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "testing" for title "Vendor" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Additional Cost" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$300" for title "Calculated Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item1" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item1" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    When I click on "Delete" icon for "Description of Item1" inside flex table with id "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see the following messages in the page details contains:
      | Record deleted successfully. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item  | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item2 | test   | 2        | 100       | -100            | calclation                                               | 10000                | 100        | 100            |
    #NYSED-2934
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Equipment" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "New" :
      | Description of Item  | Vendor | Quantity | Unit Cost | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item2 | test   | 2        | 100       |                 | calclation                                               | 10000                | 100        | 100            |
    #NYSED-2934 #NYSED-2935
    Then I softly cannot see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "" for title "Additional Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Calculated Proposed Expenditure" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item2" for title "Description of Item" against the value "calclation" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item  | Additional Cost |
      | Description of Item2 | ee              |
    #NYSED-2934
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "" for title "Additional Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "calclation" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Calculated Proposed Expenditure" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item2" for title "Description of Item" against the value "$200" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:EquipmentCategoryTableId---" by clicking "Edit" :
      | Description of Item  | Additional Cost | Calculation of Cost (if other than Quantity * Unit Cost) |
      | Description of Item2 | 10.00           | {SavedValue:Char256}                                     |
    #NYSED-2934 #NYSED-2935
    Then I softly see value "2.00" for title "Quantity" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "test" for title "Vendor" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Unit Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$1,000" for title "Additional Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "{SavedValue:Char255}" for title "Calculation of Cost (if other than Quantity * Unit Cost)" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$1,200" for title "Calculated Proposed Expenditure" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,000" for title "Proposed Expenditure" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Cash Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$100" for title "Non-Cash Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$200" for title "Total Match" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "$10,200" for title "Total Project Cost" against the value "Description of Item2" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    Then I softly see value "Description of Item2" for title "Description of Item" against the value "$200" inside table "---applicationIntake:-:EquipmentCategoryTableId---"
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         |                            | Calculation         | 88.988               | 88.988     | 88.988         |
    #NYSED-2869
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Minor Remodeling" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "New" :
      | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description                         | Provider of Service        | Calculation         | 88.988               | 88.988     | 88.988         |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | Provider of Service        | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" by clicking "Edit" :
      | Description of Work to be Performed | Provider of Service/Vendor |
      | Description                         | {SavedValue:Char255}       |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:MinorRemodelingCategoryTableId---" :
      | Actions     | Description of Work to be Performed | Provider of Service/Vendor | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Description                         | {SavedValue:Char255}       | Calculation         | $88,988              | $88,988    | $88,988        | $177,976    | $266,964           |

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @NYSED-2723 @NYSED-2722 @NYSED-2915 @US-NYSED-1851 @US-NYSED-1852 @M05
  Scenario Outline: Verify that the grantee user see Professional Staff Salaries, Budget Categories modal, having a 'Additional Cost (e.g., Per Diem, Teacher Stipends)' column (Editable, Currency Field without decimal places, Optional and blank for new row)
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
    And I wait for "5" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 88.988                 |                                                    | 1000             | 100        | 100            |
    #NYSED-2723
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                |                                                    | $1,000           | $100       | $100           | $200        | $1,200             |
      |             | Total                   |                | 10.00 | $88,988                | $0                                                 | $1,000           | $100       | $100           | $200        | $1,200             |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Position Title          | ee                                                 |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                |                                                    | $1,000           | $100       | $100           | $200        | $1,200             |
      |             | Total                   |                | 10.00 | $88,988                | $0                                                 | $1,000           | $100       | $100           | $200        | $1,200             |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Position Title          | -88.988                                            |
    #NYSED-2723
    Then I softly see the following messages in the page details contains:
      | Additional Cost cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | Additional Cost (e.g., Per Diem, Teacher Stipends) |
      | Position Title          | 88.988                                             |
    #NYSED-2723
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $88,988                                            | $1,000           | $100       | $100           | $200        | $1,200             |
      |             | Total                   |                | 10.00 | $88,988                | $88,988                                            | $1,000           | $100       | $100           | $200        | $1,200             |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          |                | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    #NYSED-2722
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | ee             | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    #NYSED-2722
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    Then I softly see the text containing "Enter a valid numeric value."
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | -34            | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    #NYSED-2722
    Then I softly see the following messages in the page details contains:
      | # of Positions cannot be negative. |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | ee             | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
    #NYSED-2722
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 88.988         | 10  | 88.988                 | 88.988                                             | 1000             | 100        | 100            |
     #NYSED-2722
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 88,988         | 10.00 | $88,988                | $88,988                                            | $1,000           | $100       | $100           | $200        | $1,200             |
      |             | Total                   |                | 10.00 | $88,988                | $88,988                                            | $1,000           | $100       | $100           | $200        | $1,200             |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          | 10             |
     #NYSED-2722
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 10             | 10.00 | $88,988                | $88,988                                            | $1,000           | $100       | $100           | $200        | $1,200             |
      |             | Total                   |                | 10.00 | $88,988                | $88,988                                            | $1,000           | $100       | $100           | $200        | $1,200             |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          |                | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    #NYSED-2915
    Then I softly see the following messages in the page details contains:
      | Required fields missing |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10.87          | 10  | 10                     | 10                                                 | 1000             | 100        | 100            |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 1,087          | 10.00 | $10                    | $10                                                | $1,000           | $100       | $100           | $200        | $1,200             |
      |             | Total                   |                | 10.00 | $10                    | $10                                                | $1,000           | $100       | $100           | $200        | $1,200             |
    And I edit the following rows inline in flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "Edit" :
      | Specific Position/Title | # of Positions |
      | Position Title          | 20.87          |
    Then I see the following rows under the following headers in table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" :
      | Actions     | Specific Position/Title | # of Positions | FTE   | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match | Total Match | Total Project Cost |
      | Action menu | Position Title          | 2,087          | 10.00 | $10                    | $10                                                | $1,000           | $100       | $100           | $200        | $1,200             |
      |             | Total                   |                | 10.00 | $10                    | $10                                                | $1,000           | $100       | $100           | $200        | $1,200             |
    When I click on "Delete" icon for "Position Title" inside flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
#      | GRANTEE_CE  |

  @2193 @2191 @NYSEDSprint-23 @US-2090 @M05
  Scenario Outline: Verify with the Internal User that applications in states other than "Created" are visible in the application filter for competitive announcements.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTED_COMPETATIVE_DETAILE_BUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID1"
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I wait for "5" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID2"
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    And I wait for "30" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Projected Salary | Cash Match |
      | Title                   | 2              | 1   | 1000                   | 1000             | 900        |
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I wait for "20" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    #2193
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    #2191
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:appAllTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @2190 @NYSEDSprint-23 @US-2090 @M05
  Scenario Outline: Verify with the Internal User that applications in states other than "Created" are visible in the application filter for competitive announcements.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BAAF_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID1"
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I wait for "5" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID2"
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    And I wait for "30" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Projected Salary | Cash Match |
      | Title                   | 2              | 1   | 1000                   | 1000             | 900        |
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I wait for "20" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:appAllTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @2189 @NYSED-2228 @NYSEDSprint-23 @US-2090 @NYSEDSprint-26 @US-NYSED-1847 @M05
  Scenario Outline: Verify with the Internal User that applications created in any state are visible in the application list view filter for Formula - By Applicant announcements.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "BY_FORMULA_BA_DETAILBUDGET_YES"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I wait for "3" seconds
    #NYSED-2228
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. If blank, any number of applications can be submitted." shown as help text
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. If blank, any number of applications can be submitted." shown as help text
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID1"
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I wait for "5" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "3" seconds
    Then I softly do not see asterisk mark on "Maximum # Applications Allowed"
    When I hovering mouse on help text icon inside page block detail "Maximum # Applications Allowed"
    Then I softly see "The maximum number of applications allowed per subrecipient organization against this funding opportunity. If blank, any number of applications can be submitted." shown as help text
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID2"
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationIntake:-:budgetPeriodTableId---"
    And I wait for "2" seconds
    And I wait for "30" seconds
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Projected Salary | Cash Match |
      | Title                   | 2              | 1   | 1000                   | 1000             | 900        |
    And I click modal button "Close"
    When I navigate to "Overview" sub tab
    And I wait for "20" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:appAllTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @2188 @NYSEDSprint-23 @US-2090 @M05
  Scenario Outline: Verify with the Internal User that applications created in any state are visible in the application list view filter for Directed announcements.
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
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID1"
    And I navigate to "Opportunities" tab
    And I wait for "3" seconds
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    And I wait for "5" seconds
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:convertedToApplicationTableID---"
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "On behalf of" into field "NYSED_CreatingFor__c"
    And I wait for "2" seconds
    And I enter value "{SavedValue:AutomationPermanentChildOrganization}" into field "NYSED_ChildOrganization__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "AppID2"
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationIntake:-:budgetPeriodTableId---" by clicking "Edit" :
      | Category Name               | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    And I wait for "20" seconds
    And I edit the following rows inline in flex table with id "---applicationIntake:-:applicationContactsTableId---" by clicking "Edit" :
      | Name                             | Project Role   | Is Key Contact |
      | Automation Grantee_SubmitCertify | Fiscal Contact | Checked        |
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    When I click on "Submit Application" in the page details
    And I wait for "5" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:applicationPhaseTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:applicationPhaseTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Created"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID1}" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - Submitted"
    And I perform quick search for "{SavedValue:AppID1}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "No records found" inside flex table with id "---applicationIntake:-:appAllTableId---"
    When I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:AppID2}" in "---applicationIntake:-:appAllTableId---" panel
    Then I softly see "{SavedValue:AppID2}" inside flex table with id "---applicationIntake:-:appAllTableId---"

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @490638-2 @NYSEDSprint-24 @NYSEDSprint-01 @US-490341 @M05
  Scenario Outline:Verify that grantee user cannot see the New button and Edit & Delete actions on 'Budget Category: 20 - Equipment' modal, if the application is in other than created state
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECTED_COMPETATIVE_DETAILE_BUDGET_YES"
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
    And I pause execution for "5" seconds
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Target |
      | Automation Permanent KPI | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | {SavedValue:GRANTEE_SC Username} | Checked        |
    And I wait for "2" seconds
    And I enter value "Automation Test Description" into field "ProjectAbstract__c"
    When I navigate to "Budget" sub tab
    And I enter value "Automation Test Description" into field "Justification__c"
    #490638
    Then I softly can see top right button "Save" in page detail
    Then I softly can see top right button "Cancel" in page detail
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #490638
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right dropdown button "Submit Application" in page detail
    Then I softly can see top right dropdown button "Download As PDF" in page detail
    Then I softly can see top right dropdown button "Take Snapshot" in page detail

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @NYSED-3500 @NYSED-3496 @NYSEDSprint-26 @US-NYSED-2110 @M05
  Scenario:Verify that the Grantee user sees that all fields present in the budget summary sections are computed properly.
  |Verify that the Grantee user sees that every line item entered against Purchased Services budget category is not considered in the Indirect cost calculation, if the Subcontract? is selected as ‘No’ in the budget line item.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Budget" sub tab
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | 49000                | 100        | 100            |
      | Description of Item1        | Yes             | Provider of Services1 | Calculation of Cost1 | 33000                | 200        | 200            |
      | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | 50000                | 300        | 300            |
      | Description of Item3        | Yes             | Provider of Services3 | Calculation of Cost3 | 24000                | 400        | 400            |
      | Description of Item4        | No              | Provider of Services4 | Calculation of Cost4 | 50000                | 500        | 500            |
      | Description of Item5        | No              | Provider of Services5 | Calculation of Cost5 | 2341                 | 600        | 600            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 7119             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Travel Expenses" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:TravelExpensesCategoryTableId---" by clicking "New" :
      | Position of Traveler | Destination | Purpose | Type (Air, Bus, Train, Mileage) | Calculation of Cost | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Position Title       | Destination | Purpose | Automation Benefits- 1          | Calculation         | 69561                | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Support Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:SupportStaffSalariesCategoryTableId---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 25700            | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Employee Benefits" inside flex table with id "---applicationIntake:-:SubRecipientBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:EmployeeBenefitsCategoryTableId---" by clicking "New" :
      | Benefit              | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Automation Benefit-1 | 5500                 | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3500 #NYSED-3496
    Then I softly see field "Waiver" as "N/A"
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$26,388"
    Then I softly see field "Budgeted Direct Amount" as "$316,221"
    Then I softly see field "Total Budgeted Amount" as "$316,221"
    Then I softly see value "$26,388" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$316,221" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$316,221" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @NYSED-3493 @NYSED-3495 @NYSEDSprint-26 @US-NYSED-2110 @M05 @Bug-Ticket-NYSED-3587
  Scenario:Verify that the Grantee user sees that every line item entered against Purchased Services budget category is considered in the Indirect cost calculation, if the Subcontract? is selected as ‘Yes’ in the budget line item .
  |Verify that the Grantee user sees after editing the Subcontract? field or after deleting the line item in the Purchased Services budget category, is updated in the Indirect cost calculation|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DETAILBUDGET_YES_FORMULA_BA"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "GRANTEE_SC" user
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    When I navigate to "Financials" sub tab
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I navigate to "Budget" sub tab
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Given I expand nested table containing column value "BP01"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "New" :
      | Description of Item/Service | Is Subcontract? | Provider/Vendor       | Calculation of Cost  | Proposed Expenditure | Cash Match | Non-Cash Match |
      | Description of Item         | Yes             | Provider of Services  | Calculation of Cost  | 24000                | 100        | 100            |
      | Description of Item1        | Yes             | Provider of Services1 | Calculation of Cost1 | 2223                 | 200        | 200            |
      | Description of Item2        | Yes             | Provider of Services2 | Calculation of Cost2 | 50000                | 300        | 300            |
    And I click modal button "Close"
    And I wait for "2" seconds
    When I click on "View/Add Line Item Details" icon for "Professional Staff Salaries" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I enter the following values into flex table with id "---applicationIntake:-:LineItemDetailsDetailTableID---" by clicking "New" :
      | Specific Position/Title | # of Positions | FTE | Annualized Rate of Pay | Additional Cost (e.g., Per Diem, Teacher Stipends) | Projected Salary | Cash Match | Non-Cash Match |
      | Position Title          | 10             | 10  | 10                     | 10                                                 | 7119             | 100        | 100            |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$8,334"
    Then I softly see field "Budgeted Direct Amount" as "$83,342"
    Then I softly see field "Total Budgeted Amount" as "$83,342"
    Then I softly see value "$8,334" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? |
      | Description of Item         | No              |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$3,334"
    #WillUpdateThisOnceBugResolved #NYSED-3587
    Then I softly see field "Budgeted Direct Amount" as "$83,342"
    Then I softly see field "Total Budgeted Amount" as "$83,342"
    Then I softly see value "$3,334" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #WillUpdateThisOnceBugResolved
    Then I softly see value "$83,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    When I edit the following rows inline in flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---" by clicking "Edit" :
      | Description of Item/Service | Is Subcontract? |
      | Description of Item         | Yes             |
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$8,334"
    Then I softly see field "Budgeted Direct Amount" as "$83,342"
    Then I softly see field "Total Budgeted Amount" as "$83,342"
    Then I softly see value "$8,334" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$83,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    When I click on "View/Add Line Item Details" icon for "Purchased Services" inside flex table with id "---applicationReview:-:budgetTableId---"
    And I wait for "2" seconds
    When I click on "Delete" icon for "Description of Item" inside flex table with id "---applicationIntake:-:PurchasedServicesCategoryTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    And I wait for "2" seconds
    #NYSED-3495
    Then I softly see field "Allocation Amount" as "$1,000"
    Then I softly see field "Reallocation" as "$0"
    Then I softly see field "Total Available" as "$1,000"
    Then I softly see field "Requested Indirect Amount" as "$0"
    Then I softly see field "Indirect Rate (%)" as "10.00%"
    Then I softly see field "Maximum Indirect Allowed" as "$3,334"
    #WillUpdateThisOnceBugResolved
    Then I softly see field "Budgeted Direct Amount" as "$33,342"
    Then I softly see field "Total Budgeted Amount" as "$33,342"
    Then I softly see value "$3,334" for title "Maximum Indirect Allowed" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    #WillUpdateThisOnceBugResolved
    Then I softly see value "$33,342" for title "Budgeted Direct Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"
    Then I softly see value "$33,342" for title "Total Budgeted Amount" against the value "{SavedValue:AutomationPermanentFocusArea}" inside table "---applicationIntake:-:budgetSumamaryByFocusAreaTableId---"

  @NYSED-4016 @NYSEDSprint-28 @US-NYSED-3869 @M05
  Scenario Outline:Verify that the Grantee User can see that on the Opportunity layout below, changes have been made. - Competitive Type - Lump Sum
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMSUM_COMPETITIVE_DIRECTED"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    And I wait for "2" seconds
    And I save the field labeled "Maximum # Applications Allowed" as "MaximumApplicationsAllowed"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    #NYSED-4016
    Then I softly cannot see "History" sub tab at view detail page
    Then I softly cannot see "Performance" sub tab at view detail page
    Then I softly see field "Deputy Area" added after "Maximum # Applications Allowed"
    Then I softly see field "Maximum # Applications Allowed" as "{SavedValue:MaximumApplicationsAllowed}"
    Then I softly cannot see field "Version Summary" inside page block
    Then I see only the following ordered page blocks :
      | Opportunity Information           |
      | Opportunity Specific Settings     |
      | Details                           |
      | Focus Areas                       |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | Eligibility Details               |
      | Contacts                          |
      | Key Dates                         |
      | Q&A Information                   |
      | System Information                |
    Then I see below fields in "Opportunity Specific Settings" page block
      | Subrecipient Match Required? |
      | Subrecipient Match (%)       |
      | Focus Area Required?         |
      | Objectives Required?         |
      | KPI's Required?              |
      | Risk Assessment Required?    |
      | Advance Payment Allowed?     |
      | Revisions Allowed?           |
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Indirect Rate Type" inside page block
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    And I navigate to "Overview" sub tab
    Then I softly cannot see "History" sub tab at view detail page
    Then I softly cannot see "Performance" sub tab at view detail page
    Then I softly see field "Deputy Area" added after "Maximum # Applications Allowed"
    Then I softly see field "Maximum # Applications Allowed" as "{SavedValue:MaximumApplicationsAllowed}"
    Then I softly cannot see field "Version Summary" inside page block
    Then I see only the following ordered page blocks :
      | Opportunity Information           |
      | Opportunity Specific Settings     |
      | Eligibility Details               |
      | Opportunity Details               |
      | Focus Areas                       |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | Contacts                          |
      | Key Dates                         |
      | Q&A Information                   |
      | System Information                |
    Then I see below fields in "Opportunity Specific Settings" page block
      | Subrecipient Match Required? |
      | Subrecipient Match (%)       |
      | Focus Area Required?         |
      | Objectives Required?         |
      | KPI's Required?              |
      | Risk Assessment Required?    |
      | Advance Payment Allowed?     |
      | Revisions Allowed?           |
    When I navigate to "Financials" sub tab
    Then I softly cannot see field "Indirect Rate Type" inside page block

    Examples:
      | ExternalUser |
#      | GRANTEE_SC   |
      | GRANTEE_CE   |

  @NYSED-4015 @NYSEDSprint-28 @US-NYSED-3869 @M05
  Scenario Outline:Verify that the Grantee User can see that on the Opportunity layout below, changes have been made. - Competitive Type - FS-10
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "default"
    When I login to "As a Grantor" app as "PM" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    And I wait for "2" seconds
    And I save the field labeled "Maximum # Applications Allowed" as "MaximumApplicationsAllowed"
    When I re-login to "Grants Portal" app as "<ExternalUser>" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    And I wait for "2" seconds
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside flex table with id "---applicationIntake:-:activeOpportunitiesTableId---"
    And I wait for "3" seconds
    And I navigate to "Overview" sub tab
    #NYSED-4015
    Then I softly cannot see "History" sub tab at view detail page
    Then I softly cannot see "Performance" sub tab at view detail page
    Then I softly see field "Deputy Area" added after "Maximum # Applications Allowed"
    Then I softly see field "Maximum # Applications Allowed" as "{SavedValue:MaximumApplicationsAllowed}"
    Then I softly cannot see field "Version Summary" inside page block
    Then I see only the following ordered page blocks :
      | Opportunity Information           |
      | Opportunity Specific Settings     |
      | Details                           |
      | Focus Areas                       |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | Eligibility Details               |
      | Contacts                          |
      | Key Dates                         |
      | Q&A Information                   |
      | System Information                |
    Then I see below fields in "Opportunity Specific Settings" page block
      | Subrecipient Match Required? |
      | Subrecipient Match (%)       |
      | Focus Area Required?         |
      | Objectives Required?         |
      | KPI's Required?              |
      | Risk Assessment Required?    |
      | Advance Payment Allowed?     |
      | Revisions Allowed?           |
    When I navigate to "Financials" sub tab
    Then I softly see field "Indirect Rate Type" added after "Estimated Project Period End Date"
    Then I softly see field "Maximum Indirect Rate %" added after "Indirect Rate Type"
    When I click on "Qualify" in the page details
    And I wait for "2" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    When I click on "Save" in the page details
    And I navigate to "Opportunities" tab
    And I navigate to "Converted to Application" content inside "Opportunities" subheader on left side link
    When I click toggle button to select "Opportunities Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application}" in "---applicationIntake:-:convertedToApplicationTableID---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application}" inside table
    And I navigate to "Overview" sub tab
    Then I softly cannot see "History" sub tab at view detail page
    Then I softly cannot see "Performance" sub tab at view detail page
    Then I softly see field "Deputy Area" added after "Maximum # Applications Allowed"
    Then I softly see field "Maximum # Applications Allowed" as "{SavedValue:MaximumApplicationsAllowed}"
    Then I softly cannot see field "Version Summary" inside page block
    Then I see only the following ordered page blocks :
      | Opportunity Information           |
      | Opportunity Specific Settings     |
      | Eligibility Details               |
      | Opportunity Details               |
      | Focus Areas                       |
      | Goals and Objectives              |
      | Key Performance Indicators (KPIs) |
      | Contacts                          |
      | Key Dates                         |
      | Q&A Information                   |
      | System Information                |
    Then I see below fields in "Opportunity Specific Settings" page block
      | Subrecipient Match Required? |
      | Subrecipient Match (%)       |
      | Focus Area Required?         |
      | Objectives Required?         |
      | KPI's Required?              |
      | Risk Assessment Required?    |
      | Advance Payment Allowed?     |
      | Revisions Allowed?           |
    When I navigate to "Financials" sub tab
    Then I softly see field "Indirect Rate Type" added after "Estimated Project Period End Date"
    Then I softly see field "Maximum Indirect Rate %" added after "Indirect Rate Type"

    Examples:
      | ExternalUser |
      | GRANTEE_SC   |
#      | GRANTEE_CE   |

  @NYSED-4246 @NYSEDSprint-28 @US-NYSED-2878 @M05
  Scenario Outline:Verify that the grantee user can view the indirect rate populated from the organization’s previous fiscal year rate when the current fiscal year rate and the maximum indirect rate are not available.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter value "2027" into field "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
    When I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                      | Allocation Amount |
      | {SavedValue:ExternalOrgWithoutInstitutionIDOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
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
    And I wait for "2" seconds
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
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    #NYSED-4246
    Then I softly see field "Indirect Rate (%)" as "12.50%"

    Examples:
      | ExternalUser |
      | EXTERNAL_SC  |

  @NYSED-4245 @NYSEDSprint-28 @US-NYSED-2878 @M05
  Scenario Outline:Verify that the grantee user can view the indirect rate populated from the organization’s current fiscal year rate when the maximum indirect rate is not available in the announcement.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter value "1990" into field "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
    When I clear the value from field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                      | Allocation Amount |
      | {SavedValue:ExternalOrgWithoutInstitutionIDOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
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
    And I wait for "2" seconds
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
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    #NYSED-4245
    Then I softly see field "Indirect Rate (%)" as "13.50%"

    Examples:
      | ExternalUser |
      | EXTERNAL_SC  |

  @NYSED-4148 @NYSEDSprint-28 @US-NYSED-2878 @M05
  Scenario Outline:Verify that if the present fiscal year rates are not available, the grantee user can use the maximum indirect rate specified in the announcement if the organization’s previous year rate is higher than it
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
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
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
    And I enter value "10" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                      | Allocation Amount |
      | {SavedValue:ExternalOrgWithoutInstitutionIDOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
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
    And I wait for "2" seconds
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
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    #NYSED-4148
    Then I softly see field "Indirect Rate (%)" as "10.00%"

    Examples:
      | ExternalUser |
      | EXTERNAL_SC  |

  @NYSED-4129 @NYSEDSprint-28 @US-NYSED-2878 @M05
  Scenario Outline:Verify that if the present fiscal year rates are not available, the grantee user can use the organization’s previous year rate when it is lower than the maximum indirect rate specified in the announcement.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter value "2022" into field "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
    And I enter value "14" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                      | Allocation Amount |
      | {SavedValue:ExternalOrgWithoutInstitutionIDOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
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
    And I wait for "2" seconds
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
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    #NYSED-4129
    Then I softly see field "Indirect Rate (%)" as "13.50%"

    Examples:
      | ExternalUser |
      | EXTERNAL_SC  |

  @NYSED-4125 @NYSEDSprint-28 @US-NYSED-2878 @M05 @Bug-Ticket-NYSED-10167
  Scenario Outline:Verify that the grantee user can view the indirect rate populated from the announcement’s maximum indirect rate when it is lower than the organization’s fiscal year rate.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter value "2001" into field "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
    And I enter value "19.5" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                      | Allocation Amount |
      | {SavedValue:ExternalOrgWithoutInstitutionIDOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
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
    And I wait for "2" seconds
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
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    #NYSED-4125
    Then I softly see field "Indirect Rate (%)" as "19.50%"

    Examples:
      | ExternalUser |
      | EXTERNAL_SC  |

  @NYSED-4112 @NYSEDSprint-28 @US-NYSED-2878 @M05
  Scenario Outline:Verify that the grantee user can view the indirect rate populated from the organization’s fiscal year rate when it is lower than the maximum rate allowed in the announcement.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "FD" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter value "2029" into field "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_ByApplicant" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "4" seconds
    And I enter "Formula_Edition" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I click on "Save" in the page details
    When I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    And I wait for "2" seconds
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    And I enter value "Justified" into field "Justification__c"
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I wait for "2" seconds
    And I enter value "22.99" into field "Indirect_Rate__c"
    When I click on "Save" in the page details
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Overview" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:ExternalOrgWithoutInstitutionIDOrg}" in the table "---announcement:-:directedAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I refresh the page
    When I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                                      | Allocation Amount |
      | {SavedValue:ExternalOrgWithoutInstitutionIDOrg} | 1000              |
    When I navigate to "Setup" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" by showing entries "All" in flex table with id "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
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
    And I wait for "2" seconds
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
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    #NYSED-4112
    Then I softly see field "Indirect Rate (%)" as "8.99%"

    Examples:
      | ExternalUser |
      | EXTERNAL_SC  |

  @NYSED-6868 @NYSED-6865 @NYSED-6866 @NYSED-Sprint-31 @US-NYSED-3900 @M05
  Scenario Outline:Verify that the County field is mandatory for the Grantee user to save the application layout.
  |Verify that the specified fields/columns are hidden for the Grantee user on the application layout.|
  |Verify that the specified fields/columns are hidden for the Internal user on the application layout.|
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
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "7" seconds
    And I enter value "Self" into field "NYSED_CreatingFor__c"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Application_Field_Values.xlsx"
    And I navigate to "Overview" sub tab
    When I edit the following rows inline in flex table with id "---applicationIntake:-:kpiTableId---" by clicking "Edit" :
      | Title                               | Target |
      | {SavedValue:AutomationPermanentKPI} | 10     |
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                             | Is Key Contact |
      | {SavedValue:GRANTEE_SC Username} | Checked        |
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    And I wait for "2" seconds
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Budget Category             | Budget | Cash Match | Non-Cash Match |
      | Professional Staff Salaries | 1000   | 450        | 450            |
    And I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    And I clear the value from field "County__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    #NYSED-6868
    Then I softly see the following messages in the page details contains:
      | To save, County Code is required in the Overview tab under the Primary Place of Performance section. |
    When I enter value "$%" into field "County__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | The County Code should consist of 2 digits. |
    When I enter value "132" into field "County__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "County Code" as "13"
    When I click on "Edit" in the page details
    When I enter value "12" into field "County__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "County Code" as "12"
    #NYSED-6865
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    When I re-login to "Grants Portal" app as "GRANTEE_CE" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #NYSED-6865
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    When I re-login to "Grants Portal" app as "GRANTEE_VO" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #NYSED-6865
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    When I re-login to "Grants Portal" app as "GRANTEE_LEA" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "2" seconds
    #NYSED-6865
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    When I re-login to "Grants Portal" app as "<UserType>" user on "SUBPORTAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    And I wait for "5" seconds
    When I click on "Submit Application" in the page details
    And I wait for "3" seconds
    Then I softly see field "Status" as "Submitted to Grantor"
    Given I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    #NYSED-6866
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    Given I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    #NYSED-6866
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    Given I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    #NYSED-6866
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    Given I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    #NYSED-6866
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"
    Given I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    When I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "2" seconds
    #NYSED-6866
    Then I softly do not see "Organization Name" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly cannot see field "EIN" inside page block
    Then I softly see field "Vendor ID" added after "UEI"

    Examples:
      | UserType   |
      | GRANTEE_SC |

  @NYSED-8817 @NYSED-Sprint-32 @US-NYSED-6966 @M05
  Scenario Outline: Verify that the Grantee user cannot see the ‘Applications - My Records’ list filter from the Applications phase as well as from the Applications phase → Applications left navigation module.
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<UserType>" user
    When I navigate to "Applications" tab
    #NYSED-8817
    Then I softly do not see toggle option "Applications - My Records" inside flex table id "---applicationIntake:-:recipientApplications---"
    When I navigate to "Applications" content inside "Applications" subheader on left panel
    #NYSED-8817
    Then I softly do not see toggle option "Applications - My Records" inside flex table id "---applicationIntake:-:recipientApplications---"

    Examples:
      | UserType   |
      | GRANTEE_SC |
      | GRANTEE_CE |
