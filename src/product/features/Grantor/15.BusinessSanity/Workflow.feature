@workflow @regression
Feature: Validate all scenarios of every modules flow

  @programFlow @ValidateFullProgramFlow @ValidateInternalProgramActivation
  Scenario: Validate Activation of Internal Program
    Given I am on "INTERNAL" portal
    And I login as "EXE" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter in modal "Creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I enter "Edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I see status in Progress-bar is "Created" and is "green"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:contactsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---program:-:associateContactsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | NA      |
    When I enter the following values into flex table with id "---program:-:approverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:FO Username} | Step 1  |
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:focusAreaTableId---"
    When I perform quick search for "Automation Permanent Focus Area" in "---program:-:associateFocusAreaTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---program:-:associateFocusAreaTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:objectivesTableId---"
    When I perform quick search for "Automation Permanent Objective" in "---program:-:associateObjectivesTableId---" panel
    When I click "Associate" after selection of "Automation Permanent Objective" in the table "---program:-:associateObjectivesTableId---"
    And I click on top right button "Associate" in flex table with id "---program:-:kpiTableId---"
    When I perform quick search for "Automation Permanent KPI" in "---program:-:associateKPITableId---" panel
    When I click "Associate" after selection of "Automation Permanent KPI" in the table "---program:-:associateKPITableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "Green"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "green"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:ProgramEGMSID}" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:ProgramEGMSID}" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see field "Status" as "Active"

  @programFlow @ValidateFullProgramFlow @ValidateExternalProgramActivation @ValidateNGOProgramActivation
  Scenario Outline: Validate Activation of External/NGO Program
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click on top right button "New" in flex table with id "---program:-:ExternalNGOProgramTableId---"
    When I enter "NGOCreation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I pause execution for "2" seconds
    And I enter "NGOEdit" values from "Program_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "5" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "ProgramEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | NA      |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                     | Program |
      | {SavedValue:PM Username} | Step 1  |
    When I enter the following values into flex table with id "---program:-:extapproverTableId---" by clicking "New" :
      | Name                      | Program |
      | {SavedValue:EXE Username} | Step 2  |
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---program:-:ExternalNGOProgramContactTableId---"
    When I click "Associate" after selection of "NGO Contact" by showing entries "All" in flex table with id "---program:-:associateContactsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---program:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---program:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "2" seconds
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Planning" tab
    When I navigate to "External Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "NGO Programs - All"
    When I perform quick search for "<Program Name>" in "---program:-:ExternalNGOProgramTableId---" panel
    And I click on "View" icon for "<Program Name>" inside flex table with id "---program:-:ExternalNGOProgramTableId---" without waiting for record
    And I click on "Activate" in the page details
    Then I softly see status in Progress-bar is "Active" and is "dark blue"

    Examples:
      | Program Name                                     |
      | {SavedValue:Automation Runtime External Program} |

  @FocusArea_KPI_Objective_WorkFlow
  Scenario: WorkFlow For Focus Area KPI & Objectives
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Planning" tab
    When I navigate to "Focus Areas" content inside "Setup" subheader on left panel
    And I click on top right button "New" in flex table with id "---focusarea:-:focusAreaTableId---"
    When I enter value "Automation Runtime Focus Area" into field "Title__c"
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    When I click on "Activate" in the page details
     #KPI
    And I navigate to "Planning" tab
    When I navigate to "Key Performance Indicators (KPI)" content inside "Setup" subheader on left panel
    And I click toggle button to select "Key Performance Indicators (KPI) - Draft"
    And I click on top right button "New" in flex table with id "---keyperformanceindicator:-:kpiTableId---"
    And I enter "Creation" values from "KPI_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "KPI_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Activate" in the page details
    #Objectives
    And I navigate to "Planning" tab
    When I navigate to "Strategic Plans" content inside "Setup" subheader on left panel
    And I click toggle button to select "Strategic Plans - Draft"
    And I click on top right button "New" in flex table with id "---strategicplan:-:StrategicPlansTableId---"
    And I enter in modal "StrategicPlanCreation" values from "StrategicPlan_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalObjectivesTableId---"
    When I enter in modal value "Automation Strategic Goal" into field "fieldStrategyTitle__c"
    When I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    When I click on top right button "New" in flex table with id "---strategicplan:-:strategicGoalRelatedObjectivesTableId---"
    When I enter in modal value "Automation Strategic Objective" into field "StrategyTitle__c"
    When I click modal button "Save and Continue"
    When I enter value "Automation Test Description" into field "fieldStrategyDescription__c"
    And I click on "Save" in the page details
    And I click on "Back To Strategic Goal" in the page details
    When I click on "Back To Strategic Plan" in the page details
    And I click on "Activate" in the page details

  @PublishAnn-Application
  Scenario: Validate Publish Announcement Submit Application Submit
    When I login to "Grantor" app as "EXE" user
    And I navigate to "Announcements" tab
    When I navigate to "Competitive" content inside "Announcements" subheader on left panel
    And I click toggle button to select "Draft Competitive Announcements"
    And I click on top right button "New" in flex table with id "---announcement:-:competitiveAnnouncementTableId---"
    And I enter "CompetitiveAnnouncement" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Continue"
    When I enter "Creation Second Negotiation" values from "Announcement_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AnnEGMSID"
    And I save the field labeled "Announcement Name" as "Automation Runtime Announcement Application Review"
    When I click on "Edit" in the page details
    And I enter "Edition" values from "Announcement_Field_Values.xlsx"
    And I click on "Save" in the page details
    Then I softly see status in Progress-bar is "Created" and is "Green"
    When I navigate to "Financials" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "{SavedValue:fundingAccount}" in the table "---announcement:-:fundingAccTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I refresh the page
    Given I edit the following rows inline in flex table with id "---announcement:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Pre-Encumbrance |
      | {SavedValue:fundingAccount} | 100             |
    When I navigate to "Financials" sub tab
    And I click on top right button "Add Budget Period" in flex table with id "---announcement:-:budgetPeriodTableId---"
    When I refresh the page
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:contactTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---announcement:-:annoucementContactTableId---"
    When I navigate to "Setup" sub tab
    And I click on top right button "Associate" in flex table with id "---announcement:-:objectivesTableId---"
    When I click "Associate" after selection of "Automation Permanent Objective2" in the table "---announcement:-:goalsTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---announcement:-:approversTableId---" by clicking "New" :
      | Name          | Announcement | FDM    | Award  | Amendment Request | Post Award Reporting | Payment Request | Monitoring | Closeout |
      | Automation PM | Step 1       | Step 1 | Step 1 | Step 1            | Step 1               | Step 1          | Step 1     | Step 1   |
    And I click on "Edit" in the page details
    When I navigate to "Financials" sub tab
    And I enter value "Justified" into field "Justification__c"
    When I get the "EGMS ID"
    When I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---announcement:-:budgetPeriodTableId---" by clicking "Edit" :
      | Budget Period Name | Start Date | End Date |
      | BP01               | 50         | 150      |
    And I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see status in Progress-bar is "Approved" and is "Green"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AnnEGMSID}" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:AnnEGMSID}" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I click on "Publish" in the page details
    Then I see status in Progress-bar is "Published" and is "green"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Review}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Review}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I expand nested table containing column value "BP01"
    And I edit the following rows inline in flex table with id "---applicationReview:-:budgetTableId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match |
      | Construction  | 1000   | 100        | 100            |
    When I navigate to "Overview" sub tab
    When I click on "Edit" icon for "{SavedValue:SPI3 Username}" inside flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    And I enter value "Checked" into field "IsKeyContact__c"
    And I click on top right button "Save" in flex table with id "---applicationReview:-:flexGridAppContactTableId---"
    When I navigate to "Proposal" sub tab
    When I edit the following rows inline in flex table with id "---applicationReview:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Files" sub tab
    And I click on "Edit" icon for "Standard Assurances Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 1" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I click on "Edit" icon for "Program Application Form" inside flex table with id "---applicationReview:-:allFormsTableId---"
    When I enter "Form Fields 2" values from "Application_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    And I get the "EGMS ID"
    When I click on "Submit Application" in the page details

  @pre-applicatiomFlow
  Scenario: Validate Pre-Application flow
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement for Pre-App" and properties "PRE_APPLICATION_NEGOTIATION_YES"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Opportunities" tab
    And I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Not Yet Qualified Opportunities - All"
    And I perform quick search for "{SavedValue:Automation Runtime Announcement for Pre-App}" in "---applicationIntake:-:activeOpportunitiesTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement for Pre-App}" inside table
    When I click on "Qualify" in the page details
    And I click on "Create Pre-Application" in the page details
    When I click modal button "Save and Continue"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Given I click on "Edit" in the page details
    And I enter "Edition" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I navigate to "Overview" sub tab
    When I save the field containing "Program Income Allowed?" as "Yes"
    And I edit the following rows inline in flex table with id "---preApplication:-:preAppContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Contact |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked        |
    And I navigate to "Budget" sub tab
    Given I expand nested table containing column value "BP01"
    Then I softly see field "Other Leverage" inside page block
    And I edit the following rows inline in flex table with id "---preApplication:-:preApplicationAttachmentId---" by clicking "Edit" :
      | Category Name | Budget | Cash Match | Non-Cash Match | Other Leverage |
      | Construction  | 5000   | 5000       | 50             | 100            |
    When I navigate to "Files and Forms" sub tab
    And I click on "Edit" icon for "Standard Pre-Application form" inside flex table with id "---preApplication:-:preAppFormTableId---"
    And I enter "Form_Edit" values from "PreApplication_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---home:-:internalHomePendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---home:-:internalHomePendingTaskTableId---"
    When I click on "Accept" in the page details

  @subawardactivateFlow
  Scenario: Activate the subaward
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "GrantFields1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Subaward Title" as "Automation Runtime award"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account             | Encumbrance |
      | {SavedValue:fundingAccount} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    And I switch to iframe with id "---paymentRequest:-:PaymentRequestModalIframeId---"
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    And I switch to iframe with id "---progressreport:-:ProgressReportModalIframeId---"
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI3 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 1 |
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details

  @reimbursementPaymentRequest
  Scenario: rimbursement payment request
    And I activated standalone subaward "Automation Runtime award" with properties "NO_ADVANCE_PERMISSION"
    And I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement |
      | Extra Salary | The narrative | 30         | 1        | Feet        |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action |
      | {SavedValue:fundingAccount} | 30                    |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"

  @AdvancePaymentRequest
  Scenario: Advance Payment Request
    And I activated standalone subaward "Automation Runtime award" with properties "default"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"

  @progressReportWorkflow
  Scenario: progress report
    Given I activated standalone subaward "Automation Runtime award" with properties "default"
    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                      | Progress Report |
      | {SavedValue:EXE Username} | Step 1          |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - Approved"
    Then I see value "Approved" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:internalProgressReportFlexTableId---"

  @SiteVisitFlow
  Scenario: Sitevisit Flow
    Given I activated standalone subaward "Automation Runtime Award Site Visit" with properties "default"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    And I perform quick search for "{SavedValue:Automation Runtime Award Site Visit}" in "GrantorActiveGrantsgrid" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "GrantorActiveGrantsgrid"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside flex table with id "---sitevisits:-:GrantsSubAwardsTableId---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Site Visit" in flex table with id "---sitevisits:-:InitiateSiteVisitTableId---"
    And I pause execution for "4" seconds
    And I enter "Creation" values from "SiteVisit_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "SiteVisit_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---sitevisits:-:approverSiteVisitTableId---" by clicking "New" :
      | Name                      | Site Visit |
      | {SavedValue:EXE Username} | Step 1     |
    When I get the "EGMS ID"
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:participantsTableId---"
    When I click "Associate" after selection of "Automation SPA" in the table "---sitevisits:-:siteVisitContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---sitevisits:-:associateAwardSiteVisitsTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---sitevisits:-:awardSiteVisitsTableId---"
    And I click on "Notify" in the page details
    When I click on "Conduct" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    And I navigate to "Reports and Outcomes" sub tab
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---sitevisits:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:manageSiteVisitTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---sitevisits:-:manageSiteVisitTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---sitevisits:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---sitevisits:-:correctiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Site Visits" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Site Visit Reports - All"
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Site Visit}" inside table
    And I click on "Accept And Close" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "Green"

  @DeskReviewFlow
  Scenario: Desk Review Flow
    Given I activated standalone subaward "Automation Runtime Award Desk Review" with properties "default"
    Given I activated standalone subaward "Automation Runtime Award Record" with properties "default"
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award Desk Review}" in "---deskreview:-:internalActiveGrants---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalActiveGrants---"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime Award Desk Review}" inside flex table with id "---deskreview:-:internalRelatedAwards1---"
    Given I navigate to "Management" sub tab
    And I click on top right button "Initiate Desk Review" in flex table with id "---deskreview:-:managementInitiateDRtableid---"
    And I enter "Creation" values from "DeskReview_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I enter "Edition" values from "DeskReview_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "DeskReview"
    Given I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---deskreview:-:approverDeskReviewTableId---" by clicking "New" :
      | Name                      | Desk Review |
      | {SavedValue:EXE Username} | Step 1      |
    Given I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---deskreview:-:participantsTableId---"
    When I click "Associate" after selection of "{SavedValue:EXE Username}" in the table "---deskreview:-:deskReviewContactsTableId---"
    And I click on top right button "Associate" in flex table with id "---deskreview:-:associateAwardDeskReviewTableId---"
    When I click "Associate" after selection of "{SavedValue:Automation Runtime Award Record}" in the table "---deskreview:-:awardDeskReviewTableId---"
    And I click on "Notify" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---sitevisits:-:monitoringTabPhasePendingTasks---"
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Given I click on "Conduct" in the page details
    And I navigate to "Reports and Outcomes" sub tab
    When I enter the following values into flex table with id "---deskreview:-:correctiveTableId---" by clicking "New" :
      | Title                  | Description            | Type        |
      | Automation Finding     | Automation Description | Finding     |
      | Automation Concern     | Automation Description | Concern     |
      | Automation Observation | Automation Description | Observation |
    When I click on "Edit" icon for "General Review Form" inside flex table with id "---deskreview:-:reportsTableId---"
    And I enter "Form Fields" values from "DeskReview_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Back" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    Given I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:monitoringTabPhasePendingTasks---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---deskreview:-:monitoringTabPhasePendingTasks---"
    When I navigate to "Reports and Outcomes" sub tab
    And I expand nested table containing column value "Automation Observation"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                               | Description            | Status      | Due Date | Assigned To                |
      | Automation Observation Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Observation"
    And I expand nested table containing column value "Automation Concern"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Concern Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    When I collapse nested table containing column value "Automation Concern"
    And I expand nested table containing column value "Automation Finding"
    When I enter the following values into flex table with id "---deskreview:-:deskReviewCorrectiveTableId---" by clicking "New" :
      | Title                           | Description            | Status      | Due Date | Assigned To                |
      | Automation Finding Subrecipient | Automation Description | In-Progress | 30       | {SavedValue:SPI3 Username} |
    And I collapse nested table containing column value "Automation Finding"
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Desk Reviews" content inside "Monitoring Activities" subheader on left panel
    When I perform quick search for "Record Id" in "---deskreview:-:deskReviewGridViewTableId---" panel
    And I click on "View" icon for "Record Id" inside flex table with id "---deskreview:-:deskReviewGridViewTableId---"
    And I click on "Accept And Close" in the page details
    Then I softly see status in Progress-bar is "Closed" and is "Green"

  @CloseoutWorkFlow
  Scenario: Closeout WorkFlow
    And I activated standalone subaward "Automation Runtime Award for closeout" with properties "Automation PO user" of type "Competitive"
    When I login to "Grantor" app as "PO" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    Then I softly see field "Status" as "Completed"

  @AwardLevelRiskAssesment
  Scenario: Award Level Risk Assessment
    Given I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Management" sub tab
    When I click on top right button "New" in flex table with id "---subAwardStandAlone:-:riskAssessmentTableId---"
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I enter "Risk Assessment" values from "Award_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I get the "EGMS ID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:riskAssessmentApproverTableId---" by clicking "New" :
      | Name                     | Risk Assessment |
      | {SavedValue:FO Username} | Step 1          |
    And I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see that "EGMS ID" is in "Active" status

  @OrganizationalRiskAssessment
  Scenario: Organizational Risk Assessment
    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    When I create a risk assessment record for organization "Automation Permanent Organization for Risk Assessment"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SA" user
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Automation Permanent Organization for Risk Assessment" in "---orgRiskAssessment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Automation Permanent Organization for Risk Assessment" inside flex table with id "---orgRiskAssessment:-:pendingTaskTableId---" without waiting for record
    And I enter "Risk Assessment Creation" values from "Award_Field_Values.xlsx"
    When I click on "Save and Continue" in the page details
    And I navigate to "Assessment" sub tab
    And I enter "OrgAssessmentValues" values from "RiskAssessment_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    When I click on "Submit" in the page details
    Then I see status in Progress-bar is "Active" and is "Green"

  @NegotiationWorkFlow
  Scenario: Negotiation Workflow
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---" without waiting for record
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I navigate to "Negotiations" sub tab
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition" values from "Negotiations_Field_Values.xlsx"
    When I click on "Save" in the page details
    When I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---negotiation:-:homePendingTasks---"
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I enter values into fields
      | Value                              | Field                |
      | Automation Negotiation Iniatiation | ApplicantResponse__c |
    When I click on "Save" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:internalHomePendingTableId---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:internalHomePendingTableId---"
    When I click on "Complete Negotiation" in the page details
    And I navigate to "Negotiations" sub tab
    Then I softly see field "Negotiation Request Status" as "Complete" in "Negotiation Request Details" pageblock

  @ApplicationReviewtoapprovedFDMWorkFlow
  Scenario Outline: Application Review WorkFlow
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    When I initiated an application review for application "<Announcement Name>" on announcement "<Announcement Name>" with properties "default"
    And I login to "Grantor" app as "dynamicUser" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "<Application Name>"
    When I click on "View" icon for "<Application Name>" inside table
    And I get the "EGMS ID"
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---" with wait for record
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
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
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Pre-Screen Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    And I wait for "2" seconds
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Program Review    | 5           |
      | Fiscal Review     | 5           |
      | Compliance Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                  |
      | {SavedValue:EXE Username} |
      | {SavedValue:FO Username}  |
      | {SavedValue:PM Username}  |
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Program Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:PM Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:PM Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Fiscal Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:FO Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:FO Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    When I expand nested table containing column value "<Application Name>"
    And I click on "Assign" icon for "Compliance Review" inside flex table with id "---applicationReview:-:reviewFormsTableId---" with wait for record
    And I perform quick search for "{SavedValue:EXE Username}" in "---applicationReview:-:panelAppTableId---" panel
    And I check "{SavedValue:EXE Username}" boxes in flex table with id "---applicationReview:-:panelAppTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:panelAppTableId---"
    When I close "Assign Reviewers" modal by clicking the top right x button
    And I pause execution for "5" seconds
    And I check "All" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I pause execution for "2" seconds
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "SME Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to Next Step" in flex table with id "---applicationReview:-:appTableId---"
    And I click on "Next Review Step" in the page details
    When I edit the following rows inline in flex table with id "---applicationReview:-:formTableId---" by clicking "Edit" :
      | Form Name         | Due in Days |
      | Management Review | 5           |
    When I enter the following values into flex table with id "---applicationReview:-:reviewersTableId---" by clicking "Add" :
      | Reviewer                 |
      | {SavedValue:FO Username} |
    And I click on "Assign" icon for "{SavedValue:FO Username}" inside flex table with id "---applicationReview:-:reviewersTableId---"
    When I perform quick search for "<Application Name>" in "---applicationReview:-:assignApplicationsTableId---" panel
    And I check "<Application Name>" boxes in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I click on top right button "Assign" in flex table with id "---applicationReview:-:assignApplicationsTableId---"
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appreviewsTableId---"
    And I click on top right button "Send for Review" in flex table with id "---applicationReview:-:appreviewsTableId---"
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record ID" in "---applicationReview:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record ID" inside flex table with id "---applicationReview:-:pendingTaskTableId---"
    When I complete filling in the Review form with recommendation "Recommended"
    And I click on "Save" in the page details
    And I wait for "6" seconds
    When I click on "Submit" in the page details without processing
    When I click alert button "OK"
    And I wait for "5" seconds
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    And I navigate to "Reviews" content inside "Application Reviews" subheader on left panel
    When I click toggle button to select "Application Reviews - All"
    And I perform quick search for "<Announcement Name>" in "---applicationReview:-:announcementListTableId---" panel
    When I click on "View" icon for "<Announcement Name>" inside flex table with id "---applicationReview:-:announcementListTableId---"
    And I navigate to "Related Log" sub tab
    When I click on "View" icon for "Management Review" inside flex table with id "---applicationReview:-:reviewStepsTableId---"
    Then I softly see that "Review Completed" has been added in flextable with Id "---applicationReview:-:appreviewsTableId---"
    Then I softly can see top right button "Funding Decision Memo" in page detail
    When I check "<Application Name>" boxes in flex table with id "---applicationReview:-:appTableId---"
    And I click on top right button "Promote to FDM" in flex table with id "---applicationReview:-:appTableId---"
    Then I softly see field "Status" as "Completed"
    When I click on "Funding Decision Memo" in the page details
    Then I softly see field "Status" as "Created"
    And I get the "EGMS ID"
    When I click on "Edit" in the page details
    When I enter values into fields
      | Value                       | Field                 |
      | AuGr                        | GrantCode__c          |
      | Automation Test Description | fieldJustification__c |
    And I click on "Save" in the page details
    And I edit the following rows inline in flex table with id "flexGridFundingDecisionMemoApplications" by clicking "Edit" :
      | Application Title                                | Recommended Budget | Recommend for Funding | Comments    |
      | {SavedValue:Automation Runtime FDM Announcement} | 500                | Yes                   | Recommended |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardFromFDM:-:fdmApproverTableId---" by clicking "New" :
      | Name                     | FDM    |
      | {SavedValue:PM Username} | Step 1 |
    And I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I navigate to "Funding Decision Memo" sub tab
    Then I softly see value "Approved" for title "Final Decision" inside table "---subAwardFromFDM:-:recommendedAppTableId---"

    Examples:
      | Announcement Name                                | Application Name                                 |
      | {SavedValue:Automation Runtime FDM Announcement} | {SavedValue:Automation Runtime FDM Announcement} |

  @termsconditions123
  Scenario:
    Given I login to "Grantor" app as "ADMIN" user
    When I navigate to "Planning" tab
    And I navigate to "Terms and Conditions" content inside "Setup" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:termsAndConditionsTableId---"
    And I enter "Creation" values from "TermsandConditions_Field_Values.xlsx"
    When I click modal button "Save"
    When I save the field labeled "EGMS ID" as "EGMSID"
    When I close "Create Terms and Conditions" modal by clicking the top right x button
    When I perform quick search for "{SavedValue:EGMSID}" in "---home:-:termsAndConditionsTableId---" panel
    Then I softly see value "Active" for title "Status" against the value "{SavedValue:EGMSID}" inside table "---home:-:termsAndConditionsTableId---"

  @GrantorSideAmendmentRequestWorkflow
  Scenario:
    And I activated standalone subaward "Automation Runtime Amendment Award" with properties "default"
    When I login to "Grantor" app as "PM" user
    And I navigate to "Grants" tab
    And I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Amendment Award}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Amendment Award}" inside flex table with id "---subAwardStandAlone:-:activeGrantsTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    When I perform quick search for "Activated" in "---subAwardStandAlone:-:subawardsTableId---" panel
    And I click on "View" icon for "Activated" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:amendmentRequestTableId---"
    When I enter "Scope&BudgetPeriod_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPC&ScopeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Amendment Award}"
    When I click on "Edit" in the page details
    And I enter "BudgetPeriodChange_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "fieldNewBudgetPeriodEndDate__c"
    And I enter "ScopeOfWork_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    When I click on "Submit for Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPC&ScopeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:budgetPC&ScopeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"

  @SubrecipientSideAmendmentRequestWorkflow
  Scenario:
    And I activated standalone subaward "Automation Runtime Award" with properties "Automation PO user"
    When I am on "SUBPORTAL" portal
    And I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Grants" tab
    When I navigate to "Subawards" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Subawards  - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---amendment:-:recipientsSubawardTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---amendment:-:recipientsSubawardTableId---" without waiting for record
    And I navigate to "Management" sub tab
    And I click on top right button "New" in flex table with id "---amendment:-:recipientAwardAmendmentRequestTableId---"
    When I enter "SubRecipientBPC_Creation" values from "AmendmentRequest_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "budgetPChangeId"
    And I get the updated budget end date by offset "1" for award "{SavedValue:Automation Runtime Award}"
    When I click on "Edit" in the page details
    And I enter "SubRecipientBPC_Edition" values from "AmendmentRequest_Field_Values.xlsx"
    And I enter value "4000" into field "fieldNewBudgetPeriodEndDate__c"
    And I click on "Save" in the page details
    And I save the field labeled "New Budget Period End Date" as "updatedBudgetPeriodDate"
    Then I see status in Progress-bar is "Created" and is "Green"
    And I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I edit the following rows inline in flex table with id "---amendment:-:projectAreasTableId---" by clicking "Edit" :
      | Title                           | End Date                             |
      | Automation Permanent Focus Area | {SavedValue:updatedBudgetPeriodDate} |
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---amendment:-:fundingChangeApproversTableId---" by clicking "New" :
      | Name                      | Amendment Request |
      | {SavedValue:EXE Username} | Step 1            |
    When I click on "Submit for Approval" in the page details
    And I pause execution for "3" seconds
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Amendment Requests" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Amendment Requests - All"
    When I perform quick search for "{SavedValue:budgetPChangeId}" in "---amendment:-:grantorAmendmentRequestsTableId---" panel
    And I click on "View" icon for "{SavedValue:budgetPChangeId}" inside flex table with id "---amendment:-:grantorAmendmentRequestsTableId---" without waiting for record
    And I click on "Amend Subaward" in the page details
    When I click on "Activate" in the page details
    Then I softly see field "Status" as "Activated"

  @SubrecipientOrganizationRegistrationFlow
  Scenario: Verify Subrecipient Organization Registration Process
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    When I enter value as "123456780" into "Employer Identification Number (EIN)" on old form
    And I generate the random UEI and save as "UEI"
    When I enter value as "{SavedValue:UEI}" into "Unique Entity Identifier (UEI)" on old form
    When I click on "Save and Continue" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    #    TODO: Extra Save step to be removed after bug-237206
    And I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldPrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "190" seconds
    And I refresh the page
    And I click on mail with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    #Create Secondary User
    And I click on top right button "New" in flex table with id "---home:-:userContactsTableId---"
    And I enter "Secondary_User" values from "SubrecipientOrganization_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID1"
    And I enter value "{SavedValue:uniqueEmailID1}" into field "fieldEmail"
    When I click on "Save" in the page details
    When I close "Create Contact" modal by clicking the top right x button
    And I refresh the page
    And I save the value from row "1" for column name "Full Name" as "Automation Runtime Contact" from flex table "---home:-:userContactsTableId---"
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:userContactsTableId---" without waiting for record
    And I click "Send" button in modal
    Then I softly see confirmation box with body "Email sent succesfully." is displayed
    When I click modal button "Ok"
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "190" seconds
    Then I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID1}" with subject "Sandbox: Notification: Invitation to be a user of EGMS"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID1}"
    And I pause execution for "190" seconds
    And I refresh the page
    And I click on mail with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details

  @IndividualUserRegistrationFlow
  Scenario:Verify Individual User Registration Process
    Given I begin "Individual" registration
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I generate the random SSN and save as "SSN"
    When I enter value as "{SavedValue:SSN}" into "Social Security Number (SSN)" on old form
    And I generate the random EmailID and save as "uniqueEmailID"
    When I enter value as "{SavedValue:uniqueEmailID}" into "Email" on old form
    When I enter value as "1234" into "Vendor ID" on old form
    When I click on "Save and Continue" in the page details
    And I enter "PrimaryRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "fieldSameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Your registration request for access to EGMS has been completed and sent for government approval.Once approved, you will be sent another email from salesforce.com (technology platform provider) with your Username and Password shortly to log into the system. |
    And I am on "INTERNAL" portal
    And I login to "Grantor" app as "dynamicUser" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:uniqueEmailID}" in "{grantor_tableId:SubrecipientIndRegistration}" panel
    When I click on "Start" icon for "{SavedValue:uniqueEmailID}" inside flex table with id "{grantor_tableId:SubrecipientIndRegistration}"
    And I "Approve" in the approval decision
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "190" seconds
    And I refresh the page
    And I click on mail with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Individual Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Individual Subrecipient" in the page details

  @SMEreviewerFlow
  Scenario:
    Given I login to "Grantor" app as "EXE" user
    When I navigate to "Home" tab
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    When I click on top right button "New" in flex table with id "---home:-:reviewersTableId---"
    And I enter "Creation" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I generate the random EmailID and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "fieldEmail"
    When I click modal button "Save"
    And I save the contact name as "Automation Runtime Contact"
    And I navigate to "SME Reviewers" content inside "Contacts" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Contact}" in "---home:-:reviewersTableId---" panel
    And I click on "Send Invitation" icon for "{SavedValue:Automation Runtime Contact}" inside flex table with id "---home:-:reviewersTableId---" without waiting for record
    And I click "Send" button in modal
    Then I see the following messages in the page details :
      | Email Sent Successfully |
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "300" seconds
    And I refresh the page
    And I navigate to yopmail portal for "{SavedValue:uniqueEmailID}" with subject "Sandbox: Notification: You have been Invited to Register in theEnterprise Grants Management System (EGMS)"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I enter "Edition" values from "PotentialReviewersContact_Field_Values.xlsx"
    And I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I pause execution for "5" seconds
    Then I see the following messages in the page details contains:
      | Confirmation Message |
    And I checkout to yopmail with mailid "{SavedValue:uniqueEmailID}"
    And I pause execution for "40" seconds
    And I refresh the page
    And I click on mail with subject "Sandbox: Welcome to Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    And I select "My Profile" from user dropdown
    Then I see the header is "{SavedValue:Automation Runtime Contact}" in the page details

  @end-to-end-flow-paymentrequest-progressreport-closeout
  Scenario: end-to-end-flow-paymentrequest-progressreport-closeout
    Given I activated standalone subaward "Automation Runtime award" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO" of type "Competitive"
    And I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    #Advance-Request
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Actuals" sub tab
    And I click on top right button "Advance Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId"
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:budgetTableId---" by clicking "Edit" :
      | Budget Category | Advance Requested This Action |
      | Construction    | 10                            |
    When I navigate to "Files" sub tab
    When I click on "Attach" icon for "Mandatory" inside flex table with id "---paymentRequest:-:recipientAdvanceSupportiveDocumentChecklistTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    When I click on "Submit to Grantor" in the page details
    Then I see status in Progress-bar is "Submitted to Grantor" and is "green"
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountsAdvTableId---" by clicking "Edit" :
      | Funding Account             | Advance Requested This Action |
      | {SavedValue:fundingAccount} | 10                            |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:approversTableId---" by clicking "New" :
      | Name                     | Advance |
      | {SavedValue:FO Username} | Step 1  |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Advances" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId}" in "---paymentRequest:-:paymentrequestAdvancesTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId}" inside flex table with id "---paymentRequest:-:paymentrequestAdvancesTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId}" modal by clicking the top right x button
    Then I softly see field "Status" as "Paid"
    #Reimbursement Request
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---paymentRequest:-:recipientGrantTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientGrantTableId---" without waiting for record
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---paymentRequest:-:recipientAwardTableId---" without waiting for record
    When I navigate to "Actuals" sub tab
    And I click on top right button "Reimbursement Request" in flex table with id "---paymentRequest:-:paymentRequestTableId---"
    When I enter value "Automation Runtime Payment Request" into field "Title__c"
    And I click modal button "Save and Continue"
    When I enter "Edition" values from "PaymentRequest_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I save the field labeled "EGMS ID" as "PayreqId1"
    And I navigate to "Financials" sub tab
    When I click on "Show line items" icon for "Construction" inside flex table with id "---paymentRequest:-:paymentRequestBudgetTableId---" with wait for record
    When I enter the following values into flex table with id "---paymentRequest:-:paymentLineItemsTableId---" by clicking "New" :
      | Title        | Narrative     | Unit Price | Quantity | Measurement | Advance Applied |
      | Extra Salary | The narrative | 30         | 1        | Feet        | 10              |
    When I close "Payment Line Items" modal by clicking the top right x button
    And I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    And I navigate to "Financials" sub tab
    And I edit the following rows inline in flex table with id "---paymentRequest:-:fundingAccountTableId---" by clicking "Edit" :
      | Funding Account             | Net Spent This Action | Advance Applied This Action |
      | {SavedValue:fundingAccount} | 30                    | 10                          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---paymentRequest:-:ReimbursmentApproverTableId---" by clicking "New" :
      | Name                      | Reimbursement |
      | {SavedValue:EXE Username} | Step 1        |
    When I get the "EGMS ID"
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:pendingTaskTableId---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    And I navigate to "Reimbursements" content inside "Payments" subheader on left panel
    When I perform quick search for "{SavedValue:PayreqId1}" in "---paymentRequest:-:paymentrequestReimbursementTableId---" panel
    And I click on "View" icon for "{SavedValue:PayreqId1}" inside flex table with id "---paymentRequest:-:paymentrequestReimbursementTableId---" without waiting for record
    When I click on "Mark As Paid" in the page details
    And I enter in modal "Paid Details" values from "PaymentRequest_Field_Values.xlsx"
    When I click modal button "Save"
    When I close "{SavedValue:PayreqId1}" modal by clicking the top right x button
    Then I softly see field "Status" as "Paid"
    #Progress Report
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment "Attachment.pdf" of type "Others" from computer
    And I click on "Save" in the page details
    When I get the "EGMS ID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I click on "Back" in the page details
    When I click on "Submit to Grantor" in the page details
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name                      | Progress Report |
      | {SavedValue:EXE Username} | Step 1          |
    When I click on "Submit for Approval" in the page details
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Monitoring" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:Record Id}" inside table
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Progress Reports" content inside "Monitoring Activities" subheader on left panel
    And I click toggle button to select "Progress Reports - Approved"
    Then I see value "Approved" for title "Status" against the value "{SavedValue:Record Id}" inside table "---progressReport:-:internalProgressReportFlexTableId---"
    #Closeout
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime award}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime award}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "fieldJustification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I click on "Override" in the page details
    When I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "green"
    When I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I "Approve" in the approval decision
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Closeout" tab
    And I click toggle button to select "Closeouts - All"
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:CloseoutTableId---" panel
    And I click on "View" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:CloseoutTableId---"
    #TBC:completed status not updated due to bug change after bug reslved
    Then I softly see field "Status" as "Approved"

  @debug1
  Scenario: end-to-end-flow-paymentrequest-progressreport-closeout
    Given I login to "Grantor" app as "PM" user
    And I wait for "10" seconds
    When I select radio button "Reject" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I see confirmation box with quotes in body "Rejecting the FDM will update the 'Final Decision' for all applications in this FDM to 'Cancelled' and the system will not allow you to award any recommended applications in the FDM. Are you sure you wish to continue?" is displayed
    Then I softly see button "Continue" on confirmation pop-up
    Then I softly see button "Cancel" on confirmation pop-up
    And I click "Continue" on modal confirmation box
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see field "Status" as "Rejected"

  @TestingXSS
  Scenario: Testing xss
    When I login to "Grantor" app as "dynamicUser" user
    And I navigate to "Planning" tab
    When I navigate to "Internal Programs" content inside "Programs" subheader on left panel
    And I click toggle button to select "Internal Programs - Draft"
    And I click on top right button "New" in flex table with id "---program:-:programsTableId---"
    When I enter "xss_creation" values from "Program_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    When I enter "xss_edition" values from "Program_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I get the "EGMS ID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---program:-:peerReviewTableId---" by clicking "New" :
      | Reviewer Name | Responsibility   | Description                                                        | Due Date |
      | Automation PM | Program Reviewer | <script><img title="</script><img src onerror=alert(1)>"></script> | 10       |
    When I get the "EGMS ID"
    When I navigate to "Setup" sub tab
    When I enter the following values into flex table with id "---program:-:checklistTableId---" by clicking "Add" :
      | Description                                                                         | Required | Applies To  | Status |
      | <iframe src=http://subdomain1.portswigger-labs.net/dangling_markup/name.html name=" | Optional | Application | Active |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    When I click on "Upload Template" icon for "Not Applicable" inside flex table with id "---program:-:checklistTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" with description "<input onauxclick=alert(1)>" from computer
    Then I softly see the following messages in the page details contains:
      | File Attachment.pdf Uploaded successfully. |
    When I click modal button "Close"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---program:-:GrantorInternalProgramFilesTableId---"
    And I pause execution for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Program Artifacts" with description "<input onauxclick=alert(1)>" from computer
    Then I softly see the following messages in the page details contains:
      | File Attachment.pdf Uploaded successfully. |
    When I click modal button "Close"
    When I enter the following values into flex table with id "---program:-:internalProgramNotesTableId---" by clicking "New" :
      | Title                                                                    | Description                         |
      | <textarea><img title="</textarea><img src onerror=alert(1)>"></textarea> | <object data="javascript:alert(1)"> |
    Then I softly see the following messages in the page details contains:
      | Saved Successfully! |
    And I click on top right button "Send Email" in flex table with id "CommunicationHistory"
    And I send the email under collab tab with following details:
      | To                              | Cc                             | Subject | Body            |
      | pm.automation.merge@yopmail.com | exe.automation.qa2@yopmail.com | test    | Automation Test |
    Then I see the text "Email Sent Successfully." in modal

  @granteeExecution1 @443 @ValidatePMusershouldabletoCreateActivatetheKPI
  Scenario: Validate PM user should able to Create & Activate the KPI
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberPMUser}"
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "3" seconds
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I wait for "2" seconds
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I halt execution
#    And I "Submitted for Approval" award from application for opportunity "{SavedValue:Automation Runtime}" for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
#    And I updated award from application for title "{SavedValue:Automation Runtime Opportunity}" with properties "default"
#    And I activate the award for title "{SavedValue:Automation Runtime Opportunity}"
#    Adhoc Closeout API
#    And I halt execution
    And I "Created" standalone subaward "Automation Runtime Award" with properties "INDIRECT_COST_NO"
    And I updated direct grant award for title "{SavedValue:Automation Runtime Award}" with properties "default"
#    And I activate the award for title "{SavedValue:Automation Runtime Award}"
#    And I create adhoc closeout "{SavedValue:Automation Runtime Award}" for status "Completed" with properties "UPDATE_CLOSEOUT_TYPE"
#    And I create schedule closeout "{SavedValue:Automation Runtime Award}" for status "Created" with properties "default"
#    And I create schedule closeout "{SavedValue:Automation Runtime Award}" for status "Submitted to Grantor" with properties "default"
#    And I create schedule closeout "{SavedValue:Automation Runtime Award}" for status "Completed" with properties "default"#    And I "Submitted to Grantor" the "Progress Report" for title "Automation Runtime Award103116" with properties "default"
#    And I Created the schedule "Progress Report" for title "{SavedValue:Automation Runtime Award}" with properties "default"
#    And I update the schedule "Financial Report" in "Approved" state for title "Automation Runtime Award115221" with properties "FINAL_PROGRESS_YES"
#    And I "Approved" of type "Periodic Renewal" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "default"
#    When I login to "Grantee" app as "GRANTEE PM" user
#    And I navigate to "Grants" tab
#    When I navigate to "Grants" content inside "Grants, Awards & Amendment Requests" subheader on left panel
#    And I click toggle button to select "Grants - All"
#    When I perform quick search for "{SavedValue:Automation Runtime Award}" in "---grantee_tableId:-:GrantsTable---" panel
#    And I click on "View" icon for "{SavedValue:Automation Runtime Award}" inside flex table with id "---grantee_tableId:-:GrantsTable---" without waiting for record
#    Then I softly see field "Status" as "Active"
#    Then I softly see status in Progress-bar is "Active" and is "dark blue"
#    And I save the field labeled "EGMS ID" as "GrantEGMSID"
#    When I navigate to "Awards" sub tab
#    And I click on "View" icon for "Activated" inside flex table with id "---grantee_tableId:-:GrantsAwardsRevisionTableId---" without waiting for record
#    Then I softly see field "Status" as "Activated"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID"
#    And I navigate to "Overview" sub tab
#    And I save the field labeled "Award Issue Date" as "AwardIssueDate"
#    When I navigate to "Amendments" sub tab
#    And I click on "View" icon for "Approved" inside flex table with id "---grantee_tableId:-:AmendmentRequestTableId---"
#    When I click on "Submit to Grantor" in the page details
#    And I wait for "5" seconds
#    When I enter values into fields
#      | Value | Field                 |
#      | 0     | SubmittedToGrantor__c |
#    And I click modal button "Save"
#    And I click modal button "Close"
#    Then I softly see field "Status" as "Submitted to Grantor"
#    Then I can see top right button "Record Decision" in page detail
#    Then I can see top right button "Revise Amendment" in page detail
#    When I click on "Record Decision" in the page details
#    When I enter values into fields
#      | Value                       | Field             |
#      | Accepted                    | Decision__c       |
#      | {SavedValue:AwardIssueDate} | AwardIssueDate__c |
#      | Test                        | Comments__c       |
#    And I click modal button "Save"
#    And I click modal button "Close"
#    Then I softly see field "Status" as "Accepted"
#    And I click on "Amend Award" in the page details
#    Then I softly see status in Progress-bar is "Pending Activation" and is "dark blue"
#    When I click on "Activate Award" in the page details
#    Then I softly see field "Status" as "Activated"
#    Then I softly see status in Progress-bar is "Activated" and is "dark blue"
#    And I save the field labeled "EGMS ID" as "AwardEGMSID1"
#    And I "Created" of type "Carry Forward" amendment request for title "{SavedValue:Automation Runtime Award}" with properties "CARRY_FORWARD"
    And I halt execution

  @orgRegister
  Scenario:
    Given I begin "Organization" registration as "Register As Organization"
    When I click on "Agree" in the page details
    When I click on "Agree" in the page details
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I navigate to "Organization Profile" sub tab
    And I enter "CreationWithAllDetails" values from "UserRegistration_Field_Values.xlsx"
    And I enter value "Yes" into field "SameAsOrganizationAddress__c"
    When I click on "Save" in the page details
    And I enter "AuthorizedRepresentativeDetails" values from "UserRegistration_Field_Values.xlsx"
    And I generate the random maildropEmail and save as "uniqueEmailID"
    And I enter value "{SavedValue:uniqueEmailID}" into field "PrimaryRepEmail__c"
    When I click on "Save" in the page details
    When I click on "Submit" in the page details
    And I am on "INTERNAL" portal
    And I login to "Grantor" app as "PM" user
    When I navigate to "Pending Subrecipient Registrations" content inside "Organization" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Organization}" in "{grantor_tableId:SubrecipientOrganization}" panel
    When I click on "Start" icon for "{SavedValue:Automation Runtime Organization}" inside flex table with id "{grantor_tableId:SubrecipientOrganization}"
    And I "Approve" in the approval decision
    And I checkout to maildrop with mailid "{SavedValue:uniqueEmailID}"
    And I click on mail with subject "Sandbox: Welcome to GovGrants 3.0 Recipient Portal"
    And I navigate to reset password link
    Then I set password for the user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I see the header is "Subrecipient Organization" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Organization}" in the page details

  @debugtest
  Scenario:
