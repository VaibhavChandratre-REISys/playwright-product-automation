@directGrantAnnouncementNysed @announcementExecution @announcementUAT
Feature: Validate all scenarios in the Direct Grant Announcement

  @536184 @536185 @536188 @536189 @536186 @536192 @NYSEDSprint-13 @US-535338 @M05
  Scenario Outline: Verify that user can see error message if upload an excel in incorrect format.- Competitive Announcement
  |Verify that user can see an error message if I try to upload an Excel with more than one row for a given applicant. Complete upload fails.- Competitive Announcement|
  |Verify that user can see an error message if entered 'Institution ID' does not match with existing Institution ID in the system.- Competitive Announcement|
  |Verify that user can see an error message if entered 'Institution ID' does not match with correct format.- Competitive Announcement|
  |Verify that user can see an error message if 'Institution ID' column i.e. required column is missing for a given row in Excel- Competitive Announcement|
  |Verify that user can leave the SED code and Applicants column blank in the Excel. The system should derive the Applicant and SED code based on Institution ID.- Competitive Announcement|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "3" seconds
    When I navigate to "Financials" sub tab
    #536184
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "Applicants_DirectGrantYes_CompetitiveType.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    When I click modal button "Close"
    #536185
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "DuplicateApplicants_DirectGrantYes_CompetitiveType.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Row #5 - Duplicate entry found for Institution ID (321456987443). The Institution ID must be unique for each row. |
    When I click modal button "Close"
    #536188
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "NoExistingID_Applicants_DirectGrantYes_CompetitiveType.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.    |
      | Row #2 - Institution ID not found: 166485414444 |
    When I click modal button "Close"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "InvalidID_Applicants_DirectGrantYes_CompetitiveType.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                            |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    When I click modal button "Close"
    #536189
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "InvalidID1_Applicants_DirectGrantYes_CompetitiveType.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                            |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    When I click modal button "Close"
    #536186
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "BlankID_Applicants_DirectGrantYes_CompetitiveType.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #4 - The Institution ID is missing.      |
    When I click modal button "Close"
    #536192
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "Applicants_DirectGrantYes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Institution ID | SED Code | Applicants                         |
      | 166485411256   | CACP12   | {SavedValue:SubrecipientOrg}       |
      | 166987654255   | NYH12    | {SavedValue:SubrecipientHealthOrg} |
      | 321456987443   | NYS12    | {SavedValue:SubrecipientSchoolOrg} |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @536183 @536199 @536180 @536177 @NYSEDSprint-13 @US-535338 @M05
  Scenario Outline: Verify that user can add rows or update existing rows in Excel, and upload the updated data in the Excel to the Applicants section. If the upload is successful, I see that the Applicants section refreshes and shows updated data- Competitive Announcement
  |Verify that the if the option for 'Is Announcement for Direct Grant?' is selected as 'Yes' during announcement creation, then the Applicants section is configured at the Announcement overview tab with below columns - Competitive Announcement|
  |Verify that the downloaded Excel shows all records already entered in the Applicants section and the download file name should be same as section name.- Competitive Announcement|
  |Verify that the attached excel format is downloaded if I click on 'Download in Excel' Button. - Competitive Announcement|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    And I wait for "3" seconds
    #536183
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload file "Applicants_DirectGrantYes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I refresh the page
    And I wait for "2" seconds
    And I click on "Remove" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I refresh the page
    #536180
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I pause execution for "5" seconds
    And I click modal button "Close"
    #536177
    Then I softly verify that the file "Applicants.xlsx" is downloaded
    Then I see row "1" contains value "166987654255" against the column name "Institution ID" in the Excel file "Applicants.xlsx"
    Then I see row "1" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    Then I see row "1" contains value "NYH12" against the column name "SED Code" in the Excel file "Applicants.xlsx"
    Then I see row "2" contains value "321456987443" against the column name "Institution ID" in the Excel file "Applicants.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants.xlsx"
    Then I see row "2" contains value "NYS12" against the column name "SED Code" in the Excel file "Applicants.xlsx"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants.xlsx"
    And I Update "321456987443" value in "2" row and "1" column in "Applicants.xlsx"
    And I Update "NYS12" value in "2" row and "2" column in "Applicants.xlsx"
    And I Update "{SavedValue:SubrecipientSchoolOrg}" value in "2" row and "3" column in "Applicants.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I upload the excel file "Applicants.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    And I refresh the page
    #536199
    Then I softly see "Applicants" page block displayed
    Then I see the following headers in table with id "FormulaGrantsAwardOrganizations" :
      |  | Actions | Institution ID | SED Code | Applicants | Grant EGMS ID | Last Updated By | Last Updated |
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId"
    Then I softly can see top right button "Delete Selected" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Institution ID | SED Code | Applicants                         |
      | 166987654255   | NYH12    | {SavedValue:SubrecipientHealthOrg} |
      | 321456987443   | NYS12    | {SavedValue:SubrecipientSchoolOrg} |
    Then I softly can see row level action button "Remove" against "{SavedValue:SubrecipientHealthOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientHealthOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    And I delete the excel file "Applicants.xlsx"

    Examples:
      | UserType |
      | FD       |
#      | PO       |
#      | FO       |
#      | PM      |

  @536203 @NYSEDSprint-13 @US-535338 @M05
  Scenario Outline: Verify that the if the option for 'Is Announcement for Direct Grant?' is selected as 'NO' during announcement creation, then the Applicants section is not configured at the Announcement overview tab - Competitive Announcement
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "3" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "5" seconds
    When I navigate to "Overview" sub tab
    Then I softly do not see "Applicants" page block displayed

    Examples:
      | UserType |
#      | FD       |
      | PO       |
#      | FO       |
#      | PM      |

  @536661 @536176 @536174 @NYSEDSprint-13 @US-535338 @M05
  Scenario Outline: Verify that the Announcement Owner cannot see the validation related to Eligibility Details section (adding organization type) on 'Submit For Approval' action when 'Is Announcement for Direct Grant?' is selected as 'Yes': Competitive
  |Verify that the Announcement Owner can see that validation related to Eligibility Details section (adding organization type) is disabled on 'Upload Excel' action when 'Is Announcement for Direct Grant?' is selected as 'Yes': Competitive |
  |Verify that the Announcement Owner can see that validation related to Eligibility Details section (adding organization type) is disabled on 'Add Organization' modal when 'Is Announcement for Direct Grant?' is selected as 'Yes': Competitive |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I wait for "3" seconds
    #536661
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    #536176
    When I upload file "Applicants_DirectGrantYes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I refresh the page
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants                         |
      |  | Actions | 166485411255   | CACP12   | {SavedValue:SubrecipientOrg}       |
      |  | Actions | 166987654255   | NYH12    | {SavedValue:SubrecipientHealthOrg} |
      |  | Actions | 321456987443   | NYS12    | {SavedValue:SubrecipientSchoolOrg} |
    And I wait for "10" seconds
    And I click on "Remove" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    #536174
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---announcement:-:directedInvitedApplicatsTableId---" :
      | Institution ID | SED Code | Applicants                   |
      | 166485411255   | CACP12   | {SavedValue:SubrecipientOrg} |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:PM Username}  | Program Coordinator        |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    When I navigate to "Financials" sub tab
    When I click on "Edit" in the page details
    And I enter value "Unrestricted" into field "Indirect_Rate_Type__c"
    And I enter value "100" into field "Indirect_Rate__c"
    When I navigate to "Overview" sub tab
    And I enter value "No" into field "NYSED_FARequiredForAmendment__c"
    And I enter value "10" into field "First_Payment__c"
    And I enter value "Justified" into field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I wait for "3" seconds
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Overview" sub tab
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    Then I softly see field "Status" as "Submitted for Approval"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @538129 @NYSEDSprint-14 @US-535399 @M05 @needsToAddAPICaseBAAF_FocusArea_yes
  Scenario Outline:Verify that the associated Grant Finance Coordinator/s cannot see the 'Create Grant' inline action, at the Announcement layout->Applicants and Allocations section in approved state if 'Is Announcement for Direct Grant?' is set to 'Yes': Formula BAFA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #538129
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | EXE      |

  @538122 @NYSEDSprint-14 @US-535399 @M05
  Scenario Outline:Verify that the associated Grant Finance Coordinator/s cannot see the 'Create Grant' inline action, at the Announcement layout->Applicants and Allocations section in approved state if 'Is Announcement for Direct Grant?' is set to 'Yes': Formula BAFA
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #538122
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | EXE      |
#      | PO       |
#      | FO       |
#      | FD       |
#      | PM       |

  @538116 @NYSEDSprint-14 @US-535399 @M05 @needsToAddCase
  Scenario Outline:Verify that the Announcement Owner cannot see the 'Create Grant' inline action, at the Announcement layout->Overview tab->Applicants section in approved state if 'Is Announcement for Direct Grant?' is set to 'Yes'.: Directed
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Directed" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_DIRECT_GRANT"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I wait for "3" seconds
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:annoucementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #538116
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @538111 @NYSEDSprint-14 @US-535399 @M05 @needsToAddCase
  Scenario Outline:Verify that the Announcement Owner cannot see the 'Create Grant' inline action, at the Announcement layout->Overview tab->Applicants section in approved state if 'Is Announcement for Direct Grant?' is set to 'Yes'.: Competitive
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "COMPETATIVE_DIRECTED_DIRECT_GRANT"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #538111
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @538123 @NYSEDSprint-14 @US-535399 @M05
  Scenario Outline:Verify that the Announcement Owner cannot see the 'Create Grant' inline action, at the Announcement layout->Overview tab->Applicants and Allocations section in approved state if 'Is Announcement for Direct Grant?' is set to 'Yes'.:  Formula By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #538123
    And I wait for "3" seconds
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | PM       |

  @538130 @NYSEDSprint-14 @US-535399 @M05 @needsToAddCase
  Scenario Outline:Verify that the Announcement Owner cannot see the 'Create Grant' inline action, at the Announcement layout->Applicants and Allocations section in approved state if 'Is Announcement for Direct Grant?' is set to 'Yes'.:  Formula By Applicant and Focus Area
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Announcement" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "<UserType>" user
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I navigate to "Financials" sub tab
    #538130
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "No Actions Available" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @541148 @541095 @541129 @538128 @541122 @US-540546 @US-NYSED-1845 @NYSEDSprint-16 @NYSEDSprint-22 @M04 @M05 @DirectGrant-Yes @FS-10
  Scenario Outline: Verify that the Announcement Approver can perform the approval 'Undo' if the direct grant is not yet created from the announcement.
  |Verify that the Announcement Approver is stopped from performing the approval 'Undo' if one or more grant/s have been created from the announcement.: Formula By Applicant and Focus Area.|
  |Verify that the Announcement Owner cannot remove the program coordinator if only one program coordinator is added or cannot change the Role from Program Coordinator to Grants Finance Coordinator when announcement is in Approved state.: Formula BAFA|
  |Verify that the associated Program Coordinator/s can see below validation on clicking the 'Create Grant' button, once the grant is created for the subrecipient organization, for announcement type Formula By Applicant and Focus Area.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Program Coordinator        |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
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
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #541148
    When I navigate to "Financials" sub tab
    And I click on "Undo" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #541095
    When I navigate to "Financials" sub tab
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Approved"
    And I wait for "4" seconds
    Then I softly see the following messages in the page details :
      | The Approval cannot be undone as the related Grant/s are already created. |
    #541129
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                |
      | {SavedValue:EXE Username} | Program Coordinator |
    And I refresh the page
    And I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    And I refresh the page
    And I click on "Remove" icon for "{SavedValue:PM Username}" inside flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | All Program coordinators cannot be removed for announcement, add another user as a Program Coordinator before removing the existing one. |
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Edit" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    Then I softly see the following messages in the page details :
      | All Program coordinators cannot be removed for announcement, add another user as a Program Coordinator before removing the existing one. |
    #538128
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "6" seconds
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details :
      | The Grant for this organization has already been created. |
    And I click modal button "Close"
    When I click alert button "OK"
    And I refresh the page
    #541122
    When I navigate to "Financials" sub tab
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I click "{SavedValue:GRANT_EGMSID}" lookup link
    Then I see the header is "Grant" in the page details

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @541118 @541132 @538121 @541124 @541148_BA @US-540546 @NYSEDSprint-16 @M05 @DirectGrant-Yes @FS-10
  Scenario Outline: Verify that the Announcement Approver is stopped from performing the approval 'Undo' if one or more grant/s have been created from the announcement.: Formula By Applicant
  |Verify that the Announcement Owner cannot remove the program coordinator if only one program coordinator is added or cannot change the Role from Program Coordinator to Grants Finance Coordinator when announcement is in Approved state.: Formula BA|
  |Verify that the associated Program Coordinator/s cannot see the 'Create Grant' button once the grant is created in the Applicants and Allocations section: Formula By Applicant|
  |Verify that the Internal User can see the 'Grant EGMS ID' field is added in the Applicants and Allocation section of the announcement.: Formula By Applicant|
  |Verify that the Announcement Approver can perform the approval 'Undo' if the direct grant is not yet created from the announcement.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "FocusAreaRequired__c"
    And I enter value "By Applicant" into field "Allocationlevel__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaInvitedApplicatsTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Program Coordinator        |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
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
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I wait for "2" seconds
    And I refresh the page
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    #541148_BA
    When I navigate to "Financials" sub tab
    And I click on "Undo" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I refresh the page
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "6" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    #541118
    When I navigate to "Financials" sub tab
    And I click on "Undo" in the page details
    Then I softly see field "Status" as "Approved"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | The Approval cannot be undone as the related Grant/s are already created. |
    #541132
    And I refresh the page
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                |
      | {SavedValue:EXE Username} | Program Coordinator |
    And I refresh the page
    And I click on "Remove" icon for "{SavedValue:EXE Username}" inside flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | Record deleted successfully. |
    And I refresh the page
    And I click on "Remove" icon for "{SavedValue:PM Username}" inside flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details :
      | All Program coordinators cannot be removed for announcement, add another user as a Program Coordinator before removing the existing one. |
    And I refresh the page
    And I edit the following rows inline in flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Edit" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Grants Finance Coordinator |
    Then I softly see the following messages in the page details :
      | All Program coordinators cannot be removed for announcement, add another user as a Program Coordinator before removing the existing one. |
    #538121
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly cannot see row level action button "Create Grant" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #541124
    And I click "{SavedValue:GRANT_EGMSID}" lookup link
    Then I see the header is "Grant" in the page details

    Examples:
      | UserType | Approver      |
#      | PM       | Automation PM |
      | PO       | Automation PO |
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @539339 @US-532926 @NYSEDSprint-15 @M05
  Scenario Outline: Verify that the internal user cannot see the New button on the Grant Phase->Grant option from left navigation->List view.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Grants" tab
    Then I softly cannot see top right button "New" in flex table with id "ActiveGrants"
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    Then I softly cannot see top right button "New" in flex table with id "---subAwardStandAlone:-:grantsTableId---"

    Examples:
      | UserType |
      | PM       |
      | PO       |
      | FO       |
      | FD       |

  @539227 @545454 @US-532927 @US-544880 @NYSEDSprint-15 @NYSEDSprint-19 @M05
  Scenario Outline: Verify that internal users see that the budget categories are reflecting the selected budget type (Lump Sum) as per the related announcement in the subaward budget section under the budget tab on the subaward layout.
  |Verify that the associated Program Coordinator(s) cannot set the 'Contractual?' field to 'Yes' on the Create Direct Grant modal when the budget type is 'Lump Sum'|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I published "Formula" type announcement having name "Automation Runtime Direct Grant" for the activated program "{SavedValue:Automation Runtime Active Program}" with properties "LUMPSUM_DIRECT_GRANT_YES_BA"
    Given I login to "As a Grantor" app as "PO" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Direct Grant}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I navigate to "Financials" sub tab
    And I wait for "5" seconds
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" without waiting for record
    And I wait for "3" seconds
    #545454
    Then I softly see default value "No" for the field "NYSED_Contractual__c"
    Then I see only the following ordered options in dropdown field "NYSED_Contractual__c" :
      | --None-- | Yes | No |
    And I enter value "Yes" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | Contractual grants cannot be issued for budget type 'Lump Sum'. |
    And I wait for "3" seconds
    And I enter value "No" into field "NYSED_Contractual__c"
    And I click modal button "Save and Continue"
    And I wait for "5" seconds
    Then I see the header is "Grant" in the page details
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    And I save the field labeled "Grant Title" as "GrantTitle"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Direct Grant}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Budget" sub tab
    #539227
    Then I softly see value "Lump Sum" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I perform quick search for "{SavedValue:GRANT_EGMSID}" in "---subAwardStandAlone:-:GrantsAllTableId---" panel
    And I click on "View" icon for "{SavedValue:GRANT_EGMSID}" inside flex table with id "---subAwardStandAlone:-:GrantsAllTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:GRANT_EGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    #539227
    When I navigate to "Budget" sub tab
    Then I softly see value "Lump Sum" for title "Budget Category" inside table "---subAwardStandAlone:-:subAwardBudgetTableId---"

    Examples:
      | UserType |
      | FD       |
