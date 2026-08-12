@GranteeApplicationsManual @GranteePreAwardRegression
Feature: Validate all scenarios for Applications Manual

  @480702 @OpportunitiesconvertedtoApplicationManualVerifyEXEusercannavigatetoOpportunitydetailspageafterclickingonviewactionfortheOppprotunitywhichisconvertedtoPre-application @P2_Grantee @EXE_Grantee @GRegression1
  Scenario Outline: Opportunities converted to Application Manual EXE user can navigate to Opportunity details page after clicking on view action for the Oppprotunity which is converted to Pre-application
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-Victor EXE user"
    Given I login to "Grantee" app as "<User>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "PRE_APPLICATION_YES"
    And I create Pre-application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "{SavedValue:Automation Runtime}" with properties "default-Grantee PO user"
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
    And I wait for "2" seconds
    Then I softly see the text containing "victor.exe@ggp.test8.ggmergeqa2"
    And I wait for "2" seconds
    And I click on back arrow
    And I wait for "2" seconds
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
      | User        |
      | GRANTEE EXE |

  @473233 @ValidateNotYetConvertedOpportunityManualEXEusercannotcreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @P3_Grantee @EXE_Grantee @GRegression1
  Scenario: Validate Not Yet Converted Opportunity (Manual) EXE user cannot create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
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
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "No"

  @482415 @POuserVerifyUsershouldabletoapprovetheAwardwith4stepapprover @P1_Grantee @GRegression1 @GranteeTBE
  Scenario:PO user User should able to approve the Award with 4 step approver
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
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "AwardEGMSID"
    When I navigate to "Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:awardAddFilesTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Interim Award Document" from computer
    When I click modal button "Close"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "{SavedValue:AwardEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    And I wait for "5" seconds
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "{SavedValue:AwardEGMSID}" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Grants" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:AwardEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:AwardEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Activated"
    When I navigate to "History" sub tab
    Then I softly see column "Overall Status" at position "1" contains text "Approved"
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Activated" for title "New Value" inside field history table
    Then I softly see value "Submitted for Approval" for title "Original Value" inside field history table
    And I navigate to "Grants" tab
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "Record Id" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I see that "Record Id" has been added in flextable with Id "---grantee_tableId:-:grantCompletedTaskTableId---"

  @487157 @ValidateNotYetConvertedOpportunityManualAuditorusercannotcreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @P3_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual Auditor user cannot create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<filter>"
    Given I login to "Grantee" app as "<userName>" user
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
    Then I softly see field "Status" as "Approved"
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "No"
    Examples:
      | filter        | userName   | userType        |
      | Sarah PM user | GRANTEE PM | GRANTEE AUDITOR |

  @487158 @ValidateNotYetConvertedOpportunityManualADMINusercannotcreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate Not Yet Converted Opportunity Manual ADMIN user cannot create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default-<filter>"
    Given I login to "Grantee" app as "<userName>" user
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
    Then I softly see field "Status" as "Approved"
    Then I softly cannot see top right button "Create Application" in page detail
    When I navigate to "Overview" sub tab
    Then I softly see field "Pre-Application Required?" as "No"
    Examples:
      | filter          | userName   | userType      |
      | Grantee PO user | GRANTEE PO | GRANTEE ADMIN |

  @472391 @Validatethatuserabletocreatetheapplicationfromthequalifiedleads @P2_Grantee @PM_Grantee @GRegression1
  Scenario: Validate that user able to create the application from the qualified leads
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"

  @472827 @PMuserVerifyPMuserseesubmittoGrantorbuttononapprovedapplication
  Scenario:Verify PM user see submit to Grantor button on approved application
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
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "DAVID_FO_APPROVER"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Approved"
    When I click on "Submit To Grantor" in the page details
    And I click modal button "Save"
    Then I softly see the following messages in the page details contains:
      | To Save, Submitted to Grantor On is required. |
    When I enter values into fields
      | Value | Field          |
      | 0     | SubmittedOn__c |
    And I click modal button "Save"
    And I save the field labeled "Submitted to Grantor On" as "SubmittedtoGrantorOn"
    And I click modal button "Close"
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Overview" sub tab
    Then I see field "Submitted to Grantor On" as "{SavedValue:SubmittedtoGrantorOn}"

  @494024 @Validateimpactonalreadycreatedapplicationafterapplicationduedateispassed
  Scenario Outline: PreApp - Verify with PO Profile ,when preapplication due date is crossed for grants.gov lead then unable to see the create pre application button.
    When I login to "Grantee" app as "<User>" user
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{AUTOEnvData:AutomationPermanentApplicationExpired}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{AUTOEnvData:AutomationPermanentApplicationExpired}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    And I click on "Submit For Approval" in the page details
    Then I softly see the following messages in the page details contains:
      | This application cannot be submitted. The application due date has passed. |

    Examples:
      | User       |
      | GRANTEE PM |

  @547375 @547368 @547354 @validatethatContactsectionshouldbevisiblewithcorrectrecordscounttoallInternalUsers @GranteeFlexP1
  Scenario Outline: Validate that Contact section should be visible with correct records count to all Internal Users
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    And I navigate to "Overview" sub tab
    Then I softly see "Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Project Role                                   |
      | Sarah PM | Project Director/Principal Investigator(PI/PD) |
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact |
      | Sarah PM | Checked        |
    And I wait for "2" seconds
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    And I wait for "2" seconds
    When I perform quick search for "Automation Permanent NGO Program2" in "---grantee_tableId:-:applicationAssociateExternalProgramsTableId---" panel
    When I click "Associate" after selection of "Automation Permanent NGO Program2" in the table "---grantee_tableId:-:applicationAssociateExternalProgramsTableId---"
    And I wait for "2" seconds
    When I click modal button "Close"
    Then I softly see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I softly see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I see total records count "Total Records: 2" in flex table "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    And I navigate to "Overview" sub tab
    Then I softly see "Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see value "Project Director/Principal Investigator(PI/PD)" for title "Project Role" against the value "Sarah PM" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    Then I softly see value "Project Director/Principal Investigator(PI/PD)" for title "Project Role" against the value "Sarah PM" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    Then I softly see value "True" for title "Is Key Contact" against the value "Sarah PM" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    Then I softly see value "Automation Permanent NGO Program" for title "Title" inside table "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I softly see value "Automation Permanent NGO Program2" for title "Title" inside table "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I see total records count "Total Records: 2" in flex table "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |

  @547490 @validateKeyContactsectionshouldnotbevisiblewithcorrectrecordscounttocrossorguser @GranteeFlexP1
  Scenario Outline: Validate Key Contact section should not be visible to cross org user
  /Validate that Application record should not be visible to cross org users if record is not assigned through the Peer Review
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    And I navigate to "Overview" sub tab
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Sarah PM" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Project Role                                   |
      | Sarah PM | Project Director/Principal Investigator(PI/PD) |
    And I wait for "3" seconds
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:ContactTableIdApplication---" by clicking "Edit" :
      | Name     | Is Key Contact |
      | Sarah PM | Checked        |
    And I wait for "2" seconds
    Then I softly see value "Sarah PM" for title "Name" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    Then I softly see value "Project Director/Principal Investigator(PI/PD)" for title "Project Role" against the value "Sarah PM" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    And I click on top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I click "Associate" after selection of "Victor EXE" in the table "---grantee_tableId:-:ContactModalTableIdApplication---"
    When I click modal button "Close"
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:ContactTableIdApplication---"
    When I re-login to "Grantee" app as "<NonUser>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:ApplicationTableId---"
    And I navigate to "Home" tab
    And I select "Applications" from dropdown for Global search
    And I wait for "2" seconds
    And I perform quick search inside global search "{SavedValue:appEGMSID}"
    Then I softly see the text containing "No results"
    Examples:
      | NonUser |
      | PM1     |

  @547381 @validatethatBudgetPeriodsectionshouldbevisiblewithcorrectrecordscounttoallInternalUsers @GranteeFlexP1
  Scenario Outline: Validate Budget Period section should be visible with correct records count
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    Then I softly can see row level action button "Delete" against "BP01" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly can see row level action button "Edit" against "BP01" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I click on "Edit" icon for "BP01" inside flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I enter in modal value "360" into field "BudgetEndDate__c"
    When I click modal button "Save"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Automation Permanent Focus Area" for title "Focus Area Title" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area Title" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I see total records count "Total Records: 2" in flex table "---grantee_tableId:-:ChildBudgetPeriodDetailsFromBudgetOfSetUp---"
    When I collapse nested table containing column value "BP01"
    And I click on top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I enter in modal value "361" into field "BudgetStartDate__c"
    When I enter in modal value "365" into field "BudgetEndDate__c"
    When I click modal button "Save"
    And I wait for "2" seconds
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP02" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    And I wait for "3" seconds
    When I click "Associate" after selection of "Automation Permanent Focus Area2" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I click modal button "Close"
    Then I softly can see row level action button "Delete" against "BP02" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly can see row level action button "Edit" against "BP02" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Given I expand nested table containing column value "BP02"
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area Title" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly can see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I see total records count "Total Records: 1" in flex table "---grantee_tableId:-:ChildBudgetPeriodDetailsFromBudgetOfSetUp---"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly see value "BP01" for title "Budget Period #" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly see value "BP02" for title "Budget Period #" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly cannot see row level action button "Delete" against "BP01" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly cannot see row level action button "Edit" against "BP01" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly cannot see row level action button "Delete" against "BP02" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly cannot see row level action button "Edit" against "BP02" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Given I expand nested table containing column value "BP01"
    Then I softly see value "Automation Permanent Focus Area" for title "Focus Area Title" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area Title" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I see total records count "Total Records: 2" in flex table "---grantee_tableId:-:ChildBudgetPeriodDetailsFromBudgetOfSetUp---"
    When I collapse nested table containing column value "BP01"
    Given I expand nested table containing column value "BP02"
    Then I softly see value "Automation Permanent Focus Area2" for title "Focus Area Title" inside table "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I softly cannot see row level action button "Remove" against "Automation Permanent Focus Area2" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I see total records count "Total Records: 1" in flex table "---grantee_tableId:-:ChildBudgetPeriodDetailsFromBudgetOfSetUp---"
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |

  @547384 @validatethatBudgetCategoriessectionshouldbevisiblewithcorrectrecordscounttoallInternalUsers @GranteeFlexP1
  Scenario Outline: Validate Budget Categories section should be visible with correct records count
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Details" page block displayed
    Given I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area - BP01" inside rows of enhanced grid id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---"
    Then I softly see total records count "Total Records: 12" in flex table "---grantee_tableId:-:ApplicationBudgetCategoryTableId---"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    Then I softly see "Budget Details" page block displayed
    Given I expand nested table containing column value "BP01"
    Then I softly see "Focus Area : Automation Permanent Focus Area - BP01" inside rows of enhanced grid id "---grantee_tableId:-:ApplicationBudgetCategoryTableId---"
    Then I softly see total records count "Total Records: 12" in flex table "---grantee_tableId:-:ApplicationBudgetCategoryTableId---"
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |

  @547389 @547387 @547388 @validatethatIndirectRatessectionshouldbevisiblewithcorrectrecordscounttoallInternalUsers @GranteeFlexP1
  Scenario Outline: Validate Indirect Rates section should be visible with correct records count
  /Validate Program Income section should be visible with correct records count
  /Validate Approvers section should be visible with correct records count
    And I create "Manual" qualified lead for title "Automation Runtime Opportunity" and opportunity number "Automation Runtime" with properties "default"
    When I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "{SavedValue:Automation Runtime}" with properties "default"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    And I click on "Create Application" in the page details
    And I wait for "5" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values.xlsx"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I click on top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    When I click "Next" after selection of "BP01" in the table "---grantee_tableId:-:ApplicationBudgetPeriodModalTableId---"
    When I click "Associate" after selection of "Automation Permanent Focus Area" in the table "---grantee_tableId:-:ApplicationSelectFocusAreaModalTableId---"
    And I wait for "2" seconds
    And I click modal button "Close"
    When I navigate to "Budget" sub tab
    Then I softly see "Program Income" page block displayed
    Then I softly see value "Automation Permanent Focus Area - BP01" for title "Focus Area Name" inside table "---grantee_tableId:-:ApplicationProgramIncomeTableID---"
    Then I softly can see row level action button "Edit" against "Automation Permanent Focus Area - BP01" in flex table with id "---grantee_tableId:-:ApplicationProgramIncomeTableID---"
    Then I softly see total records count "Total Records: 1" in flex table "---grantee_tableId:-:ApplicationProgramIncomeTableID---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Date From" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Date To" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:indirectRatesApplicationtableId---" by clicking "New" :
      | Title | Date From | Date To | Approved Indirect Cost Rate(%) | Indirect Cost Rate Type |
      | Rate  | 15        | 30      | 10                             | Final                   |
    Then I softly see value "Rate" for title "Title" inside table "---grantee_tableId:-:indirectRatesApplicationtableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Approvers" page block displayed
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 1      |
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name       | Application |
      | Grantee PO | Step 2      |
    Then I softly see value "David FO" for title "Name" inside table "---grantee_tableId:-:ApplicationApprovers---"
    Then I softly see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:ApplicationApprovers---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:ApplicationApprovers---"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Created"
    When I navigate to "Budget" sub tab
    Then I softly see "Program Income" page block displayed
    Then I softly see value "Automation Permanent Focus Area - BP01" for title "Focus Area Name" inside table "---grantee_tableId:-:ApplicationProgramIncomeTableID---"
    Then I softly cannot see row level action button "Edit" against "Automation Permanent Focus Area - BP01" in flex table with id "---grantee_tableId:-:ApplicationProgramIncomeTableID---"
    Then I softly see total records count "Total Records: 1" in flex table "---grantee_tableId:-:ApplicationProgramIncomeTableID---"
    Then I softly see "Indirect Rates" page block displayed
    Then I softly see "Actions" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Title" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Date From" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Date To" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Approved Indirect Cost Rate(%)" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see "Indirect Cost Rate Type" in flex table header "---grantee_tableId:-:indirectRatesApplicationtableId---"
    Then I softly see value "Rate" for title "Title" inside table "---grantee_tableId:-:indirectRatesApplicationtableId---"
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Approvers" page block displayed
    Then I softly see value "David FO" for title "Name" inside table "---grantee_tableId:-:ApplicationApprovers---"
    Then I softly see value "Grantee PO" for title "Name" inside table "---grantee_tableId:-:ApplicationApprovers---"
    Then I softly see value "Victor EXE" for title "Name" inside table "---grantee_tableId:-:ApplicationApprovers---"
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |