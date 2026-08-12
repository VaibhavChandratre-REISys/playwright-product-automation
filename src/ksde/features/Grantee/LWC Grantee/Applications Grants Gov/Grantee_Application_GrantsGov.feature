@GranteeApplicationsGrantsGov
Feature: Validate all scenarios for Applications Grants Gov

  @480684 @ValidateOpportunitiesconvertedtoApplicationGrantsgovPOusercannavigatetoOpportunitydetailspagefromOpportunitiesConvertedtoApplicationlistview @P3_Grantee @PO_Grantee @GRegression2
  Scenario Outline: Validate Opportunities converted to Application Grants gov PO user can navigate to Opportunity details page from Opportunities Converted to Application list view
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityNumberUser}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0000660610" with properties "default"
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
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
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
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
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
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
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
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
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
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
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
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
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
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
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
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
    When I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0000660610" with properties "default"
    And I create Application "{SavedValue:Automation Runtime Opportunity}" with state "Created" for opportunity number "CAS-HHS0000660610" with properties "default"
    When I re-login to "As a Grantor" app as "<User>" user on "INTERNAL" portal
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
    Then I softly see the text containing "sarah.pm@ggp.test8.qagrnteatm"
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
      | GRANTEE ADMIN1  |

  @487233 @OpportunitiesNotconvertedGrantsgovVerifyEXEusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify EXE user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Victor EXE | GRANTEE EXE | GRANTEE EXE     |

  @487234 @OpportunitiesNotconvertedGrantsgovVerifyFOusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify FO user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Sarah PM   | GRANTEE PM  | GRANTEE FO      |

  @487235 @OpportunitiesNotconvertedGrantsgovVerifyFDusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @FD_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify FD user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Sarah PM   | GRANTEE PM  | GRANTEE FD      |

  @487236 @OpportunitiesNotconvertedGrantsgovVerifyEXEusercannotseeCreateApplicationbuttononApprovedOpportunity @P3_Grantee @ADMIN_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify ADMIN user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Grantee PO | GRANTEE PO  | GRANTEE ADMIN1  |

  @487237 @OpportunitiesNotconvertedGrantsgovVerifyAUDITORusercannotseeCreateApplicationbuttononApprovedOpportunity @P4_Grantee @AUDITOR_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov) -  Verify AUDITOR user cannot see Create Application button on Approved Opportunity
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<OwnerType>" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I wait for "5" seconds
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
    And I navigate to "Opportunities" tab
    And I navigate to "Not Converted" content inside "Opportunities" subheader on left panel
    When I click toggle button to select "Opportunities Not Converted to Application - All"
    And I perform quick search for "{SavedValue:opportunityEGMSID}" in "---grantee_tableId:-:OpportunityNotConvertedToApplication---" panel
    When I click on "View" icon for "{SavedValue:opportunityEGMSID}" inside table
    Then I softly cannot see top right button "Create Application" in page detail

    Examples:
      | UserName   | OwnerType   | UserType        |
      | Grantee PO | GRANTEE PO  | GRANTEE AUDITOR |

  @475755 @OpportunitiesNotconvertedGrantsgovVerifyEXEuserReviewereditaccessasNocanabletosubmitReview @P3_Grantee @EXE_Grantee @GRegression1 @GranteeTBE
  Scenario Outline: Opportunities Not converted (Grants.gov)  - Verify EXE user (Reviewer edit access as = No)can able to submit Review
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default-<UserName>"
    Given I login to "As a Grantee" app as "<UserType>" user
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
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
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
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
    Given I login to "As a Grantee" app as "<UserType>" user
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
    When I re-login to "As a Grantee" app as "GRANTEE FO" user on "INTERNAL" portal
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
    Then I softly see value "Submitted" for title "Status" against the value "David FO" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "David FO" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "GRANTEE FD" user on "INTERNAL" portal
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
    Then I softly see value "Submitted" for title "Status" against the value "Danielle FD Garcia" inside table "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Enter Review" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    Then I softly cannot see row level action button "Edit" against "Danielle FD Garcia" in flex table with id "---grantee_tableId:-:OpportunityPeerReviewers---"
    When I re-login to "As a Grantee" app as "<UserType>" user on "INTERNAL" portal
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
      | Sarah PM   | GRANTEE PM  |

  @487232 @NotYetConvertedOpportunityGrantsgovVerifyPOusercancreateApplicationfromOpportunityifPreApplicationRequiredisselectedasNoonOpportunityrecord @P1_Grantee @GRegression1 @GranteeTBE
  Scenario: Not Yet Converted Opportunity (Grants.gov)  - Verify PO user can create Application from Opportunity if Pre-Application Required? is selected as No on Opportunity record
    Given I delete the grantee record "{grantee_testData:GrantsgovOpportunityWithAllFormMendatory}"
    And I create "Grants.Gov" qualified lead for title "Automation Runtime Opportunity" and opportunity number "CAS-HHS0001212745" with properties "default"
    Given I login to "As a Grantee" app as "GRANTEE PM" user
    And I navigate to "Opportunities" tab
    When I navigate to "Qualified" content inside "Leads" subheader on left panel
    And I click toggle button to select "Qualified Leads - All"
    When I perform quick search for "{SavedValue:Automation Runtime Opportunity}" in "---grantee_tableId:-:qualifiedLeadTableId---" panel
    And I click on "View" icon for "{SavedValue:Automation Runtime Opportunity}" inside flex table with id "---grantee_tableId:-:qualifiedLeadTableId---" without waiting for record
    When I click on "Convert to Opportunity" in the page details
    And I save the field labeled "EGMS ID" as "opportunityEGMSID"
    And I create opportunity with state "Approved" for opportunity number "CAS-HHS0001212745" with properties "default-Sarah PM"
    When I re-login to "As a Grantee" app as "GRANTEE PO" user on "INTERNAL" portal
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