#    And I "Created" award from application for opportunity "Automation Runtime1316489936" for title "Automation Runtime Opportunity65465" with properties "default-Grantee PO user"
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
    And I halt execution

  @testCheck
  Scenario:
#    And I login to "Grantor" app as "PM" user
#    When I re-login to "Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I published "Formula" type announcement having name "Automation Permanent Archived Formula Ann-By Applicant and Focus Area" and properties "BY_APPLICANT_FOCUS_AREA"
#    And I initiated an application review for application "{SavedValue:Automation Permanent FDM Approved Closed Formula Ann-By App and Focus Area}" on announcement "{SavedValue:Automation Permanent FDM Approved Closed Formula Ann-By App and Focus Area}" with properties "default"
#    And I created approved FDM on application "{SavedValue:Automation Permanent FDM Approved Closed Formula Ann-By App and Focus Area}"

  @InternalUserPwdCheckGrantee
  Scenario Outline: test
    When I login to "Grantee" app as "<InternalUser>" user
    When I navigate to "Home" tab

    Examples:
      | InternalUser    |
      | GRANTEE ADMIN   |
      | GRANTEE ADMIN1  |
      | GRANTEE EXE     |
      | GRANTEE PM      |
      | GRANTEE FO      |
      | GRANTEE PO      |
      | GRANTEE FD      |
      | GRANTEE AUDITOR |

  @InternalUserPwdCheckGrantor
  Scenario Outline: test
    When I login to "Grantor" app as "<InternalUser>" user
    When I navigate to "Home" tab

    Examples:
      | InternalUser |
      | ADMIN        |
      | ADMIN1       |
      | EXE          |
      | EXE1         |
      | PM           |
      | PM1          |
      | FO           |
      | FO1          |
      | PO           |
      | PO1          |
      | FD           |
      | FD1          |
      | AUDITOR      |

  @ExternalUserPwdCheckGrantor
  Scenario Outline: test
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<SubrecipientUser>" user
    When I navigate to "Home" tab

    Examples:
      | SubrecipientUser |
      | SPI3             |
      | SPA              |
      | SPI4             |
      | SA               |
      | IND              |
      | SME              |

  @ReloginTest
  Scenario Outline: test
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "<SubrecipientUser>" user
    When I navigate to "Home" tab
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab

    Examples:
      | SubrecipientUser |
      | SPI3             |

  @TestIssue
  Scenario:
    When I login to "Grantor" app as "GRANTEE PM" user
    When I navigate to "Home" tab
    When I re-login to "Grantor" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Home" tab

  @APITest
  Scenario:
    And I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "default"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    Given I created award from approved FDM with announcement "{SavedValue:Automation Runtime FDM Announcement}"
    And I activate award from FDM having application name "{SavedValue:Automation Runtime FDM Announcement}"
     # Direct Grant
    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
     # Progress Report
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "ProgressReports__c"
     # Payment Request
    Given I delete the record "{SavedValue:Automation Runtime Award}" from the object "Payment Request"
    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "PaymentRequest__c"
     # Closeout
    When I create a post award record "Closeout" for the Award "{SavedValue:Automation Runtime Award}" having object api name as "Closeout"

  @testchckAwards
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "ADVANCE_PERMISSIBLE_YES_FOCUS_AREA_NO-Automation PM1 user" of type "Competitive"
     #Progress Report
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    Given I delete the record "{SavedValue:Automation Runtime Award for closeout}" from the object "Progress Report"
    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime Award for closeout}" having object api name as "ProgressReports__c"
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:Record Id}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:Record Id}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Forms and Files" sub tab
    And I click on "Attach" icon for "Active" inside flex table with id "---progressReport:-:progressReportChecklistsTableId---" without waiting for record
    And I upload attachment without random number "Attachment.pdf" of type "Others" from computer
    And I pause execution for "5" seconds
    And I click modal button "Close"
    When I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "progID"
    And I click on "Edit" in the page details
    When I enter "Edition" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I navigate to "Performance" sub tab
    When I edit the following rows inline in flex table with id "---progressReport:-:kpiTableId---" by clicking "Edit" :
      | Title                    | Reported Date | Actual |
      | Automation Permanent KPI | 7             | 7      |
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Community Initiative Progress Report" inside flex table with id "---progressReport:-:formTableId---" without waiting for record
    And I switch to tab number "1"
    And I enter "Form Fields" values from "ProgressReport_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I close the tab
    When I click on "Submit to Grantor" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    And I navigate to "Monitoring" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:progID}" in "---progressReport:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:progID}" inside flex table with id "---progressReport:-:pendingTaskTableId---" without waiting for record
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---progressReport:-:approversTableId---" by clicking "New" :
      | Name           | Progress Report |
      | Automation PM1 | Step 1          |
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    #Closeout
    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - Active"
    When I perform quick search for "{SavedValue:Automation Runtime Award for closeout}" in "---closeout:-:grantsTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Award for closeout}" inside flex table with id "---closeout:-:grantsTableId---"
    When I navigate to "Requests" sub tab
    And I click on top right button "New" in flex table with id "---closeout:-:closeoutTableId---"
    When I enter in modal "Creation" values from "Closeout_Field_Values.xlsx"
    And I click modal button "Save and Continue"
    And I enter "Edition" values from "Closeout_Field_Values.xlsx"
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "closeoutID"
    When I click on "Save" in the page details
    And I click on "Edit" in the page details
    And I enter value "Automation Test justification" into field "Justification__c"
    When I click on "Save" in the page details
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---closeout:-:closeoutApproverTableId---" by clicking "New" :
      | Name                      | Closeout |
      | {SavedValue:EXE Username} | Step 1   |
    And I click on "Send To Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    When I click on "Edit" in the page details
    And I enter "Subrecipient fields" values from "Closeout_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I click on "Acknowledge" in the page details
    When I re-login to "Grantor" app as "Admin" user on "INTERNAL" portal
    And I navigate to "Home" tab
    Then I see "Ownership" inside "Reassign" is displayed
    When I navigate to "Ownership" content inside "Reassign" subheader on left panel
    And I select value "Automation PM" into field "input-1"
    And I select value "Automation PM1" into field "input-2"
    And I select module "Closeout" from reassign ownership dropdown
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutSourceTableId---"
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutSourceTableId---" panel
    When I check "{SavedValue:closeoutID}" boxes in flex table with id "---closeout:-:closeoutSourceTableId---"
    When I click table top right button "Transfer Ownership" in flex table with id "---closeout:-:closeoutSourceTableId---"
    Then I softly see confirmation box with body "When the ownership of the record is changed, all pending tasks assigned to the owner of the record will be reassigned automatically as well. Do you wish to proceed?" is displayed
    And I click "OK" on modal confirmation box
    And I pause execution for "30" seconds
    And I reset the table
    When I navigate to "Records of Target User" sub tab
    When I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:closeoutTargetTableId---" panel
    Then I see value "{SavedValue:closeoutID}" for title "Closeout ID" inside table "---closeout:-:closeoutTargetTableId---"
    And I pause execution for "2" seconds
    When I re-login to "Grantor" app as "PM1" user on "INTERNAL" portal
    When I navigate to "Closeout" tab
    And I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:closeoutID}" in "---closeout:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "{SavedValue:closeoutID}" inside flex table with id "---closeout:-:pendingTaskTableId---"
    And I refresh the page
    When I navigate to "Open Items" sub tab
    Then I softly see value "Submitted for Approval" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"
    When I click on "Override" in the page details
    Then I softly see field "Status" as "Overridden"
    When I navigate to "Open Items" sub tab
    Then I softly see value "Force Closed" for title "Status" against the value "{SavedValue:progID}" inside table "---closeout:-:closeoutPendingProgressReportCloseoutTableId---"

  @testChecking
  Scenario:
#    And I published "Competitive" type announcement having name "Automation Test Record" and properties "default"
#    And I initiated an application review for application "{SavedValue:Automation Test Record}" on announcement "{SavedValue:Automation Test Record}" with properties "default"
#    Given I delete the record "Automation Permanent Organization for Risk Assessment" from the object "ORGANIZATION RISKASSESSMENT"
    Given I login to "Grantor" app as "ADMIN" user
    When I navigate to "Home" tab

  @FFATAAward
  Scenario: Create bulk data for FFATA awards with 3 funding accounts
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "90000" into field "NewObligation__c"
    And I enter value "90000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-266" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-267" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-268" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-266       | 50000       |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-267       | 30000       |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-268       | 10000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 90000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status

  @FFATAAward1
  Scenario: Create bulk data for FFATA awards with 3 funding accounts
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA1" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "135000" into field "NewObligation__c"
    And I enter value "135000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-270" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-269" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-271" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-269       | 40000       |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-270       | 5000        |
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-271       | 90000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 135000       |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status

  @FFATAAward2
  Scenario: Create bulk data for FFATA awards with 1 funding accounts
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA2" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "100000" into field "NewObligation__c"
    And I enter value "100000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-272" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-272       | 100000      |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 100000       |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status

  @FFATAAward3 @FFATAExecution
  Scenario: Create bulk data for FFATA awards with internal funding source with 1 funding accounts
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "Enhanced Tuition Award" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "30000" into field "NewObligation__c"
    And I enter value "30000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "FA-ST-402" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-ST-402       | 30000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 30000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status

  @FFATAAward4 @FFATAExecution
  Scenario: Create bulk data for FFATA awards with external funding source with 1 funding accounts with invalid agency code
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "Art & Music Teacher Salary Reimbursement" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "40000" into field "NewObligation__c"
    And I enter value "40000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-261" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-261       | 40000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 40000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status

  @FFATAAward5 @FFATAExecution
  Scenario: Create bulk data for FFATA awards with external funding source with 1 funding accounts with invalid FAIN no
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "Teacher Development Program Grants" into field "ProjectTitle__c"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "60000" into field "NewObligation__c"
    And I enter value "60000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-262" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-262       | 60000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 60000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status

  @FFATAAward6 @FFATAExecution
  Scenario: Create bulk data for FFATA awards with external funding source with 1 funding accounts
    When I login to "As a Grantor" app as "SARAH PM" user
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I wait for "2" seconds
    And I enter "GrantsFFATA" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter in modal value "4201 Capital Grant Program" into field "ProjectTitle__c"
    When I click modal button "Save and Continue"
    And I save the field labeled "EGMS ID" as "GrantEGMSID"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    When I enter "Edition_FFATA" values from "Award_Field_Values.xlsx"
    And I enter value "29000" into field "NewObligation__c"
    And I enter value "29000" into field "TotalCommitment__c"
    And I click on "Save" in the page details
    And I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "FA-FD-274" in the table "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    And I wait for "3" seconds
    And I click modal button "Close"
    And I wait for "3" seconds
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account | Encumbrance |
      | FA-FD-274       | 29000       |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount |
      | Construction    | 29000        |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    And I wait for "3" seconds
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I wait for "3" seconds
    And I click modal button "Save"
    Then I refresh the page
    When I navigate to "Overview" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:associatedContactsTableId---" by clicking "Edit" :
      | Name         | Project Role             | Is Key Personnel |
      | Daniel Jacks | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name     | Award  |
      | Sarah PM | Step 1 |
    And I wait for "3" seconds
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I pause execution for "3" seconds
    And I click on "Submit for Approval" in the page details
    Then I see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    And I "Approve" in the approval decision
    And I wait for "2" seconds
    And I click on "Send to Subrecipient" in the page details
    And I wait for "2" seconds
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:subrecipientPendingtaskTableId---" without waiting for record
    And I click on "Accept after Approval" in the page details
    And I wait for "2" seconds
    When I re-login to "Grantor" app as "SARAH PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "{SavedValue:GrantEGMSID}" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "{SavedValue:GrantEGMSID}" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Activate" in the page details
    And I wait for "3" seconds
    Then I see that "Subaward" is in "Activated" status

  @testgranteesf
  Scenario:
    Given I create program records with status "Active" using "default" properties
      | Title                               | RecordType       |
      | Automation Runtime Internal Program | Internal Program |
      | Automation Runtime External Program | NGO Program      |
    And I halt execution