#      | FO       |
#      | EXE      |
#      | PM       |

  @539566 @539563 @539560 @539533 @539556 @539557 @539552 @539600 @544314 @544328 @544312 @US-532926 @US-541206 @NYSEDSprint-15 @NYSEDSprint-18 @M05 @M04 @DirectGrant-Yes @FS-10
  Scenario Outline:  Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Business Forms section is hidden.: Competitive
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Files Tab->Supporting Document Checklist is copied from related announcement.: Competitive|
  | Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Period of Performance Project Period Start and End date fields are copied from Announcement->Financials tab->Budget Specific setting->Estimated Project Period.: |
  |Verify that the associated Program Coordinator/s can see Grant layout->Overview Tab->Grant information section-> Announcement ID field is visible.: Competitive |
  |Verify that the associated Program Coordinator/s can see on the Grant layout->Overview Tab->Grant Details section, field values are copied/referenced from related announcement.: Competitive |
  |Verify that the associated Program Coordinator/s can see on the Grant Layout->Overview Tab->Subrecipient Information section details are filled based on subrecipient from related announcements' Applicant section.: Competitive |
  |Verify that the associated Program Coordinator/s can see on Grant layout->Overview Tab->Grant information section details populate as follows:  Competitive |
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Comp_Dir_Edition_DirectGrant" values from "Announcement_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    And I save the field labeled "Announcement Name" as "Announcement_Name"
    And I save the field labeled "Fund Year" as "Fund_Year"
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I enter the following values into flex table with id "---announcement:-:annChecklist---" by clicking "Add" :
      | Description                       | Required  | Applies To | Status |
      | Automation test description-Award | Mandatory | Award      | Active |
    #544312
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - You must invite at least one applicant before submitting this Announcement. |
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I wait for "2" seconds
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                     | Role                       |
      | {SavedValue:PM Username} | Program Coordinator        |
      | {SavedValue:PO Username} | Grants Finance Coordinator |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    When I navigate to "Financials" sub tab
    #544314
    When I navigate to "Setup" sub tab
    And I click on top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |
    And I click on "Submit For Approval" in the page details
    #544328
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - You must invite at least one applicant before submitting this Announcement. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    When I navigate to "Financials" sub tab
    And I click on "Create Grant" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" without waiting for record
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "GRANT_EGMSID"
    And I enter value "Automation- Grant Description" into field "GrantDescription__c"
    When I click on "Save" in the page details
    #539566
    When I navigate to "Files" sub tab
    Then I softly do not see "Business Forms" page block displayed
    #539563
    Then I see the following rows under the following headers in table with id "---subAwardStandAlone:-:flexGridGrantChecklistsTableId---" :
      | Description                       | Required  | Applies To | Status | Template Link  | Subrecipient Document Link |
      | Automation test description-Award | Mandatory | Award      | Active | Not Applicable | Not Applicable             |
    #539560
    When I navigate to "Overview" sub tab
    Then I softly see field "Project Period Start Date" as "{Date:M/d/yyyy::d+50}"
    Then I softly see field "Project Period End Date" as "{Date:M/d/yyyy::d+150}"
    #539557
    Then I softly see field "Subrecipient Organization" as "{SavedValue:SubrecipientOrg}"
    #539556 539600
    Then I softly see field "Subrecipient Match Required?" as "Yes"
    Then I softly see field "Advance Payment Allowed?" as "Yes"
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "Yes"
    Then I softly see field "Focus Areas Required?" as "Yes"
    Then I softly see field "Allocation Level" as "N/A"
    Then I softly see field "Objectives Required?" as "Yes"
    Then I softly see field "KPIs Required?" as "Yes"
    Then I softly see field "Risk Assessment Required?" as "No"
    Then I softly see field "Carry Over" as "Yes"
    Then I softly see field "Carry Over Limit" as "Yes"
    Then I softly see field "Carry Over Limit %" as "11.00%"
    Then I softly see field "First Payment %" as "50.00%"
    #539552
    Then I softly see field "Grant Title" as "{SavedValue:Announcement_Name}"
    Then I softly see field "Grant Type" as "Competitive"
    Then I softly see field "Grant Abbreviation" as "GA"
    Then I softly see field "Announcement ID" as "{SavedValue:Announcement_EGMSID}"
    Then I softly see field "Fund Year" as "{SavedValue:Fund_Year}"
    When I click on "Edit" in the page details
    Then I softly see field "Grant Type" is not editable
    Then I softly see field "Grant Abbreviation" is not editable
    Then I softly see field "Announcement ID" is not editable
    Then I softly see field "Fund Year" is not editable
    Then I softly see field "Internal Program" is not editable
    And I clear the value from field "ProjectTitle__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Grant Title is required in the Overview tab under the Grant Information section. |
    And I enter value "{SavedValue:Announcement_Name}" into field "ProjectTitle__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Grant Title" as "{SavedValue:Announcement_Name}"
    #539533
    When I navigate to "Overview" sub tab
    And I click "{SavedValue:Announcement_EGMSID}" lookup link
    Then I see the header is "Announcement" in the page details

    Examples:
      | UserType | Approver      |
#      | PM       | Automation PM |
#      | PO       | Automation PO |
#      | FO       | Automation FO |
      | FD       | Automation FD |

  @544311 @544340 @US-541206 @NYSEDSprint-18 @M04 @DirectGrant-No
  Scenario Outline: Verify that the internal users Applicants section unable to see in case of Direct grant NO.
  |Verify  that the internal user Pre-Application option get hide from 'Applies To' column If Direct Grant - NO.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation Second Modal" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    Given I navigate to "Overview" sub tab
    #544311
    Then I softly do not see "Applicants" page block displayed
    And I click on "Submit For Approval" in the page details
    And I wait for "3" seconds
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - You must invite at least one applicant before submitting this Announcement. |
    #544340
    When I navigate to "Setup" sub tab
    And I click on top right button "Add" in flex table with id "---announcement:-:annChecklist---"
    Then I see only the following ordered options in dropdown field "AttachmentLocation__c" :
      | Application | Award | Reimbursement Request |

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @544945 @US-541206 @NYSEDSprint-18 @M04 @DirectGrant-Yes @defectID-1763
  Scenario Outline:  Verify that the internal user if supporting documents is getting copied from Program which has 'Application' in 'Applies To' column in case of Direct Grant set to yes then able to see Validation.
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Created"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I pause execution for "3" seconds
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I perform quick search for "{SavedValue:EXE Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:EXE Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    When I perform quick search for "{SavedValue:FD Username}" in "---program:-:associateContactsTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FD Username}" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I click modal button "Close"
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                      | Project Role   | Group Email        | Is Key Contact |
      | {SavedValue:EXE Username} | Fiscal Contact | testNY@yopmail.com | Checked        |
    And I edit the following rows inline in flex table with id "---program:-:contactsTableId---" by clicking "Edit" :
      | Name                     | Project Role    | Group Email        | Is Key Contact |
      | {SavedValue:FD Username} | Program Contact | testNY@yopmail.com | Checked        |
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                 | Required  | Applies To  | Status |
      | Automation test description | Mandatory | Application | Active |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 1  |
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I navigate to "Overview" sub tab
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:homePendingTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---program:-:homePendingTableId---"
    Then I navigate to "Overview" sub tab
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"
    And I wait for "2" seconds
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter value "Automation Runtime Competitive Announcement" into field "AnnouncementName__c"
    And I enter value "{SavedValue:ProgramEGMSID}" into field "Program__c"
    And I enter value "1995" into field "NYSED_Year__c"
    And I enter value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_NoSetti_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Comp_Dir_Edition_DirectGrant" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:PM Username}  | Program Coordinator        |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | The application cannot be selected as 'Applies To' because it is not included in the downstream process flow. |

    Examples:
      | UserType |
#      | FD       |
#      | FO       |
      | PO       |
#      | PM       |

  @NYSED-2154_DG @NYSED-2155_DG @NYSEDSprint-22 @US-NYSED-1802 @M04 @DirectGrant-Yes  @defectID-2856
    @NYSED-6548 @Sprint-30 @US-NYSED-6262 @M04
  Scenario Outline:  Verify that the Announcement Owner can see that the 'Is a Detailed Budget Required on the Application?' field defaults to 'Yes' when the Budget Type is 'FS-10' and remains editable.
  |Verify that the ‘Required to Submit’ icon is displayed for ‘First Payment %’ when ‘Advance Payment Allowed?’ is set to Yes on the Announcement layout.|
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_NoSetti_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Comp_Dir_Edition_DirectGrant" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    #NYSED-2154
    Then I see field "Advance Payment Allowed?" as "Yes"
    And I click on "Edit" in the page details
    Then I softly see field "Advance Payment Allowed?" is not editable
    When I click on "Save" in the page details
    #NYSED-2155
    Then I softly see field "First Payment %" added after "Advance Payment Allowed?"
    And I click on "Edit" in the page details
    And I clear the value from field "First_Payment__c"
    When I click on "Save" in the page details
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:PM Username}  | Program Coordinator        |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |

    Examples:
      | UserType |
#      | FD       |
      | FO       |
#      | PO       |
#      | PM       |

  @NYSED-2156_DG @NYSED-2121 @NYSED-2122 @NYSEDSprint-22 @US-NYSED-1802 @US-NYSED-1816 @M04 @DirectGrant-Yes
  Scenario Outline:  Verify that the Announcement Owner can see that the 'Is a Detailed Budget Required on the Application?' field defaults to 'Yes' when the Budget Type is 'FS-10' and remains editable.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_NoSetti_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsAdvancePermitted__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Comp_Dir_Edition_DirectGrant1" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    #NYSED-2156
    Then I see field "Advance Payment Allowed?" as "No"
    Then I softly do not see field "First Payment %" added after "Advance Payment Allowed?"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:PM Username}  | Program Coordinator        |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:directedInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:directedInvitedApplicatsTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    #NYSED-2121
    When I navigate to "Overview" sub tab
    Then I softly cannot see field "Focus Areas" inside page block
    #NYSED-2122
    When I navigate to "Setup" sub tab
    Then I softly cannot see field "Goals and Objectives" inside page block
    When I navigate to "Financials" sub tab
    And I click on "Submit For Approval" in the page details
    And I wait for "4" seconds
    #NYSED-2156_DG
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - First Payment % is required before submitting the announcement for approval. |

    Examples:
      | UserType |
#      | FD       |
      | FO       |
#      | PO       |
#      | PM       |

  @NYSED-2048 @NYSED-2051 @NYSED-1816 @NYSED-2049 @NYSED-2054 @NYSED-2056 @NYSED-2133 @NYSED-2050 @NYSEDSprint-22 @US-NYSED-1816 @M04 @DirectGrant-Yes
  Scenario Outline:  Verify Financial Details Fields are Disabled for Direct Grant Announcements.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    #NYSED-2050
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Cert Level | Available Balance |
    #NYSED-2049
    Then I softly cannot see field "Subaward Floor" inside page block
    Then I softly cannot see field "Subaward Ceiling" inside page block
    Then I softly cannot see field "Estimated Total Funding" inside page block
    Then I softly cannot see field "Estimated Number of Awards" inside page block
    Then I softly cannot see field "Estimated Total Funding" inside page block
    Then I softly cannot see field "Deficit Amount" inside page block
    Then I softly cannot see field "Justification for Deficit Amount" inside page block
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline |
      | BP01               | 50         | 150      | 100                |
    And I wait for "3" seconds
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:PM Username}  | Program Coordinator        |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I close "Associate Funding Accounts" modal by clicking the top right x button
     #NYSED-2051
    Then I softly cannot see row level action button "Edit" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "Record id" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "Record id" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    When I navigate to "Financials" sub tab
    #NYSED-2133
    Then I softly see "Financial Details" page block displayed
    #NYSED-2048
    Then I softly see field "Indirect Rate Type" inside page block
    Then I softly see field "Maximum Indirect Rate %" inside page block
    #NYSED-1816
    When I navigate to "Overview" sub tab
    Then I see only the following headers in table with id "---announcement:-:AnnouncementServiceArea1TableId---" :
      | Actions | EGMS ID | Title | Year Created |
    #NYSED-2054
    When I navigate to "Setup" sub tab
    Then I see only the following headers in table with id "---announcement:-:objectivesTableId---" :
      | Actions | EGMS ID | Title | Strategic Plan | Year Created |
    #NYSED-2056
    When I navigate to "Responsibilities" sub tab
    Then I see only the following headers in table with id "---announcement:-:approversTableId---" :
      | Actions | Name | Announcement | Award | Amendment Request | Payment Request | Monitoring |

    Examples:
      | UserType |
#      | FD       |
#      | FO       |
#      | PO       |
      | PM       |


  @NYSED-2055 @NYSED-2120 @NYSEDSprint-22 @US-NYSED-1816 @M04 @DirectGrant-No
  Scenario Outline:  Verify Project Director Field Hidden in Applications Section when  ‘Is Announcement for Direct Grant?’ is set to ‘NO’
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:ClosedFormulaAnnouncement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:ClosedFormulaAnnouncement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Related Log" sub tab
    Then I see only the following headers in table with id "RelatedFOApplications" :
      | Actions | EGMS ID | Application Title | Submitted On | Subrecipient Organization | Status |
    #NYSED-2120
    When I navigate to "Financials" sub tab
    Then I see only the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions | Funding Account | Fund Year | Funding Account Title | Funding Account Message | Available Balance | Pre-Encumbrance | Outstanding Encumbrance Balance | Expenditure Paid to Date |

    Examples:
      | UserType |
#      | FD       |
#      | FO       |
#      | PO       |
      | PM       |

  @NYSED-2132 @NYSEDSprint-22 @US-NYSED-1816 @M04 @DirectGrant-Yes
  Scenario Outline:  Verify with Internal user Financial Details section is hidden when ‘Is Announcement for Direct Grant’ setting is set to ‘Yes’ and Budget Type is Lump Sum’
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_YesSetti_DirectGrant" values from "Announcement_Field_Values.xlsx"
    And I enter value "Lump Sum" into field "Budget_Category_Package__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Comp_Dir_Edition_DG_LumpSum" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    Then I softly do not see "Financial Details" page block displayed

    Examples:
      | UserType |
