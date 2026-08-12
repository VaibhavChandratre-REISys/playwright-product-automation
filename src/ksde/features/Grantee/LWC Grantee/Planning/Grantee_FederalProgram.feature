@GranteeFederalProgram
Feature: Validate all scenarios for Federal Program

  @476625 @ValidateFederalprogramPMusercanviewFederalProgram @GRegression1 @PM_Grantee @P1_Grantee @GranteeTBE
  Scenario Outline: Validate Federal program PM user can view Federal Program
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    Then I cannot see row level action button "Edit" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    Then I can see row level action button "View" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    And I save the field labeled "EGMS ID" as "fedProgramEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:fedProgramEGMSID}"
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Examples:
      | userType        |
      | GRANTEE PM      |

  @476626 @ValidateFederalprogramPMusercanviewFederalProgram @PO_Grantee @P1_Grantee @GRegression2 @GranteeTBE
  Scenario Outline: Validate Federal program PO user can view Federal Program
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    Then I cannot see row level action button "Edit" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    Then I can see row level action button "View" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    And I save the field labeled "EGMS ID" as "fedProgramEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:fedProgramEGMSID}"
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Examples:
      | userType        |
      | GRANTEE PO      |

  @476627 @ValidateFederalprogramPMusercanviewFederalProgram @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Validate Federal program EXE user can view Federal Program
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    Then I cannot see row level action button "Edit" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    Then I can see row level action button "View" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    And I save the field labeled "EGMS ID" as "fedProgramEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:fedProgramEGMSID}"
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Examples:
      | userType        |
      | GRANTEE EXE     |

  @476628 @ValidateFederalprogramPMusercanviewFederalProgram @FO_Grantee @P3_Grantee @GRegression2 @GranteeTBE
  Scenario Outline: Validate Federal program FO user can view Federal Program
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    Then I cannot see row level action button "Edit" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    Then I can see row level action button "View" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    And I save the field labeled "EGMS ID" as "fedProgramEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:fedProgramEGMSID}"
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Examples:
      | userType        |
      | GRANTEE FO      |

  @476629 @ValidateFederalprogramPMusercanviewFederalProgram @FD_Grantee @P3_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Validate Federal program FD user can view Federal Program
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    Then I cannot see row level action button "Edit" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    Then I can see row level action button "View" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    And I save the field labeled "EGMS ID" as "fedProgramEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:fedProgramEGMSID}"
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Examples:
      | userType        |
      | GRANTEE FD      |

  @476630 @ValidateFederalprogramPMusercanviewFederalProgram @P3_Grantee @ADMIN_Grantee @GRegression2 @GranteeTBE
  Scenario Outline: Validate Federal program ADMIN user can view Federal Program
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    Then I cannot see row level action button "Edit" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    Then I can see row level action button "View" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    And I save the field labeled "EGMS ID" as "fedProgramEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:fedProgramEGMSID}"
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Examples:
      | userType        |
      | GRANTEE ADMIN   |

  @476631 @ValidateFederalprogramPMusercanviewFederalProgram @AUDITOR_Grantee @P4_Grantee @GRegression4 @GranteeTBE
  Scenario Outline: Validate Federal program AUDITOR user can view Federal Program
    When I login to "As a Grantee" app as "<userType>" user
    And I navigate to "Planning" tab
    When I navigate to "External" content inside "Programs" subheader on left panel
    And I wait for "10" seconds
    And I perform quick search for "Maha Research and Technology Activity" in "---grantee_tableId:-:ExternalFederalPrograms---" panel
    Then I cannot see row level action button "Edit" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    Then I can see row level action button "View" against "Maha Research and Technology Activity" in flex table with id "---grantee_tableId:-:ExternalFederalPrograms---"
    When I click on "View" icon for "Maha Research and Technology Activity" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I see the header is "Federal Program" in the page details
    Then I see the sub-header is "Maha Research and Technology Activity" in the page details
    Then I softly see "Program Information" page block displayed
    Then I softly see "Eligibility Requirements" page block displayed
    Then I softly see "Application and Award Process" page block displayed
    Then I softly see "Assistance Consideration" page block displayed
    Then I softly see "Compliance Requirements" page block displayed
    Then I softly see "Financial Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "Contact Information" page block displayed
    Then I softly see "System Information" page block displayed
    Then I softly see field "EGMS ID" inside page block
    And I save the field labeled "EGMS ID" as "fedProgramEGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:fedProgramEGMSID}"
    Then I softly see field "Source" inside page block
    Then I softly see field "Source" as "SAM.gov"
    Then I softly see field "Assistance Listing #" inside page block
    Then I softly see field "Awarding Agency Code" inside page block
    Then I softly see field "Federal Agency" inside page block
    Then I softly see field "Authorization" inside page block
    Then I softly see field "Objectives" inside page block
    Then I softly see field "Types Of Assistance" inside page block
    Then I softly see field "Uses And Use Restrictions" inside page block
    Then I softly see field "Credentials/Documentation" inside page block
    Then I softly see field "Applicant Eligibility" inside page block
    Then I softly see field "Beneficiary Eligibility" inside page block
    Then I softly see field "Pre-application Coordination" inside page block
    Then I softly see field "Application Procedures" inside page block
    Then I softly see field "Award Procedure" inside page block
    Then I softly see field "Deadlines" inside page block
    Then I softly see field "Date Range of Approval/Disapproval" inside page block
    Then I softly see field "Appeals" inside page block
    Then I softly see field "Renewals" inside page block
    Then I softly see field "Criteria For Selecting Proposals" inside page block
    Then I softly see field "Formula And Matching Requirements" inside page block
    Then I softly see field "Length And Time Phasing Of Assistance" inside page block
    Then I softly see field "Reports" inside page block
    Then I softly see field "Audits" inside page block
    Then I softly see field "Records" inside page block
    Then I softly see field "Regulations, Guidelines, and Literature" inside page block
    Then I softly see field "Account Identification" inside page block
    Then I softly see field "Obligations" inside page block
    Then I softly see field "Range and Average of Financial Assistance" inside page block
    Then I softly see field "Program Accomplishments" inside page block
    Then I softly see field "Regional Or Local Office" inside page block
    Then I softly see field "Headquarters Office" inside page block
    Then I softly see field "Website Address" inside page block
    Then I softly see field "Created By" inside page block
    Then I softly see field "Last Modified By" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Examples:
      | userType        |
      | GRANTEE AUDITOR |