#    And I create program records with status "Approved" using "default" properties
#      | Title                                            |
#      | {SavedValue:Automation Runtime Program}          |
#      | {SavedValue:Automation Runtime External Program} |

  @testAmendmentRequest
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    And I create amendment request records with status "Created" using "default" properties
      | Title                                              | AmendmentType    | RecordType          |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal | Periodic/BP Renewal |
    And I create amendment request records with status "Sent To Subrecipient" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I create amendment request records with status "Acknowledged" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I create amendment request records with status "Submitted for Approval" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I create amendment request records with status "Approved" using "default" properties
      | Title                                              | AmendmentType    |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal |
    And I halt execution

  @testAmendmentRequest1
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    And I create subrecipient side amendment request records with status "Acknowledged" using "default" properties
      | Title                                              | AmendmentType        | RecordType        |
      | {SavedValue:Automation Runtime Award for closeout} | Budget Period Change | Formal Amendments |
    And I halt execution

  @testCarryForward
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "SECOND_FOCUS_AREA_BUDGET_CATEGORY" of type "Competitive"
    And I create amendment request records with status "Approved" using "default" properties
      | Title                                              | AmendmentType    | RecordType          |
      | {SavedValue:Automation Runtime Award for closeout} | Periodic Renewal | Periodic/BP Renewal |
    And I halt execution
    And I save the field labeled "Subaward Title" as "Automation Runtime New award"
    And I create subrecipient side amendment request records with status "Created" using "default" properties
      | Title                                     | GrantName                                          | AmendmentType | RecordType        |
      | {SavedValue:Automation Runtime New award} | {SavedValue:Automation Runtime Award for closeout} | Carry Forward | Formal Amendments |