#      | FD       |
#      | FO       |
#      | PO       |
      | PM       |

  @NYSED-2198 @NYSED-2195 @NYSEDSprint-23 @US-NYSED-1836 @M04 @DirectGrant-Yes
  Scenario Outline:  Verify that internal users can view the updated help texts, picklist values, and required fields on the Announcement – Competitive with Direct Grant No Settings.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    #NYSED-2195
    When I hovering mouse on help text icon inside page block detail "Year"
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    And I click modal button "Continue"
    When I enter "Creation_NoSetti_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "No" into field "IsAdvancePermitted__c"
    And I click modal button "Save and Continue"
    And I pause execution for "5" seconds
    And I enter "Comp_Dir_Edition_DirectGrant1" values from "Announcement_Field_Values.xlsx"
    When I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    When I navigate to "Overview" sub tab
    When I click on "Edit" in the page details
    #NYSED-2198
    Then I softly see fields "NYSEDDeputy_Area__c" is in edit mode
    Then I see only the following ordered options in dropdown field "NYSEDDeputy_Area__c" :
      | --None-- | P-12 | OHE | ACCES/SPEC ED | OCE | OP | OMS/PIMS |
    And I enter value "--None--" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Deputy Area is required in the Overview tab under the Information section. |
    And I enter value "P-12" into field "NYSEDDeputy_Area__c"
    When I click on "Save" in the page details
    Then I softly see field "Deputy Area" as "P-12"
    When I hovering mouse on help text icon inside page block detail "Year"
    Then I softly see "This Year field is used to populate the Fund Year's last two digits." shown as help text
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I hovering mouse on help text icon inside page block detail "Indirect Rate Type"
    And I wait for "3" seconds
    Then I softly see "Indicates the rate type that is allowed for the announcement. For Unrestricted, and Restricted rate types, please enter the "Maximum Indirect Rate %" only if you wish to limit the indirect rate % to a maximum rate for all applicants irrespective of the LEA-specific indirect rate uploaded in the GFMS for the fiscal year." shown as help text
    When I click on "Edit" in the page details
    Then I see only the following ordered options in dropdown field "Indirect_Rate_Type__c" :
      | --None-- | Restricted | Unrestricted | Not Allowed |

    Examples:
      | UserType |
#      | FD       |
#      | FO       |
      | PO       |
#      | PM       |

  @517291 @517292 @517296 @517309 @522710 @518725 @518733 @518738 @518756 @518774 @517310 @517318 @517320 @517323 @517858 @517861 @Sprint-08 @US-508409 @sanitysuite @M04Announcement
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' as a picklist field with Yes/No dropdown options is added at the create announcement modal->Information Section: Formula
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    #517291
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required. |
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    #517292
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required in the Information section. |
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    #517296
    Then I softly see field "Is Announcement for Direct Grant?" added after "Link For Additional Information"
    Then I softly see field "Is Announcement for Direct Grant?" is not editable
    Then I softly see field "Is Announcement for Direct Grant?" as "Yes"
    #517310
    Then I softly see field "Grant Abbreviation" added after "First Payment %"
    #517309
    Then I softly cannot see field "Application Due Date" inside page block
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts section" page block displayed
    Then I softly do not see "Q & A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block
    #522710
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?" inside page block
    And I get the "EGMS ID"
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
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    #518756
    Then I softly do not see "Contacts" inside page block detail
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    #518733
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    #518738
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    #517858
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I softly verify that the file "Applicants and Allocations.xlsx" is downloaded
    #517861
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "3" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
      #517318
    And I wait for "2" seconds
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see top right button "Delete Selected" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I see only the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      |  |  | Actions | Institution ID | SED Code | Applicants |
    #517320
    Then I see the following rows under the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      | Institution ID | SED Code | Applicants                   |
      | 166485411255   | CACP12   | {SavedValue:SubrecipientOrg} |
    Then I softly cannot see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see only the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Actions | Focus Area | Grant EGMS ID | Allocation Amount | Last Updated By | Last Updated |
    #517323
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area" in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I click on "Edit" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    Then I softly see fields "AllocatedAmount__c" is in edit mode
    When I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | 90.00             |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $9,000            |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | -44               |
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Allocation Amount can not be less than zero. |
    When I click on "Undo" icon for "Automation Permanent Focus Area" inside flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area | #$^&              |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaFocusAreaInvitedTableId---" by clicking "Edit" :
      | Focus Area                      | Allocation Amount |
      | Automation Permanent Focus Area |                   |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name                      | Role                       |
      | {SavedValue:PM Username}  | Program Coordinator        |
      | {SavedValue:EXE Username} | Grants Finance Coordinator |
    When I click on "Submit For Approval" in the page details
    #518725
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section. |
    #518756
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role.         |
      | Overview Tab - At least one contact should have the 'Program Contact' Role.        |
    #518774
      | Overview Tab - Provide the Application Due Date.                                   |
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    #517314
    Then I softly cannot see top right dropdown button "Publish" in page detail
    Then I softly cannot see top right dropdown button "Revise" in page detail
    Then I softly cannot see top right dropdown button "Extend Dates" in page detail

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @517881 @517885 @517887 @517888 @517903 @517915 @517920 @517924 @517926 @Sprint-08 @US-508409 @M05
  Scenario Outline: Verify that the announcement owner can add rows or update existing rows in Excel, and upload the updated data in the Excel to the Applicants and Allocations section using the 'Upload Excel' action.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
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
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I softly verify that the file "Applicants and Allocations.xlsx" is downloaded
    Then I see row "2" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    And I Update "1500" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    When I click modal button "Close"
    And I wait for "3" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $1,500            |
    #517926
    Then I softly see value "$1,500" for title "Allocation Amount" against the value "Total" inside table "---announcement:-:formulaFocusAreaInvitedTableId---"
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    #517885
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "InstitutionID" value in "1" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "SEDCode" value in "1" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "Applicant" value in "1" row and "3" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    When I click modal button "Close"
   #517887
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area2" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area2" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area2" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                                                                                            |
      | Row #3 - Duplicate entry found for combination of Institution ID (166485411255) and Focus Area (Automation Permanent Focus Area2). Focus Area cannot be repeated for an Institution ID. |
      | Row #4 - Duplicate entry found for combination of Institution ID (166485411255) and Focus Area (Automation Permanent Focus Area2). Focus Area cannot be repeated for an Institution ID. |
    When I click modal button "Close"
    #517888
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
      | Row #3 - The Institution ID is missing.      |
      | Row #4 - The Institution ID is missing.      |
    When I click modal button "Close"
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Focus Area is missing.          |
      | Row #3 - The Focus Area is missing.          |
      | Row #4 - The Focus Area is missing.          |
    When I click modal button "Close"
    #517890
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
      | Row #3 - The Institution ID is missing.      |
      | Row #4 - The Institution ID is missing.      |
    And I click modal button "Close"
   #506253
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "-12564" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #3 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "123456789223" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789323" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789423" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.    |
      | Row #2 - Institution ID not found: 123456789223 |
      | Row #3 - Institution ID not found: 123456789323 |
      | Row #4 - Institution ID not found: 123456789423 |
    And I click modal button "Close"
    #517896
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "Automation Permanent Focus Area3" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area2" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "Automation Permanent Focus Area2" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                        |
      | The following rows contain Focus Areas that are not associated to the Announcement. |
      | Row #2 - Automation Permanent Focus Area3                                           |
      | Row #3 - Automation Permanent Focus Area2                                           |
      | Row #4 - Automation Permanent Focus Area2                                           |
    And I click modal button "Close"
    #517901
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                     |
      | Row #2 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #3 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #4 - The Allocation Amount must be positive.                                                 |
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                     |
      | Row #3 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #4 - The Allocation Amount must be positive.                                                 |
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "5" column in "Applicants and Allocations.xlsx"
    And I Update "1500" value in "4" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |  |
    And I click modal button "Close"
    And I expand nested table containing column value "{SavedValue:SubrecipientOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $1,000            |
    When I collapse nested table containing column value "{SavedValue:SubrecipientOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $0                |
    When I collapse nested table containing column value "{SavedValue:SubrecipientHealthOrg}"
    And I expand nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaFocusAreaInvitedTableId---" :
      | Allocation Amount |
      | $1,500            |
    When I collapse nested table containing column value "{SavedValue:SubrecipientSchoolOrg}"
    #517903
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "" value in "2" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "$@!&" value in "3" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "2" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    Then I softly see value "CACP12" for title "SED Code" against the value "{SavedValue:SubrecipientOrg}" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see value "NYH12" for title "SED Code" against the value "{SavedValue:SubrecipientHealthOrg}" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    Then I softly see value "NYS12" for title "SED Code" against the value "{SavedValue:SubrecipientSchoolOrg}" inside table "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    #517915
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "5000000" value in "2" row and "5" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                          |
      | Allocated amount for Subrecipient cannot be greater than the Estimated Total Funding. |
    And I click modal button "Close"
    #517920
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants and Allocations.xlsx"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientHealthOrg}" in file "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #517924
    Then I see the following rows under the following headers in table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |

    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @520170 @520176 @520179 @520181 @520208 @520256 @520257 @520262 @520263 @520264 @520273 @520274 @520276 @520277 @520278 @Sprint-08 @US-508409 @M05
  Scenario Outline: Verify that the Announcement Owner can see 'Is Announcement for Direct Grant?' field is required field at the create announcement modal->Information Section: Formula - By Applicant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    #520170
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    Then I softly see asterisk mark on "Is Announcement for Direct Grant?"
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required. |
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "CreationFor_ByAp_focusNo_DG_Yes" values from "Announcement_Field_Values.xlsx"
    Then I softly see field "Is Announcement for Direct Grant?" inside page block
    Then I see only the following ordered options in dropdown field "NYSED_IsDirecGrant__c" :
      | --None-- | Yes | No |
    When I enter in modal value "--None--" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    Then I softly see the following messages in the page details contains:
      | To Save, Is Announcement for Direct Grant? is required in the Information section. |
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly see field "Is Announcement for Direct Grant?" added after "Link For Additional Information"
    Then I softly see field "Is Announcement for Direct Grant?" is not editable
    Then I softly see field "Is Announcement for Direct Grant?" as "Yes"
    Then I softly see field "Grant Abbreviation" added after "First Payment %"
    Then I softly cannot see field "Application Due Date" inside page block
    #520176
    Then I softly do not see "Eligibility Details" page block displayed
    Then I softly do not see "Contacts section" page block displayed
    Then I softly do not see "Q & A Information" page block displayed
    Then I softly cannot see field "Maximum # Applications Allowed" inside page block
    Then I softly cannot see field "Is Application Deadline Soft?" inside page block
    And I navigate to "Financials" sub tab
    Then I softly cannot see field "Is a Detailed Budget Required on the Application?" inside page block
    And I get the "EGMS ID"
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
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    Then I softly do not see "Contacts" inside page block detail
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    #520178
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    #520257
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    Then I softly verify that the file "Applicants and Allocations.xlsx" is downloaded
    #520258
    Then I see row "1" contains value "{SavedValue:SubrecipientOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "2" contains value "{SavedValue:SubrecipientHealthOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    Then I see row "3" contains value "{SavedValue:SubrecipientSchoolOrg}" against the column name "Applicants" in the Excel file "Applicants and Allocations.xlsx"
    #520259
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    #520261
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "InstitutionID" value in "1" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "SEDCode" value in "1" row and "2" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful. The excel is not in the correct format. Please click the "Download in Excel" button to get the correct format. |
    When I click modal button "Close"
    #520217
    And I wait for "2" seconds
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Delete Selected" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I see only the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      |  | Actions | Institution ID | SED Code | Applicants | Grant EGMS ID | Allocation Amount | Last Updated By | Last Updated |
    #520255
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      |  | Actions     | Institution ID | SED Code | Applicants                         | Grant EGMS ID | Allocation Amount | Last Updated By | Last Updated              |
      |  | Action menu | 166485411256   | CACP12   | {SavedValue:SubrecipientOrg}       |               | $0                | Automation PM   | {Date:MM/DD/yyyy h:mm} AM |
      |  | Action menu | 166987654255   | NYH12    | {SavedValue:SubrecipientHealthOrg} |               | $0                | Automation PM   | {Date:MM/DD/yyyy h:mm} AM |
      |  | Action menu | 321456987443   | NYS12    | {SavedValue:SubrecipientSchoolOrg} |               | $0                | Automation PM   | {Date:MM/DD/yyyy h:mm} AM |
      |  |             |                | Total    |                                    |               | $0                |                 |                           |
    When I click on "Edit" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see fields "AllocatedAmount__c" is in edit mode
    Then I softly see field "Institution ID" is not editable
    Then I softly see field "SED Code" is not editable
    Then I softly see field "Applicants" is not editable
    And I click on top right button "Save" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    #520256
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Allocation Amount |
      | $0                |
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click on "Edit" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see fields "AllocatedAmount__c" is in edit mode
    When I click on "Save" in the page details
#    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
#      | Applicants                   | Allocation Amount |
#      | {SavedValue:SubrecipientOrg} | 44.2356           |
#    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
#      | Allocation Amount |
#      | $44               |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | -44               |
    Then I softly see the following messages in the page details contains:
      | Allocation Amount can not be less than zero. |
    When I click on "Undo" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Applicants                   | Allocation Amount |
      | {SavedValue:SubrecipientOrg} | #$5^&             |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Allocation Amount |
      | $0                |
    And I edit the following rows inline in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---" by clicking "Edit" :
      | Focus Area                         | Allocation Amount |
      | {SavedValue:SubrecipientSchoolOrg} |                   |
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Allocation Amount |
      | $0                |
    #520262
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "166485411255" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "166485411255" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                                      |
      | Row #3 - Duplicate entry found for Institution ID (166485411255). The Institution ID must be unique for each row. |
    When I click modal button "Close"
    #@520263
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly see the following messages in the page details contains:
      | Table exported successfully. You may close this window. |
    And I click modal button "Close"
    And I Update "" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below. |
      | Row #2 - The Institution ID is missing.      |
      | Row #3 - The Institution ID is missing.      |
    And I wait for "5" seconds
    When I click modal button "Close"
    #520264
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "-12564" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "3" seconds
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I wait for "3" seconds
    And I click modal button "Close"
    And I Update "1234567891231" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "1234567891231" value in "4" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #2 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
      | Row #4 - The Institution ID is invalid. The Institution ID should be a 12-digit number. |
    And I click modal button "Close"
    And I Update "123456789223" value in "1" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789323" value in "2" row and "1" column in "Applicants and Allocations.xlsx"
    And I Update "123456789423" value in "3" row and "1" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I wait for "5" seconds
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.    |
      | Row #2 - Institution ID not found: 123456789223 |
      | Row #3 - Institution ID not found: 123456789323 |
      | Row #4 - Institution ID not found: 123456789423 |
    And I click modal button "Close"
    #520273
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "$@!&" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                     |
      | Row #2 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #3 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #4 - The Allocation Amount must be positive.                                                 |
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "12.365" value in "3" row and "4" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                                     |
      | Row #3 - The Allocation Amount entered is invalid. The Allocation Amount must be a whole number. |
      | Row #4 - The Allocation Amount must be positive.                                                 |
    And I click modal button "Close"
    #520274
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "" value in "2" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "$@!&" value in "3" row and "2" column in "Applicants and Allocations.xlsx"
    And I Update "-12365" value in "4" row and "2" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I pause execution for "5" seconds
    And I click modal button "Close"
    #520276
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I delete row where column name "Applicants" and column value "{SavedValue:SubrecipientSchoolOrg}" in file "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    And I pause execution for "5" seconds
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I wait for "3" seconds
    And I click modal button "Close"
    And I refresh the page
    And I wait for "3" seconds
    #520277
    Then I see the following rows under the following headers in table with id "---announcement:-:formulaInvitedApplicatsTableId---" :
      | Applicants                         |
      | {SavedValue:SubrecipientOrg}       |
      | {SavedValue:SubrecipientHealthOrg} |
      | {SavedValue:SubrecipientSchoolOrg} |
    #520278
    Then I softly see value "$5" for title "Allocation Amount" against the value "Total" inside table "---announcement:-:formulaInvitedApplicatsTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name       | Announcement |
      | <Approver> | Step 1       |
    And I wait for "3" seconds
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    When I click on "Submit For Approval" in the page details
    #520176
    Then I softly cannot see the following messages in the page details contains:
      | Overview Tab - Select Eligible Applicant Types in the Eligibility Details section. |
    #520181
      | Overview Tab - At least one contact should have the 'Fiscal Contact' Role.         |
      | Overview Tab - At least one contact should have the 'Program Contact' Role.        |
    #520208
      | Overview Tab - Provide the Application Due Date.                                   |
      | Overview Tab - 'Is Application Deadline Soft?' is required to submit for approval. |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    #520215
    Then I softly cannot see top right dropdown button "Publish" in page detail
    Then I softly cannot see top right dropdown button "Revise" in page detail
    Then I softly cannot see top right dropdown button "Extend Dates" in page detail
    Examples:
      | UserType | Approver      |
      | PM       | Automation PM |
#      | PO       | Automation PO|
#      | FO       | Automation FO|
#      | FD       | Automation FD|

  @520275 @Sprint-08 @US-506812 @M05
  Scenario Outline:Verify that the announcement owner sees an error message if upload the excel for inviting Applicant without adding the Estimated Total Funding in the Announcement. OR allocation amount is greater than the Estimated Total Funding amount.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "1000" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                          |
      | Allocated amount for Subrecipient cannot be greater than the Estimated Total Funding. |
    And I click modal button "Close"
    And I delete the excel file "Applicants and Allocations.xlsx"
    And I click on top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I pause execution for "5" seconds
    And I click modal button "Close"
    And I Update "2000" value in "2" row and "4" column in "Applicants and Allocations.xlsx"
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I upload the excel file "Applicants and Allocations.xlsx"
    Then I softly see the following messages in the page details contains:
      | Upload unsuccessful due to the errors below.                                          |
      | Allocated amount for Subrecipient cannot be greater than the Estimated Total Funding. |
    And I click modal button "Close"

    Examples:
      | UserType |
      | PM       |
#      | PO      |
#      | FO      |
#      | FD      |

  @520279 @Sprint-08 @US-506812 @M05 @FuncnalityRemoved-NeedToRemoveAfterTestcasesMarkedasInvalid @skipOnJenkins
  Scenario Outline: Verify that the Peer Reviewer with Edit access YES, should see the following section-level actions and button on Applicants and Allocations table-- a. Add Organizations  b.  Upload Excel and c. Delete Selected
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    Then I softly cannot see the following messages in the page details contains:
      | Please provide Eligible Applicant Types and save the record, before adding any organization. |
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:flexGridApproverRolesTableId---" by clicking "New" :
      | Name       | Responsibility  | Description              | Due Date | Allow Record Editing |
      | <Reviewer> | Fiscal Reviewer | Review Financial details | 10       | Yes                  |
    And I click on "Send for Review" icon for "<Reviewer>" inside flex table with id "---announcement:-:flexGridApproverRolesTableId---" without waiting for record
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly see status in Progress-bar is "Submitted for Review" and is "dark blue"
    When I re-login to "As a Grantor" app as "<ReviewerUser>" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record id" in "---announcement:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    When I navigate to "Overview" sub tab
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Upload Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see top right button "Download in Excel" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Edit" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:SubrecipientOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:SubrecipientHealthOrg}" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    And I click on "Remove" icon for "{SavedValue:SubrecipientOrg}" inside flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    Then I do not see value "{SavedValue:SubrecipientOrg}" for title "Applicants" inside table "---announcement:-:formulaInvitedApplicatsTableId---"

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
      | PM       | PO           | {SavedValue:PO Username} |
#      | PO      | FO           | {SavedValue:FO Username}  |
#      | FO      | FD           | {SavedValue:FD Username}  |
#      | FD      | EXE          | {SavedValue:FD Username}  |
#      | EXE     | PM           | {SavedValue:PM Username}  |

  @535997 @535998 @536000 @536001 @US-504142 @NYSEDSprint-13 @M05 @DirectGrant-Yes @FS-10
  Scenario Outline:Verify that the ‘Is Detailed Budget Required on the Subaward?’ field is visible on the Formula Announcement layout, is set to 'Yes' by default, and is not editable when ‘Is Announcement for Direct Grant?’ is set to ‘Yes’ and the Budget Type is FS-10.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "CreationFormula_ByApp_focusNo" values from "Announcement_Field_Values.xlsx"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    #535997
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "Yes"
    #535998
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    #535997
    Then I softly see that "Is Detailed Budget Required on the Subaward?" rendered in view mode only
    #535998
    Then I softly see that "Budgeting is Required for:" rendered in view mode only
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Setup" sub tab
    #536000
    Then I softly do not see "Business Forms" page block displayed
    Then I softly see "Supporting Documents Checklist" page block displayed
    Then I softly do not see "Review Steps" page block displayed
    When I navigate to "Responsibilities" sub tab
    #536001
    Then I softly do not see "FDM" in flex table header "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:ActiveFundingOpportunitiesAllTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:ActiveFundingOpportunitiesAllTableId---"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I re-login to "As a Grantor" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    When I click toggle button to select "Formula Announcements - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside flex table with id "---announcement:-:formulaAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Organizations" in flex table with id "---announcement:-:formulaInvitedApplicatsTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientHealthOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I click "Add" after selection of "{SavedValue:SubrecipientSchoolOrg}" in the table "---announcement:-:formulaAddInviteApplicantTableId---"
    When I close "Add Organizations" modal by clicking the top right x button
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:PO Username} | Step 1       |
    When I navigate to "Financials" sub tab
    #535997
    Then I softly see field "Is Detailed Budget Required on the Subaward?" as "Yes"
    #535998
    Then I softly see field "Budgeting is Required for:" as "Only First Budget Period"
    And I click on "Edit" in the page details
    #535997
    Then I softly see that "Is Detailed Budget Required on the Subaward?" rendered in view mode only
    #535998
    Then I softly see that "Budgeting is Required for:" rendered in view mode only
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Responsibilities" sub tab
    #536001
    Then I softly do not see "FDM" in flex table header "---announcement:-:approversTableId---"
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PM | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    #536000
    Then I softly see field "Status" as "Submitted for Approval"
    When I navigate to "Responsibilities" sub tab
    #536001
    Then I softly do not see "FDM" in flex table header "---announcement:-:approversTableId---"
    When I re-login to "As a Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Announcements" tab
    And I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - All"
    When I perform quick search for "{SavedValue:Automation Runtime Announcement}" in "---announcement:-:formulaAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Announcement}" inside table
    And I wait for "3" seconds
    And I "Reject" in the approval decision
    Then I softly see field "Status" as "Rejected"
    When I navigate to "Responsibilities" sub tab
    #536001
    Then I softly do not see "FDM" in flex table header "---announcement:-:approversTableId---"

    Examples:
      | UserType | ReviewerUser | Reviewer                 |
#      | PM       | PO           | {SavedValue:PO Username} |
#      | PO      | FO           | {SavedValue:FO Username}  |
      | FO       | FD           | {SavedValue:FD Username} |
#      | FD      | EXE          | {SavedValue:FD Username}  |
#      | EXE     | PM           | {SavedValue:PM Username}  |

  @NYSED-1183 @NYSEDSprint-21 @US-NYSED-928 @M04
  Scenario: Verify that the FD user sees the Pre-Encumbrance and Available Balance amounts correctly populated with proper calculations on the funding account related to the GSPS funding source when the announcement is approved. Negative Value: Direct Grant Type
    Given I login to "As a Grantor" app as "FD" user
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:externalFundingTableId---"
    When I enter in modal "External_fs_Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "External_FS_Edition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "FederalFundinAccountEdition" values from "FundingSource_Field_Values.xlsx"
    Given I navigate to "Overview" sub tab
    And I enter value "2026" into field "NYSED_Year__c"
    And I enter value "2020" into field "Fund_Code__c"
    When I enter value "10" into field "NYSED_BlanketVoucherCut__c"
    And I enter value "2000" into field "AppropriationBalance__c"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "FundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCE"
    And I save the field labeled "Title" as "FundingAccountTitle"
    When I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---fundingsource:-:fundingSourceTableId---"
    When I enter in modal "Creation" values from "FundingSource_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "Yes" into field "NYSED_GSPS__c"
    And I enter value "1000" into field "NYSED_Expenditure_Cap__c"
    And I wait for "5" seconds
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I click on top right button "New" in flex table with id "---fundingsource:-:fundingAccountTableId---"
    And I enter in modal "Funding Account Creation" values from "FundingSource_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Funding Account Edition" values from "FundingSource_Field_Values.xlsx"
    And I enter value "{Date:M/d/yyyy::d+50}" into field "NYSED_ExpDate__c"
    And I enter value "3000" into field "AppropriationBalance__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see field "Exp Date" as "{Date:M/d/yyyy::d+50}"
    And I save the field labeled "EGMS ID" as "StateFundingAccountID"
    And I save the field labeled "Funding Source" as "FUNDINGSOURCESTATE"
    And I save the field labeled "Title" as "StateFundingAccountTitle"
    When I click on "Activate" in the page details
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Active" and is "dark blue"
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "Automation Runtime Announcement"
    When I navigate to "Financials" sub tab
    And I click on top right button "Upload Excel" in flex table with id "---announcement:-:addOrganizationByAppFocusAreaTableId---"
    When I upload file "Applicants and Allocations Direct Grant Yes.xlsx" into library
    Then I softly see the following messages in the page details contains:
      | The allocation data is being processed. Please wait for a few minutes and refresh the page. You will also receive an email when processing is complete. |
    And I click modal button "Close"
    When I navigate to "Financials" sub tab
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:FundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:FundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    #NYSED-1186
    Then I softly see value "$2,000" for title "Cert Level" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
#    Then I softly see value "$1,000" for title "Pre-Encumbrance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    Then I softly see value "$2,000" for title "Available Balance" against the value "{SavedValue:FundingAccountID}" inside table "---announcement:-:fundingAccountsTableId---"
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:StateFundingAccountID}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:StateFundingAccountID}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    #NYSED-1186
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name                     | Announcement |
      | {SavedValue:FD Username} | Step 1       |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                |
      | Automation PO | Program Coordinator |
    When I enter the following values into flex table with id "---announcement:-:AnnouncementCoordinatorsTableId---" by clicking "Add" :
      | Name          | Role                       |
      | Automation FD | Grants Finance Coordinator |
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    And I click on "Submit For Approval" in the page details
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:FundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:FundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1186
    Then I softly see field "Cert Level" as "$2,000"
#    Then I softly see field "Pre-Encumbrance" as "$1,000"
    Then I softly see field "Available Balance" as "$2,000"
    And I navigate to "Planning" tab
    When I navigate to "Funding Sources" content inside "Setup" subheader on left panel
    When I perform quick search for "{SavedValue:StateFundingAccountID}" in "---fundingsource:-:fundingTableId---" panel
    And I click on "View" icon for "{SavedValue:StateFundingAccountID}" inside flex table with id "---fundingsource:-:fundingTableId---" without waiting for record
    And I wait for "2" seconds
    #NYSED-1186
    Then I softly see field "Cert Level" as "$3,000"
#    Then I softly see field "Pre-Encumbrance" as "$2,000"
    Then I softly see field "Available Balance" as "$3,000"

  @NYSED-7200 @Sprint-32 @US-NYSED-6293 @M05 @yugaC
  Scenario Outline: Verify that the FD user can see the Remove inline action for the added Funding account on the Announcements layout → Financials tab → Funding Accounts section when the announcement is in the created state.
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnn_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I click modal button "Continue"
    When I enter "Creation_CompDir_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    And I save the field labeled "EGMS ID" as "Announcement_EGMSID"
    When I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - All"
    And I perform quick search for "{SavedValue:Announcement_EGMSID}" in "---announcement:-:competitiveAnnouncementTableId---" panel
    And I click on "View" icon for "{SavedValue:Announcement_EGMSID}" inside flex table with id "---announcement:-:competitiveAnnouncementTableId---" without waiting for record
    When I navigate to "Financials" sub tab
    And I wait for "2" seconds
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    When I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I perform quick search for "{SavedValue:fundingAccount1}" in "---announcement:-:fundingAccTableId---" panel
    When I click "Associate" after selection of "{SavedValue:fundingAccount1}" by showing entries "All" in flex table with id "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I wait for "2" seconds
    Then I see only the following rows under the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions     | Funding Account EGMS ID      |
      | Action menu | {SavedValue:fundingAccount}  |
      | Action menu | {SavedValue:fundingAccount1} |
      |             | Total                        |
    And I wait for "2" seconds
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    Then I softly can see row level action button "Remove" against "{SavedValue:fundingAccount1}" in flex table with id "---announcement:-:fundingAccountsTableId---"
    And I click on "Remove" icon for "{SavedValue:fundingAccount1}" inside flex table with id "---announcement:-:fundingAccountsTableId---" without waiting for record
    Then I see only the following rows under the following headers in table with id "---announcement:-:fundingAccountsTableId---" :
      | Actions     | Funding Account EGMS ID     |
      | Action menu | {SavedValue:fundingAccount} |
      |             | Total                       |
    Examples:
      | UserType |
      | PM       |

  @NYSED-11027 @NYSED-Sprint-37 @US-NYSED-10667 @M04
  Scenario Outline:Verify that the Internal User see that at Announcement layout Overview tab->Applicants and Allocations section is moved to Financials tab after Funding Accounts section. - Formula (BA) type: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    When I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Formula" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Formula Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:formulaAnnouncementTableId---"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    And I enter "FormulaAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Formula_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Formula_Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly do not see "Applicants and Allocations" page block displayed
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    #NYSED-11027
    Then I see only the following ordered page blocks :
      | Financial Details          |
      | Funding Accounts           |
      | Applicants and Allocations |
      | Budget Specific Settings   |
      | Budget Period Details      |
      | Budget Categories          |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financials Tab - You must invite at least one applicant before submitting this Announcement. |

    Examples:
      | UserType |
      | PO       |
#      | PM      |
#      | FO      |
#      | FD      |

  @NYSED-11025 @NYSED-Sprint-37 @US-NYSED-10667 @M04
  Scenario Outline:Verify that the Internal User see that at Announcement layout Overview tab->Applicants section is moved to Financials tab after Funding Accounts section. - Competitive type: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Competitive Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    When I navigate to "Overview" sub tab
    And I enter value "GA" into field "NYSED_GrantAbbreviation__c"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    Then I softly do not see "Applicants" page block displayed
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    #NYSED-11025
    Then I see only the following ordered page blocks :
      | Financial Details          |
      | Funding Accounts           |
      | Applicants |
      | Budget Specific Settings   |
      | Budget Period Details      |
      | Budget Categories          |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financials Tab - You must invite at least one applicant before submitting this Announcement. |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |

  @NYSED-11026 @NYSED-Sprint-37 @US-NYSED-10667 @M04
  Scenario Outline:Verify that the Internal User see that at Announcement layout Overview tab->Applicants section is moved to Financials tab after Funding Accounts section. - Directed type: Direct Grant
    Given I activate the internal program "Automation Runtime Active Program" with properties "default"
    Given I login to "As a Grantor" app as "<UserType>" user
    And I navigate to "Announcements" tab
    And I navigate to "Directed" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Directed Announcements - Created"
    And I click on top right button "New" in flex table with id "---announcement:-:annoucementTableId---"
    And I enter "DirectedAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I enter value "{SavedValue:Automation Runtime Active Program}" into field "Program__c"
    And I enter unique year value in field with APIName "NYSED_Year__c"
    When I enter in modal value "Yes" into field "NYSED_IsDirecGrant__c"
    And I wait for "5" seconds
    And I click modal button "Continue"
    When I enter "Creation_Allocation_NA_DG_Yes" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition_DirectGrantYes" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I navigate to "Overview" sub tab
    Then I softly do not see "Applicants" page block displayed
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date | Amendment Deadline | FS-10F Due Date |
      | BP01               | 50         | 150      | 60                 | 60              |
    #NYSED-11026
    Then I see only the following ordered page blocks :
      | Financial Details          |
      | Funding Accounts           |
      | Applicants |
      | Budget Specific Settings   |
      | Budget Period Details      |
      | Budget Categories          |
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | Financials Tab - You must invite at least one applicant before submitting this Announcement. |

    Examples:
      | UserType |
      | PM       |
#      | PO       |
#      | FO       |
#      | FD       |