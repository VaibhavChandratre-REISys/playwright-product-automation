@KSDEEnhancement
Feature: KSDE_CR_Update Label from “Application Files” to “Budget Files” + Validate button

  @KSDE-1669 @KSDE-1606 @ApplicationEnacement @KSDE-1671
  Scenario:Verify that Subrecipient User (SPI/SPA) does not see 'Application Files' label anywhere in the application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    And I wait for "3" seconds
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "3" seconds
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Overview" sub tab
    Then I softly do not see "Application Files" page block displayed
    Then I softly do not see field "Application Files" inside "Information" section
    Then I softly do not see field "Application Files" inside "Primary Place of Performance" section
    Then I softly do not see field "Application Files" inside "Opportunity Overview" section
    Then I softly do not see field "Application Files" inside "Application Overview" section
    Then I softly do not see field "Application Files" inside "Project Information" section
    Then I softly do not see "Application Files" in flex table header "---applicationIntake:-:applicationContactsTableId---"
    Then I softly do not see field "Application Files" inside "Acknowledgement" section
    Then I softly do not see field "Application Files" inside "System Information" section
    And I navigate to "Budget" sub tab
    And I wait for "3" seconds
    Then I softly do not see "Application Files" page block displayed
    Then I softly do not see field "Application Files" inside "Budget Narrative" section
    Then I softly do not see field "Application Files" inside "Budget Summary" section
    Then I softly see "Budget Periods" page block displayed
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    Then I see the following rows under the following headers in table with id "---announcement:-:announcementBudgetCategory---" :
      | Category Name              |
      | Special Populations        |
      | Supplies                   |
      | Software and Subscriptions |
      | Computing Devices          |
      | Equipment                  |
      | Professional Development   |
      | Contracted Services        |
      | Salaries                   |
      | Honorarium or Stipend      |
      | Travel Expenses            |
      | Advisory Committee         |
      | CTSO Advisor Expenses      |
      | Substitutes                |
      | Externships                |
      | Institutional Memberships  |
      | Administrative Costs       |
    When I navigate to "Proposal" sub tab
    Then I softly do not see "Application Files" page block displayed
    Then I softly do not see "Application Files" in flex table header "---applicationIntake:-:goalsAndObjectivesTableId---"
    Then I softly do not see "Application Files" in flex table header "---applicationIntake:-:kpiTableId---"
    #KSDE-1671
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Budget Files" page block displayed
    Then I softly do not see "Application Files" page block displayed
    Then I softly do not see "Application Files" in flex table header "---applicationReview:-:SupportingDocumentsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:SupportingDocumentsTableId---"
    Then I softly do not see "Application Files" in flex table header "---applicationReview:-:SupportingDocumentsTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationReview:-:SupportingDocumentsTableId---"
    Then I softly do not see "Application Files" in flex table header "---applicationReview:-:allFormsTableId---"
    Then I softly see "Total Records: 1" inside flex table with id "---applicationReview:-:allFormsTableId---"
    Then I softly do not see value "Application Files" for title "Form Name" inside table "---applicationReview:-:allFormsTableId---"
    Then I softly do not see "Application Files" in flex table header "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly do not see value "Application Files" for title "Title" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    Then I softly do not see "Application Files" in flex table header "---applicationIntake:-:ApplicationNotesTableId---"
    Then I softly see "No Records Found" inside flex table with id "---applicationIntake:-:ApplicationNotesTableId---"
    Then I softly do not see value "Application Files" for title "Title" inside table "---applicationIntake:-:ApplicationNotesTableId---"
    And I click on top right button "Add Files" in flex table with id "---applicationIntake:-:ApplicationAttachmentTableId---"
    And I wait for "5" seconds
    And I upload attachment without random number "Attachment.pdf" of type "General Assurances" from computer
    When I click modal button "Close"
    Then I softly see value "General Assurances" for title "Classification" inside table "---applicationIntake:-:ApplicationAttachmentTableId---"
    When I navigate to "History" sub tab
    Then I softly do not see "Application Files" page block displayed
    Then I softly see "No Records Found" inside snapshot history
    And I navigate to "Messages" sub tab
    Then I softly do not see "Application Files" page block displayed
    Then I softly see "No Records Found" inside flex table with id "---announcement:-:collabMessages---"
    Then I softly do not see value "Application Files" for title "Subject" inside table "---announcement:-:collabMessages---"

  @KSDE-1367 @KSDE-1383 @KSDE-1384 @KSDE-1387 @RiskAssessmentEnhancemnet
  Scenario Outline: Hide Risk Assessment Tab for Grantor and Suppress Email Notification to Subrecipient
  |As a Grantee, verify that Risk Assessment tab should not be displayed on the Grantee Organization layout|
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Home" tab
    When I navigate to "Organization Profile" content inside "Organization" subheader on left panel
    Then I softly cannot see "Risk Assessment" sub tab at view detail page
    #KSDE-1384
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    When I navigate to "Home" tab
    And I navigate to "Subrecipients" content inside "Organization" subheader on left panel
    When I perform quick search for "School District" in "---orgRiskAssessment:-:activeOrgTableID---" panel
    When I click on "View" icon for "School District" inside flex table with id "---orgRiskAssessment:-:activeOrgTableID---"
    Then I see the header is "Subrecipient Organization" in the page details
    Then I softly cannot see "Risk Assessment" sub tab at view detail page
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Related Log" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    #KSDE-1387
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click on top right button "New" in flex table with id "---subAwardStandAlone:-:activeGrantsTableId---"
    And I enter "Grant_Creation5" values from "Award_Field_Values.xlsx"
    And I click modal button "Continue"
    And I enter "Grant_Edition1" values from "Award_Field_Values.xlsx"
    When I click modal button "Save and Continue"
    And I navigate to "Subawards" sub tab
    And I click on "View" icon for "Created" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Edit" in the page details
    When I enter "Edition_StandAlone" values from "Award_Field_Values.xlsx"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    When I navigate to "Budget" sub tab
    When I click on top right button "Associate" in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---"
    When I click "Associate" after selection of "Automation Permanent Funding Account1" by showing entries "All" in flex table with id "---subAwardStandAlone:-:awardFundingAccountsTableId---"
    When I close "Associate Funding Accounts" modal by clicking the top right x button
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:focusAreaTableId---" by clicking "Edit" :
      | Title                           | Start Date | End Date |
      | Automation Permanent Focus Area | 0          | 3650     |
    And I refresh the page
    When I edit the following rows inline in flex table with id "---subAwardStandAlone:-:fundingAccountsTableId---" by clicking "Edit" :
      | Funding Account              | Encumbrance |
      | {SavedValue:fundingAccount1} | 1000        |
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:subAwardBudgetTableId---" by clicking "Edit" :
      | Budget Category | Award Amount | Cash Match | Non-Cash Match |
      | Construction    | 1000         | 100        | 100            |
    When I navigate to "Performance" sub tab
    And I edit the following rows inline in flex table with id "---subAwardStandAlone:-:kpiTableId---" by clicking "Edit" :
      | EGMS ID                  | Target |
      | Automation Permanent KPI | 10     |
    And I navigate to "Terms" sub tab
    And I click on "Edit" icon for "Payment Request" inside flex table with id "---subAwardStandAlone:-:paymentRequestSchedulesTableId---" without waiting for record
    When I enter in modal "Payment Request Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    And I click on "Edit" icon for "Progress Report" inside flex table with id "---subAwardStandAlone:-:progressReportScheduleTableId---" without waiting for record
    When I enter in modal "Progress Report Schedule" values from "Award_Field_Values.xlsx"
    And I click modal button "Save"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---subAwardFromFDM:-:associateContactTableId---"
    When I click "Associate" after selection of "{SavedValue:SPI4 Username}" in the table "---subAwardFromFDM:-:keyContactsTableId---"
    And I wait for "2" seconds
    And I edit the following rows inline in flex table with id "---subAwardFromFDM:-:associateContactTableId---" by clicking "Edit" :
      | Name                       | Project Role             | Is Key Personnel |
      | {SavedValue:SPI4 Username} | Project Director/Manager | Checked          |
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:PM Username} | Step 1 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                      | Award  |
      | {SavedValue:EXE Username} | Step 2 |
    When I enter the following values into flex table with id "---subAwardStandAlone:-:awardApproversTableId---" by clicking "New" :
      | Name                     | Award  |
      | {SavedValue:FO Username} | Step 3 |
    When I get the "EGMS ID"
    And I click on "Send to Subrecipient" in the page details
    And I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    When I click on "Accept" in the page details
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    When I navigate to "Terms" sub tab
    When I click on top right button "Associate Mandatory Terms and Conditions" in flex table with id "---subAwardStandAlone:-:termsndConditionsTableId---"
    And I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    And I click on "Start" icon for "Record Id" inside flex table with id "---subAwardStandAlone:-:pendingTaskTableId---" without waiting for record
    And I "Approve" in the approval decision
    When I re-login to "As a Grantor" app as "dynamicUser" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Grants" content inside "Grants, Subawards & Amendments" subheader on left panel
    And I click toggle button to select "Grants - All"
    When I perform quick search for "<Grant Name>" in "---subAwardStandAlone:-:activeGrantsTableId---" panel
    And I click on "View" icon for "<Grant Name>" inside table
    When I navigate to "Subawards" sub tab
    And I click on "View" icon for "<Award Name>" inside flex table with id "---subAwardStandAlone:-:subawardsTableId---" without waiting for record
    And I click on "Send to Subrecipient" in the page details
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---subAwardStandAlone:-:pendingTaskTableId---" panel
    When I click on "Start" icon for "Record Id" inside table
    And I click on "Accept after Approval" in the page details
    Then I softly cannot see the following messages in the page details contains:
      | Your Organization does not have an active Risk Assessment. Create and activate a Risk Assessment as the Subaward cannot be accepted without an active Risk Assessment. |

    Examples:
      | Award Name                                      | Grant Name                                      |
      | {SavedValue:Automation Runtime Execution Award} | {SavedValue:Automation Runtime Execution Award} |


  @KSDE-1670 @KSDE-1681
  Scenario:Verify that Subrecipient User (SPI/SPA) does not submit application when clicking 'Validate' button
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "appEGMSID"
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    When I navigate to "Overview" sub tab
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment2.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I edit the following rows inline in flex table with id "StudentPerformanceData" by clicking "Edit" :
      | Category          | 1S1 Graduation | 2S1 Reading Language Arts | 2S2 Math | 2S3 Science | 3S1 Placement | 4S1 Nontraditional | 5S2 Postsecondary Credits |
      | LEA Overall Score | 80             | 20                        | 40       | 73          | 56            | 99                 | 110                       |
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I click on "Back" in the page details
    And I switch to parent tab
    And I refresh the page
    #KSDE-1670
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Application has been validated successfully. |
    Then I softly see field "Status" as "Created"
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see top right button "Validate" in page detail


  @KSDE-1673
  Scenario:Verify that Subrecipient User (SPI/SPA) does not submit application when clicking 'Validate' button
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    Then I softly see field "Status" as "Created"
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "appEGMSID"
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment2.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    And I click on "Back" in the page details
    And I switch to parent tab
    And I refresh the page
    #KSDE-1673
    Then I softly see field "Status" as "Created"
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Files- Please enter data for at least one field in the Student Performance Data (Actuals) section in Perkins Secondary Improvement Grant Form before submitting the application. |

  @KSDE-1672 @KSDE-1677
  Scenario:Test Set Secondary Improvement Grant Application
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I wait for "2" seconds
    #KSDE-1672
    When I click on "Save" in the page details
    Then I can see top right button "Validate" in page detail
    #KSDE-1677
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                                                                     |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                        |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                                                             |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Proposal Tab - Provide Target Values for all Key Performance Indicators.                                                                            |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                   |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                                                                     |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                        |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                                                             |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Proposal Tab - Provide Target Values for all Key Performance Indicators.                                                                            |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                   |
    And I wait for "2" seconds
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    When I enter "Edition1" values from "Application_Field_Values.xlsx"
    When I click on "Save" in the page details
    And I wait for "3" seconds
    And I navigate to "Budget" sub tab
    And I save the field labeled "EGMS ID" as "appEGMSID"
    And I expand nested table containing column value "BP01"
    And I select value inside table "---applicationReview:-:budgetPeriodTableId---" is "All"
    When I click on "Add Line Item Details" icon for "Special Populations" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I enter the following values into flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "New" :
      | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Pathway Name   | Amount to be paid by Perkins |
      | Special Populations | Special Populations                        | 10.00    | 100       | Health Science | 1,000                        |
    And I wait for "3" seconds
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Actions     | Expenditure         | How does this support Special Populations? | Quantity | Cost/Unit | Online Link to Item | Pathway Name   | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Action menu | Special Populations | Special Populations                        | 10.00    | $100.00   |                     | Health Science | $1,000.00  | $1,000.00                    | $0.00                      | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name       | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Special Populations | $1,000.00        | $0.00      | $0.00          | $0.00       | $0.00          | $1,000.00          |
    When I click on "Add Line Item Details" icon for "Supplies" inside flex table with id "---applicationReview:-:childBudgetPeriodTableId---"
    When I edit the following rows inline in flex table with id "---applicationReview:-:addLineItemsModalTableId---" by clicking "Edit" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Other Leverage | Amount to be paid by Perkins |
      | Supplies    | 10       | 100       | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | 100        | 100            | 100            | $1,000.00                    |
    Then I see the following rows under the following headers in table with id "---applicationReview:-:addLineItemsModalTableId---" :
      | Description | Quantity | Cost/Unit | Online Link to Item        | CLNA                              | Pathway Name                                 | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Cost | Amount to be paid by Perkins | Amount not paid by Perkins | Total Project Cost |
      | Supplies    | 10.00    | $100.00   | {default:StringOf255Chars} | Evaluation of Student Performance | Agricultural Technology & Mechanical Systems | $100.00    | $100.00        | $200.00     | $100.00        | $1,000.00  | $1,000.00                    | $0.00                      | $1,300.00          |
    When I close "Application Budget Categories" modal by clicking the top right x button
    Then I see the following rows under the following headers in table with id "---applicationReview:-:childBudgetPeriodTableId---" :
      | Category Name | Requested Budget | Cash Match | Non-Cash Match | Total Match | Other Leverage | Total Project Cost |
      | Supplies      | $1,000.00        | $100.00    | $100.00        | $200.00     | $100.00        | $1,300.00          |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    When I save the field labeled "Form ID" as "FormID"
    Then I see the following rows under the following headers in table with id "StudentPerformanceData" :
      | Actions     | Category                      | 1S1 Graduation | 1S1 Graduation Gap Or Exceed | 2S1 Reading Language Arts | 2S1 Reading Language Arts Gap Or Exceed | 2S2 Math | 2S2 Math Gap Or Exceed | 2S3 Science | 2S3 Science Gap Or Exceed | 3S1 Placement | 3S1 Placement Gap Or Exceed | 4S1 Nontraditional | 4S1 Nontraditional Gap Or Exceed | 5S2 Postsecondary Credits | 5S2 Postsecondary Credits Gap Or Exceed |
      | Action menu | LEA Overall Score             |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Individuals with Disabilities |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Economically Disadvantaged    |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Single Parents                |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | English Learners              |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Non-Traditional Enrollees     |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Migrant Worker Parents        |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Homeless (includes Migrant)   |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Active Military Parent        |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
      | Action menu | Foster Care Youth             |                | N/A                          |                           | N/A                                     |          | N/A                    |             | N/A                       |               | N/A                         |                    | N/A                              |                           | N/A                                     |
    When I enter "KSDE_ApplicationForm-2" values from "Application_Field_Values.xlsx"
    And I enter value "Checked" into field "Acknowledgement__c"
    And I enter value "Automation Test" into field "Acknowledgement_By__c"
    And I enter value "0" into field "Acknowledgement_Date__c"
    And I enter value "Checked" into field "Certify__c"
    And I enter value "Automation Test" into field "Certified_By__c"
    And I enter value "Automation Test" into field "Signature__c"
    And I enter value "0" into field "Certified_Date__c"
    And I click on "Save" in the page details
    And I wait for "3" seconds
    And I click on top right button "Add" in flex table with name "Student Performance Action Plan"
    Then I softly see "Student Performance Action Plan" opens in overLay window
    And I select dropdown value "2S2 Math" in field "Indicator__c"
    And I select dropdown value "English Learners" in field "Category__c"
    And I enter value "Automation Test" into field "Action_Plan__c"
    And I select dropdown value "Policies/Processes" in field "Root_Cause__c"
    And I select dropdown value "Scheduling barriers" in field "Subcategory__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I see the following rows under the following headers in table with id "StudentPerformanceActionPlan" :
      | Actions     | Indicator | Identified Gap | Category         | Root Cause         | Subcategory         | Action Plan     |
      | Action menu | 2S2 Math  | -60%           | English Learners | Policies/Processes | Scheduling barriers | Automation Test |
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "CLNA Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment2.pdf" of type "Consortium Contacts Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Contractual Provisions and Local Assurances Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Memorandum of Understanding Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Program Income Form" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on top right button "Add" in flex table with name "Application Files"
    And I upload attachment "Attachment.pdf" of type "Approved Pathways Supporting Document" from computer
    And I click modal button "Close"
    And I wait for "5" seconds
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    #KSDE-1681
    When I click on "Submit Application" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see top right button "Validate" in page detail

  @KSDE-1674
  Scenario:Verify that Subrecipient User (SPI/SPA) sees all validation messages for Secondary Classification when clicking 'Validate' button
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "program-{SavedValue:InternalProgram_2}"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | UnChecked      |
    When I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-1674
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                        |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                   |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                                                                     |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                        |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                                                             |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                   |
    And I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Perkins Secondary Improvement Grant" inside flex table with id "---applicationReview:-:allFormsTableId---"
    And I switch to tab number "1"
    And I switch to parent tab
    And I refresh the page
    And I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                                                              |
      | Forms and Files- Please enter data for at least one field in the Student Performance Data (Actuals) section in Perkins Secondary Improvement Grant Form before submitting the application. |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                                                               |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section.                                        |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                                                             |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                                                               |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                                                         |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                                                          |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                                                              |
      | Forms and Files- Please enter data for at least one field in the Student Performance Data (Actuals) section in Perkins Secondary Improvement Grant Form before submitting the application. |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                                                               |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section.                                        |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                                                             |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                                                               |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                                                         |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                                                          |

  @KSDE-1675 @KSDE-1677 @KSDE-1680
  Scenario Outline: Verify that Subrecipient User (SPI/SPA) sees appropriate validation messages when Overview tab required fields are incomplete
    Given I published "Competitive" type announcement having name "Automation Runtime Announcement Application Intake" and properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Opportunities" tab
    When I navigate to "Not Yet Qualified" content inside "Opportunities" subheader on left panel
    And I perform quick search for "{SavedValue:Automation Runtime Announcement Application Intake}" in "---applicationReview:-:reviewsTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Announcement Application Intake}" inside flex table with id "---applicationReview:-:reviewsTableId---"
    When I click on "Qualify" in the page details
    When I click on "Create Application" in the page details
    And I wait for "3" seconds
    And I click modal button "Save and Continue"
    And I edit the following rows inline in flex table with id "---applicationReview:-:flexGridAppContactTableId---" by clicking "Edit" :
      | Name                       | Is Key Contact |
      | {SavedValue:SPI3 Username} | UnChecked      |
    When I click on "Save" in the page details
    And I click on "Validate" in the page details
    #KSDE-1675
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.              |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application. |
    #KSDE-1677
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                                                                     |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                        |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                                                             |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Proposal Tab - Provide Target Values for all Key Performance Indicators.                                                                            |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                   |
    When I click on "Submit Application" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide the Project Abstract before submitting this Application.                                                                     |
      | Overview Tab - Specify at least one contact as Key Personnel for Application.                                                                       |
      | Overview Tab - Enter an Acknowledgement for project cost before submitting this Application.                                                        |
      | Budget Tab - Budgeted Amount should be greater than or equal to the Subaward Floor Amount. Adjust the Budgeted Amount in the Budget period section. |
      | Budget Tab - Enter a Justification for project cost before submitting this Application.                                                             |
      | Budget Tab - Provide the match (Cash Match/Non-Cash Match) details to submit this application.                                                      |
      | Budget Tab - The Subrecipient Match should not be less than the given value.                                                                        |
      | Budget Tab - Enter budget details before submitting an Application to the Grantor.                                                                  |
      | Proposal Tab - Provide Target Values for all Key Performance Indicators.                                                                            |
      | Forms and Files Tab - All mandatory forms must be 100% completed.                                                                                   |
    #KSDE-1676
    When I navigate to "Overview" sub tab
    Then I softly do not see "Budget Files" page block displayed
    Then I softly do not see "Application Files" page block displayed
    And I navigate to "Budget" sub tab
    Then I softly do not see "Budget Files" page block displayed
    Then I softly do not see "Application Files" page block displayed
    And I navigate to "Proposal" sub tab
    Then I softly do not see "Budget Files" page block displayed
    Then I softly do not see "Application Files" page block displayed
    And I navigate to "Forms and Files" sub tab
    Then I softly see "Budget Files" page block displayed
    Then I softly do not see "Application Files" page block displayed
    And I click on bottom button "Navigator" in page detail
    When I navigate to "History" sub tab
    Then I softly do not see "Budget Files" page block displayed
    Then I softly do not see "Application Files" page block displayed
    When I navigate to "Messages" sub tab
    Then I softly do not see "Budget Files" page block displayed
    Then I softly do not see "Application Files" page block displayed
    #KSDE-1680
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I re-login to "As a Grantee" app as "<userType>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---applicationIntake:-:applicantGrantorApplicationsTableId---" panel
    And I click on "View" icon for "{SavedValue:appEGMSID}" inside flex table with id "---applicationIntake:-:applicantGrantorApplicationsTableId---"
    And I wait for "4" seconds
    Then I softly cannot see top right button "Validate" in page detail

    Examples:
      | userType |
      | PM       |
      | PO       |
      | Admin    |
      | FO       |


  @KSDE-1679 @KSDE-1683
  Scenario:Verify that Subrecipient User (SPI/SPA) triggers all Submit to Grantor validations when clicking 'Validate' button in Negotiation Initiated state
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "NEGOTIATION"
    And I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I save the field labeled "EGMS ID" as "EGMSID"
    And I pause execution for "10" seconds
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I wait for "3" seconds
    #KSDE-1679
    Then I can see top right button "Validate" in page detail
    #KSDE-1683
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - All mandatory forms must be 100% completed.    |
      | Negotiation Tab - Provide details in the Applicant Response section. |


  @KSDE-1679 @KSDE-1684 @KSDE-1678 @KSDE-1682
  Scenario:Verify that Subrecipient User (SPI/SPA) triggers all Submit to Grantor validations when clicking 'Validate' button in Negotiation Initiated state
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "program-{SavedValue:InternalProgram_2}"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    And I delete the record "{SavedValue:Automation Runtime FDM Announcement}" from the object "FDM"
    Given I login to "As a Grantor" app as "PM" user
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I click on "Initiate Negotiation" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    When I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:EGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    Then I softly cannot see top right button "Validate" in page detail
    When I re-login to "As a Grantor" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    And I pause execution for "10" seconds
    And I navigate to "Negotiations" sub tab
    And I wait for "2" seconds
    When I clear the value from field "ApplicationSectionsForRevision__c"
    When  I enter "Edition_Sanity" values from "Negotiations_Field_Values.xlsx"
    And I wait for "3" seconds
    When I click on "Save" in the page details
    And I wait for "4" seconds
    When I click on "Send to Subrecipient" in the page details
    And I wait for "4" seconds
    Then I see field "Status" as "Negotiation Initiated"
    When I re-login to "Grants Portal" app as "SPI3" user on "SUBPORTAL" portal
    And I navigate to "Home" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:EGMSID}" in "---negotiation:-:homePendingTasks---" panel
    And I click on "Start" icon for "{SavedValue:EGMSID}" inside flex table with id "---negotiation:-:homePendingTasks---"
    And I wait for "3" seconds
    #KSDE-1679
    Then I can see top right button "Validate" in page detail
    #KSDE-1684
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Forms and Files Tab - All mandatory forms must be 100% completed.    |
      | Negotiation Tab - Provide details in the Applicant Response section. |

  @KSDE-1684 @prajwal
  Scenario: Directed Ann Verify as IND user I can see Recommended budget field is visible under budget summary summary when App status is convert to award
    Given I published "Competitive" type announcement having name "Automation Runtime FDM Announcement" and properties "program-{SavedValue:InternalProgram_2}"
    When I initiated an application review for application "{SavedValue:Automation Runtime FDM Announcement}" on announcement "{SavedValue:Automation Runtime FDM Announcement}" with properties "default"
    When I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---applicationIntake:-:recipientApplications---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---applicationIntake:-:recipientApplications---"
    #KSDE-1682
    Then I softly see field "Status" as "Review Initiated"
    Then I softly cannot see top right button "Validate" in page detail
    And I created approved FDM on application "{SavedValue:Automation Runtime FDM Announcement}"
    When I re-login to "As a Grantee" app as "PM" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Funding Decision Memos (FDM)" content inside "Application Reviews" subheader on left panel
    And I click toggle button to select "Approved Funding Decision Memos (FDM)"
    When I perform quick search for "{SavedValue:Automation Runtime FDM Announcement}" in "---subAwardFromFDM:-:fdmTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:fdmTableId---"
    When I save the value from row "1" for column name "EGMS ID" as "appEGMSID" from flex table "---subAwardFromFDM:-:recommendedAppTableId---"
    And I click on "Create Subaward" icon for "{SavedValue:Automation Runtime FDM Announcement}" inside flex table with id "---subAwardFromFDM:-:recommendedAppTableId---"
    And I pause execution for "3" seconds
    Then I softly see that "Subaward" is in "Created" status
    And I save the field labeled "EGMS ID" as "EGMSID"
    Given I am on "SUBPORTAL" portal
    When I login to "Grants Portal" app as "SPI3" user
    And I navigate to "Applications" tab
    And I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---applicationIntake:-:recipientApplications---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside flex table with id "---applicationIntake:-:recipientApplications---" without waiting for record
    #KSDE-1684
    Then I softly see field "Status" as "Converted to Award"
    Then I softly cannot see top right button "Validate" in page detail