#    And I create subrecipient side amendment request records with status "Approved" using "default" properties
#      | Title                             | GrantName                                  | AmendmentType | RecordType        |
#      | Automation Runtime New Award98104 | Automation Runtime Award for closeout92657 | Carry Forward | Formal Amendments |
    And I halt execution

  @testApplication
  Scenario:
#    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application" and properties "default"
    And I create program records with status "Active" using "default" properties
      | Title                      | RecordType       |
      | Automation Runtime Program | Internal Program |
    And I create announcement records with status "Published" using "default" properties
      | AnnouncementName                            | ProgramName                             | AnnType  | AllocationLevel |
      | Automation Runtime Announcement Application | {SavedValue:Automation Runtime Program} | Directed | N/A             |
#    And I halt execution
#    And I create pre-application records with status "Created" using "default" properties
#      | Title                              | AnnouncementName                                         |
#      | Automation Runtime Pre-Application | {SavedValue:Automation Runtime Announcement Application} |
#    And I halt execution
    And I create application records with status "Submitted to Grantor" using "default" properties
      | Title                          | AnnouncementName                                         | PreAppTitle |
      | Automation Runtime Application | {SavedValue:Automation Runtime Announcement Application} |             |
#    And I halt execution
    And I Initiated application review for multiple records on announcement
      | AnnouncementName                                         |
      | {SavedValue:Automation Runtime Announcement Application} |
