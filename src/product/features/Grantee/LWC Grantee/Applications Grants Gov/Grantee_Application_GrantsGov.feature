@GranteeApplicationsGrantsGov @GranteeGrantsgovOpportunityrerun
Feature: Validate all scenarios for Applications Grants Gov

  @480684 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov PO user can navigate to Opportunity details page from Opportunities Converted to Application list view
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
      | GRANTEE PO |

  @480686 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @FO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov FO user can navigate to Opportunity details page from Opportunities Converted to Application list view
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
      | GRANTEE FO |

  @480687 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @FD_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov FD user can navigate to Opportunity details page from Opportunities Converted to Application list view
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
      | GRANTEE FD |

  @480688 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P4_Grantee @AUDITOR_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov AUDITOR user can navigate to Opportunity details page from Opportunities Converted to Application list view
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
      | User            |
      | GRANTEE AUDITOR |

  @480689 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @ADMIN_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov ADMIN user can navigate to Opportunity details page from Opportunities Converted to Application list view
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
      | User           |
      | GRANTEE ADMIN1 |

  @487233 @OpportunitiesNotconvertedGrantsgovVerifyEXEusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify EXE user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType    |
      | Victor EXE | GRANTEE EXE | GRANTEE EXE |

  @487234 @OpportunitiesNotconvertedGrantsgovVerifyFOusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify FO user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName | OwnerType  | UserType   |
      | Sarah PM | GRANTEE PM | GRANTEE FO |

  @487235 @OpportunitiesNotconvertedGrantsgovVerifyFDusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @FD_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify FD user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName | OwnerType  | UserType   |
      | Sarah PM | GRANTEE PM | GRANTEE FD |

  @487236 @OpportunitiesNotconvertedGrantsgovVerifyEXEusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @ADMIN_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify ADMIN user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType  | UserType       |
      | Grantee PO | GRANTEE PO | GRANTEE ADMIN1 |

  @487237 @OpportunitiesNotconvertedGrantsgovVerifyAUDITORusercannotseeCreateApplicationbuttononApprovedOpportunity @P4_Grantee @AUDITOR_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify AUDITOR user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType  | UserType        |
      | Grantee PO | GRANTEE PO | GRANTEE AUDITOR |

  @475755 @OpportunitiesNotconvertedGrantsgovVerifyEXEuserReviewereditaccessasNocanabletosubmitReview @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov)  - Verify EXE user (Reviewer edit access as = No)can able to submit Review
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | NO                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Role             | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"

    Examples:
      | UserName   | UserType    |
      | Victor EXE | GRANTEE EXE |

  @475754 @OpportunitiesNotconvertedGrantsgovVerifyPMuserReviewereditaccessasNocanabletosubmitReview @P3_Grantee @FO_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov)  - Verify PM user (Reviewer edit access as = No)can able to submit Review
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "Grantee" app as "<UserType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    And I wait for "2" seconds
    When I click on "Convert to Opportunity" in the page details
    And I wait for "2" seconds
    Then I softly see field "Status" as "Draft"
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name | Role            | Description            | Due Date | Allow Record Editing |
      | David FO      | Fiscal Reviewer | Automation Description | 5        | NO                   |
    When I enter the following values into flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" by clicking "New" :
      | Reviewer Name      | Role             | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Program Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly cannot see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "David FO" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    Then I softly can see row level action button "Edit" against "{SavedValue:opportunityEGMSID}" in flex table with id "---grantee_tableId:-:OpportunityNotConvertedToApplication---"
    And I wait for "2" seconds
    And I navigate to "Opportunities" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    Then I softly see value "{SavedValue:opportunityEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:PendingTask---"
    When I click on "Start" icon for "{SavedValue:opportunityEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    And I navigate to "Responsibilities" sub tab
    Then I softly can see top right button "Edit" in page detail
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---" without waiting for record
    And I wait for "2" seconds
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "3" seconds
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    When I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    And I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Complete Review" in page detail
    When I navigate to "Responsibilities" sub tab
    Then I softly can see row level action button "Resend for Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly see top right button "New" inside flex table "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Examples:
      | UserName | UserType   |
      | Sarah PM | GRANTEE PM |

  @487232 @NotYetConvertedOpportunityGrantsgovVerifyPOusercancreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @P1_Grantee @GRegression1 @GranteeTBE
  Scenario: Not Yet Converted Opportunity (Grants.gov)  - Verify PO user can create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-Sarah PM"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I enter "Grantee_Edition" values from "Application_Field_Values - backup.xlsx"
    When I click on "Save" in the page details
    And I pause execution for "2" seconds
    Then I softly see field "Status" as "Created"
    Then I see status in Progress-bar is "Created" and is "dark blue"

  @481499 @ValidateEXEuserhasonlyviewaccessonforminallstatesofapplication @P1_Grantee @EXE_Grantee @GRegression1
  Scenario: Validate EXE user has only view access on form in all states of application
    Given I delete the grantee record "{grantee_testData:GrantsGovProjectPerformanceMandatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269345" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269345" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269345" with properties "TWO_STEP_APPROVER"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    Then I softly see value "Project/Performance Site Location(s)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project/Performance Site Location(s)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    And I enter "Project_Perform_Site" values from "Application_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "1" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:projectLocationFormTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Project/Performance Site Location(s)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project/Performance Site Location(s)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project/Performance Site Location(s)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I see the header is "Project/Performance Site Location(s)" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "4.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    Then I softly see the text containing "When filling out the data within this form, please adhere to the character limits for each field as specified within the information icon for the field."
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Project/Performance Site Primary Location" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "UEI" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Street1" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "City" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "State" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Country" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Congressional District" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Primary Address" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see that "Is Primary Address" rendered in view mode only
    Then I softly see that "Organization Name" rendered in view mode only
    Then I softly see that "UEI" rendered in view mode only
    Then I softly see that "Street 1" rendered in view mode only
    Then I softly see that "Street 2" rendered in view mode only
    Then I softly see that "City" rendered in view mode only
    Then I softly see that "County" rendered in view mode only
    Then I softly see that "State" rendered in view mode only
    Then I softly see that "Province" rendered in view mode only
    Then I softly see that "Country" rendered in view mode only
    Then I softly see that "ZIP / Postal Code" rendered in view mode only
    Then I softly see that "Project/ Performance Site Congressional District" rendered in view mode only
    And I click modal button "Close"
    And I wait for "1" seconds
    And I close the tab
    Then I softly see value "100.00%" for title "Percentage" against the value "Project/Performance Site Location(s)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project/Performance Site Location(s)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project/Performance Site Location(s)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I see the header is "Project/Performance Site Location(s)" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "4.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    Then I softly see the text containing "When filling out the data within this form, please adhere to the character limits for each field as specified within the information icon for the field."
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Project/Performance Site Primary Location" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "UEI" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Street1" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "City" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "State" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Country" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Congressional District" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Primary Address" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see that "Is Primary Address" rendered in view mode only
    Then I softly see that "Organization Name" rendered in view mode only
    Then I softly see that "UEI" rendered in view mode only
    Then I softly see that "Street 1" rendered in view mode only
    Then I softly see that "Street 2" rendered in view mode only
    Then I softly see that "City" rendered in view mode only
    Then I softly see that "County" rendered in view mode only
    Then I softly see that "State" rendered in view mode only
    Then I softly see that "Province" rendered in view mode only
    Then I softly see that "Country" rendered in view mode only
    Then I softly see that "ZIP / Postal Code" rendered in view mode only
    Then I softly see that "Project/ Performance Site Congressional District" rendered in view mode only
    And I click modal button "Close"
    And I wait for "1" seconds
    And I close the tab
    Then I softly see value "100.00%" for title "Percentage" against the value "Project/Performance Site Location(s)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Approved"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project/Performance Site Location(s)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project/Performance Site Location(s)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I see the header is "Project/Performance Site Location(s)" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "4.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    Then I softly see the text containing "When filling out the data within this form, please adhere to the character limits for each field as specified within the information icon for the field."
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Project/Performance Site Primary Location" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "UEI" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Street1" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "City" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "State" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Country" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Congressional District" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Primary Address" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see that "Is Primary Address" rendered in view mode only
    Then I softly see that "Organization Name" rendered in view mode only
    Then I softly see that "UEI" rendered in view mode only
    Then I softly see that "Street 1" rendered in view mode only
    Then I softly see that "Street 2" rendered in view mode only
    Then I softly see that "City" rendered in view mode only
    Then I softly see that "County" rendered in view mode only
    Then I softly see that "State" rendered in view mode only
    Then I softly see that "Province" rendered in view mode only
    Then I softly see that "Country" rendered in view mode only
    Then I softly see that "ZIP / Postal Code" rendered in view mode only
    Then I softly see that "Project/ Performance Site Congressional District" rendered in view mode only
    And I click modal button "Close"
    And I wait for "1" seconds
    And I close the tab
    Then I softly see value "100.00%" for title "Percentage" against the value "Project/Performance Site Location(s)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "S2SReceived" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Check Status" in the page details
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Validated" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project/Performance Site Location(s)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project/Performance Site Location(s)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I see the header is "Project/Performance Site Location(s)" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "4.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    Then I softly see the text containing "When filling out the data within this form, please adhere to the character limits for each field as specified within the information icon for the field."
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Project/Performance Site Primary Location" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "UEI" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Street1" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "City" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "State" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Country" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Congressional District" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Primary Address" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see that "Is Primary Address" rendered in view mode only
    Then I softly see that "Organization Name" rendered in view mode only
    Then I softly see that "UEI" rendered in view mode only
    Then I softly see that "Street 1" rendered in view mode only
    Then I softly see that "Street 2" rendered in view mode only
    Then I softly see that "City" rendered in view mode only
    Then I softly see that "County" rendered in view mode only
    Then I softly see that "State" rendered in view mode only
    Then I softly see that "Province" rendered in view mode only
    Then I softly see that "Country" rendered in view mode only
    Then I softly see that "ZIP / Postal Code" rendered in view mode only
    Then I softly see that "Project/ Performance Site Congressional District" rendered in view mode only
    And I click modal button "Close"
    And I wait for "1" seconds
    And I close the tab
    Then I softly see value "100.00%" for title "Percentage" against the value "Project/Performance Site Location(s)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly cannot see row level action button "Edit" against "{SavedValue:appEGMSID}" in flex table with id "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Revision in Progress"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Project/Performance Site Location(s)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project/Performance Site Location(s)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I see the header is "Project/Performance Site Location(s)" in the page details
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly see the field "Agency Owner :" as "Grants.gov" on forms
    Then I softly see the field "OMB Number :" as "4040-0010" on forms
    Then I softly see the field "Version :" as "4.0" on forms
    Then I softly see the field "OMB Expiration Date :" as "12/31/2026" on forms
    Then I softly see the text containing "When filling out the data within this form, please adhere to the character limits for each field as specified within the information icon for the field."
    Then I softly can see "Form" sub tab at view detail page
    Then I softly see "Project/Performance Site Primary Location" page block displayed
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "UEI" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Street1" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "City" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "State" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Country" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Congressional District" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see "Primary Address" in flex table header "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly do not see top right button "Add" inside flex table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Edit" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly cannot see row level action button "Delete" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly can see row level action button "View" against "{SavedValue:EGMSID}" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    And I click on "View" icon for "{SavedValue:EGMSID}" inside flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see that "Is Primary Address" rendered in view mode only
    Then I softly see that "Organization Name" rendered in view mode only
    Then I softly see that "UEI" rendered in view mode only
    Then I softly see that "Street 1" rendered in view mode only
    Then I softly see that "Street 2" rendered in view mode only
    Then I softly see that "City" rendered in view mode only
    Then I softly see that "County" rendered in view mode only
    Then I softly see that "State" rendered in view mode only
    Then I softly see that "Province" rendered in view mode only
    Then I softly see that "Country" rendered in view mode only
    Then I softly see that "ZIP / Postal Code" rendered in view mode only
    Then I softly see that "Project/ Performance Site Congressional District" rendered in view mode only
    And I click modal button "Close"
    And I wait for "1" seconds
    And I close the tab
    And I wait for "1" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Project/Performance Site Location(s)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"

  @486451 @ValidatePOusershouldabletosubmittheapplicationtograntsgovGrantsgovlead @P1_Grantee @PO_Grantee @GRegression1
  Scenario: Validate PO user should able to submit the application to grants.gov
    Given I delete the grantee record "{grantee_testData:GrantsGovProjectPerformanceMandatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269345" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269345" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269345" with properties "TWO_STEP_APPROVER_PO_OWNER"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    Then I softly see field "Status" as "Created"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:ApplicationTableId---"
    When I click toggle button to select "Applications - My Records"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly see value "{SavedValue:appEGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:ApplicationTableId---"
    Then I softly see "EGMS ID" in flex table header "---grantee_tableId:-:ApplicationTableId---"
    Then I softly see "Application Title" in flex table header "---grantee_tableId:-:ApplicationTableId---"
    Then I softly see "Funding Organization" in flex table header "---grantee_tableId:-:ApplicationTableId---"
    Then I softly see "Application Due Date" in flex table header "---grantee_tableId:-:ApplicationTableId---"
    Then I softly see "Status" in flex table header "---grantee_tableId:-:ApplicationTableId---"
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    And I wait for "2" seconds
    Then I softly can see "Overview" sub tab at view detail page
    Then I softly can see "Setup" sub tab at view detail page
    Then I softly can see "Budget" sub tab at view detail page
    Then I softly can see "Checklist" sub tab at view detail page
    Then I softly can see "Responsibilities" sub tab at view detail page
    Then I softly can see "Forms and Files" sub tab at view detail page
    Then I softly can see "History" sub tab at view detail page
    Then I softly can see "Messages" sub tab at view detail page
    And I navigate to "Overview" sub tab
    Then I softly see "Application Overview" page block displayed
    Then I softly see "Opportunity Overview" page block displayed
    Then I softly see "External Programs" page block displayed
    Then I softly see "Contacts" page block displayed
    Then I softly see "Project Abstract" page block displayed
    Then I softly see "Primary Place of Performance" page block displayed
    Then I softly see "System Information" page block displayed
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I navigate to "Setup" sub tab
    Then I softly see "Project Period" page block displayed
    Then I softly see "Budget Period Details" page block displayed
    Then I can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I navigate to "Budget" sub tab
    Then I softly see "Budget Overview" page block displayed
    Then I softly see "Budget Level Information" page block displayed
    Then I softly see "Budget Details" page block displayed
    Then I softly see "Program Income" page block displayed
    Then I softly see "Indirect Rates" page block displayed
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:indirectRatesApplicationtableId---"
    And I navigate to "Checklist" sub tab
    Then I softly see "Checklists" page block displayed
    When I navigate to "Responsibilities" sub tab
    Then I softly see "Peer Reviewers" page block displayed
    Then I softly see "Approvers" page block displayed
    Then I softly see "Owner" page block displayed
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ApplicationPeerReview---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ApplicationApprovers---"
    When I navigate to "Forms and Files" sub tab
    Then I softly see "Application Files" page block displayed
    Then I softly see "Notes" page block displayed
    Then I softly see "All Forms" page block displayed
    Then I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Other" has been added in "Application Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "Edit" :
      | Name       | Title               | Description      |
      | Grantee PO | Notes Record for FO | Automation Notes |
    When I click on "Delete" icon for "Notes Record for FO" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    When I navigate to "History" sub tab
    Then I softly see "Approval History" page block displayed
    Then I softly see "Snapshot History" page block displayed
    And I navigate to "Messages" sub tab
    Then I softly see "Messages" page block displayed
    Then I softly see top right button "Send Email" inside flex table "CommunicationHistory"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    Then I softly see value "Project/Performance Site Location(s)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see "check" symbol against the value "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Project/Performance Site Location(s)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on top right button "Add" in flex table with id "---grantee_tableId:-:projectLocationFormTableId---"
    And I enter "Project_Perform_Site" values from "Application_Field_Values.xlsx"
    When I click modal button "Save"
    And I wait for "1" seconds
    And I save the value from row "1" for column name "EGMS ID" as "EGMSID" from flex table "---grantee_tableId:-:projectLocationFormTableId---"
    Then I softly see value "{SavedValue:EGMSID}" for title "EGMS ID" inside table "---grantee_tableId:-:projectLocationFormTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I wait for "2" seconds
    And I refresh the page
    And I wait for "3" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Project/Performance Site Location(s)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationPeerReview---" by clicking "New" :
      | Reviewer Name      | Responsibility  | Description            | Due Date | Allow Record Editing |
      | Danielle FD Garcia | Fiscal Reviewer | Automation Description | 5        | Yes                  |
    And I click on "Send for Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I wait for "2" seconds
    Then I softly see field "Status" as "Submitted for Review"
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Other" has been added in "Application Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "Edit" :
      | Name       | Title               | Description      |
      | Grantee PO | Notes Record for FO | Automation Notes |
    When I click on "Delete" icon for "Notes Record for FO" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    When I re-login to "Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
    And I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    Then I softly can see top right button "Edit" in page detail
    And I click on "Edit" in the page details
    And I wait for "3" seconds
    When I navigate to "Overview" sub tab
    Then I softly see fields "Title__c" is in edit mode
    Then I softly see fields "DUNS__c" is in edit mode
    Then I softly see fields "ProjectDirectorContact__c" is in edit mode
    Then I softly see fields "AOR_Contact__c" is in edit mode
    Then I softly see fields "ProjectAbstract__c" is in edit mode
    Then I softly see fields "Addressline1__c" is in edit mode
    Then I softly see fields "Addressline2__c" is in edit mode
    Then I softly see fields "City__c" is in edit mode
    Then I softly see fields "County__c" is in edit mode
    Then I softly see fields "State__c" is in edit mode
    Then I softly see fields "CongressionalDistrict1__c" is in edit mode
    Then I softly see fields "Country__c" is in edit mode
    Then I softly see fields "Zip4__c" is in edit mode
    Then I softly see fields "ZipCode4Extension__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "3" seconds
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I navigate to "Setup" sub tab
    Then I can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I navigate to "Budget" sub tab
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:indirectRatesApplicationtableId---"
    And I navigate to "Checklist" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "ITRequirements__c" is in edit mode
    Then I softly see fields "ITRequirementsComments__c" is in edit mode
    Then I softly see fields "SpaceRequirements__c" is in edit mode
    Then I softly see fields "SpaceRequirementsComments__c" is in edit mode
    Then I softly see fields "AreAnyStateSpecificFormsAttached__c" is in edit mode
    Then I softly see fields "AreAnyStateSpecificFormsAttached__c" is in edit mode
    Then I softly see fields "TrainingCertificationRequirements__c" is in edit mode
    Then I softly see fields "TrainingCertificationComments__c" is in edit mode
    Then I softly see fields "SpecialAwardConditions__c" is in edit mode
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Other" has been added in "Application Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    When I click on "Delete" icon for "Other" inside flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "Edit" :
      | Name               | Title               | Description      |
      | Danielle FD Garcia | Notes Record for FD | Automation Notes |
    When I click on "Delete" icon for "Notes Record for FD" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I navigate to "Responsibilities" sub tab
    When I click on "Enter Review" icon for "Danielle FD Garcia" inside flex table with id "---grantee_tableId:-:ApplicationPeerReview---" without waiting for record
    And I enter a review as "Passed"
    When I click modal button "Save"
    And I click on submit review
    And I wait for "2" seconds
    Then I softly cannot see top right button "Edit" in page detail
    And I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I navigate to "Completed Tasks" content inside "My Tasks" subheader on left panel
    When I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:grantCompletedTaskTableId---" panel
    Then I softly see value "Completed" for title "Status" against the value "{SavedValue:appEGMSID}" inside table "---grantee_tableId:-:grantCompletedTaskTableId---"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted for Review"
    Then I softly can see top right button "Complete Review" in page detail
    And I click on "Complete Review" in the page details
    Then I softly see field "Status" as "Reviewed"
    Then I softly can see top right button "Edit" in page detail
    Then I softly can see top right button "Validate" in page detail
    Then I softly can see top right button "Submit For Approval" in page detail
    And I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    Then I softly see fields "Title__c" is in edit mode
    Then I softly see fields "DUNS__c" is in edit mode
    Then I softly see fields "ProjectDirectorContact__c" is in edit mode
    Then I softly see fields "AOR_Contact__c" is in edit mode
    Then I softly see fields "ProjectAbstract__c" is in edit mode
    Then I softly see fields "Addressline1__c" is in edit mode
    Then I softly see fields "Addressline2__c" is in edit mode
    Then I softly see fields "City__c" is in edit mode
    Then I softly see fields "County__c" is in edit mode
    Then I softly see fields "State__c" is in edit mode
    Then I softly see fields "CongressionalDistrict1__c" is in edit mode
    Then I softly see fields "Country__c" is in edit mode
    Then I softly see fields "Zip4__c" is in edit mode
    Then I softly see fields "ZipCode4Extension__c" is in edit mode
    And I click on "Save" in the page details
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    Then I can see top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I navigate to "Setup" sub tab
    Then I can see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I can see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I navigate to "Budget" sub tab
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:indirectRatesApplicationtableId---"
    And I navigate to "Checklist" sub tab
    And I click on "Edit" in the page details
    Then I softly see fields "ITRequirements__c" is in edit mode
    Then I softly see fields "ITRequirementsComments__c" is in edit mode
    Then I softly see fields "SpaceRequirements__c" is in edit mode
    Then I softly see fields "SpaceRequirementsComments__c" is in edit mode
    Then I softly see fields "AreAnyStateSpecificFormsAttached__c" is in edit mode
    Then I softly see fields "AreAnyStateSpecificFormsAttached__c" is in edit mode
    Then I softly see fields "TrainingCertificationRequirements__c" is in edit mode
    Then I softly see fields "TrainingCertificationComments__c" is in edit mode
    Then I softly see fields "SpecialAwardConditions__c" is in edit mode
    And I click on "Save" in the page details
    When I navigate to "Forms and Files" sub tab
    Then I can see top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Other" has been added in "Application Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    When I enter the following values into flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    And I edit the following rows inline in flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "Edit" :
      | Name       | Title               | Description      |
      | Grantee PO | Notes Record for FO | Automation Notes |
    Then I softly can see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:ApplicationPeerReview---"
    Then I can see top right button "New" in flex table with id "---grantee_tableId:-:ApplicationApprovers---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    Then I softly cannot see top right button "Edit" in page detail
    Then I softly cannot see top right button "Validate" in page detail
    Then I softly cannot see top right button "Submit For Approval" in page detail
    Then I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ApplicationExternalProgramsTableId---"
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    Then I cannot see top right button "Associate" in flex table with id "---grantee_tableId:-:ContactTableIdApplication---"
    When I navigate to "Setup" sub tab
    Then I cannot see top right button "Create New Budget Period" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    Then I cannot see top right button "Associate Focus Area" in flex table with id "---grantee_tableId:-:BudgetPeriodDetailsFromSetup---"
    And I navigate to "Budget" sub tab
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:indirectRatesApplicationtableId---"
    When I navigate to "Forms and Files" sub tab
    Then I cannot see top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I see "Other" has been added in "Application Files" flex table
    Then I can see row level action button "Download" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I cannot see row level action button "Delete" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I cannot see row level action button "Edit" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I can see row level action button "View" against "Other" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly see value "Notes Record for FO" for title "Title" inside table "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Delete" against "Notes Record for FO" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly can see row level action button "Edit" against "Notes Record for FO" in flex table with id "---grantee_tableId:-:NotesApplicationTableId---"
    Then I softly cannot see row level action button "Edit" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "View" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly can see row level action button "Preview" against "Project/Performance Site Location(s)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I navigate to "Responsibilities" sub tab
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:ApplicationPeerReview---"
    Then I cannot see top right button "New" in flex table with id "---grantee_tableId:-:ApplicationApprovers---"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    Then I can see top right button "Download as PDF with Forms" in page detail
    Then I can see top right button "Take Snapshot" in page detail
    Then I can see top right button "Record Decision" in page detail
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "S2SReceived" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Check Status" in the page details
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Validated" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Record Decision" in the page details
    When I enter values into fields
      | Value           | Field                |
      | Awarded         | Decision__c          |
      | Automation Test | RejectionComments__c |
    And I click modal button "Save"
    And I click modal button "Close"
    Then I softly see field "Status" as "Awarded"
    Then I can see top right button "Create Award" in page detail
    And I navigate to "Chatter" sub tab in split screen
    And I post the message "Automation Test1 Execution" inside chatter
    Then I softly see post "Automation Test1 Execution" by user "Grantee PO"
    Then I softly see "Resize" button for page
    Then I softly see "Collapse" button for page
    And I navigate to "Field Audit" sub tab in split screen
    And I click on hyperlink containing value "View All"
    Then I softly see value "Awarded" for title "New Value" inside field history table
    Then I softly see value "Submitted to Grantor" for title "Original Value" inside field history table
    And I click on back arrow
    And I wait for "2" seconds
    When I navigate to "Home" tab
    And I perform quick search inside global search "{SavedValue:appEGMSID}"
    Then I softly can see row level action button "Edit" against "{SavedValue:appEGMSID}" in global search with id "Applications"
    Then I softly can see row level action button "Change Owner" against "{SavedValue:appEGMSID}" in global search with id "Applications"
    And I click on row level action button "Change Owner" against "{SavedValue:appEGMSID}" in global search with id "Applications"
    And I wait for "2" seconds
    And I select users value "Victor EXE" in field "forceSearchInputLookup"
    When I click modal button "Submit"
    Then I softly see the following messages in the page details contains:
      | You cannot change the owner from this screen. The Ownership Reassignment feature is not available for Grantee application. Please contact your system administrator for assistance. |

  @480752 @ValidatePMProfileonclickrevisebuttonagainabletosubmittograntsGov @P2_Grantee @PM_Grantee @GRegression5
  Scenario: Validate PM Profile on click revise button again able to submit to grants.Gov
    Given I delete the grantee record "{grantee_testData:GrantsGovMandatorySFLLL}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001269344" with properties "default"
    Given I login to "Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001269344" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0001269344" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    Then I softly see value "Disclosure of Lobbying Activities (SF-LLL)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Edit" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "Grantee_SF-LLL_Form_Valid" values from "Application_Field_Values - backup.xlsx"
    And I click on "Save" in the page details
    And I wait for "2" seconds
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I click on "Edit" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I refresh the page
    And I wait for "2" seconds
    Then I softly see value "100.00%" for title "Percentage" against the value "Disclosure of Lobbying Activities (SF-LLL)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly see value "Yes" for title "Validated" against the value "Disclosure of Lobbying Activities (SF-LLL)" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    Then I softly cannot see row level action button "Edit" against "Disclosure of Lobbying Activities (SF-LLL)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    And I close the tab
    And I wait for "1" seconds
    When I click on "Splitview" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see top right button "Edit" in the split screen page details
    Then I softly cannot see top right button "Validate" in the split screen page details
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Disclosure of Lobbying Activities (SF-LLL)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    And I close the tab
    And I wait for "1" seconds
    When I click on "Splitview" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see top right button "Edit" in the split screen page details
    Then I softly cannot see top right button "Validate" in the split screen page details
    When I navigate to "History" sub tab
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:submissionHistoryTableId---"
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "Cancel" on modal confirmation box
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "S2SReceived" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Success" for title "Response Status Details" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "{SavedValue:TrackingNumber}" for title "Tracking Number" against the value "SUCCESS" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I navigate to "Forms and Files" sub tab
    When I navigate to "Forms and Files" sub tab
    Then I softly cannot see row level action button "Edit" against "Disclosure of Lobbying Activities (SF-LLL)" in flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    Then I cannot see top right button "Edit" in page detail
    Then I cannot see top right button "Validate" in page detail
    And I close the tab
    And I wait for "1" seconds
    When I click on "Splitview" icon for "Disclosure of Lobbying Activities (SF-LLL)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    Then I softly cannot see top right button "Edit" in the split screen page details
    Then I softly cannot see top right button "Validate" in the split screen page details
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "History" sub tab
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "Cancel" on modal confirmation box
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail

  @481544 @ValidatePMusershouldabletosubmittheapplicationtograntsgovifuserupdatethedatarevisioninprogressstate @P2_Grantee @PM_Grantee @GRegression2 @GranteeP_Q4
  Scenario: Validate PM user should able to submit the application to grants.gov if user update the data revision in progress state
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
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    And I click on "Edit" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I wait for "2" seconds
    And I upload attachment without random number "Attachment.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    And I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details :
      | Form validated successfully. |
    And I close the tab
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "History" sub tab
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "Cancel" on modal confirmation box
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Success" for title "Response Status Details" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Revise" in the page details
    Then I softly see field "Status" as "Revision in Progress"
    And I navigate to "Overview" sub tab
    And I click on "Edit" in the page details
    And I enter value "173" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    Then I softly see field "Congressional District" as "173"
    When I navigate to "Forms and Files" sub tab
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:AddFilesApplicationTableID---"
    And I upload attachment without random number "Attachment.pdf" of type "Other" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    Then I see "Attachment.pdf" has been added in "Application Files" flex table
    When I enter the following values into flex table with id "---grantee_tableId:-:NotesApplicationTableId---" by clicking "New" :
      | Title        | Description      |
      | Notes Record | Automation Notes |
    Then I softly see value "Notes Record" for title "Title" inside table "---grantee_tableId:-:NotesApplicationTableId---"
    When I navigate to "Responsibilities" sub tab
    When I enter the following values into flex table with id "---grantee_tableId:-:ApplicationApprovers---" by clicking "New" :
      | Name     | Application |
      | David FO | Step 2      |
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Application has been validated successfully. |
    And I click on "Submit For Approval" in the page details
    Then I softly see field "Status" as "Submitted for Approval"
    When I re-login to "Grantee" app as "GRANTEE EXE" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    Then I softly can see top right button "Submit To Grants.Gov" in page detail
    When I navigate to "History" sub tab
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "Cancel" on modal confirmation box
    Then I softly see status in Progress-bar is "Approved" and is "dark blue"
    And I click on "Submit To Grants.Gov" in the page details without processing
    And I click "OK" on modal confirmation box
    Then I softly see field "Status" as "Submitted to Grantor"
    Then I cannot see top right button "Edit" in page detail
    Then I can see top right button "Check Status" in page detail
    Then I can see top right button "Revise" in page detail
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Success" for title "Response Status Details" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"

  @486511 @validatethevalidationonapplication(Grants.gov)
  Scenario: Validate the Validation on application(Grants.gov)
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-Grantee PO user"
    When I re-login to "Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I save the field labeled "Application Title" as "ApplicationTitle"
    And I clear the value from field "Title__c"
    And I navigate to "Budget" sub tab
    And I enter value "--None--" into field "ProgramIncome__c"
    When I click on "Save" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | To Save, Application Title is required in the Overview tab under the Application Overview section.              |
      | To Save, Program Income Treatment Type is required in the Budget tab under the Budget Overview section.         |
      | To Save, Congressional District is required in the Overview tab under the Primary Place of Performance section. |
    And I enter value "Additive" into field "ProgramIncome__c"
    And I navigate to "Overview" sub tab
    And I enter value "{SavedValue:ApplicationTitle}" into field "Title__c"
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I click on "Submit For Approval" in the page details
    And I wait for "2" seconds
    Then I softly see the following messages in the page details contains:
      | Overview Tab - Associate at least one Contact with the application.                                                                         |
      | Budget Tab - Requested Amount should be greater than or equal to Award Floor Amount. Adjust the requested budget in Budget Details section. |
      | Overview Tab - Please fill "Project Abstract" before you submit for approval.                                                               |
      | Overview Tab - Please fill "Project Director/Principal Investigator" before you submit for approval.                                        |
      | Overview Tab - Please fill "Authorized Organization Representative (AOR)" before you submit for approval.                                   |
      | Budget Tab - You must add a budget before submitting this application.                                                                      |
      | Overview Tab - You must add a UEI before submitting this application.                                                                       |
      | Responsibilities - At least one approver is required.                                                                                       |

  @472431 @validatethatPM(RecordOwner)userseeCreateApplicationbuttonagaininthesameorganizationontherelatedopportunity/Preapplicationonceapplicationisdeleted
  Scenario: Validate that PM(Record Owner) user see Create Application button again in the same organization on the related opportunity/Preapplication once application is deleted
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-Grantee PO user"
    Given I login to "Grantee" app as "GRANTEE PO" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-Grantee PO user"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "Delete" icon for "{SavedValue:appEGMSID}" inside table with table id "---grantee_tableId:-:ApplicationTableId---" without processing
    Then I softly see confirmation box with body "Are you sure you want to permanently delete the draft application?" is displayed
    When I click modal button "OK"
    And I wait for "3" seconds
    When I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    Then I softly see "No Records Found" inside flex table with id "---grantee_tableId:-:ApplicationTableId---"
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly can see top right button "Create Application" in page detail
    When I click on "Create Application" in the page details
    And I wait for "2" seconds
    And I click modal button "Save and Continue"
    And I navigate to "Overview" sub tab
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"

  @547385 @547386 @validatethatSubmissionHistorysectionshouldbevisiblewithcorrectrecordscounttoallInternalUsers @GranteeFlexP1
  Scenario Outline: Validate Submission History section should be visible with correct records count
  /Validate Forms section should be visible with correct records count
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
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "DAVID_FO_APPROVER"
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside table
    Then I softly see field "Status" as "Created"
    Then I can see top right button "Edit" in page detail
    When I click on "Edit" in the page details
    When I navigate to "Overview" sub tab
    And I enter value "123" into field "CongressionalDistrict1__c"
    When I click on "Save" in the page details
    And I get the "EGMS ID"
    And I save the field labeled "EGMS ID" as "appEGMSID"
    When I navigate to "Forms and Files" sub tab
    Then I softly see value "Application for Federal Assistance (SF-424)" for title "Form Name" inside table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I click on "View" icon for "Application for Federal Assistance (SF-424)" inside flex table with id "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I switch to tab number "1"
    And I click on "Edit" in the page details
    Then I softly can see top right button "Cancel" in page detail
    Then I softly can see top right button "Save" in page detail
    And I enter "SF424_FORM" values from "Application_Field_Values.xlsx"
    And I click on top right button "Add Files" in flex table with id "---grantee_tableId:-:applicationFormAddFileTableId---"
    And I upload attachment without random number "AttachmentTesting.pdf" of type "Delinquent Federal Debt" from computer
    When I click modal button "Close"
    And I wait for "2" seconds
    When I click on "Save" in the page details
    When I click on "Validate" in the page details
    Then I softly see the following messages in the page details contains:
      | Form Validated Successfully. |
    And I close the tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I see total records count "Total Records: 12" in flex table "---grantee_tableId:-:applicationBusinessFormTableId---"
    And I click on "Submit For Approval" in the page details
    Then I softly see status in Progress-bar is "Submitted For Approval" and is "dark blue"
    When I re-login to "Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    When I navigate to "Pending Tasks" content inside "My Tasks" subheader on left panel
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:PendingTask---" panel
    When I click on "Start" icon for "{SavedValue:appEGMSID}" inside flex table with id "---grantee_tableId:-:PendingTask---" without waiting for record
    When I "Approve" in the approval decision
    Then I softly see field "Status" as "Approved"
    When I re-login to "Grantee" app as "GRANTEE PM" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    When I click on "Submit To Grants.Gov" in the page details
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "History" sub tab
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "S2SReceived" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    When I click on "Check Status" in the page details
    And I save the value from row "1" for column name "Tracking Number" as "TrackingNumber" from flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "Validated" for title "Grants.Gov Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I softly see value "SUCCESS" for title "Status" against the value "{SavedValue:TrackingNumber}" inside table "---grantee_tableId:-:submissionHistoryTableId---"
    Then I see total records count "Total Records: 2" in flex table "---grantee_tableId:-:submissionHistoryTableId---"
    When I re-login to "Grantee" app as "<User>" user on "INTERNAL" portal
    When I navigate to "Applications" tab
    And I navigate to "Applications" content inside "Applications" subheader on left panel
    When I click toggle button to select "Applications - All"
    And I perform quick search for "{SavedValue:appEGMSID}" in "---grantee_tableId:-:ApplicationTableId---" panel
    When I click on "View" icon for "{SavedValue:appEGMSID}" inside table
    Then I softly see field "Status" as "Submitted to Grantor"
    When I navigate to "Forms and Files" sub tab
    And I select value inside table "---grantee_tableId:-:applicationBusinessFormTableId---" is "All"
    Then I see total records count "Total Records: 12" in flex table "---grantee_tableId:-:applicationBusinessFormTableId---"
    When I navigate to "History" sub tab
    Then I see total records count "Total Records: 2" in flex table "---grantee_tableId:-:submissionHistoryTableId---"
    Examples:
      | User            |
      | GRANTEE PO      |
      | GRANTEE EXE     |
      | GRANTEE FO      |
      | GRANTEE FD      |
      | GRANTEE ADMIN   |
      | GRANTEE AUDITOR |