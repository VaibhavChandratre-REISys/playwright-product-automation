@GranteeOpportunity @GranteePreAwardRegression
Feature: Validate all scenarios for Opportunity

  @477695 @477697 @477702 @ValidatethedependentfieldforPMuserforsectionEvaluationunderevaluationtabonopportunity @P3_Grantee @PM_Grantee @GRegression1
  Scenario: Validate the dependent field for PM user for section "Evaluation" under evaluation tab on opportunity
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "HaveWeReceivedAwardFromProgram__c"
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    And I enter value "No" into field "HaveWeReceivedAwardFromProgram__c"
    Then I softly see field "1b. If no, provide a brief description of the Proposal (i.e. the purpose of the program, funds needed to accomplish the objectives of the program, what will be the projected achievements according to the funds needed)." inside page block
    #477697
    And I enter value "No" into field "LeadAgencyAgreedUpon__c"
    Then I softly see field "8b. If no, what steps have been taken to determine the lead organization?" inside page block
    And I enter value "Yes" into field "LeadAgencyAgreedUpon__c"
    Then I softly cannot see field "8b. If no, what steps have been taken to determine the lead organization?" inside page block
    And I enter value "Yes" into field "CollaborationandWorkShare__c"
    Then I softly see field "9a. Please explain." inside page block
    And I enter value "No" into field "CollaborationandWorkShare__c"
    Then I softly cannot see field "9a. Please explain." inside page block
    #477702
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    And I enter value "No" into field "MaintenanceEffortRequire__c"
    Then I softly cannot see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    And I enter value "Yes" into field "RequiredPassThroughToSubrecipients__c"
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    And I enter value "No" into field "RequiredPassThroughToSubrecipients__c"
    Then I softly cannot see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    And I enter value "Yes" into field "LimitOnAdministrativeRate__c"
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    And I enter value "No" into field "LimitOnAdministrativeRate__c"
    Then I softly cannot see field "16a. If yes, what percent is the administrative cost limit?" inside page block

  @463559 @ValidateOpportunitiesNotconvertedmanualDavidFOuserReviewerNocanabletosubmitReview @P3_Grantee @GRegression1 @GranteeTBE
  Scenario: Validate Opportunities Not converted manual David FO user Reviewer No can able to submit Review
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I create opportunity with state "created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Role             | Description | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Test        | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Test        | 5        | No                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description | Due Date | Allow Record Editing |
      | Grantee PO    | Fiscal Reviewer | Test        | 5        | No                   |
    Then I softly can see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Delete" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Delete" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Edit" against "Grantee PO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Send for Review" against "Grantee PO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly can see row level action button "Delete" against "Grantee PO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I click on "Delete" icon for "Grantee PO" inside table with table id "---grantee_tableId:-:OpportunityPeerReviewers---" without processing
    Then I softly see confirmation box with body "Are you sure you want to delete?" is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    Then I softly do not see value "Grantee PO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see value "Sent for Review" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"

  @463595 @475758 @OpportunitiesconvertedtoApplicationManualVerifyEXEusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPre-application @P2_Grantee @PM_Grantee @GRegression2
  Scenario Outline: OpportunitiesconvertedtoApplicationManualVerifyEXEusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    Then I softly see field "Funding Organization" as "Department of Education"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "demo.admin@ggp.test8.ggmergeqa2"
    And I click on back arrow
    #475758
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "13a. If yes, describe the statutory maintenance of effort requirement." inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "14a. If yes, what is the percent of funding required to pass through to subrecipients." inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "15a. If yes, what rate will the organization use?" inside page block
    When I hovering mouse on help text icon inside page block detail "15a. If yes, what rate will the organization use?"
    Then I softly see "Rate for Organization Use as selected in the Financial Details." shown as help text
    Then I softly see field "15b. If Yes, Maximum Indirect Cost Rate." inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15b. If Yes, Maximum Indirect Cost Rate."
    Then I softly see "Maximum Indirect Cost Rate as provided in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    #463595
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    Examples:
      | User       |
      | GRANTEE PM |

  @475743 @OpportunitiesNotconvertedGrantsgovVerifyasPMuservalidationisdisplayedonSaveforrequiredforsavefieldsandisdisplayedforrequiredfields @P2_Grantee @PM_Grantee @GRegression1
  Scenario Outline: Opportunities Not converted (Grants.gov ) - Verify as PM user,  validation is displayed on Save for required for save fields and is displayed for required fields
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I navigate to "Overview" sub tab
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see asterisk mark on "Description"
    Then I softly see asterisk mark on "Is Leverage Allowed?"
    And I click on "Edit" in the page details
    Then I see textarea field "AnnouncementDescription__c" is editable
    Then I softly see fields "LaverageAllowed__c" is in edit mode
    Then I softly see fields "AnnouncementDescription__c" is in edit mode
    Then I softly see fields "CategoryOfFundingActivity__c" is in edit mode
    And I clear the value from field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Description is required in the Overview tab under the Additional Information section. |
    And I enter value "Test" into field "AnnouncementDescription__c"
    And I enter value "-30" into field "EstimatedProjectPeriodStartDate__c"
    And I enter value "150" into field "AnticipatedAwardDate__c"
    And I enter value "150" into field "LetterOfIntentDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Estimated Project Period Start Date should be after Application Due Date             |
      | Anticipated award date should be between application due date and project start date |

    Examples:
      | UserName | UserType   |
      | Sarah PM | GRANTEE PM |

  @487225 @OpportunitiesNotconvertedGrantsgovVerifyasPMuservalidationisdisplayedonSaveforrequiredforsavefieldsandisdisplayedforrequiredfields @P2_Grantee @PO_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov ) - Verify as PO user,  validation is displayed on Save for required for save fields and is displayed for required fields
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I navigate to "Overview" sub tab
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see asterisk mark on "Description"
    Then I softly see asterisk mark on "Is Leverage Allowed?"
    And I click on "Edit" in the page details
    Then I see textarea field "AnnouncementDescription__c" is editable
    Then I softly see fields "LaverageAllowed__c" is in edit mode
    Then I softly see fields "AnnouncementDescription__c" is in edit mode
    Then I softly see fields "CategoryOfFundingActivity__c" is in edit mode
    And I clear the value from field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Description is required in the Overview tab under the Additional Information section. |
    And I enter value "Test" into field "AnnouncementDescription__c"
    And I enter value "-30" into field "EstimatedProjectPeriodStartDate__c"
    And I enter value "150" into field "AnticipatedAwardDate__c"
    And I enter value "150" into field "LetterOfIntentDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Estimated Project Period Start Date should be after Application Due Date             |
      | Anticipated award date should be between application due date and project start date |

    Examples:
      | UserName   | UserType   |
      | Grantee PO | GRANTEE PO |

  @487226 @OpportunitiesNotconvertedGrantsgovVerifyasPMuservalidationisdisplayedonSaveforrequiredforsavefieldsandisdisplayedforrequiredfields @P2_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov ) - Verify as EXE user,  validation is displayed on Save for required for save fields and is displayed for required fields
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I navigate to "Overview" sub tab
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see asterisk mark on "Description"
    Then I softly see asterisk mark on "Is Leverage Allowed?"
    And I click on "Edit" in the page details
    Then I see textarea field "AnnouncementDescription__c" is editable
    Then I softly see fields "LaverageAllowed__c" is in edit mode
    Then I softly see fields "AnnouncementDescription__c" is in edit mode
    Then I softly see fields "CategoryOfFundingActivity__c" is in edit mode
    And I clear the value from field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Description is required in the Overview tab under the Additional Information section. |
    And I enter value "Test" into field "AnnouncementDescription__c"
    And I enter value "-30" into field "EstimatedProjectPeriodStartDate__c"
    And I enter value "150" into field "AnticipatedAwardDate__c"
    And I enter value "150" into field "LetterOfIntentDueDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Estimated Project Period Start Date should be after Application Due Date             |
      | Anticipated award date should be between application due date and project start date |

    Examples:
      | UserName   | UserType    |
      | Victor EXE | GRANTEE EXE |

  @487155 @ValidateNotYetConvertedOpportunityManualFOusercannotcreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @FO_Grantee @P3_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual FO/FD user cannot create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "No"
    Examples:
      | userType   |
      | GRANTEE FO |

  @487156 @ValidateNotYetConvertedOpportunityManualFOusercannotcreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual FD user cannot create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "No"
    Examples:
      | userType   |
      | GRANTEE FO |

  @463594 @ValidateOpportunitiesconvertedtoPreApplicationManualPOusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPreapplication @P3_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Pre-Application Manual PO user can navigate to Opportunity details page after clicking on view action for the Oppprotunity which is converted to Pre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I re-login to "Grantee" app as "<userName>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    Then I see the header is "Lead" in the page details
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Converted to Pre-Application" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Examples:
      | userName   |
      | GRANTEE PO |

  @480703 @ValidateOpportunitiesconvertedtoPreApplicationManualPOusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPreapplication @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Pre-Application Manual FO user can navigate to Opportunity details page after clicking on view action for the Oppprotunity which is converted to Pre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I re-login to "Grantee" app as "<userName>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    Then I see the header is "Lead" in the page details
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Converted to Pre-Application" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Examples:
      | userName   |
      | GRANTEE FO |

  @480706 @ValidateOpportunitiesconvertedtoPreApplicationManualPOusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPreapplication @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Pre-Application Manual FD user can navigate to Opportunity details page after clicking on view action for the Oppprotunity which is converted to Pre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I re-login to "Grantee" app as "<userName>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    Then I see the header is "Lead" in the page details
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Converted to Pre-Application" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Examples:
      | userName   |
      | GRANTEE FD |

  @480708 @ValidateOpportunitiesconvertedtoPreApplicationManualPOusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPreapplication @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Pre-Application Manual ADMIN user can navigate to Opportunity details page after clicking on view action for the Oppprotunity which is converted to Pre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I re-login to "Grantee" app as "<userName>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    Then I see the header is "Lead" in the page details
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Converted to Pre-Application" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Examples:
      | userName      |
      | GRANTEE ADMIN |

  @480709 @ValidateOpportunitiesconvertedtoPreApplicationManualPOusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPreapplication @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Pre-Application Manual AUDITOR user can navigate to Opportunity details page after clicking on view action for the Oppprotunity which is converted to Pre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
    When I re-login to "Grantee" app as "<userName>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities - All"
    When I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Pre-Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Pre-Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    And I click on Menu icon present on top right corner of the page
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Collapse" button for header
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    Then I see the header is "Lead" in the page details
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    When I navigate to "History" sub tab
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Converted to Pre-Application" for title "New Value" inside field history table
    Then I softly see value "Approved" for title "Original Value" inside field history table
    And I click on back arrow
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"
    And I refresh the page
    And I wait for "3" seconds
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Delete" in page detail
    Examples:
      | userName        |
      | GRANTEE AUDITOR |

  @487217 @ValidateNotYetConvertedOpportunityManualEXEusercannotcreatePreapplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord @P3_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Validate Not Yet Converted Opportunity Manual EXE user cannot create Pre-application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType    |
      | GRANTEE EXE |

  @487218 @ValidateNotYetConvertedOpportunityManualEXEusercannotcreatePreapplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual FO user cannot create Pre-application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType   |
      | GRANTEE FO |

  @487219 @ValidateNotYetConvertedOpportunityManualEXEusercannotcreatePreapplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual FD user cannot create Pre-application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType   |
      | GRANTEE FD |

  @487220 @ValidateNotYetConvertedOpportunityManualEXEusercannotcreatePreapplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual ADMIN user cannot create Pre-application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType      |
      | GRANTEE ADMIN |

  @487221 @ValidateNotYetConvertedOpportunityManualEXEusercannotcreatePreapplicationfromOpportunityifPreApplicationRequiredisselectedasYesonOpportunityrecord @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual AUDITOR user cannot create Pre-application from Opportunity if Pre-Application Required? is selected as Yes on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType        |
      | GRANTEE AUDITOR |

  @487227 @ValidateOpportunitiesNotconvertedGrantsgovEXEusercannotseeCreatePreapplicationbuttononApprovedOpportunity @P3_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Validate Opportunities Not converted Grants gov EXE user cannot see Create Preapplication button on Approved
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType    |
      | GRANTEE EXE |

  @487228 @ValidateOpportunitiesNotconvertedGrantsgovEXEusercannotseeCreatePreapplicationbuttononApprovedOpportunity @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities Not converted Grants gov FO user cannot see Create Preapplication button on Approved
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType   |
      | GRANTEE FO |

  @487229 @ValidateOpportunitiesNotconvertedGrantsgovEXEusercannotseeCreatePreapplicationbuttononApprovedOpportunity @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate Opportunities Not converted Grants gov FD user cannot see Create Preapplication button on Approved
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType   |
      | GRANTEE FD |

  @487230 @ValidateOpportunitiesNotconvertedGrantsgovEXEusercannotseeCreatePreapplicationbuttononApprovedOpportunity @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate Opportunities Not converted Grants gov FO user cannot see Create Preapplication button on Approved
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType      |
      | GRANTEE ADMIN |

  @487231 @ValidateOpportunitiesNotconvertedGrantsgovEXEusercannotseeCreatePreapplicationbuttononApprovedOpportunity @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Opportunities Not converted Grants gov AUDITOR user cannot see Create Preapplication button on Approved
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "GRANTEE EXE" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "PRE_APPLICATION_YES"
    When I re-login to "Grantee" app as "<userType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly cannot see top right button "Create Pre-Application" in page detail
    Examples:
      | userType        |
      | GRANTEE AUDITOR |

  @487159 @463544 @validateaspodetailsdisplayedonoverviewtabofopportunitiesnotconverteddetailspagewhenrecordisopenedinviewmode  @P2_Grantee @Gregression2 @PO_Grantee
  Scenario Outline: Validate as PO , details displayed on Overview Tab of Opportunities Not converted- details page when record is opened in view mode
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<userName>"
    Given I login to "Grantee" app as "<userType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I create opportunity with state "created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I save the field labeled "Days Left" as "DaysLeft"
    And I wait for "3" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    Then I softly see field "EGMS ID" as "{SavedValue:opportunityEGMSID}"
    Then I softly see field "Funding Organization" as "Department of Education"
    Then I softly see field "Status" as "Draft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    Then I see status in Progress-bar is "Created" and is "dark blue"
    Then I see the header is "Opportunity" in the page details
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    And I click on Menu icon present on top right corner of the page
    And I wait for "2" seconds
    Then I see option "Submit for Approval" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Take Snapshot" present in parallel dropdown
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    And I wait for "1" seconds
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Maximum Indirect Cost Rate" inside page block
    Then I softly see field "Rate for Organization Use" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "grantee.po@yopmail.com.ggmergeqa2"
    And I click on back arrow
    Examples:
      | userName        | userType   |
      | Grantee PO user | GRANTEE PO |
      | Grantee PM user | GRANTEE PM |

  @463548 @validateonsubmitforapprovalvalidationisdisplayedtoPOuserforrequireforsubmitfieldsandiconisdisplayedforrequiredforsubmitfields @P2_Grantee @PO_Grantee @GRegression3
  Scenario: Validate on Submit for approval, validation is displayed to PO user for required for submit fields and icon is displayed for required for submit fields
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I click on "Edit" in the page details
    And I enter value "Yes" into field "LaverageAllowed__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide a value for Budget Type.                                                                                        |
      | Overview Tab - Provide the Estimated Project Period Start Date for this opportunity.                                                   |
      | Overview Tab - Provide the Estimated Project Period End Date for this opportunity.                                                     |
      | Overview Tab - Provide a value for Pre-Application Required.                                                                           |
      | Overview Tab - Provide a value for Letter of Intent Required.                                                                          |
      | Overview Tab - Provide a value for Match Source when Match Required is Yes.                                                            |
      | Overview Tab - Provide a value for Cost Sharing or Matching Requirement when Match Required is Yes.                                    |
      | Overview Tab - Provide a value for Required Match (%) when Match Required is Yes.                                                      |
      | Overview Tab - Provide a value for Program Income Allowed.                                                                             |
      | Evaluation Tab - Provide a value for Previously received an award from this sponsoring agency.                                         |
      | Evaluation Tab - Provide a value for Required resources and required skill sets.                                                       |
      | Evaluation Tab - Provide a value for Necessary Systems and Financial Tools.                                                            |
      | Evaluation Tab - Provide a value for Business and Technical Domain Knowledge.                                                          |
      | Evaluation Tab - Provide a value for whether the Grant requires collaboration with other internal organizations within the Department. |
      | Evaluation Tab - Provide a value for Probability of receiving a grant award.                                                           |
      | Evaluation Tab - Provide a value for the Estimated number of hours required to develop the application.                                |
      | Evaluation Tab - Provide a value for the estimated number of full-time personnel (FTE) to be hired.                                    |
      | Evaluation Tab - Select a value for Maintenance of Effort required.                                                                    |
      | Evaluation Tab - Provide a value for How will the program be sustained, should funding end.                                            |
      | Responsibilities - At least one approver is required                                                                                   |

  @463538 @validateOpportunitiesnotcoverted-verifyasPMuserListviewfunctionalityofopportunities-Notconverted @Gregression2 @P2_Grantee @PM_Grantee
  Scenario: Validate as PM user, List view functionality of opportunities - Not converted
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    Then I softly see default toggle as "Opportunities Not Converted to Application - My Records" for table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see button "Advance Filter" inside flextable "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I click on parallel lines menu bar with data target value "Opportunities Not Converted to Application - My Records"
    And I wait for "3" seconds
    Then I see option "Refresh" present in parallel dropdown
    Then I see option "Download as PDF" present in parallel dropdown
    Then I see option "Download as CSV" present in parallel dropdown
    Then I softly see toggle option "Opportunities Not Converted to Application - Open" inside flex table id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see toggle option "Opportunities Not Converted to Application - My Records" inside flex table id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see toggle option "Opportunities Not Converted to Application - Closed" inside flex table id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see toggle option "Opportunities Not Converted to Application - All" inside flex table id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    And I wait for "2" seconds
    And I select value inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---" is "All"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    And I click on page navigation arrow "---grantee_tableId:-:OpportunityNotConvertedToApplication---" for table id "Next"
    When I click on button "resetIcon" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see "Opportunity Number" in flex table header "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see "Opportunity Title" in flex table header "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Draft" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Approved" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Approved" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I click toggle button to select "Opportunities Not Converted to Application - Open"
    When I perform quick search for "Draft" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I click toggle button to select "Opportunities Not Converted to Application - My Records"
    When I perform quick search for "Draft" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I click toggle button to select "Opportunities Not Converted to Application - Closed"
    And I wait for "2" seconds
    When I perform quick search for "Draft" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Draft" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Submitted for Review" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Submitted for Review" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Reviewed" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Reviewed" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Submitted for Approval" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Submitted for Approval" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Approved" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Approved" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    When I perform quick search for "Rejected" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly see value "Rejected" for title "Status" inside table "---grantee_tableId:-:OpportunityNotConvertedToApplication---"

  @487223 @validateonsubmitforapprovalvalidationisdisplayedtoPOuserforrequireforsubmitfieldsandiconisdisplayedforrequiredforsubmitfields @P2_Grantee @PO_Grantee @GRegression3
  Scenario Outline: Validate on Submit for approval, validation is displayed to EXE user for required for submit fields and icon is displayed for required for submit fields
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<OwnerType>"
    Given I login to "Grantee" app as "<Owner>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I click on "Edit" in the page details
    And I enter value "Yes" into field "LaverageAllowed__c"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Provide a value for Budget Type.                                                                                        |
      | Overview Tab - Provide the Estimated Project Period Start Date for this opportunity.                                                   |
      | Overview Tab - Provide the Estimated Project Period End Date for this opportunity.                                                     |
      | Overview Tab - Provide a value for Pre-Application Required.                                                                           |
      | Overview Tab - Provide a value for Letter of Intent Required.                                                                          |
      | Overview Tab - Provide a value for Match Source when Match Required is Yes.                                                            |
      | Overview Tab - Provide a value for Cost Sharing or Matching Requirement when Match Required is Yes.                                    |
      | Overview Tab - Provide a value for Required Match (%) when Match Required is Yes.                                                      |
      | Overview Tab - Provide a value for Program Income Allowed.                                                                             |
      | Evaluation Tab - Provide a value for Previously received an award from this sponsoring agency.                                         |
      | Evaluation Tab - Provide a value for Required resources and required skill sets.                                                       |
      | Evaluation Tab - Provide a value for Necessary Systems and Financial Tools.                                                            |
      | Evaluation Tab - Provide a value for Business and Technical Domain Knowledge.                                                          |
      | Evaluation Tab - Provide a value for whether the Grant requires collaboration with other internal organizations within the Department. |
      | Evaluation Tab - Provide a value for Probability of receiving a grant award.                                                           |
      | Evaluation Tab - Provide a value for the Estimated number of hours required to develop the application.                                |
      | Evaluation Tab - Provide a value for the estimated number of full-time personnel (FTE) to be hired.                                    |
      | Evaluation Tab - Select a value for Maintenance of Effort required.                                                                    |
      | Evaluation Tab - Provide a value for How will the program be sustained, should funding end.                                            |
      | Responsibilities - At least one approver is required                                                                                   |
    Examples:
      | Owner       | OwnerType       |
      | GRANTEE EXE | Victor EXE user |

  @487224 @OpportunitiesNotconvertedGrantsgovVerifyasEXEuservalidationisdisplayedonSaveforrequiredforsavefieldsandisdisplayedforrequiredfields @P2_Grantee @PM_Grantee @GRegression1
  Scenario Outline: Opportunities Not converted (Manual) - Verify as EXE user, validation is displayed on Save for required for save fields and * is displayed for required fields
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<OwnerType>"
    Given I login to "Grantee" app as "<Owner>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    When I save the field labeled "Estimated Project Period End Date" as "EstimatedProjectPeriodEndDate"
    And I click on "Edit" in the page details
    And I enter value "150" into field "PreApplicationDueDate__c"
    And I enter value "151" into field "LetterOfIntentDueDate__c"
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Please enter the Letter of Intent date equal to or lesser than Pre-Application due date. |
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I navigate to "Overview" sub tab
    Then I softly see asterisk mark on "Category Of Funding Activity"
    Then I softly see asterisk mark on "Description"
    Then I softly see asterisk mark on "Is Leverage Allowed?"
    Then I see textarea field "AnnouncementDescription__c" is editable
    Then I softly see fields "LaverageAllowed__c" is in edit mode
    Then I softly see fields "AnnouncementDescription__c" is in edit mode
    Then I softly see fields "CategoryOfFundingActivity__c" is in edit mode
    And I clear the value from field "AnnouncementDescription__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | To Save, Description is required in the Overview tab under the Additional Information section. |
    And I enter value "Test" into field "AnnouncementDescription__c"
    And I enter value "-30" into field "EstimatedProjectPeriodStartDate__c"
    And I enter value "150" into field "AnticipatedAwardDate__c"
    And I click on "Save" in the page details
    Then I softly see the following messages in the page details contains:
      | Estimated Project Period Start Date should be after Application Due Date             |
      | Anticipated award date should be between application due date and project start date |
    Examples:
      | Owner       | OwnerType       |
      | GRANTEE EXE | Victor EXE user |

  @480700 @ValidatePMusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOpportunitywhichisconvertedtoPre-application
  Scenario Outline: Opportunities converted to Pre-Application (Grants.gov) - Verify PM user can navigate to Opportunity details page after clicking on view action for the Opportunity which is converted to Pre-application
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Converted to Application" content inside "Opportunities" subheader on left panel
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:fundingOpportunitiesTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:fundingOpportunitiesTableId---" without waiting for record
    Then I softly see field "Status" as "Converted to Application"
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Evaluation" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Field Audit" sub tab at view detail page
    Then I softly can see "Chatter" sub tab at view detail page
    Then I see the header is "Opportunity" in the page details
    Then I see the sub-header is "{SavedValue:Automation Runtime Opportunity}" in the page details
    And I save the field labeled "EGMS ID" as "EGMSID"
    Then I softly see field "EGMS ID" as "{SavedValue:EGMSID}"
    Then I softly see field "Status" as "Converted to Application"
    And I save the field labeled "Funding Organization" as "FundingOrganization"
    Then I softly see field "Funding Organization" as "{SavedValue:FundingOrganization}"
    And I save the field labeled "Days Left" as "DaysLeft"
    Then I softly see field "Days Left" as "{SavedValue:DaysLeft}"
    When I hovering mouse on help text icon inside page block detail "Days Left"
    Then I softly see "Days remaining until the application due date" shown as help text
    Then I softly can see top right button "Download as PDF" in page detail
    Then I softly can see top right button "Take Snapshot" in page detail
    Then I softly see "Opportunity Information" page block displayed
    Then I softly see field "Funding Opportunity Title" inside page block
    Then I softly see field "Opportunity Number" inside page block
    When I hovering mouse on help text icon inside page block detail "Opportunity Number"
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "Internal Organization" inside page block
    Then I softly see field "Funding Instrument Type" inside page block
    Then I softly see field "Category Of Funding Activity" inside page block
    Then I softly see field "Opportunity Category" inside page block
    Then I softly see field "Expected Number of Awards" inside page block
    When I hovering mouse on help text icon inside page block detail "Expected Number of Awards"
    Then I softly see "The maximum number excepted is 999." shown as help text
    Then I softly see field "Source" inside page block
    Then I softly see field "Lead Version" inside page block
    Then I softly see field "Posted Date" inside page block
    Then I softly see field "Last Update Date" inside page block
    Then I softly see "Lead Information" page block displayed
    Then I softly see field "FOA Lead" inside page block
    Then I softly see field "Number of Agencies that have Qualified this Lead" inside page block
    And I save the field labeled "FOA Lead" as "FOALead"
    And I click on hyperlink containing value "{SavedValue:FOALead}"
    And I click on back arrow
    Then I softly see "Opportunity Specific Settings" page block displayed
    Then I softly see field "Budget Type" inside page block
    Then I softly see field "Estimated Project Period Start Date" inside page block
    Then I softly see field "Estimated Project Period End Date" inside page block
    Then I softly see field "Pre-Application Required?" inside page block
    Then I softly see field "Pre-Application Due Date" inside page block
    Then I softly see field "Letter of Intent Required" inside page block
    Then I softly see field "Letter of Intent Due Date" inside page block
    Then I softly see field "Application Due Date" inside page block
    Then I softly see field "Anticipated Award Date" inside page block
    Then I softly see "External Programs" page block displayed
    Then I softly see "Eligibility" page block displayed
    Then I softly see field "Eligible Applicants" inside page block
    Then I softly see field "Additional Information on Eligibility" inside page block
    Then I softly see "Additional Information" page block displayed
    Then I softly see field "Description" inside page block
    Then I softly see field "Link to Additional Information" inside page block
    Then I softly see field "Grantor Contact Information" inside page block
    Then I softly see field "Funding Organization Grants System" inside page block
    Then I softly see "Financial Details" page block displayed
    Then I softly see field "Is Match Required?" inside page block
    Then I softly see field "Cost Sharing or Matching Requirement" inside page block
    Then I softly see field "Required Match(%)" inside page block
    Then I softly see field "Match Source" inside page block
    Then I softly see field "Estimated Total Program Funding" inside page block
    Then I softly see field "Award Floor" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Floor"
    Then I softly see "Minimum award amount" shown as help text
    Then I softly see field "Award Ceiling" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Award Ceiling"
    Then I softly see "Maximum award amount" shown as help text
    Then I softly see field "Is Program Income Allowed?" inside page block
    Then I softly see field "Program Income Treatment Type" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "Program Income Treatment Type"
    Then I softly see "• Additive: Program income realized is added to (i.e., supplements) the funds committed to the project by the awarding agency. The program income funds shall be used to support related objectives. • Deductive: Program income realized is deducted from the total allowable costs in determining the net allowable costs on which the federal or other sponsor share of costs is based. • Matching: Program income realized is used to finance the non-federal share of the project (i.e., meet cost sharing commitments)." shown as help text
    Then I softly see field "Are Indirect Costs Allowed?" inside page block
    Then I softly see field "Is Leverage Allowed?" inside page block
    Then I softly see "System Information" page block displayed
    Then I softly see field "Created by" inside page block
    And I save the field labeled "Created by" as "Createdby"
    Then I softly see link "{SavedValue:Createdby}" inside Page block
    Then I softly see field "Created Date" inside page block
    Then I softly see field "Last Modified Date" inside page block
    Then I softly see field "Last Modified by" inside page block
    And I save the field labeled "Last Modified By" as "LastModifiedBy"
    Then I softly see link "{SavedValue:LastModifiedBy}" inside Page block
    And I click on hyperlink containing value "{SavedValue:LastModifiedBy}"
    Then I softly see the text containing "sarah.pm@ggp.test8.ggmergeqa2"
    And I click on back arrow
    And I navigate to "Evaluation" sub tab
    Then I softly see "Evaluation" page block displayed
    Then I softly see field "1. Have we previously received an award from this sponsoring agency?" inside page block
    Then I softly see field "1a. If yes, provide a full description of past fundings (i.e. Purpose of the Program, funds granted, time of the grant, Weaknesses and Achievements according to the funds granted)." inside page block
    Then I softly see field "2. What is the estimated probability of receiving a grant award?" inside page block
    Then I softly see field "2a. Briefly explain." inside page block
    Then I softly see "Organizational Readiness" page block displayed
    Then I softly see field "3. Do we have the business and technical domain knowledge?" inside page block
    Then I softly see field "3a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "3a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "4. Do we have the required resources and skill sets to perform the work?" inside page block
    Then I softly see field "4a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "4a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "5. Do we have the necessary systems and financial tools?" inside page block
    Then I softly see field "5a. Please explain in detail according to the requirements of the Grant Opportunity." inside page block
    When I hovering mouse on help text icon inside page block detail "5a. Please explain in detail according to the requirements of the Grant Opportunity."
    Then I softly see "Text and number both are allowed. Must not exceed 255 characters" shown as help text
    Then I softly see field "6. Provide the estimated number of hours required to develop the application. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "6. Provide the estimated number of hours required to develop the application. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see field "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation." inside page block
    When I hovering mouse on help text icon inside page block detail "7. Provide the estimated number of full time personnel (FTE) that will be required to be hired to implement the grant. Provide an explanation."
    Then I softly see "Text and Numbers are allowed, with a maximum limit of 650 characters." shown as help text
    Then I softly see "Collaboration Details" page block displayed
    Then I softly see field "8. Have other internal organizations within the Department qualified this lead?" inside page block
    Then I softly see field "8a. If yes, has an agreement been reached to which organization will be the lead?" inside page block
    Then I softly see field "9. Does this grant require a collaboration with other internal organizations within the Department?" inside page block
    Then I softly see field "9a. Please explain." inside page block
    Then I softly see "Financial Overview" page block displayed
    Then I softly see field "10. What is the expected funding request amount?" inside page block
    When I hovering mouse on help text icon inside page block detail "10. What is the expected funding request amount?"
    Then I softly see "Estimated Total Program Funding amount provided in the Financial Details." shown as help text
    Then I softly see field "10a. What is the stated award ceiling (if known)?" inside page block
    When I hovering mouse on help text icon inside page block detail "10a. What is the stated award ceiling (if known)?"
    Then I softly see "Maximum spending amount anticipated over the life of the project as provided in the Financial Details." shown as help text
    Then I softly see field "11. Is match required for this grant?" inside page block
    When I hovering mouse on help text icon inside page block detail "11. Is match required for this grant?"
    Then I softly see "Match Requirement setting as shown in the Financial Details" shown as help text
    Then I softly see field "11a. What is the match type." inside page block
    When I hovering mouse on help text icon inside page block detail "11a. What is the match type."
    Then I softly see "Cost Sharing or Matching Requirement selected in the Financial Details." shown as help text
    Then I softly see field "11b. If yes, identify the match sources." inside page block
    When I hovering mouse on help text icon inside page block detail "11b. If yes, identify the match sources."
    Then I softly see "Match Source as selected in the Financial Details." shown as help text
    Then I softly see field "11c. Required Match(%)" inside page block
    When I hovering mouse on help text icon inside page block detail "11c. Required Match(%)"
    Then I softly see "Required Match(%) as provided in the Financial Details." shown as help text
    Then I softly see field "12. Is program income anticipated?" inside page block
    When I hovering mouse on help text icon inside page block detail "12. Is program income anticipated?"
    Then I softly see "Is Program Income Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "12a. If yes, what is the program income treatment type?" inside page block
    When I hovering mouse on help text icon inside page block detail "12a. If yes, what is the program income treatment type?"
    Then I softly see "Program Income Treatment Type as selected in the Financial Details." shown as help text
    Then I softly see field "13. Is there a maintenance of effort required?" inside page block
    Then I softly see field "14. Does the grant require pass through funding to subrecipients?" inside page block
    Then I softly see field "15. Does the grant allow indirect costs?" inside page block
    When I hovering mouse on help text icon inside page block detail for invisible element "15. Does the grant allow indirect costs?"
    Then I softly see "Are Indirect Costs Allowed? setting as selected in the Financial Details." shown as help text
    Then I softly see field "16. Is there an administrative cost limit?" inside page block
    Then I softly see field "16a. If yes, what percent is the administrative cost limit?" inside page block
    Then I softly see field "17. How will the program be sustained, should funding end?" inside page block
    Then I softly see "Certifications and Other" page block displayed
    Then I softly see field "18. Describe any additional legal requirements or policy impact from receiving an award." inside page block
    Then I softly see field "19. Describe any additional organizational certifications required or compliance requirements created as a result of an award." inside page block
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    And I navigate to "Files" sub tab
    Then I softly see "Opportunity Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "Business Forms" page block displayed
    And I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Field Audit" sub tab in split screen
    Then I softly can see "Field Audit" sub tab at view detail page
    And I navigate to "Chatter" sub tab in split screen
    Then I softly see the text containing "Post"

    Examples:
      | User       |
      | GRANTEE PM |

  @463561 @Opportunities(manual)-VerifyPMusershouldabletosubmitandapproved/senttoowner/forward/RejecttheOpportunityrecord @Gregression2 @P2_Grantee @PM_Grantee
  Scenario: Opportunities Not converted (Manual) - Verify PM user should able to submit and approved/sent to owner/forward/Reject the Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Victor EXE | Step 1      |
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I select radio button "Forward" in the approval decision
    And I select user "David FO" in the approval decision
    When I enter comment "Automation testing" in the approval decision
    And I submit the approval in the approval decision without processing
    Then I softly see the following messages in the page details contains:
      | Successfully Re-Assigned |
    Then I softly see status in Progress-bar is "Submitted for Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Send to Owner" in the approval decision
    Then I softly see field "Status" as "Draft"
    And I wait for "100" seconds
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see field "Status" as "Draft"
    Then I softly see status in Progress-bar is "Created" and is "dark blue"
    When I click on "Submit for Approval" in the page details
    And I get the "EGMS ID"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I select radio button "Forward" in the approval decision
    When I "Reject" in the approval decision
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see field "Status" as "Rejected"
    Then I softly see status in Progress-bar is "Rejected" and is "Red"
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Submit for Approval" in page detail

  @546590 @validatetherecordssharingforOppwithPO/FO/FD/auditor/Admin/EXEfromsameOrginallstatesofOpp @GranteeFlexP1
  Scenario: Validate the records sharing for Opp with PO/FO/FD/auditor/Admin/EXE from same Org in all states of Opp
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I click on "Edit" in the page details
    And I enter "Grantee_Opp_PreAppYes_Edition" values from "Announcement_Field_Values.xlsx"
    And I enter value "50%" into field "ProbabilityofWinningreceivingaGrant__c"
    And I click on "Save" in the page details
    When I navigate to "Overview" sub tab
    And I wait for "2" seconds
    When I save the field labeled "Application Due Date" as "ApplicationDueDate"
    And I click on "Edit" in the page details
    And I enter value "{SavedValue:ApplicationDueDate}" into field "PreApplicationDueDate__c"
    And I navigate to "Evaluation" sub tab
    And I enter value "Yes" into field "MaintenanceEffortRequire__c"
    And I enter value "Automation Test" into field "StatutoryMaintenanceOfEffort__c"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Overview" sub tab
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:opportunityExternalProgramTableId---"
    When I click "Associate" after selection of "Automation Permanent NGO Program2" in the table "---grantee_tableId:-:opportunityExternalProgramModalTableId---"
    When I click modal button "Close"
    And I wait for "3" seconds
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | NO                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role             | Description            | Due Date | Allow Record Editing |
      | Victor EXE    | Program Reviewer | Automation Description | 5        | Yes                  |
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name       | Opportunity |
      | Grantee PO | Step 1      |
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityApproverTableId---" by clicking "New" :
      | Name               | Opportunity |
      | Danielle FD Garcia | Step 2      |
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I click on "Send for Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I pause execution for "3" seconds
    Then I softly see value "Sent for Review" for title "Status" against the value "Victor EXE" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see value "Sent for Review" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    And I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:opportunityFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "FOA Documents" from computer
    And I wait for "2" seconds
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:opportunityNotesTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:opportunityEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Review"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Overview" sub tab
    Then I softly can see top right button "Edit" in page detail
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Victor EXE" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    When I click modal button "Save"
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Rating is required.   |
      | To Save, Comments is required. |
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Victor EXE" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Victor EXE" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Victor EXE" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see top right button "Edit" in page detail
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:opportunityEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Reviewed"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see field "Status" as "Reviewed"
    When I click on "Submit for Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Overview" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I perform quick search inside global search "{SavedValue:opportunityEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    Then I softly cannot see row level action button "Change Owner" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    And I click on row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in global search with id "Announcements"
    Then I softly see field "Status" as "Submitted for Approval"
    Then I cannot see top right button "Save" in page detail
    Then I cannot see top right button "Cancel" in page detail
    Then I softly see the text containing "You dont have sufficient access to edit this record"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "Record Id" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "Record Id" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly see field "Status" as "Submitted for Approval"
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I navigate to "Overview" sub tab
    Then I see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    Then I see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:opportunityExternalProgramTableId---"
    And I navigate to "Responsibilities" sub tab
    Then I see value "David FO" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Victor EXE" for title "Reviewer Name" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    Then I see value "Danielle FD Garcia" for title "Name" inside table "---grantee_tableId:-:opportunityApproverTableId---"
    And I navigate to "Files" sub tab
    Then I see value "AttachmentTesting.pdf" for title "Title" inside table "---grantee_tableId:-:opportunityFilesTableId---"
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:opportunityNotesTableId---"