#    And I halt execution
    And I initiate pre-screen review for announcements with properties "default"
      | AnnouncementName                                         | ReviewerName             |
      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:FO Username} |
#    And I halt execution
    And I submit review for announcements with properties "default"
      | ReviewName        | AnnouncementName                                         | ApplicationName                             |
      | Pre-Screen Review | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
    And I initiate SME review for announcements with properties "default"
      | AnnouncementName                                         | ReviewerName             | ReviewerName2             | ReviewerName3            |
      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:FO Username} | {SavedValue:EXE Username} | {SavedValue:PM Username} |
#    And I halt execution
    And I submit review for announcements with properties "default"
      | ReviewName | AnnouncementName                                         | ApplicationName                             |
      | SME Review | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
    And I initiate management review for announcements with properties "default"
      | AnnouncementName                                         | ReviewerName             |
      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:FO Username} |
    And I halt execution
#    And I submit review for announcements with properties "default"
#      | ReviewName        | AnnouncementName                                         | ApplicationName                             |
#      | Management Review | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
#    And I create FDM records with status "Created" using "default" properties
#      | AnnouncementName                                         | ApplicationName                             |
#      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution
#    And I initiate award for FDM records with properties "default"
#      | AnnouncementName                                         | ApplicationName                             |
#      | {SavedValue:Automation Runtime Announcement Application} | {SavedValue:Automation Runtime Application} |
#    And I halt execution

  @testCloseout
  Scenario:
    Given I activated standalone subaward "Automation Runtime Award for closeout" with properties "default" of type "Competitive"
#    And I create subawards records with status "Submitted to Grantor" using "default" properties
#      | Title                              | AwardName                                          | PaymentRequestType |
#    Given I activated standalone subaward "Automation Runtime Award" with properties "default" of type "Competitive"
#    And I create payment request records with status "Submitted to Grantor" using "default" properties
#      | Title                              | AwardName                                          | PaymentRequestType |
#      | Automation Runtime Payment Request | {SavedValue:Automation Runtime Award for closeout} | Reimbursement      |
#    And I create site visit or Desk Review records with status "Active" using "default" properties
#      | RecordType  | Title                          | AwardName                                          | AssociateAward                        | MonitoringType   |
#      | Site Visit | Automation Runtime Site Visit | {SavedValue:Automation Runtime Award for closeout} | {SavedValue:Automation Runtime Award} | Program & Fiscal |
#    And I create org level site visit or Desk Review records with status "Active" using "default" properties
#      | RecordType | Title                                    | AccountName                         | AssociateAward                        | MonitoringType   |
#      | Site Visit | Automation Runtime Org Level Desk Review | SAN DIEGO ELECTRICAL TRAINING TRUST | {SavedValue:Automation Runtime Award} | Program & Fiscal |
#    And I create closeout records with status "Approved" using "default" properties
#      | AwardName                                          | CloseoutType     |
#      | {SavedValue:Automation Runtime Award for closeout} | Early Completion |
#    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Payment Request"
#    When I create a post award record "PaymentRequest" for the Award "{SavedValue:Automation Runtime award}" having object api name as "PaymentRequest__c"
#    And I update schedule payment request records with status "Created" using "default" properties
#      | EGMSId                 | AwardName                             | PaymentRequestType |
#      | {SavedValue:Record Id} | {SavedValue:Automation Runtime award} | Reimbursement      |
#    Given I delete the record "{SavedValue:Automation Runtime award}" from the object "Progress Report"
#    When I create a post award record "ProgressReport" for the Award "{SavedValue:Automation Runtime award}" having object api name as "ProgressReports__c"
#    And I update schedule progress report records with status "Approved" using "default" properties
#      | EGMSId                 | AwardName                             |
#      | {SavedValue:Record Id} | {SavedValue:Automation Runtime award} |
    And I halt execution

  @CheckUserLogins
  Scenario: Check User Logins
    Given I login to "Grantor" app as "PM1" user
    And I navigate to "Planning" tab
    And I halt execution
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
#    When I re-login to "As a Grantor" app as "ADMIN1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I re-login to "Grantor" app as "PM" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    When I re-login to "As a Grantor" app as "PM1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "Grantor" app as "PO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "As a Grantor" app as "PO1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "Grantor" app as "FO" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I halt execution
#    And I re-login to "As a Grantor" app as "FO1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "As a Grantor" app as "FD" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "As a Grantor" app as "FD1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "Grantor" app as "EXE" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I halt execution
#    And I re-login to "As a Grantor" app as "EXE1" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "As a Grantor" app as "AUDITOR" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "As a Grantor" app as "SARAH PM" user on "INTERNAL" portal
#    And I navigate to "Planning" tab
#    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I re-login to "Grants Portal" app as "SPA" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I re-login to "Grants Portal" app as "SA" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I re-login to "Grants Portal" app as "IND" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I re-login to "Grants Portal" app as "SME" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
#    And I re-login to "Grants Portal" app as "SPI4" user on "SUBPORTAL" portal
#    And I navigate to "Grants" tab
    And I logout

    @testworkarounf @debug
    Scenario:
    When I login to "Grantor" app as "PM" user
   And I navigate to "Announcements" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "AN-TAO-8678" in "---announcement:-:pendingTaskTableId---" panel
    When I click on "View" icon for "AN-TAO-8678" inside flex table with id "---announcement:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision